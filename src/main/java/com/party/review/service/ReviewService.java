package com.party.review.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.notice.vo.NoticeVO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.vo.ReviewVO;


public interface ReviewService {
	int getTotalCountM();
	
	ArrayList<ReviewVO> getAllReview(int page,int page2);

	ArrayList<ReviewVO> getFilterReview(@Param("page") int page,@Param("page2") int page2,@Param("review_filter") String review_filter, @Param("review_search") String review_search);

	void reviewInsert(ReviewVO reviewVO);
	
	//자기리뷰조회
	ArrayList<ReviewVO> myReview(int page, int page2, int mem_num);
	
	//리뷰상세조회 - 리뷰내용
	ReviewVO myReviewDetail(ReviewVO reviewVO);
		
	//리뷰상세조회 - 예약내용
	ReservationVO myReviewDetail2(ReviewVO reviewVO);
	
	//리뷰수정
	void reviewUpdate(ReviewVO reviewVO);
	
	int getFilterTotal(@Param("review_filter")String review_filter,@Param("review_search")String review_search);
	
	// 개별 파티룸 리뷰 전체 조회
	ArrayList<ReviewVO> reviewOneAll(int room_num);
	
	void reviewDelete(ReviewVO reviewVO);
	
	int getTotalCount2(ReviewVO reviewVO);
}
