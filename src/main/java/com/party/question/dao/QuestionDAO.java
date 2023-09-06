package com.party.question.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.question.vo.QuestionVO;

public interface QuestionDAO {
	
	//ArrayList<QuestionVO> questionMyAll(); //==> 관리자 : 전체 출력
	
	//==> 관리자 : 전체 출력
	ArrayList<QuestionVO> getAllQuestion(@Param("page") int page,@Param("page2") int page2);

	//==> 회원 : 자기것만 전체 출력
	ArrayList<QuestionVO> questionMyOne(@Param("page") int page,@Param("page2") int page2,@Param("mem_num") int mem_num);

	// 입력
	void insertQuestion(QuestionVO questionVO);

	// 수정
	void updateQuestion(QuestionVO questionVO);
	
	// 삭제
	void deleteQuestion(QuestionVO questionVO);

	// 1명에 대한 디테일건
	QuestionVO getQuestion(QuestionVO questionVO);

	ArrayList<QuestionVO> filterQuestion(@Param("question_search") String question_search,@Param("mem_num") int mem_num); // 제목+내용 검색

	ArrayList<QuestionVO> filterQuestion1(@Param("page") int page,@Param("page2") int page2,@Param("question_search") String question_search);// 회원번호로 검색
	
	int getTotalCount();
	
	int getFilterTotal(@Param("question_search")String question_search);
	
	int getTotalCount2(QuestionVO questionVO);
}
