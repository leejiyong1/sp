package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;
import vo.ProductVO;

public class CartDAO {
	
	SqlSession sqlSession;
	
	public CartDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	
	public int cartInsert(CartVO cart) {
		int res = sqlSession.insert("c.cart_insert", cart);
		return res;
	}
	
	public int cartCheck(CartVO cart) {
		int ch = sqlSession.selectOne("c.cart_check", cart);
		return ch;
	}
	
	public List<CartVO> cartList(int u_idx) {
		List<CartVO> list = sqlSession.selectList("c.cart_select", u_idx);
		return list;
	}
	
	public int user_idx(String u_email) {
		int u_idx  = sqlSession.selectOne("c.user_idx", u_email);
		return u_idx;
	}
	
	public int cart_quantity(CartVO cart) {
		int up = sqlSession.update("c.cart_quantity", cart);
		return up;
	}
	
	public int totalprice(int u_idx) {
		int total = sqlSession.selectOne("c.cart_totalprice",u_idx);
		return total;
	}
	
	public int updatecart(CartVO cart) {
		int res = sqlSession.update("c.cart_update",cart);
		return res;
	}
	
	public int deletecart(int cart_idx) {
		return sqlSession.delete("c.cart_delete",cart_idx);
	}
	
	
	

}
