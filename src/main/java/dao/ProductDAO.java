package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {
	
	SqlSession sqlSession;
	
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ProductVO> p_category_select(Map<String, Object> p_map){
		List<ProductVO> list = sqlSession.selectList("p.select_category", p_map);
		return list;
	}
	
	public int p_category_count(String p_category_b) {
		int count = sqlSession.selectOne("p.select_category_count", p_category_b);
		return count;
	}
	
	public ProductVO p_view(int p_idx) {
		ProductVO p_vo = sqlSession.selectOne("p.select_product_view", p_idx);
		return p_vo;
	}
	
	
	
	public int p_buy(Map<String, Integer> p_map) {
		int res = sqlSession.update("p.buy_product",p_map);
		return res;
	}
	
	public ProductVO p_buy_view(int p_idx) {
		ProductVO p_vo = sqlSession.selectOne("p.buy_product_view",p_idx);
		return p_vo;
	}
	
	public List<ProductVO> p_category_s_select(Map<String, Object> p_map){
		List<ProductVO> list = sqlSession.selectList("p.select_category_s", p_map);
		return list;
	}
	
	public int p_category_s_count(String p_category_s) {
		int count = sqlSession.selectOne("p.select_category_s_count", p_category_s);
		return count;
	}
	
	public List<ProductVO> p_best_product(){
		List<ProductVO> list = sqlSession.selectList("p.select_best");
		return list;
	}
	
	public List<ProductVO> p_best_main(){
		List<ProductVO> list = sqlSession.selectList("p.select_best_main");
		return list;
	}
	
	public List<ProductVO> p_discount(){
		List<ProductVO> list = sqlSession.selectList("p.select_discount");
		return list;
	}
	
	public List<ProductVO> p_discount2(){
		List<ProductVO> list = sqlSession.selectList("p.select_discount2");
		return list;
	}

}
