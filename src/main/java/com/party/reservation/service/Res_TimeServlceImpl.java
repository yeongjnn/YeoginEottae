package com.party.reservation.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.reservation.dao.Res_TimeDAO;
import com.party.reservation.vo.Res_TimeVO;
import com.party.reservation.vo.ReservationVO;

@Service("res_timeService")
public class Res_TimeServlceImpl implements Res_TimeService {

	@Autowired
	private Res_TimeDAO rtd1;

	@Override
	@Transactional
	public void insertRes_Time(Res_TimeVO res_TimeVO) {
		rtd1.insertRes_Time(res_TimeVO);

	}

//	@Override
//	public int timeCheck(int i, String start_date) throws Exception {
//		return rtd1.timeCheck(i, start_date);
//	}

	
	public int timeCheck(int i, String reserve_date, int room_num) {
		// TODO Auto-generated method stub
		return rtd1.timeCheck(i, reserve_date, room_num);
	}
	
	public void resTimeDelete(Res_TimeVO res_TimeVO) {
		// TODO Auto-generated method stub
		rtd1.resTimeDelete(res_TimeVO);
	}

}
