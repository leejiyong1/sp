package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private int b_idx, u_idx, likes_count, readhit, t_idx, p_idx, comment_count;
	private String subject, content, ip, regdate, t_name, p_name, u_email, u_name;
	
}
