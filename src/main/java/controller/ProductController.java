package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ProductService;
import vo.BuyProductVO;
import vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	ServletContext app;
	ProductService p_service;
	static final String VIEW_PATH = "/WEB-INF/views/main/";
	
	@Autowired
	HttpSession session;
	public ProductController(ProductService p_service) {
		this.p_service = p_service;
	}
	
	//카테고리 리스트
	@RequestMapping(value = "/product_category_list.do", method = RequestMethod.GET)
	public String category_list(String page, String p_category_b, Model model) throws Exception{
		int nowpage =1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		if(p_category_b == null || p_category_b.isEmpty()) {
			p_category_b = "woman";
		}
		
		Map<String, Object> p_map = p_service.p_category_service(p_category_b, nowpage);
		model.addAttribute("list", p_map.get("list"));
		model.addAttribute("page", p_map.get("page_menu"));
		return VIEW_PATH + "product_category.jsp";
	}
	
	//상품자세히보기
	@RequestMapping(value ="/product_view.do", method = RequestMethod.GET)
	public String product_view(int p_idx, Model model) throws Exception {
		ProductVO p_vo = p_service.p_product_view(p_idx);
		model.addAttribute("p_vo", p_vo);
		return VIEW_PATH + "product_view.jsp";
	}
	
	//총가격
	@RequestMapping(value = "/update_price.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String product_update_price(int p_idx, int quantity) throws Exception{
		ProductVO p_vo = p_service.p_product_view(p_idx);
		int price = p_vo.getP_price();
		int totalprice = price*quantity;
		return "가격:"+String.valueOf(totalprice)+"원";
	}
	
	//상품구매창
	@RequestMapping(value = "/buyproduct_form.do", method = RequestMethod.GET)
	public String prdocut_buy(int p_idx,int quantity,Model model) throws Exception{
		ProductVO p_vo = p_service.p_buy_view(p_idx);
		p_vo.setQuantity(quantity);
		p_vo.setP_totalprice(p_vo.getP_price()*quantity);
		model.addAttribute("p_vo", p_vo);
		return VIEW_PATH+"product_buy_form.jsp";
	}
	
	
	//카테고리_s 보기
	@RequestMapping(value = "/product_category_s_list.do", method = RequestMethod.GET)
	public String category_s_list(String page, String p_category_s, Model model) throws Exception{
		int nowpage =1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		Map<String, Object> p_map = p_service.p_category_s_service(p_category_s, nowpage);
		model.addAttribute("list", p_map.get("list"));
		model.addAttribute("page", p_map.get("page_menu"));
		return VIEW_PATH + "product_category_s.jsp";
	}
	
	
	//베스트상품
	@RequestMapping(value = "/product_best_list.do",method = RequestMethod.GET)
	public String prduct_best(Model model) throws Exception{
		List<ProductVO> list = p_service.p_best_product();
		model.addAttribute("list", list);
		return VIEW_PATH+"product_best.jsp";
	}
	
	@RequestMapping(value = "/product_discount_list.do",method = RequestMethod.GET)
	public String prduct_discount(Model model) throws Exception{
		List<ProductVO> list = p_service.p_discount_page();
		model.addAttribute("list", list);
		return VIEW_PATH+"product_discount.jsp";
	}
	
	@RequestMapping(value = "/user_detail_list.do")
	public String user_detail_list(Model model) throws Exception{
		String email = (String) session.getAttribute("email");
		if(email == null) {
			return "redirect:main.do";
		}
		List<BuyProductVO> list = p_service.user_detail(email);
		model.addAttribute("list", list);
		return VIEW_PATH+"user_detail.jsp";
	}
	
	@RequestMapping(value = "buyproduct_success.do",method = RequestMethod.GET)
	public String buy_product_success(String u_email,BuyProductVO bp_vo,String imp_uid) {
		String email = (String) session.getAttribute("email");
		if(email == null) {
			return "redirect:main.do";
		}
		int u_idx = p_service.user_idx(u_email);
		bp_vo.setU_idx(u_idx);
		return null;
	}
	
	
	
	
	
	

}
