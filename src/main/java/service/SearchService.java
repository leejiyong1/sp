package service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import dao.SearchDAO;
import util.Common;
import util.HangulSearcher;
import util.ProductPaging;
import vo.ProductVO;

public class SearchService {

	SearchDAO s_dao;
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;

	public SearchService(SearchDAO s_dao) {
		this.s_dao = s_dao;
	}

	// 초성 검색
	public List<String> search_result(String keyword) {
		List<String> list = s_dao.search_result();
		List<String> resultList = new ArrayList<String>();
		String str = "";
		for (int i = 0; i < list.size(); i++) {
			str = HangulSearcher.resultChosung(list.get(i));
			if (str.charAt(0) == keyword.charAt(0)) {
				int num = 0;
				if (keyword.length() <= str.length()) {
					for (int j = 0; j < str.length(); j++) {
						String str2 = "";
						for (int c = num; c < keyword.length() + num; c++) {
							str2 += str.charAt(c);
						} // c
						if (keyword.equals(str2)) {
							resultList.add(list.get(i));
							break;
						} else {
							num++;
						}

						if (str2.length() == str.length() || str2.length() + num == str.length() + 1) {
							break;
						}
					} // j
				}
			}
			if(resultList.size() == 5) {
				break;
			}
		} // i
		return resultList;
	}

	// 글자완성검색
	public List<String> search_keyword(String keyword) {
		List<String> list = s_dao.search_keyword(keyword);
		return list;
	}

	// 검색했을때결과
	public Map<String, Object> s_search_list(String keyword, int nowpage) {
		int start = (nowpage - 1) * Common.Product.BLOCKLIST + 1;
		int end = start + Common.Product.BLOCKLIST - 1;
		Map<String, Object> p_map = new HashMap<String, Object>();
		p_map.put("keyword", keyword);
		p_map.put("start", start);
		p_map.put("end", end);
		List<ProductVO> list = s_dao.s_search_list(p_map);
		int rowtotal = s_dao.s_search_count(keyword);
		p_map.put("list", list);
		String page_menu = ProductPaging.getSearchPaging("search_list.do", nowpage, rowtotal, Common.Product.BLOCKLIST,
				Common.Product.BLOCKPAGE, keyword);
		p_map.put("page_menu", page_menu);
		return p_map;
	}

	// 첫글자 검색
	public List<String> first_search_list(char k) {
		List<String> list = s_dao.search_result();
		List<String> firstlist = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			if (HangulSearcher.composeHangul(list.get(i)).charAt(0) == k) {
				firstlist.add(list.get(i));
			}
			if (firstlist.size() == 5) {
				break;
			}
		}
		return firstlist;
	}
	
	//검색어 쿠키에서저장
	public void addRecentSearch(String keyword,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
	    String delimiter = "|";
	    // 쿠키에서 기존의 최근 검색어 목록을 가져옴
	    String recentSearchesStr = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("recentSearches".equals(cookie.getName())) {
	                recentSearchesStr = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                break;
	            }
	        }
	    }
	    System.out.println(":" +recentSearchesStr);
	    // 최근 검색어 목록을 리스트로 변환
	    List<String> recentSearches = new ArrayList<String>();
	    if (recentSearchesStr != null && !recentSearchesStr.isEmpty()) {
	        String[] searchesArray = recentSearchesStr.split("\\|");
	        for(int i=0; i<searchesArray.length; i++) {
	        	System.out.println("searchesArray:" + searchesArray[i]);
	        }
	        recentSearches.addAll(Arrays.asList(searchesArray));
	    }
	    

	    // 중복 검색어 제거 (새 검색어가 이미 리스트에 있다면 제거)
	    recentSearches.remove(keyword); // 리스트에서 새 검색어가 이미 존재하면 제거

	    // 새 검색어를 리스트의 맨 앞에 추가
	    recentSearches.add(0, keyword);

	    // 리스트 크기 제한 (예: 최대 5개)
	    while (recentSearches.size() > 5) {
	        recentSearches.remove(recentSearches.size() - 1); // 리스트의 마지막 항목을 제거
	    }

	    // 리스트를 문자열로 변환하여 쿠키에 저장
	    recentSearchesStr = String.join(delimiter, recentSearches);
	    Cookie cookie = new Cookie("recentSearches", URLEncoder.encode(recentSearchesStr, "UTF-8"));
	    cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효 기간 설정
	    response.addCookie(cookie);
	}
	//쿠키리스트로 반환
	public List<String> getRecentSearches(HttpServletRequest request) throws UnsupportedEncodingException {
	    List<String> recentSearches = new ArrayList<String>();
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("recentSearches".equals(cookie.getName())) {
	                String recentSearchesStr = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                recentSearches = Arrays.asList(recentSearchesStr.split("\\|"));
	                break;
	            }
	        }
	    }
	    return recentSearches;
	}
	//쿠키삭제
	public void deleteSearch(HttpServletRequest request, HttpServletResponse response) {
		// "recentSearches" 쿠키 찾기
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("recentSearches".equals(cookie.getName())) {
	                // 쿠키의 maxAge를 0으로 설정하여 삭제
	                cookie.setMaxAge(0);
	                // 쿠키 경로 설정이 필요할 경우 여기서 설정
	                cookie.setPath("/");
	                // 변경된 쿠키를 응답에 추가하여 클라이언트에게 보냄
	                response.addCookie(cookie);
	                break;
	            }
	        }
	    }
	}

}
