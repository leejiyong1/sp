package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private int u_idx;
	private String u_email, u_name, u_pwd, u_regidate, u_regiip ,u_role;
}