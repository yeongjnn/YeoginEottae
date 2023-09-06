package com.party.controller.question;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.party.member.vo.PageVO;
import com.party.notice.vo.NoticeVO;
import com.party.question.service.QuestionService;
import com.party.question.vo.QuestionVO;

@Controller
public class QuestionController {
	
	@Resource(name="questionService")
	private QuestionService questionService;
	
	@RequestMapping(value = "/question.do", method = RequestMethod.GET)
	public String Question(@ModelAttribute("questionVO") QuestionVO questionVO, Model model) throws Exception  {
		
		questionService.getQuestion(questionVO); 

		return "/questionInsertForm"; // 문의사항 입력폼으로 이동 questionInsertForm
	}
	
	// 문의사항 입력폼으로 이동 questionInsertForm
	@RequestMapping(value = "/insertForm.do")
	public String noticeInsetForm (@ModelAttribute("noticeVO") NoticeVO noticeVO, Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "questionInsertForm";
	}
	
	// 문의사항 모든내용 전체 출력하기 => 관리자
	@RequestMapping(value = "/getAllQuestion.do") //getAllQuestion
	public String getAllQuestion(HttpServletRequest request,PageVO paging,Model model) throws Exception {
		
		int totalcount = questionService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<QuestionVO> qtlist= questionService.getAllQuestion(page, page2);
		
		model.addAttribute("qtlist", qtlist);
		model.addAttribute("paging",paging);
		
		return "qnaBoard_mngr";
	}
	
	// 문의사항 입력하기에서 제출 버튼
	@RequestMapping(value = "/questionInsert.do")
		public String insertQuestion(QuestionVO questionVO, Model model) throws Exception  {
		
		int mem_num = questionVO.getMem_num();
		questionService.insertQuestion(questionVO); 
			
		return "redirect:/questionMyOne.do?mem_num="+mem_num; // 개인건만 전체 출력하기로 원래는
	}
	
	// 문의사항 전체 출력하기 => 회원 본인것만
	@RequestMapping(value = "/questionMyOne.do") //questionMyOne
	public String questionMyOne(@ModelAttribute("questionVO")QuestionVO questionVO, Model model,PageVO paging,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		int mem_num=questionVO.getMem_num();
		int totalcount = questionService.getTotalCount2(questionVO);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<QuestionVO> qtlist= questionService.questionMyOne(page,page2,mem_num);
		
		model.addAttribute("qtlist", qtlist);
		model.addAttribute("paging",paging);
		
		return "qnaBoard";
	}
	
	// 문의사항 개별 선택
	@RequestMapping(value = "/questionSearchOne.do", method = RequestMethod.GET)
	public String questionSearchOne(@ModelAttribute("questionVO") QuestionVO questionVO, Model model) throws Exception {
		
		questionService.getQuestion(questionVO); 
		
		return "questionDetail";
	}
	
	// 문의사항 개별 선택==> 관리자
	@RequestMapping(value = "/questionSearchOneM.do", method = RequestMethod.GET)
	public String questionSearchOne1(@ModelAttribute("questionVO") QuestionVO questionVO, Model model) throws Exception {
		
		questionService.getQuestion(questionVO); 
		
		return "questionDetail_mngr";
	}
	
	// 문의사항 개별 선택후 삭제하기
	@RequestMapping(value = "/questionDelete.do")
	public String deleteQuestion(HttpServletResponse res,QuestionVO questionVO, Model model) throws Exception {
		res.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = res.getWriter();
	    
		questionService.deleteQuestion(questionVO); 

		int mem_num = questionVO.getMem_num();
		int q_num = questionVO.getQ_num();
		
		out.println("<script>alert('삭제 되었습니다.');window.location='questionMyOne.do?mem_num=" + mem_num + "&q_num=" + q_num + "';</script>");
		out.flush();
		
		return null;
	}
	
	// 문의사항 검색하기 questionfilter.do
	@RequestMapping(value = "/questionfilter.do")
	public String questionFilter (@Param("question_search") String question_search,@Param("mem_num") int mem_num,
			QuestionVO questionVO, Model model, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String question_search2 = "%" + question_search.toUpperCase() + "%";

		mem_num = questionVO.getMem_num();
		
		ArrayList<QuestionVO> qtlist= questionService.filterQuestion(question_search2,mem_num);
		model.addAttribute("qtlist", qtlist);
		
			return "qnaBoard";
	}
	
	// 문의사항 검색하기 questionfilterM.do => 관리자는 회원번호로만 검색
	@RequestMapping(value = "/questionfilterM.do")
	public String questionFilter1 (@RequestParam("question_search") String question_search,// 회원번호로 검색
			QuestionVO questionVO, Model model, 
			HttpServletRequest request,PageVO paging, HttpServletResponse response) throws Exception {

		String question_search2 = "%" + question_search + "%";
		
		int totalcount = questionService.getFilterTotal(question_search2);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
		ArrayList<QuestionVO> qtlist= questionService.filterQuestion1(page, page2,question_search2);
		
		model.addAttribute("qtlist", qtlist);
		model.addAttribute("paging",paging);
		
			return "qnaBoard_mngr";
	}
	
	// 문의사항 답변하기 폼으로 이동 questionAnswer_mngr.jsp
	@RequestMapping(value = "/questionAnswer.do")
	public String questionAnswer (@ModelAttribute("questionVO") QuestionVO questionVO, Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "questionAnswer_mngr";
	}
	
	// 문의사항 답변하기 버튼 클릭 answer_update.do
	@RequestMapping(value = "/answer_update.do")
	public String updateAnswer (@ModelAttribute("questionVO") QuestionVO questionVO,
			Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		questionService.updateQuestion(questionVO); 
		
		
		return "redirect:/getAllQuestion.do"; 
	}
	
	// 문의사항 삭제하기 관리자 => 삭제하기 버튼 누르면 전체 글 삭제
	@RequestMapping(value = "/questionDelete_mngr.do")
	public String noticeDelete (QuestionVO questionVO, Model model) throws Exception {
		
		questionService.deleteQuestion(questionVO); 
		
		return "redirect:/getAllQuestion.do";
	}
	
	
}

