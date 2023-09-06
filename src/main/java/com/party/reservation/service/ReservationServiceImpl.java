package com.party.reservation.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.notice.vo.NoticeVO;
import com.party.reservation.dao.ReservationDAO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.vo.ReviewVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO reservatoinDAO;
	
	@Transactional
	public ArrayList<ReservationVO> getAllReservation(){
		
		return reservatoinDAO.getAllReservation();
	}

	@Transactional
	public  ArrayList<ReservationVO> getFilterReservation(@Param("reservation_filter") String reservation_filter, @Param("reservation_search") String reservation_search){
		System.out.println("서비스임플_조건 : " + reservation_filter);
		System.out.println("서비스임플_검색어 : " + reservation_search);
		
		return reservatoinDAO.getFilterReservation(reservation_filter, reservation_search);
	}
	
	public ArrayList<ReservationVO> getMyReservation(int mem_num,int page,int page2){
			
			return reservatoinDAO.getMyReservation(mem_num,page,page2);
		}
	
	public void resDelete(ReservationVO reservationVO) {
		// TODO Auto-generated method stub
		reservatoinDAO.resDelete(reservationVO);
	}
	
	public ReservationVO resDetail(ReservationVO reservationVO) {
		
		return reservatoinDAO.resDetail(reservationVO);
	}
	
	public ArrayList<ReviewVO> revCheck(ReservationVO reservationVO) {
		return  reservatoinDAO.revCheck(reservationVO);
	}
	

	
	@Transactional
	public void insertReservation(ReservationVO reservationVO) {
		reservatoinDAO.insertReservation(reservationVO);
	}
	
	public int getTotalCount(ReservationVO reservationVO) {
		return reservatoinDAO.getTotalCount(reservationVO);
	}
	
	public int getTotalCount_mngr() {
		return reservatoinDAO.getTotalCount_mngr();
	}
	
	@Override
	@Transactional
	public ArrayList<ReservationVO> getAllRes_mngr(int page,int page2) throws Exception {
		// TODO Auto-generated method stub
		return reservatoinDAO.getAllRes_mngr(page,page2);
	}
	
}
