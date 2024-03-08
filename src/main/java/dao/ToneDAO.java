package dao;

import org.apache.ibatis.session.SqlSession;

public class ToneDAO {
	SqlSession sqlSession;
	
	public ToneDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public String select_tone(int t_idx) {
		System.out.println(t_idx);
		String t_name = sqlSession.selectOne("t.select_tone", t_idx);
		return t_name;
	}
}
