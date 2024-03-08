package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class SearchDAO {
	
	SqlSession sqlSession;
	
	public SearchDAO(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public List<String> search_keyword(String keyword) {
		List<String> list = sqlSession.selectList("s.search_p_namet",keyword);
		return list;
	}
	
	public List<String> search_result(){
		List<String> list = sqlSession.selectList("s.search_result");
		return list;
	}
	
	public List<ProductVO> s_search_list(Map<String, Object> p_map){
		List<ProductVO> list = sqlSession.selectList("s.select_search_list", p_map);
		return list;
	}
	
	public int s_search_count(String keyword) {
		int count  = sqlSession.selectOne("s.search_count", keyword);
		return count;
	}


}
