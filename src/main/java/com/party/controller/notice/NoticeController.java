package com.party.controller.notice;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.party.member.vo.PageVO;
import com.party.notice.service.NoticeService;
import com.party.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Resource(name="noticeService")
	private NoticeService noticeService;

	@RequestMapping(value = "/notice.do") //getAllNotice
	public String noticeAll (HttpServletRequest request,PageVO paging,Model model) throws Exception {
		
		int totalcount = noticeService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<NoticeVO> ntlist= noticeService.getAllNotice(page, page2);
		model.addAttribute("ntlist", ntlist);
		model.addAttribute("paging",paging);
		
		return "noticeBoard";
	}
	
	//notice.page => 관리자 모드 공지사항
	@RequestMapping(value = "/notice_mngr.do", method = RequestMethod.GET)
	public String noticeAllMngr (HttpServletRequest request,PageVO paging,Model model) throws Exception {
		
		int totalcount = noticeService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<NoticeVO> ntlist= noticeService.getAllNotice(page, page2);
		model.addAttribute("ntlist", ntlist);
		model.addAttribute("paging",paging);
		
		return "noticeBoard_mngr";
	}
	
	// 한건 디테일하게 보기 회원/비회원
	@RequestMapping(value = "/noticeSearchOne.do", method = RequestMethod.GET)
	public ModelAndView noticeSearchOne (NoticeVO noticeVO, Model model, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		int n_num=noticeVO.getN_num();
		NoticeVO notice = noticeService.getNotice(noticeVO);
		ModelAndView view = new ModelAndView();
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if (cookies != null && cookies.length > 0) 
        {
            for (int i = 0; i < cookies.length; i++)
            {
                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie"+n_num))
                { 
                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
                    viewCookie = cookies[i];
                }
            }
        }	
		if (notice != null) {
            System.out.println("System - 해당 상세 리뷰페이지로 넘어감");
            
            view.addObject("review", notice);
 
            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
            if (viewCookie == null) {    
                System.out.println("cookie 없음");           
                // 쿠키 생성(이름, 값)
                Cookie newCookie = new Cookie("cookie"+n_num, "|" + n_num + "|");                            
                // 쿠키 추가
                response.addCookie(newCookie);
                // 쿠키를 추가 시키고 조회수 증가시킴
                noticeService.hitsUp(noticeVO);                           
            }
            // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
            else {
                System.out.println("cookie 있음");               
                // 쿠키 값 받아옴.
                String value = viewCookie.getValue();              
                System.out.println("cookie 값 : " + value);   
            }
            NoticeVO ntlist = noticeService.getNotice(noticeVO);
            model.addAttribute("ntlist", ntlist);
            view.setViewName("noticeDetail");
            return view;
        } 
        else {
            // 에러 페이지 설정
            view.setViewName("error/reviewError");
            return view;
        }
	}
	
	// 한건 디테일하게 보기 관리자
	@RequestMapping(value = "/noticeSearchOneM.do", method = RequestMethod.GET)
	public String noticeSearchOne1 (NoticeVO noticeVO, Model model, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		noticeService.getNotice(noticeVO); 
		
		return "noticeDetail_mngr";
	}
	
	// 공지사항 입력하기 로 이동 noticeInsertForm.do
	@RequestMapping(value = "/noticeInsertForm.do")
	public String noticeInsetForm (@ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) throws Exception {
		
		return "noticeInsertForm_mngr";
	}
	
	// 공지사항 입력하는 찐 내용 관리자 noticeInsert.do
	@RequestMapping(value = "/noticeInsert.do")
	public String noticeInset (NoticeVO noticeVO, Model model) throws Exception {
		
		noticeService.insertNotice(noticeVO); 
		
		return "redirect:/notice_mngr.do";
	}

	// 공지사항 수정하기로 이동 관리자
	@RequestMapping(value = "/noticeUpdateForm.do")
	public String UpdateForm (NoticeVO noticeVO, Model model) throws Exception {
		
		return "noticeUpdateForm_mngr";
	}
	
	// 공지사항 수정하기 관리자
	@RequestMapping(value = "/noticeUpdate.do")
	public String noticeUpdate (NoticeVO noticeVO, Model model) throws Exception {
		
		noticeService.updateNotice(noticeVO); 
		
		return "redirect:/notice_mngr.do";
	}
	
	// 공지사항 삭제하기 관리자
	@RequestMapping(value = "/noticeDelete.do")
	public String noticeDelete (NoticeVO noticeVO, Model model) throws Exception {
		
		noticeService.deleteNotice(noticeVO); 
		
		return "redirect:/notice_mngr.do";
	}
	
	
	// 공지사항 검색하기 noticefilter.do
	@RequestMapping(value = "/noticefilter.do")
	public String noticeFilter (@RequestParam("notice_search") String notice_search,NoticeVO noticeVO, Model model, 
			HttpServletRequest request, HttpServletResponse response,PageVO paging) throws Exception {

		String notice_search2 = "%" + notice_search.toUpperCase() + "%";
		
		int totalcount = noticeService.getFilterTotal(notice_search2);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<NoticeVO> ntlist= noticeService.filterNotice(page, page2,notice_search2);
		model.addAttribute("ntlist", ntlist);
		model.addAttribute("paging",paging);
		
		return "noticeBoard";
	}
	
	// 공지사항 검색하기 noticefilterM.do ==> 관리자
	@RequestMapping(value = "/noticefilterM.do")
	public String noticeFilter1 (@RequestParam("notice_search") String notice_search,NoticeVO noticeVO, Model model, 
			HttpServletRequest request, HttpServletResponse response,PageVO paging) throws Exception {

		String notice_search2 = "%" + notice_search.toUpperCase() + "%";
		
		int totalcount = noticeService.getFilterTotal(notice_search2);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<NoticeVO> ntlist= noticeService.filterNotice(page, page2,notice_search2);
		model.addAttribute("ntlist", ntlist);
		model.addAttribute("paging",paging);
		
		return "noticeBoard_mngr";
	}
	
}
