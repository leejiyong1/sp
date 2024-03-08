package controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.PcGoodService;
import service.ProductCommentService;
import util.Common;
import util.ProductPaging;
import vo.PcGoodVO;
import vo.ProductCommentVO;

@Controller
public class ProductCommentController {
	ProductCommentService pc_Service;
	PcGoodService pcg_Service;
	static final String VIEW_PATH = "/WEB-INF/views/productcomment/";

	@Autowired
	HttpSession session;
	@Autowired
	ServletContext app;
	public ProductCommentController(ProductCommentService pc_Service, PcGoodService pcg_Service) {
		this.pc_Service = pc_Service;
		this.pcg_Service = pcg_Service;
	}

//	@RequestMapping(value = "/product_comment.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//	public String productComment_list(int p_idx, Model model) {
//		List<ProductCommentVO> list = pc_Service.productComment_list(p_idx);
//		String u_id = (String) session.getAttribute("id");
//		if (u_id != null) {
//			int u_idx = pcg_Service.pcg_u_idx(u_id);
//			List<PcGoodVO> pcg_list = pcg_Service.pcg_list(u_idx);
//			if(pcg_list != null) {
//			for (int i = 0; i < list.size(); i++) {
//				for (int j = 0; j < pcg_list.size(); j++) {
//					if (list.get(i).getPc_idx() == pcg_list.get(j).getPc_idx()) {
//						list.get(i).setCheck(true);
//						break;
//					}
//				}
//			}
//			}
//		}
//		model.addAttribute("list", list);
//		return VIEW_PATH + "productcomment.jsp";
//	}
	@RequestMapping(value = "/product_comment.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String productComment_list(int p_idx, Model model,String page) {
		int nowpage =1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		int start = (nowpage-1) * Common.Product.BLOCKLIST + 1;
		int end = start+Common.Product.BLOCKLIST-1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("p_idx", p_idx);
		List<ProductCommentVO> list= pc_Service.productComment_list(map);
		
		String email = (String) session.getAttribute("email");
		if (email != null) {
			int u_idx = pcg_Service.pcg_u_idx(email);
			List<PcGoodVO> pcg_list = pcg_Service.pcg_list(u_idx);
			if(pcg_list != null) {
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < pcg_list.size(); j++) {
					if (list.get(i).getPc_idx() == pcg_list.get(j).getPc_idx()) {
						list.get(i).setCheck(true);
						break;
					}
				}
			}
			}
		}
		int rowtotal = pc_Service.productComment_list_count(p_idx);
		String page_menu = ProductPaging.getPcPaging("product_comment.do", nowpage, rowtotal,Common.Product.BLOCKLIST,
				Common.Product.BLOCKPAGE);
		model.addAttribute("list", list);
		model.addAttribute("page",page_menu);
		return VIEW_PATH + "productcomment.jsp";
	}
	

	@RequestMapping("product_comment_write_form.do")
	public String productComment_write() {
		if (session.getAttribute("email") == null) {
			return "redirect:temp.do";
		}
		return VIEW_PATH + "productcomment_write.jsp";
	}

	@RequestMapping(value = "product_comment_write.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String productComment_write(ProductCommentVO pc_vo) {
		String email = (String) session.getAttribute("email");
		if (email != null) {
			String webpath = "/resources/productcomment/";
			String path = app.getRealPath(webpath);
			System.out.println(path);
			MultipartFile photo = pc_vo.getPhoto();
			String filename="no_file";
			if(photo != null && !photo.isEmpty()) {
				filename = photo.getOriginalFilename();
				File f = new File(path,filename);
				if(!f.exists()) {
					f.mkdirs();
				}else {
					long time= System.currentTimeMillis();
					filename = String.format("%d_%s", time,filename);
					f = new File(path,filename);
				}
				
				try {
					photo.transferTo(f);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			pc_vo.setPc_image(filename);
			pc_Service.productComment_write(pc_vo, email);
		} else {
			return "redirect:temp.do";
		}
		return "redirect:product_view.do?p_idx=" + 1;
	}

	@RequestMapping(value = "product_comment_good.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String productComment_good(int pc_idx) {
		String email = (String) session.getAttribute("email");

		if (email != null) {
			PcGoodVO pcg_vo = new PcGoodVO();
			pcg_vo.setU_idx(pcg_Service.pcg_u_idx(email));
			pcg_vo.setPc_idx(pc_idx);
			boolean check = pcg_Service.userId_Check(pcg_vo.getU_idx(), pc_idx);
			if (check) {
				pc_Service.productComment_good_count(pc_idx);
				pcg_Service.pcg_click(pcg_vo);
				return "yes";
			} else {
				pc_Service.productComment_good_minus(pc_idx);
				pcg_Service.pcg_delete(pcg_vo.getU_idx(), pc_idx);
				return "minus";
			}
		} else {
			return "no";
		}
	}
	
	@RequestMapping(value = "product_comment_delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String productComment_delete(int pc_idx) {
		String email = (String) session.getAttribute("email");
		if(email != null) {
			pc_Service.productComment_delete(email, pc_idx);
		}
		return null;
	}
	
}
