package com.party.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.notice.dao.NoticeDAO;
import com.party.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	@Transactional
	public ArrayList<NoticeVO> getAllNotice(int page,int page2) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.getAllNotice(page,page2);
	}

	@Override
	@Transactional
	public NoticeVO getNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDAO.getNotice(noticeVO);
	}

	public void insertNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDAO.insertNotice(noticeVO);
	}

	public void updateNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDAO.updateNotice(noticeVO);
	}

	public void deleteNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDAO.deleteNotice(noticeVO);
	}

	@Override
	public ArrayList<NoticeVO> filterNotice(int page,int page2,String notice_search) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.filterNotice(page,page2,notice_search);
	} // filterNotice
	
	//페이징 위한 공지사항 수 조회
	public int getTotalCount() {
		return noticeDAO.getTotalCount();
	}
	
	public int getFilterTotal(String notice_search) {
		return noticeDAO.getFilterTotal(notice_search);
	}
	
	public void hitsUp(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDAO.hitsUp(noticeVO);
	}

}
