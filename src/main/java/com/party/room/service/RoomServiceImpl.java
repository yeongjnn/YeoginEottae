package com.party.room.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.member.vo.MemberVO;
import com.party.room.dao.RoomDAO;
import com.party.room.vo.RoomVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDAO rdao;
		
	@Override
	@Transactional
	public ArrayList<RoomVO> getAllRoom() {
		return rdao.getAllRoom();
	}
	
	//페이징 위한 전체 수 조회
	public int getTotalCount() {
		return rdao.getTotalCount();
	}
	//관리자-방 전체보기 (페이징)
	public ArrayList <RoomVO> getList(int page1,int page2){
		return rdao.getList(page1,page2);
	}
	
	public void insertRoom(RoomVO roomVO) {
	      rdao.insertRoom(roomVO);
	   }
	
	public void updateRoom(RoomVO roomVO) {
	      rdao.updateRoom(roomVO);
	   }
	
	public void deleteRoom(RoomVO roomVO) {
		rdao.deleteRoom(roomVO);
	}
	
	// 베이직룸 전체 조회
	public ArrayList<RoomVO> getAllBasic(String bedOption,String musicOption) {
		return rdao.getAllBasic(bedOption,musicOption);
	}

	// 쿠킹룸 전체 조회
	public ArrayList<RoomVO> getAllCooking(String bedOption,String musicOption) {
		return rdao.getAllCooking(bedOption,musicOption);
	}

	// 키즈룸 전체 조회
	public ArrayList<RoomVO> getAllKids(String bedOption,String musicOption) {
		return rdao.getAllKids(bedOption,musicOption);
	}
		
	// 루프탑 전체 조회
	public ArrayList<RoomVO> getAllRooftop() {
		return rdao.getAllRooftop();
	}
	
	//필터페이징
	public int getFilterTotal(String bedOption, String musicOption) {
		return rdao.getFilterTotal(bedOption,musicOption);
	}
	//필터페이징
	public ArrayList <RoomVO> getFilterList(String bedOption, String musicOption,int page1,int page2){
		return rdao.getFilterList(bedOption,musicOption,page1,page2);
	}
	
	public ArrayList <RoomVO> getFilterListM(String roomFilter,String roomSearch,int page1,int page2){
		return rdao.getFilterListM(roomFilter, roomSearch,page1,page2);
	}
	
	public int getFilterTotalM(String roomFilter,String roomSearch) {
		return rdao.getFilterTotalM(roomFilter,roomSearch);
	}
	
	public RoomVO getOneRoom(RoomVO roomVO) {
		return rdao.getOneRoom(roomVO);
	}
	
}
