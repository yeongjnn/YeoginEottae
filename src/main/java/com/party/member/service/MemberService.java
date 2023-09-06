package com.party.member.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.member.vo.MemberVO;

public interface MemberService {
	
	//관리자-회원 전체보기  ///삭졔예정
	ArrayList <MemberVO> getAllMember();
	
	//관리자-검색기능   ///삭졔예정
	ArrayList <MemberVO> memberFilter(String memberFilter,String memberSearch);
	
	//관리자-회원정보수정
	boolean memberUpdate(MemberVO memberVO);
	
	//관리자-회원탈퇴시키기
	void memberDelete(MemberVO memberVO);
	
	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;

	// 연락처 중복 검사
	public int telCheck(String tel) throws Exception;

	// 닉네임 중복검사
	public int nameCheck(String nickname) throws Exception;

	// 회원가입
	public boolean insertMember(MemberVO memberVO);
		
	//마이페이지 내정보 불러오기
	MemberVO getMyInfo(MemberVO memberVO);
		
	//마이페이지 내정보 수정
	boolean myPageUpdate(MemberVO memberVO);

	//페이징 위한 전체 수 조회
	int getTotalCount();
	//관리자- 사원전체보기 (페이징)
	ArrayList <MemberVO> getList(int page,int page2);
	
	
	//페이징위한 검색결과 수 조회
	int getFilterTotal(String memberFilter,String memberSearch);	
	//관리자 - 사원검색결과 전체보기 (페이징)
	ArrayList<MemberVO> getFilterList(String memberFilter, String memberSearch2, int page, int page2);
	
	
}
