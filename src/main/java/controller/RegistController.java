package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import lombok.RequiredArgsConstructor;
import vo.UserVO;

@RequiredArgsConstructor
@Controller
public class RegistController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	static final String VIEWPATH = "/WEB-INF/views";

	UserDAO userdao;

	public RegistController(UserDAO userdao) {
		this.userdao = userdao;
	}

	// 회원가입페이지 매핑
	@RequestMapping(value = "/regist.do")
	public String regist() {
		return VIEWPATH + "/login/regist.jsp";
	}

	// 회원가입 수행
	@RequestMapping(value = "/join.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String joinuser(String email, String name, String pwd) {
		UserVO vo = new UserVO();
		String result = "실패";
		// 암호화
		if (email != null && pwd != null && name != null) {
			vo.setU_pwd(pwd);
			vo.setU_name(name);
			vo.setU_email(email);
			System.out.println("set성공");
		} else {
			System.out.println("set실패");
			return String.valueOf(result);
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		vo.setU_pwd(passwordEncoder.encode(vo.getU_pwd()));
		SimpleDateFormat rigidaytime = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		String regidate = rigidaytime.format(date);
		vo.setU_regidate(regidate);
		vo.setU_regiip(request.getRemoteAddr());
		// 회원가입 수행
		int res = userdao.join(vo);
		if (res > 0) {
			System.out.println("regist controller : regist 성공");
			result = "성공";
		} else {
			System.out.println("regist controller error : regist fail");
		}
		return String.valueOf(result);
	}

	@RequestMapping(value = "/checkid.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkid(String id) {
		Optional<UserVO> option = Optional.ofNullable(userdao.login(id));
		if (option.isEmpty()) {
			return "can";
		} else {
			UserVO vo = option.get();
			System.out.println(vo.toString());
			return "cant";
		}
	}

}