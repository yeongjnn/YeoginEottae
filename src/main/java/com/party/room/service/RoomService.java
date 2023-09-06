package com.party.room.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.member.vo.MemberVO;
import com.party.room.vo.RoomVO;

public interface RoomService {
		//페이징위한 전체 수 조회
		int getTotalCount();
		//관리자- 방 전체보기 (페이징)
		ArrayList <RoomVO> getList(@Param("page") int page,@Param("page2") int page2);
		
		void insertRoom(RoomVO roomVO);
		
		void updateRoom(RoomVO roomVO);
		
		void deleteRoom(RoomVO roomVO);
		
		// 파티룸 전체 조회
		ArrayList<RoomVO> getAllRoom() throws Exception;
		
		// 베이직룸 전체 조회
		ArrayList<RoomVO> getAllBasic(String bedOption,String musicOption) throws Exception;

		// 쿠킹룸 전체 조회
		ArrayList<RoomVO> getAllCooking(String bedOption,String musicOption) throws Exception;

		// 키즈룸 전체 조회
		ArrayList<RoomVO> getAllKids(String bedOption,String musicOption) throws Exception;

		// 루프탑 전체 조회
		ArrayList<RoomVO> getAllRooftop() throws Exception;
		
		//필터-출력 페이징
		int getFilterTotal(String bedOption, String musicOption);
		
		//필터-출력 페이징
		ArrayList <RoomVO> getFilterList(String bedOption, String musicOption, int page, int page2);
		
		int getFilterTotalM(String roomFilter,String roomSearch);
		
		ArrayList<RoomVO> getFilterListM(String roomFilter, String roomSearch, int page, int page2);

		// 파티룸 개별 조회
		RoomVO getOneRoom(RoomVO roomVO);

}
