package vo;

import lombok.Data;

@Data
public class ProductVO {
	
	private int p_idx,p_price,p_hit,p_sold,p_totalprice,quantity,avg_star,total_comments,no,discountprice;
	private String p_name,p_content,p_regidate,p_image,
	p_color;
	private String p_category_b,p_category_s;
	
	
	
	

}
