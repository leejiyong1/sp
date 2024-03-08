package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import vo.UserVO;

@Slf4j
public class UserDAO {

	SqlSession sqlSession;

	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

// crud
	// create
	public int join(UserVO vo) {
		int res = sqlSession.insert("u.join", vo);
		if (res > 0) {
			log.info("회원가입 성공 email : {}", vo.getU_email());
		} else {
			log.info("회원가입 실패 email : {}", vo.getU_email());
		}
		return res;
	}

	// read all
	public List<UserVO> findAll() {
		List<UserVO> list = sqlSession.selectList("u.select_list");
		return list;
	}

	// read one
	public UserVO login(String u_email) {
		UserVO vo = sqlSession.selectOne("u.login", u_email);
		return vo;
	}

	// update password
	public int update(String pwd) {
		int res = sqlSession.update("u.insert", pwd);
		return res;
	}

	// delete
	public int delete(String u_email) {
		int res = sqlSession.delete("u.delete", u_email);
		if (res > 0) {
			log.info("계정삭제 완료", u_email);
		}
		return res;
	}

	public int changeMyPwd(UserVO uservo) {
		int res = sqlSession.update("u.changeMyPwd", uservo);
		return res;
	}

	// get idx
	public int select_idx(String u_email) {
		int idx = sqlSession.selectOne("u.select_idx", u_email);
		return idx;
	}

	public int deleteAccount(String u_email) {
		int res = sqlSession.delete("u.deleteAccount", u_email);
		return res;
	}
	
	public String select_name(String u_email) {
		String name = sqlSession.selectOne("u.select_name", u_email);
		return name;
	}

}