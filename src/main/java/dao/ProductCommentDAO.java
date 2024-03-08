package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ProductCommentVO;

public class ProductCommentDAO {
	
	SqlSession sqlSession;
	
	public ProductCommentDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
//	public List<ProductCommentVO> productComment_list(int p_idx){
//		List<ProductCommentVO> list = sqlSession.selectList("pc.product_comment",p_idx);
//		return list;
//	}
	
	public List<ProductCommentVO> productComment_list(Map<String, Integer> map){
		List<ProductCommentVO> list = sqlSession.selectList("pc.product_comment",map);
		return list;
	}
	
	public int productComment_list_count(int p_idx) {
		int count = sqlSession.selectOne("pc.select_pc_count", p_idx);
		return count;
	}
	
	public int productComment_write(ProductCommentVO pc_vo) {
		int res = sqlSession.insert("pc.product_comment_write", pc_vo);
		return res;
	}
	public int user_select(String email) {
		int res = sqlSession.selectOne("pc.user_select", email);
		return res;
	}
	
	public int pc_good_update(int pc_idx) {
		int res= sqlSession.update("pc.pc_good_count", pc_idx);
		return res;
	}
	public int pc_good_minus(int pc_idx) {
		int res= sqlSession.update("pc.pc_good_count_minus", pc_idx);
		return res;
	}
	
	public List<ProductCommentVO> productComment_good_list(int u_idx){
		List<ProductCommentVO> list = sqlSession.selectList("pc.product_good_user",u_idx);
		return list;
	}
	
	public int productComment_delete(Map<String, Integer> map) {
		int res = sqlSession.delete("pc.delete_product_comment",map);
		return res;
	}
	
	public int productbuy_check(Map<String, Integer> map) {
		int count = sqlSession.selectOne("pc.product_buy_check",map);
		return count;
	}

}
