package com.party.question.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.question.dao.QuestionDAO;
import com.party.question.vo.QuestionVO;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDAO questionDAO;

	@Override
	@Transactional//==> 관리자 : 전체 출력
	public ArrayList<QuestionVO> getAllQuestion(int page, int page2) throws Exception {
		// TODO Auto-generated method stub
		return questionDAO.getAllQuestion(page,page2);
	}
	
	@Transactional//==> 회원 : 자기것만 전체 출력
	public ArrayList<QuestionVO> questionMyOne(int page, int page2, int mem_num)throws Exception {
		// TODO Auto-generated method stub
		return questionDAO.questionMyOne(page,page2,mem_num);
	}
	
	@Override
	@Transactional// 1명에 대한 디테일건
	public QuestionVO getQuestion(QuestionVO questionVO) {
		// TODO Auto-generated method stub
		return questionDAO.getQuestion(questionVO);
	}
		// 입력
	public void insertQuestion(QuestionVO questionVO) {
		// TODO Auto-generated method stub

		questionDAO.insertQuestion(questionVO);
	}

	 // 수정
	public void updateQuestion(QuestionVO questionVO) {
		// TODO Auto-generated method stub

		questionDAO.updateQuestion(questionVO);
	}

	// 삭제
	public void deleteQuestion(QuestionVO questionVO) {
		// TODO Auto-generated method stub

		questionDAO.deleteQuestion(questionVO);
	}

	// 제목 + 내용으로 검색
	public ArrayList<QuestionVO> filterQuestion(String question_search,int mem_num) throws Exception {
		// TODO Auto-generated method stub
		return questionDAO.filterQuestion(question_search,mem_num);
	}

	@Override
	public ArrayList<QuestionVO> filterQuestion1(int page, int page2,String question_search) {
		// TODO Auto-generated method stub
		return questionDAO.filterQuestion1(page,page2,question_search);
	}
	
	public int getTotalCount() {
		return questionDAO.getTotalCount();
	}
	
	public int getFilterTotal(String question_search) {
		return questionDAO.getFilterTotal(question_search);
	}
	
	public int getTotalCount2(QuestionVO questionVO) {
		return questionDAO.getTotalCount2(questionVO);
	}

}
