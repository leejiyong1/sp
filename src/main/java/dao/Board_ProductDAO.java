package dao;

import org.apache.ibatis.session.SqlSession;

public class Board_ProductDAO {

	SqlSession sqlSession;
	
	public Board_ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public String select_product_name(int p_idx) {
		System.out.println("in bp dao");
		String p_name = sqlSession.selectOne("bp.select_product_name", p_idx);
		return p_name;
	}
}
