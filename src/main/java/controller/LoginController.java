package controller;

import java.util.Arrays;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import dao.UserDAO;
import lombok.extern.slf4j.Slf4j;
import vo.UserVO;

@Slf4j
@Controller
public class LoginController {
	static final String VIEWPATH = "/WEB-INF/views";

	@Autowired
	UserDAO dao;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request) throws Exception {
		return VIEWPATH + "/login/login.jsp";
	}
	/*
	 * //세션 메니저 public String getSession(HttpServletRequest request) { Cookie
	 * sessionCookie = findCookie(request); if (sessionCookie == null) { return
	 * null; } return store.get(sessionCookie.getValue()); } public Cookie
	 * findCookie(HttpServletRequest request) {
	 * 
	 * if (request.getCookies() == null) { return null; }
	 * 
	 * }
	 */

	@RequestMapping(value = "/login.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String loginreq(HttpServletRequest request, String email, String pwd, String yuji) throws Exception {
		Cookie sessionCookie = new Cookie("MYSESSIONID", "uniqueSessionID");
		HttpSession session = request.getSession();
		if (yuji.equalsIgnoreCase("false")) {
			session.setMaxInactiveInterval(-1);
		}
		String login_result = "bad";
		String good = "good";

		if (email.equalsIgnoreCase("1111@1111") && pwd.equalsIgnoreCase("1111")) {
			login_result = good;
			session.setAttribute("status", "succes");
			session.setAttribute("nickname", "t_nickname");
			session.setAttribute("email", "t_email");
		} else {
			Optional<UserVO> option = Optional.ofNullable(dao.login(email));
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			if (option.isEmpty()) {
				log.warn("null input = {}", option);
				return login_result;
			}
			UserVO vo = option.get();
			if (!passwordEncoder.matches(pwd, vo.getU_pwd())) {
				return login_result;
			}
			login_result = good;
			session.setAttribute("status", "succes");
			session.setAttribute("nickname", vo.getU_name());
			session.setAttribute("email", vo.getU_email());
		}

		return login_result;
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String logout(HttpServletRequest request, SessionStatus status) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		status.setComplete();
		return VIEWPATH + "/main/main.jsp";
	}

	@RequestMapping(value = "/findid.do")
	public String findid() throws Exception {

		return VIEWPATH + "/login/findid.jsp";
	}

	@RequestMapping(value = "/findpw.do")
	public String findpwd() throws Exception {
		return VIEWPATH + "/login/findpw.jsp";
	}

	@ResponseBody
	@RequestMapping("/searchemail.do")
	public String findByEmail() throws Exception {
		// 이메일로 아이디를 찾는 요청
		// db 에서 해당이메일조회
		// 이메일에 해당하는 아이디 값 받기
		// 아이디의 뒷 2자리를 **표시
		// 해당값 json 형태로 반환

		return "fail";
	}

	@ResponseBody
	@RequestMapping("/searchid.do")
	public String findById() throws Exception {
		// 아이디로 비밀번호를 재설정하는 요청

		// db 에서 해당 id조회
		// 아이디에 일치하는 이메일 조회

		// 아이디로 이메일 조회

		// 해당 이메일로 재설정 URL 보내기()

		// 이메일의 뒤 2글자에 **표시 붙여서 return함

		return "fail";
	}

}
