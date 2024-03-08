package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	static final String VIEW_PATH = "/WEB-INF/views/admin/";

	@RequestMapping(value = "/admin.do")
	public String admin() {
		return VIEW_PATH + "/admin.jsp";
	}
	
	@RequestMapping(value = "/admin_member.do")
	public String member() {
		return VIEW_PATH + "/admin_member.jsp";
	}
	
	@RequestMapping(value = "/admin_product.do")
	public String product() {
		return VIEW_PATH + "/admin_product.jsp";
	}
	
	@RequestMapping(value = "/admin_add_product.do")
	public String addproduct() {
		return VIEW_PATH + "/admin_add_product.jsp";
	}
	
	@RequestMapping(value = "/admin_order.do")
	public String order() {
		return VIEW_PATH + "/admin_order.jsp";
	}

}