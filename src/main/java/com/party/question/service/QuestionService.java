package com.party.question.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.question.vo.QuestionVO;

public interface QuestionService {

	//==> 관리자 : 전체 출력
	ArrayList<QuestionVO> getAllQuestion(int page, int page2) throws Exception;

	//==> 회원 : 자기것만 전체 출력
	ArrayList<QuestionVO> questionMyOne(int page, int page2, int mem_num) throws Exception; 

	// 1명에 대한 디테일건
	QuestionVO getQuestion(QuestionVO questionVO);
	
	// 입력
	void insertQuestion(QuestionVO questionVO);

	// 수정
	void updateQuestion(QuestionVO questionVO);

	// 삭제
	void deleteQuestion(QuestionVO questionVO);

	// 검색
	ArrayList<QuestionVO> filterQuestion(String question_search,int mem_num) throws Exception; // 검색

	ArrayList<QuestionVO> filterQuestion1(int page, int page2,String question_search); // 회원번호로 검색
	
	int getTotalCount();
	
	int getFilterTotal(String question_search);
	
	int getTotalCount2(QuestionVO questionVO);




}
