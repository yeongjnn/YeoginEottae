package com.party.reservation.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.notice.vo.NoticeVO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.vo.ReviewVO;

public interface ReservationService {

	ArrayList<ReservationVO> getAllReservation();

	ArrayList<ReservationVO> getFilterReservation(@Param("reservation_filter") String reservation_filter, @Param("reservation_search") String reservation_search);

	ArrayList<ReservationVO> getMyReservation(int mem_num,int page,int page2);
	
	void resDelete(ReservationVO reservationVO);
	
	ReservationVO resDetail(ReservationVO reservationVO);
	
	ArrayList<ReviewVO> revCheck(ReservationVO reservationVO);
	
	// 예약 등록
	void insertReservation(ReservationVO reservationVO);
	
	int getTotalCount(ReservationVO reservationVO);

	int getTotalCount_mngr();
	
	ArrayList<ReservationVO> getAllRes_mngr(int page,int page2) throws Exception;
}
