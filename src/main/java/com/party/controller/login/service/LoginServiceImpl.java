package com.party.controller.login.service;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;


import com.party.member.dao.MemberDAO;

import com.party.member.vo.MemberVO;
import com.party.notice.vo.NoticeVO;

@Service("LoginService")	
public class LoginServiceImpl implements LoginService {

	@Autowired
	private MemberDAO dao;

	@Override//로그인
	public MemberVO memberlogin(MemberVO mvo) throws Exception{
		MemberVO mvo2 = dao.memberlogin(mvo);
		return mvo2;
	}
	//아이디찾기
	public MemberVO findId(MemberVO mvo) throws Exception{
		MemberVO mvo2 = dao.findId(mvo);
		return mvo2;
	}
	//비밀번호 찾기
	public MemberVO findPw(MemberVO mvo) throws Exception{
		MemberVO mvo2 = dao.findPw(mvo);
		return mvo2;
	}
	//임시 비밀번호로 변경
	public boolean findPwUpdate(MemberVO memberVO) {
		boolean result = dao.findPwUpdate(memberVO);
		
		return result;
	}
	
	public void tryUp(MemberVO mvo) {
		// TODO Auto-generated method stub
		dao.tryUp(mvo);
	}
	
	public void tryReset(MemberVO mvo) {
		// TODO Auto-generated method stub
		dao.tryReset(mvo);
	}
}