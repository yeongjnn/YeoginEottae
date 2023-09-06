package com.party.reservation.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.notice.vo.NoticeVO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.vo.ReviewVO;

public interface ReservationDAO {

	ArrayList<ReservationVO> getAllReservation();

	ArrayList<ReservationVO> getFilterReservation(@Param("reservation_filter") String reservation_filter, @Param("reservation_search") String reservation_search);
	
	ArrayList<ReservationVO> getMyReservation(@Param("mem_num") int mem_num,@Param("page") int page,@Param("page2") int page2);
	
	void resDelete(ReservationVO reservationVO);
	
	ReservationVO resDetail(ReservationVO reservationVO);
	
	ArrayList<ReviewVO> revCheck(ReservationVO reservationVO);
	
	// 예약 등록
	void insertReservation(ReservationVO reservationVO);
	
	int getTotalCount(ReservationVO reservationVO);
	
	int getTotalCount_mngr();
	
	ArrayList<ReservationVO> getAllRes_mngr(@Param("page") int page,@Param("page2") int page2);
}
