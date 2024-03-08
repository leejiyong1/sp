package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CommentVO;

public class CommentDAO {

	SqlSession sqlSession;
	
	public CommentDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<CommentVO> comment_list(int b_idx){
		List<CommentVO> list = sqlSession.selectList("c.comment_list", b_idx);
		return list;
	}
	
	public List<CommentVO> reply_list(int c_idx){
		List<CommentVO> list = sqlSession.selectList("c.reply_list", c_idx);
		return list;
	}
	
	public CommentVO selectOne(int c_idx) {
		CommentVO vo = sqlSession.selectOne("c.select_comment", c_idx);
		return vo;
	}
	
	public int reply(CommentVO vo) {
		int res = sqlSession.insert("c.reply", vo);
		return res;
	}
	
	public int comment_write(CommentVO vo) {
		int res = sqlSession.insert("c.comment_write", vo);
		return res;
	}
	
	public int board_comment_delete(int b_idx) {
		int res = sqlSession.delete("c.board_comment_delete", b_idx);
		return res;
	}
	
	public int update_step(CommentVO vo) {
		int res = sqlSession.update("c.update_step", vo);
		return res;
	}
	
	public int update_reply(int c_idx) {
		int res = sqlSession.update("c.update_reply", c_idx);
		return res;
	}
	
}
