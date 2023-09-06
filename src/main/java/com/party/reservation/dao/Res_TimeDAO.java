package com.party.reservation.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.party.reservation.vo.Res_TimeVO;
import com.party.reservation.vo.ReservationVO;

public interface Res_TimeDAO {

	void insertRes_Time(Res_TimeVO res_TimeVO);

	// 시간 중복 체크
	// int timeCheck (int i, String start_date);

	int timeCheck(@Param("i")int i, 
			@Param("reserve_date") String reserve_date,
			@Param("room_num") int room_num);
	
	void resTimeDelete(Res_TimeVO res_TimeVO);

}
