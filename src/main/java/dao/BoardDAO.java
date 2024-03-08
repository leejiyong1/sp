package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	 public List<BoardVO> selectList(){ 
		 List<BoardVO> list = sqlSession.selectList("b.board_list");
		 return list; 
	 }
	 
	 public List<BoardVO> board_order_by(int t_idx, int p_idx){
		 List<BoardVO> list;
		 
		 if(t_idx == 0 && p_idx != 0) {
			 list = sqlSession.selectList("b.board_order_by_product", p_idx);
		 }else if(p_idx == 0 && t_idx != 0) {
			 list = sqlSession.selectList("b.board_order_by_tone", t_idx);
		 }else {
			 BoardVO vo = new BoardVO();
			 vo.setT_idx(t_idx);
			 vo.setP_idx(p_idx);
			 list = sqlSession.selectList("b.board_order_by", vo);
		 }
		 
		 return list;
	 }
	 
	 public List<BoardVO> selectList(HashMap<String, Integer> map){ 
		 List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		 return list; 
	 }
	 
	 public BoardVO board_one(int b_idx) {
		 System.out.println("in board dao: " + b_idx);
		 BoardVO vo = sqlSession.selectOne("b.board_one", b_idx);
		 return vo;
	 }
	 
	 public int board_upload(BoardVO vo) {
		 int res = sqlSession.insert("b.board_write", vo);
		 return res;
	 }
	 
	 public int board_update(BoardVO vo) {
		 int res = sqlSession.update("b.board_update", vo);
		 return res;
	 }
	 
	 public int board_delete(int b_idx) {
		 int res = sqlSession.delete("b.board_delete", b_idx);
		 return res;
	 }
	 
	 public int update_comment(int b_idx) {
		 int res = sqlSession.update("b.update_comment", b_idx);
		 return res;
	 }
	 
	 public int update_readhit(int b_idx) {
		 int res = sqlSession.update("b.update_readhit", b_idx);
		 return res;
	 }
	 
	 public int like_increase(int b_idx) {
		 int res = sqlSession.update("b.like_increase", b_idx);
		 return res;
	 }
	 
	 public int like_decrease(int b_idx) {
		 int res = sqlSession.update("b.like_decrease", b_idx);
		 return res;
	 }
	 
	 public int getRowTotal() {
		 int res = sqlSession.selectOne("b.board_count");
		 return res;
	 }
	
}
