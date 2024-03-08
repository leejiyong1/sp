package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.SearchService;
import util.HangulSearcher;

@Controller
public class SearchController {

	SearchService s_service;
	
	static final String VIEW_PATH = "/WEB-INF/views/search/";

	public SearchController(SearchService s_service) {
		this.s_service = s_service;
	}

	
	@RequestMapping(value = "search_form.do", method = RequestMethod.GET)
	public String search_form() {
		return VIEW_PATH + "search.jsp";
	}

	@RequestMapping(value = "search_keyword.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String search_keyword(String keyword,HttpServletRequest request) throws UnsupportedEncodingException {
		List<String> list = null;
		List<String> keyList = null;
		int[] che = null;
		String key = "";
		if (keyword != null) {
			if (!HangulSearcher.checkChosung(keyword.charAt(0))) {
				list = s_service.search_result(keyword);
			} else {
				list = s_service.search_keyword(keyword);
				//키워드에맞는 검색어가없을경우 마지막글자를 빼고 검색을하고, keyList에 담는다
				if (list.size() == 0) {
					if(keyword.length() >1) {
					for (int i = 0; i < keyword.length()-1; i++) {
						key += keyword.charAt(i);
						if(key.length() == keyword.length()-1) {
						keyList = s_service.search_keyword(key);
						}
					}
					}else {
						char k = keyword.charAt(0);
						list = s_service.first_search_list(k);
					}
				}
			}
		}
		//keyList에담긴값들의 마지막글자를 검사해서 keyword마지막글자의 초성,중성이 맞으면  list에 다시담는다.
		if (keyList != null) {
			che = HangulSearcher.getChosungJungsung(keyword);
			for (String keyCheck : keyList) {
				int[] keyListChosung = HangulSearcher.getChosungJungsung(keyCheck);
				if (che[0] == keyListChosung[0] && che[1] == keyListChosung[1]) {
					list.add(keyCheck);
				}
			}
		}
		System.out.println(list);
		System.out.println("키워드");
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = "";
		try {
			jsonString = mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonString;
	}

	@RequestMapping(value = "/search_list.do", method = RequestMethod.GET)
	public String product_search_list(String keyword, String page, Model model,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		int nowpage = 1;
		if (page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		// 최근 검색어 추가
//	    if (keyword != null && !keyword.isEmpty()) {
//	        s_service.addRecentSearch(keyword, request, response);
//	    }
		if(keyword == null || keyword.isEmpty()) {
			return VIEW_PATH + "search_no.jsp";
		}
		Map<String, Object> p_map = s_service.s_search_list(keyword, nowpage);
		model.addAttribute("list", p_map.get("list"));
		model.addAttribute("page_menu", p_map.get("page_menu"));
		return VIEW_PATH + "product_search.jsp";
	}
	
	//최근 검색어
	@RequestMapping(value= "/searchrecord.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String search_record(HttpServletRequest request) throws UnsupportedEncodingException {
		List<String> list = s_service.getRecentSearches(request);
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = "";
		try {
			jsonString = mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonString;
	}
	
	//최근검색어삭제
	@RequestMapping(value="/seachrecordel.do",method = RequestMethod.POST)
	@ResponseBody
	public String search_record_del(HttpServletRequest request, HttpServletResponse response) {
		s_service.deleteSearch(request,response);
		 return "su";
	}
	
	
	
	
	
}
