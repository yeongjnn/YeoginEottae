package com.party.review.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.notice.vo.NoticeVO;
import com.party.question.vo.QuestionVO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.dao.ReviewDAO;
import com.party.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Transactional
	public ArrayList<ReviewVO> getAllReview(int page,int page2) {
		return reviewDAO.getAllReview(page,page2);
	}
	
	public int getTotalCountM() {
		return reviewDAO.getTotalCountM();
	}

	@Transactional
	public ArrayList<ReviewVO> getFilterReview(@Param("page") int page,@Param("page2") int page2,@Param("review_filter") String review_filter, @Param("review_search") String review_search) {

		return reviewDAO.getFilterReview(page,page2,review_filter, review_search);
	}
	
	//리뷰쓰기
	public void reviewInsert(ReviewVO reviewVO) {		

		reviewDAO.reviewInsert(reviewVO);
	}
	
	//자기리뷰 조회 myReview
	public ArrayList<ReviewVO> myReview( int page, int page2, int mem_num) {
		return reviewDAO.myReview(page,page2,mem_num);
	}
	
	//리뷰상세조회 - 리뷰내용
	public ReviewVO myReviewDetail(ReviewVO reviewVO) {
		return reviewDAO.myReviewDetail(reviewVO);
	}
	
	//리뷰상세조회 - 예약내용
	public ReservationVO myReviewDetail2(ReviewVO reviewVO) {
		
		return reviewDAO.myReviewDetail2(reviewVO);
	}
	
	//리뷰수정
	public void reviewUpdate(ReviewVO reviewVO) {		

		reviewDAO.reviewUpdate(reviewVO);
	}
	
	public int getFilterTotal(String review_filter,String review_search) {
		return reviewDAO.getFilterTotal(review_filter,review_search);
	}
	
	@Override
	@Transactional
	public ArrayList<ReviewVO> reviewOneAll(int room_num) {
		return reviewDAO.reviewOneAll(room_num);
	}
	
	public void reviewDelete(ReviewVO reviewVO) {
		
		reviewDAO.reviewDelete(reviewVO);
	}
	
	public int getTotalCount2(ReviewVO reviewVO) {
		return reviewDAO.getTotalCount2(reviewVO);
	}

}
