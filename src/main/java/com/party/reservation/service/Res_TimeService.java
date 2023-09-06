package com.party.reservation.service;

import java.util.ArrayList;
import java.util.Map;

import com.party.reservation.vo.Res_TimeVO;

public interface Res_TimeService {

	void insertRes_Time(Res_TimeVO res_timeVO);
	
	// 시간 중복 체크
	// ArrayList<Res_TimeVO> timeCheck(String start_date) throws Exception;

	// int timeCheck(int i, String start_date) throws Exception;

	int timeCheck(int i, String reserve_date, int room_num);
	
	void resTimeDelete(Res_TimeVO res_TimeVO);
	
}
