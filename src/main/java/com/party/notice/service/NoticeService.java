package com.party.notice.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.notice.vo.NoticeVO;

public interface NoticeService {
	
	ArrayList<NoticeVO> getAllNotice(int page,int page2) throws Exception;

	NoticeVO getNotice(NoticeVO noticeVO); // 1명에 대한
	
	void insertNotice(NoticeVO noticeVO);

	void updateNotice(NoticeVO noticeVO);

	void deleteNotice(NoticeVO noticeVO);

	ArrayList<NoticeVO> filterNotice(int page,int page2,String notice_search) throws Exception; // 검색
	
	int getTotalCount();
	
	//페이징위한 검색결과 수 조회
	int getFilterTotal(String notice_search);
	
	void hitsUp(NoticeVO noticeVO);
	
}
