package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import dao.PcGoodDAO;
import vo.PcGoodVO;

public class PcGoodService {
	
	PcGoodDAO pcg_dao;
	
	public PcGoodService(PcGoodDAO pcg_dao) {
		this.pcg_dao = pcg_dao;
	}
	
	public int pcg_click(PcGoodVO pcg_vo) {
		int res = pcg_dao.good_Click(pcg_vo);
		return res;
	}
	
	public int pcg_u_idx(String email) {
		int u_idx =pcg_dao.good_user(email);
		return u_idx;
	}
//	public boolean userId_Check(String u_id) {
//		boolean check = false;
//		int u_idx = pcg_dao.user_check(u_id);//0
//		if(u_idx< 1) {
//			check = true;
//		}else {
//			pcg_dao.delete_pcg(u_idx);
//		}
//		return check;
//	}
	
	public boolean userId_Check(int u_idx,int pc_idx) {
		boolean check = false;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("u_idx", u_idx);
		map.put("pc_idx", pc_idx);
		PcGoodVO pcg_vo = pcg_dao.user_check(map);
		System.out.println(pcg_vo);
		if(pcg_vo == null) {
			check =true;
		}
		return check;
	}
	
	public List<PcGoodVO> pcg_list(int u_idx){
		List<PcGoodVO> list = pcg_dao.pcg_list(u_idx);
		return list;
	}
	
	public int pcg_delete(int u_idx,int pc_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("u_idx", u_idx);
		map.put("pc_idx", pc_idx);
		int del = pcg_dao.delete_pcg(map);
		return del;
	}

}
