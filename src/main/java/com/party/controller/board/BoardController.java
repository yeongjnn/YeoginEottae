package com.party.controller.board;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.party.board.service.BoardService;
import com.party.board.vo.BoardVO;

@Controller
public class BoardController {

	
	@Resource(name="boardService")  
	private BoardService boardService;
		
	
	//게시판 전체보기
	@RequestMapping(value="/getAllBoard.do")  
	public String getAllBoard(HttpSession session,HttpServletRequest request,Model model) throws Exception{
		
		ArrayList <BoardVO> bdlist = boardService.getAllBoard();
		model.addAttribute("bdlist",bdlist);

//		if(session.getAttribute("sid")!=null) {
//			return "main";
//		}
		
		return "boardAll"; 
	} 

	//글 작성하기
	@RequestMapping(value="/boardInsert.do",method=RequestMethod.POST) 
	public String boardInsert(@ModelAttribute("boardVO")BoardVO boardVO,Model model) {
		
		boardService.boardInsert(boardVO);
		
		return "redirect:/getAllBoard.do";		
	}
	
	//답변 작성
	@RequestMapping(value="/answerInsert.do",method=RequestMethod.POST) 
	public String answerInsert(@RequestParam("groupnum") int groupnum,@ModelAttribute("boardVO")BoardVO boardVO,Model model) {
		boardService.answerUpdate(boardVO);
		boardService.answerInsert(boardVO);
		model.addAttribute("b_num", groupnum);
		return "redirect:/answerOpen.do";
	}	
	
	//답변열기
	@RequestMapping(value="/answerOpen.do")  
	public String answerOpen(@RequestParam("b_num") int b_num,Model model) throws Exception{
		ArrayList <BoardVO> bdlist = boardService.answerOpen(b_num);
		model.addAttribute("bdlist",bdlist);
		
		return "boardAll"; 
	} 
	
	//글 삭제
	@RequestMapping(value="/boardDelete.do") 
	public String boardDelete(@RequestParam("groupnum") int groupnum,@ModelAttribute("boardVO")BoardVO boardVO,Model model) {
		boardService.boardDelete(boardVO);
		
		model.addAttribute("b_num", groupnum);
		return "redirect:/answerOpen.do";
	}	
	
	
}
