package vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_idx,p_idx,u_idx,quantity,totalprice,p_price;
	private String p_image,p_name;

}
