package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVO {
	private int c_idx, b_idx, u_idx, ref, step, depth, reply_count;
	private String content, ip, regdate, u_email, u_name;
	
}
