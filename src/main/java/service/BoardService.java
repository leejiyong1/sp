package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import dao.BoardDAO;
import vo.BoardVO;

@Service
public class BoardService {

	BoardDAO board_dao;
	
	public BoardService(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	public List<BoardVO> board_list(){ 
		List<BoardVO> list = board_dao.selectList(); 
		return list; 
	}
	
	public List<BoardVO> board_order_by(int t_idx, int p_idx){
		List<BoardVO> list = board_dao.board_order_by(t_idx, p_idx);
		return list;
	}
	
	public List<BoardVO> board_list(HashMap<String, Integer> map){ 
		List<BoardVO> list = board_dao.selectList(map); 
		return list; 
	}
	
	public int board_upload(BoardVO vo) {
		int res = board_dao.board_upload(vo);
		return res;
	}
	
	public BoardVO board_one(int b_idx) {
		BoardVO vo = board_dao.board_one(b_idx);
		return vo;
	}
	
	public int board_update(BoardVO vo) {
		int res = board_dao.board_update(vo);
		return res;
	}
	
	public int board_delete(int b_idx) {
		int res = board_dao.board_delete(b_idx);
		return res;
	}
	
	public int update_comment(int b_idx) {
		int res = board_dao.update_comment(b_idx);
		return res;
	}
	
	public int update_readhit(int b_idx) {
		int res = board_dao.update_readhit(b_idx);
		return res;
	}
	
	public int like_increase(int b_idx) {
		int res = board_dao.like_increase(b_idx);
		return res;
	}
	
	public int like_decrease(int b_idx) {
		int res = board_dao.like_decrease(b_idx);
		return res;
	}
	
	public int getRowTotal() {
		int res = board_dao.getRowTotal();
		return res;
	}

}





























