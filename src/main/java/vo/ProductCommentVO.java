package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductCommentVO {
	private int pc_idx,p_idx,u_idx,pc_good,pc_star;
	private String pc_content,pc_image,u_id,pc_regidate;
	private boolean check =false;
	private MultipartFile photo;

}
