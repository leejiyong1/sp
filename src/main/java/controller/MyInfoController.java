package controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserBoardDAO;
import dao.UserDAO;
import lombok.extern.slf4j.Slf4j;
import vo.BoardVO;
import vo.UserVO;

@Slf4j
@Controller
public class MyInfoController {

	UserDAO userdao;
	UserBoardDAO userBoardDAO;

	@Autowired
	public MyInfoController(UserDAO userdao, UserBoardDAO userBoardDAO) {
		this.userdao = userdao;
		this.userBoardDAO = userBoardDAO;
		
	}

	static final String VIEW_PATH = "/WEB-INF/views/user/";

	@RequestMapping(value = "/myInfo.do")
	public String myInfo(HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null || email.isEmpty()) {
			return VIEW_PATH + "loginFirst.jsp";
		}
		return VIEW_PATH + "myInfo.jsp";
	}

	// 내글보기
	@RequestMapping(value = "/viewMyPosts.do")
	public String viewMyPosts(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		// 테스트용 임시 세션아이디
		// id = "asd123";

		if (id == null || id.isEmpty()) {
			throw new RuntimeException("세션에 사용자 아이디가 없습니다.");
		}
		// 내글조회
		List<BoardVO> boardList = userBoardDAO.viewMyPosts(id);
		model.addAttribute("boardList", boardList);
		return VIEW_PATH + "MyBoard.jsp";
	}

	// 내가 작성한 댓글보기
	@RequestMapping(value = "/viewMyComments.do")
	public List<BoardVO> viewMyComments(HttpSession session) {
		String id = session.getId();
		// 내댓글조회
		List<BoardVO> list = userBoardDAO.viewMyComments(id);
		return list;
	}

	// 비밀번호 변경하기
	@ResponseBody
	@RequestMapping(value = "/changeMyPwd.do", method = RequestMethod.POST)
	public String changeMyPwd(HttpSession session, String prepwd, String newpwd, Model model) {
		String email = (String) session.getAttribute("email");
		Optional<UserVO> option = Optional.ofNullable(userdao.login(email));
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if (option.isEmpty()) {
			log.warn("계정조회에 실패했습니다 : {}", option);
			model.addAttribute("message", "Failed to find Account");
			return "Failed to find Account";
		}
		UserVO vo = option.get();
		log.warn("input_previous_ChangeMyPwd = {}", prepwd);
		log.warn("vo.getU_pwd() = {}", vo.getU_pwd());
		if (!passwordEncoder.matches(prepwd, vo.getU_pwd())) {
			log.warn("기존 비밀번호가 맞지않습니다 : {} , {}", prepwd, vo.getU_pwd());
			model.addAttribute("message", "Failed to check password. Please try again.");
			return "Failed to check password";
		}
		vo.setU_pwd(passwordEncoder.encode(newpwd));
		int count = userdao.changeMyPwd(vo);
		if (count == 1) {
			log.warn("변경성공");
			model.addAttribute("message", "Password changed successfully.");
		}
		// 세션 초기화
		session.invalidate();
		return "Password changed successfully";
	}

	/*
	 * @RequestMapping(value = "/changeMyPwd.do", method = RequestMethod.GET) public
	 * String changeMyPwdResult(Model model) { return VIEW_PATH +
	 * "changepwdresult.jsp"; }
	 */

	// 계정삭제
	@RequestMapping(value = "/deleteAccount.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteAccount(HttpSession session) {
		String result = "fail";
		String email = (String) session.getAttribute("email");
		int res = userdao.deleteAccount(email);
		if (res > 0) {

			result = "success";
		}
		session.invalidate();
		System.out.println("135135");
		return result;
	}

}
