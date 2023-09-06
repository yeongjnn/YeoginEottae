package com.party.notice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.notice.vo.NoticeVO;

public interface NoticeDAO {
	int getTotalCount();
	
	ArrayList<NoticeVO> getAllNotice(@Param("page") int page,@Param("page2") int page2);

	NoticeVO getNotice(NoticeVO noticeVO); // 1명에 대한
	
	void insertNotice(NoticeVO noticeVO);

	void updateNotice(NoticeVO noticeVO);

	void deleteNotice(NoticeVO noticeVO);

	ArrayList<NoticeVO> filterNotice(@Param("page") int page,@Param("page2") int page2,@Param("notice_search") String notice_search);
	
	//페이징위한 검색결과 수 조회
	int getFilterTotal(@Param("notice_search")String notice_search);
	
	void hitsUp(NoticeVO noticeVO);
	
}
