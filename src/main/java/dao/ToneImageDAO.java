package dao;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import vo.ToneImageVO;

@Slf4j
public class ToneImageDAO {

	SqlSession sqlSession;

	public ToneImageDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(ToneImageVO vo) {
		int res = sqlSession.insert("i.insert", vo);
		if (res > 0) {
			log.info("정상 저장 되었습니다.");
		} else {
		}
		return res;
	}
}
