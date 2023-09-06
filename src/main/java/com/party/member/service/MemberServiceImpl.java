package com.party.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.member.dao.MemberDAO;
import com.party.member.vo.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
		@Autowired
		private MemberDAO mdao;
		
		@Override
		@Transactional//관리자-회원 전체보기 ///삭졔예정
		public ArrayList <MemberVO> getAllMember(){
			return mdao.getAllMember();
		}
		
		//관리자-검색기능 삭제예정 ///삭졔예정
		public ArrayList <MemberVO> memberFilter(String memberFilter,String memberSearch){
			return mdao.memberFilter(memberFilter,memberSearch);
		}		
			
		//관리자-회원정보 수정
		public boolean memberUpdate(MemberVO memberVO) {
			boolean result = mdao.memberUpdate(memberVO);
			
			return result;
		}
		
		//관리자-회원정보 삭제
		public void memberDelete(MemberVO memberVO) {
			mdao.memberDelete(memberVO);
		}
	
		// 아이디 중복체크
		public int idCheck(String id) throws Exception {
			return  mdao.idCheck(id);
		}

		// 연락처 중복체크
		public int telCheck(String tel) throws Exception {
			return  mdao.telCheck(tel);
		}

		// 닉네임 중복체크
		public int nameCheck(String nickname) throws Exception{
			return  mdao.nameCheck(nickname);
		}

		
		// 회원가입
		public boolean insertMember(MemberVO memberVO) {
			return mdao.insertMember(memberVO);
		}
		
		//마이페이지 내 정보 불러오기
		public MemberVO getMyInfo(MemberVO memberVO) {
			return mdao.getMyInfo(memberVO);
		}
		
		//마이페이지 내 정보 수정
		public boolean myPageUpdate(MemberVO memberVO) {
			boolean result = mdao.myPageUpdate(memberVO);
			
			return result;
		}
		
		//페이징 위한 전체 수 조회
		public int getTotalCount() {
			return mdao.getTotalCount();
		}
		
		//관리자-사원전체보기 (페이징)
		public ArrayList <MemberVO> getList(int page1,int page2){
			return mdao.getList(page1,page2);
		}
		
		//페이징 위한 검색결과 수 조회
		public int getFilterTotal(String memberFilter,String memberSearch) {
			return mdao.getFilterTotal(memberFilter,memberSearch);
		}
		
		//관리자-사원검색결과 전체보기(페이징)
		public ArrayList <MemberVO> getFilterList(String memberFilter,String memberSearch,int page1,int page2){
			return mdao.getFilterList(memberFilter, memberSearch,page1,page2);
		}

}
