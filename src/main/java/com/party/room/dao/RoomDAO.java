package com.party.room.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.member.vo.MemberVO;
import com.party.room.vo.RoomVO;

public interface RoomDAO {

	//페이징위한 전체 수 조회
	int getTotalCount();
	//관리자- 방 전체보기 (페이징)
	ArrayList <RoomVO> getList(@Param("page") int page,@Param("page2") int page2);
	
	void insertRoom(RoomVO roomVO);
	
	void updateRoom(RoomVO roomVO);
	
	void deleteRoom(RoomVO roomVO);
	
	// 파티룸 전체 조회
	ArrayList<RoomVO> getAllRoom();
	
	// 베이직룸 전체 조회
	ArrayList<RoomVO> getAllBasic(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption);
		
	// 쿠킹룸 전체 조회
	ArrayList<RoomVO> getAllCooking(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption);
		
	// 키즈룸 전체 조회
	ArrayList<RoomVO> getAllKids(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption);
		
	// 루프탑 전체 조회
	ArrayList<RoomVO> getAllRooftop();
	
	//필터-출력 페이징
	int getFilterTotal(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption);
	
	//필터-출력 페이징
	ArrayList <RoomVO> getFilterList(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption,
										@Param("page") int page,@Param("page2") int page2);
	
	//페이징위한 검색결과 수 조회
	int getFilterTotalM(@Param("roomFilter")String roomFilter,@Param("roomSearch")String roomSearch);
	
	ArrayList<RoomVO> getFilterListM(@Param("roomFilter") String roomFilter,@Param("roomSearch") String roomSearch,
			@Param("page")int page, @Param("page2") int page2);
	// 파티룸 개별 조회
	RoomVO getOneRoom(RoomVO roomVO);
}
