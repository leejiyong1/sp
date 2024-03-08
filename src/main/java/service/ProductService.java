package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductDAO;
import util.Common;
import util.ProductPaging;
import vo.ProductVO;

public class ProductService {
	
	ProductDAO p_dao;
	
	public ProductService(ProductDAO p_dao) {
		this.p_dao = p_dao;
	}
	
	public Map<String, Object> p_category_service(String p_category_b,int nowpage){
		int start = (nowpage-1) * Common.Product.BLOCKLIST + 1;
		int end = start+Common.Product.BLOCKLIST-1;
		Map<String, Object> p_map = new HashMap<String, Object>();
		p_map.put("p_category_b", p_category_b);
		p_map.put("start", start);
		p_map.put("end", end);
		List<ProductVO> list = p_dao.p_category_select(p_map);
		int rowtotal = p_dao.p_category_count(p_category_b);
		p_map.put("list", list);
		
		String page_menu = ProductPaging.getPaging("product_category_list.do", nowpage, rowtotal, Common.Product.BLOCKLIST,
				Common.Product.BLOCKPAGE,p_category_b);
		
		p_map.put("page_menu", page_menu);
		return p_map;
	}
	
	public ProductVO p_product_view(int p_idx) {
		ProductVO p_vo = p_dao.p_view(p_idx);
		return p_vo;
	}
	
	public int p_buy(int p_idx,int quantity) {
		Map<String, Integer> p_map = new HashMap<String, Integer>();
		p_map.put("p_idx", p_idx);
		p_map.put("quantity", quantity);
		int res = p_dao.p_buy(p_map);
		return res;
	}
	
	public ProductVO p_buy_view(int p_idx) {
		ProductVO p_vo = p_dao.p_buy_view(p_idx);
		return p_vo;
	}
	
	public Map<String, Object> p_category_s_service(String p_category_s,int nowpage){
		int start = (nowpage-1) * Common.Product.BLOCKLIST + 1;
		int end = start+Common.Product.BLOCKLIST-1;
		Map<String, Object> p_map = new HashMap<String, Object>();
		p_map.put("p_category_s", p_category_s);
		p_map.put("start", start);
		p_map.put("end", end);
		List<ProductVO> list = p_dao.p_category_s_select(p_map);
		int rowtotal = p_dao.p_category_s_count(p_category_s);
		p_map.put("list", list);
		
		String page_menu = ProductPaging.getPaging("product_category_list.do", nowpage, rowtotal, Common.Product.BLOCKLIST,
				Common.Product.BLOCKPAGE,p_category_s);
		
		p_map.put("page_menu", page_menu);
		return p_map;
	}
	
	public List<ProductVO> p_best_product(){
		List<ProductVO> list = p_dao.p_best_product();
		return list;
	}
	
	public List<ProductVO> p_best_main(){
		List<ProductVO> list = p_dao.p_best_main();
		return list;
	}
	
	public List<ProductVO> p_discount_main(){
		List<ProductVO> list = p_dao.p_discount();
		return list;
	}
	
	public List<ProductVO> p_discount_page(){
		List<ProductVO> list = p_dao.p_discount2();
		return list;
	}

}
