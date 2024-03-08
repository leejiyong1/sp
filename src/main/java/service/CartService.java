package service;

import java.util.List;

import dao.CartDAO;
import vo.CartVO;
import vo.ProductVO;

public class CartService {
	
	CartDAO cartDao;
	
	public CartService(CartDAO cartDao) {
		this.cartDao = cartDao;
	}
	
	public boolean cartInsertCheck(CartVO cart) {
		
		int check = cartDao.cartCheck(cart);
		if(check >0) {
			return false;
		}else {
			cartDao.cartInsert(cart);
			return true;
		}
	}
	
	public List<CartVO> cartList(int u_idx){
		List<CartVO> list = cartDao.cartList(u_idx);
		return list;
	}
	
	public int userIdx(String u_email) {
		int u_idx = cartDao.user_idx(u_email);
		return u_idx;
	}
	
	public int total_price(int u_idx) {
		int totalprice= cartDao.totalprice(u_idx);
		return totalprice;
	}
	
	public int cart_quantity(CartVO cart) {
		return cartDao.cart_quantity(cart);
	}
	
	public int update_cart(CartVO cart) {
		return cartDao.updatecart(cart);
	}
	
	public int delete_cart(int cart_idx) {
		return cartDao.deletecart(cart_idx);
	}
	
	
	
	

}
