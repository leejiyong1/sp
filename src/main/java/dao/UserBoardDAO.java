package dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;

@Repository
public class UserBoardDAO {

	private final SqlSession sqlSession;

	@Autowired
	public UserBoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<BoardVO> viewMyPosts(String u_email) {
		List<BoardVO> boardList = sqlSession.selectList("ub.viewMyPosts", u_email);
		return Optional.ofNullable(boardList).orElseThrow(() -> new RuntimeException("내가 작성한 게시글이 존재하지 않습니다."));
	}

	public List<BoardVO> viewMyComments(String u_email) {
		List<BoardVO> boardList = sqlSession.selectList("ub.viewMyPosts", u_email);
		return Optional.ofNullable(boardList).orElseThrow(() -> new RuntimeException("내가 작성한 댓글이 존재하지 않습니다."));
	}
}
