package service;

import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class UserService {

	UserDAO user_dao;
	
	public UserService(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	public int select_idx(String u_email) {
		int idx = user_dao.select_idx(u_email);
		return idx;
	}
	
	public String select_name(String u_email) {
		String name = user_dao.select_name(u_email);
		return name;
	}
	
}
