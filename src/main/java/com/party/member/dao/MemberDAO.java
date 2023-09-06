package com.party.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.member.vo.MemberVO;
import com.party.notice.vo.NoticeVO;

public interface MemberDAO {
	//로그인 기능
	public MemberVO memberlogin(MemberVO mvo) throws Exception; 
	
	//아이디 찾기 
	public MemberVO findId(MemberVO mvo) throws Exception;	
	//비밀번호 찾기
	public MemberVO findPw(MemberVO mvo) throws Exception;
	
	//임시비밀번호로 변경
	boolean findPwUpdate(MemberVO memberVO);
	
	//관리자-회원 전체보기
	ArrayList <MemberVO> getAllMember();
	
	//관리자-검색기능 
	ArrayList <MemberVO> memberFilter(@Param("memberFilter")String memberFilter,@Param("memberSearch")String memberSearch);
	
	//관리자-회원정보수정
	boolean memberUpdate(MemberVO memberVO);
	
	//관리자-회원탈퇴 시키기
	void memberDelete(MemberVO memberVO);
	
	// 아이디 중복체크
	int idCheck(String id);

	// 연락처 중복체크
	int telCheck(String tel);
		
	// 닉네임 중복체크
	int nameCheck(String nickname);

	// 회원가입
	boolean insertMember(MemberVO memberVO);
	
	//마이페이지 내정보 불러오기
	MemberVO getMyInfo(MemberVO memberVO);
	
	//마이페이지 내정보 수정
	boolean myPageUpdate(MemberVO memberVO);
	
	//페이징위한 전체 수 조회
	int getTotalCount();
	//관리자- 사원전체보기 (페이징)
	ArrayList <MemberVO> getList(@Param("page") int page,@Param("page2") int page2);
		
	//페이징위한 검색결과 수 조회
	int getFilterTotal(@Param("memberFilter")String memberFilter,@Param("memberSearch")String memberSearch);
	
	//관리자 - 사원검색결과 전체보기 (페이징)
	ArrayList<MemberVO> getFilterList(@Param("memberFilter") String memberFilter,@Param("memberSearch") String memberSearch,
								@Param("page")int page, @Param("page2") int page2);
	
	void tryUp(MemberVO mvo);
	
	void tryReset(MemberVO mvo);
}
