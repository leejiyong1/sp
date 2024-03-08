package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.BoardService;
import service.Board_ProductService;
import service.CommentService;
import service.LikesService;
import service.ProductService;
import service.ToneService;
import service.UserService;
import util.Common;
import util.BoardPaging;
import vo.BoardVO;
import vo.CommentVO;
import vo.LikesVO;
import vo.UserVO;

@Controller
public class BoardController {

	BoardService board_service;
	ToneService tone_service;
	Board_ProductService product_service;
	CommentService comment_service;
	LikesService likes_service;
	UserService user_service;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	public BoardController(BoardService board_service, ToneService tone_service, Board_ProductService product_service, CommentService comment_service, LikesService likes_service, UserService user_service) {
		this.board_service = board_service;
		this.product_service = product_service;
		this.tone_service = tone_service;
		this.comment_service = comment_service;
		this.likes_service = likes_service;
		this.user_service = user_service;
	}

	//게시글 리스트 (게시판 첫 화면)
	@RequestMapping(value = { "/board_list.do" })
	public String board_list(Model model, Integer page) throws Exception {
		
		System.out.println(session.getAttribute("email"));
		
		//--- 페이징 처리 ---
		int nowPage = 1;
		
		if(page != null) { 
			nowPage = page; 
		}
		
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		//map에 start, end를 저장하여 DB로 보낸다
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		//페이징 메뉴 생성을 위한 전체 게시글 수 가져오기
		int row_total = board_service.getRowTotal();
		
		//하단에 들어가는 페이징 메뉴 생성
		String pageMenu = BoardPaging.getPaging("board_list.do", nowPage, row_total, 
							Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		
		//--- 전체 게시글 가져오기 ---
		List<BoardVO> list = board_service.board_list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		 

		return Common.Board.VIEW_PATH + "board_list.jsp";
	}

	@RequestMapping("/board_order_by.do")
	public String board_order_by(Model model, String tone, String product) {
		int t_idx = Integer.parseInt(tone);
		int p_idx = Integer.parseInt(product);
		//List<BoardVO> list;
		
		if(t_idx == 0 && p_idx == 0) {
			return "redirect:board_list.do";
		}
		
		List<BoardVO> list = board_service.board_order_by(t_idx, p_idx);
		
		model.addAttribute("list", list);
		return Common.Board.VIEW_PATH + "board_list.jsp";
	}

	//새 게시글 작성 폼으로 이동
	@RequestMapping("/board_write.do")
	public String board_write(Model model) throws Exception{
		//======= 현재 사용자 로그인 여부 확인 ======
		if(session.getAttribute("email") == null) {
			return "redirect:login.do";
		}
		return Common.Board.VIEW_PATH + "board_write.jsp"; 
	}
	
	//새 게시글 업로드
	@RequestMapping("/board_upload.do")
	//@ResponseBody
	public String board_upload(BoardVO vo) throws Exception{
		
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		
//		//u_idx 사용
//		int u_idx = user_service.select_idx(session.getAttribute("email").toString());
//		vo.setU_idx(u_idx); //현재 게시글 작성한 사용자 정보 저장
		
		//u_email 사용
		vo.setU_email(session.getAttribute("email").toString());
		vo.setU_name(user_service.select_name(vo.getU_email()));
		
		//vo.getT_idx & vo.getP_idx를 통해 톤 이름, 제품 이름 가져오기
		String p_name = product_service.select_product_name(vo.getP_idx());
		String t_name = tone_service.select_tone(vo.getT_idx());
		
		vo.setT_name(t_name);
		vo.setP_name(p_name);
		
		System.out.println("t_name: " + vo.getT_name());
		System.out.println("p_name: " + vo.getP_name());
		
		int res = board_service.board_upload(vo);
		
		return "redirect:board_list.do";
		
	}
	
	//게시글 상세보기
	@RequestMapping("/board_view.do")
	public String board_view(Model model, Integer b_idx, String page, HttpServletResponse response) throws Exception{ // parameter
		
		//세션에서 사용자 정보를 가져온 후 좋아요를 눌렀는지의 여부 판단
		String u_email = "unknown-user";
		LikesVO check_like = null;
		int u_idx = 0;
		
		if(session.getAttribute("email") != null) {
			//현재 user의 정보를 가져와 이 게시물에 좋아요를 눌렀는지 여부 판단하기
			//u_idx = user_service.select_idx(u_email);
			u_email = session.getAttribute("email").toString();
			
			LikesVO likes_vo = new LikesVO();
			likes_vo.setB_idx(b_idx);
			//likes_vo.setU_idx(u_idx); //현재 유저 idx
			likes_vo.setU_email(u_email);
			
			check_like = likes_service.check_like(likes_vo);
		}
		
		int like = 0;
		
		if(check_like != null) {
			like = 1;
		}
		
		//--- Cookie 사용해서 조회수 중복 증가 차단 ---
		Cookie old_cookie = null;
		Cookie[] cookies = request.getCookies();
		
		//cookies 안에 쿠키들이 존재할 경우
		//각 쿠키들의 key값을 확인하여 ""가 존재하면 old_cookie에 넣어줌
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("board_view")) {
					old_cookie = cookie;
				}
			}
		}
		
		//old_cookie의 null 여부 확인
		if(old_cookie != null) {
			//old_cookie가 null이 아닌 경우
			if(!old_cookie.getValue().contains("[[" + b_idx + "]_[" + u_email + "]]")) {
				//만약 old_cookie 속 value중 현재 회원과 일치하는 m_idx가 없다면
				
				//조회수 증가
				board_service.update_readhit(b_idx);
				
				//old_cookie에 현재 회원 value 추가
				old_cookie.setValue(old_cookie.getValue() + "_[[" + b_idx + "]_[" + u_email + "]]");
				old_cookie.setPath("/");
				old_cookie.setMaxAge(60 * 60 * 5); //5시간 동안 유효
				response.addCookie(old_cookie);
			}
		}else {
			//old_cookie가 null인 경우
			
			//조회수 증가
			board_service.update_readhit(b_idx);
			
			//새 쿠키를 생성하여 response에 추가
			Cookie new_cookie = new Cookie("board_view", "[[" + b_idx + "]_[" + u_email + "]]");
			new_cookie.setPath("/");
			new_cookie.setMaxAge(60 * 60 * 5); //5시간 유효
			response.addCookie(new_cookie);
		}
		
		//--- 현재 게시글 정보 가져오기 ---
		BoardVO vo = board_service.board_one(b_idx);
		
		model.addAttribute("check_like", like);
		model.addAttribute("vo", vo);
		
		return Common.Board.VIEW_PATH + "board_view.jsp";
	}
	
	//게시물 수정
	@RequestMapping("/board_update.do")
	//@ResponseBody
	public String board_update(BoardVO vo) throws Exception{
		//마이페이지에서만 실행됨
		
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		
		int u_idx = user_service.select_idx(session.getAttribute("email").toString());
		vo.setU_idx(u_idx);
		
		//vo.getT_idx & vo.getP_idx를 통해 톤 이름, 제품 이름 가져오기
		String p_name = product_service.select_product_name(vo.getP_idx());
		String t_name = tone_service.select_tone(vo.getT_idx());
		
		vo.setT_name(t_name);
		vo.setP_name(p_name);
		
		board_service.board_update(vo);
		
		/*
		 * String result = "Fail";
		 * 
		 * if(res >= 0) { result = "Success"; }
		 */

		return "redirect:board_view.do?b_idx=" + vo.getB_idx();
	}
	
	//게시글 수정 페이지 이동
	@RequestMapping("/board_update_form.do")
	public String board_update_form(Model model, int b_idx) throws Exception{
		//마이페이지에서만 실행됨
		
		BoardVO vo = board_service.board_one(b_idx);
		model.addAttribute("vo", vo);
		return Common.Board.VIEW_PATH + "board_update_form.jsp";
	}
	
	//게시물 지우기
	@RequestMapping("/board_delete.do")
	@ResponseBody
	public String board_delete(int b_idx) throws Exception{
		//마이페이지에서만 실행됨
		
		//게시글 지우기
		int res = board_service.board_delete(b_idx);
		
		//게시글 댓글 지우기
		comment_service.board_comment_delete(b_idx);
		return String.valueOf(res);
	}
	
	//댓글 리스트
	@RequestMapping("/comment_list.do")
	public String comment_list(Model model, int b_idx) throws Exception{
		List<CommentVO> list = comment_service.comment_list(b_idx);
		
		
		model.addAttribute("list", list);
		return Common.Comment.VIEW_PATH + "comment_list.jsp";
	}
	
	//댓글 작성
	@RequestMapping("/comment_write.do")
	@ResponseBody
	public String comment_write(CommentVO vo) throws Exception{
		// ====== 로그인 여부 확인 ======
		if(session.getAttribute("email") == null) {
			return String.valueOf(-1);
		}
		
		//idx 사용
//		int u_idx = user_service.select_idx(session.getAttribute("email").toString());
//		vo.setU_idx(u_idx);
		
		//email 사용
		vo.setU_email(session.getAttribute("email").toString());
		vo.setU_name(user_service.select_name(vo.getU_email()));
		
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = comment_service.comment_write(vo);
		
		if(res > 0) {
			board_service.update_comment(vo.getB_idx());
		}
		
		return String.valueOf(res);
	}
	
	//대댓글 리스트
	@RequestMapping("/reply_list.do")
	public String reply_list(Model model, int c_idx) throws Exception{
		List<CommentVO> list = comment_service.reply_list(c_idx);
		model.addAttribute("list", list);
		return Common.Comment.VIEW_PATH + "reply_list.jsp";
	}
	
	//댓글&대댓글 보기
	@RequestMapping("/reply.do")
	@ResponseBody
	public String reply(int c_idx, int b_idx, String content) throws Exception{
		// ====== 로그인 여부 확인 ======
		if(session.getAttribute("email") == null) {
			return String.valueOf(-1);
		}
		
		//현재 로그인 된 사용자 정보 가져오기 idx 사용
		//int u_idx = user_service.select_idx(session.getAttribute("email").toString());
		
		String ip = request.getRemoteAddr();
		
		CommentVO baseVO = comment_service.selectOne(c_idx);
		
		if(baseVO.getDepth() != 0) {
			comment_service.update_step(baseVO);
		}
		
		//Sample Data? 원래는 유저 정보가 저장되어 파라미터로 보내졌어야 함
		CommentVO vo = new CommentVO();
		
		vo.setB_idx(b_idx); //sample?
		vo.setIp(ip);
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(1);
		vo.setContent(content);//sample?
		vo.setU_email(session.getAttribute("email").toString()); //이메일 사용
		vo.setU_name(user_service.select_name(vo.getU_email()));
		
		int res = comment_service.reply(vo); 
		
		//대댓글 수 증가
		if(res > 0) {
			comment_service.update_reply(c_idx);
		}
		
		return String.valueOf(res);
	}
	
	//대댓글 작성
	@RequestMapping("/reply_form.do")
	public String replay_form(Model model, int c_idx) throws Exception{
		//로그인 여부 + 현재 사용자 정보
		
		CommentVO vo = comment_service.selectOne(c_idx);
		
		model.addAttribute("vo", vo);
		
		return Common.Comment.VIEW_PATH + "reply_form.jsp?c_idx=" + c_idx;
	}
	
	//좋아요 버튼
	@RequestMapping("/board_like.do")
	@ResponseBody
	public String like_click(int b_idx) throws Exception{
		// ====== 로그인 여부 확인 ======
		if(session.getAttribute("email") == null) {
			return String.valueOf(-1);
		}
		
		//현재 로그인 된 사용자 정보 가져오기 idx 사용
		//int u_idx = user_service.select_idx(session.getAttribute("email").toString());
		
		//Like에 게시글과 회원정보 담기
		LikesVO vo = new LikesVO();
		vo.setB_idx(b_idx);
		vo.setU_email(session.getAttribute("email").toString()); //이메일 사용
		
		//이미 좋아요를 눌렀는지 여부 확인
		if(likes_service.check_like(vo) == null) {
			//좋아요를 안누른 상태면 좋아요 테이블에 좋아요 추가
			likes_service.insert(vo);
			//게시물 좋아요 수 증가
			board_service.like_increase(b_idx);
		}else {
			//좋아요를 누른 상태면 좋아요 테이블에서 좋아요 삭제
			likes_service.delete(vo);
			//게시물 좋아요 수 감소
			board_service.like_decrease(b_idx);
		}
		
		int count = likes_service.count_like(b_idx);
		return String.valueOf(count);
	}
	
	
}




























