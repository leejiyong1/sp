package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dao.CommentDAO;
import vo.CommentVO;

@Service
public class CommentService {

	CommentDAO comment_dao;
	
	public CommentService(CommentDAO comment_dao) {
		this.comment_dao = comment_dao;
	}
	
	public List<CommentVO> comment_list(int b_idx){
		List<CommentVO> list = comment_dao.comment_list(b_idx);
		return list;
	}
	
	public List<CommentVO> reply_list(int c_idx){
		List<CommentVO> list = comment_dao.reply_list(c_idx);
		return list;
	}
	
	public CommentVO selectOne(int c_idx) {
		CommentVO vo = comment_dao.selectOne(c_idx);
		return vo;
	}
	
	public int reply(CommentVO vo) {
		int res = comment_dao.reply(vo);
		return res;
	}
	
	public int comment_write(CommentVO vo) {
		int res = comment_dao.comment_write(vo);
		return res;
	}
	
	public int board_comment_delete(int b_idx) {
		int res = comment_dao.board_comment_delete(b_idx);
		return res;
	}
	
	public int update_step(CommentVO vo) {
		int res = comment_dao.update_step(vo);
		return res;
	}
	
	public int update_reply(int c_idx) {
		int res = comment_dao.update_reply(c_idx);
		return res;
	}
	
}
