package com.party.controller.login.service;


import com.party.member.vo.MemberVO;
import com.party.notice.vo.NoticeVO;

public interface LoginService {
	//로그인
	public MemberVO memberlogin(MemberVO mvo) throws Exception;
	
	//아이디찾기
	public MemberVO findId(MemberVO mvo) throws Exception;
	
	//비밀번호찾기
	public MemberVO findPw(MemberVO mvo) throws Exception;
	
	//임시비밀번호로 변경
	boolean findPwUpdate(MemberVO memberVO);
	
	void tryUp(MemberVO mvo);
	
	void tryReset(MemberVO mvo);
}
