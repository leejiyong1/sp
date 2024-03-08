package service;

import org.springframework.stereotype.Service;

import dao.ToneDAO;

@Service
public class ToneService {

	ToneDAO tone_dao;
	
	public ToneService(ToneDAO tone_dao) {
		this.tone_dao = tone_dao;
	}
	
	public String select_tone(int t_idx) {
		System.out.println("in toneService");
		String t_name = tone_dao.select_tone(t_idx);
		return t_name;
	}
}
