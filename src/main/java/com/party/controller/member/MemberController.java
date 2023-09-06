package com.party.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.party.controller.login.LoginController;
import com.party.controller.reservation.ReservationController;
import com.party.member.service.MemberService;
import com.party.member.vo.MemberVO;
import com.party.member.vo.PageVO;

@Controller
public class MemberController {
	
	private static final org.apache.logging.log4j.Logger log = org.apache.logging.log4j.LogManager
	         .getLogger(ReservationController.class);
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Resource(name="memberService")  
	private MemberService memberService; 
	
	@RequestMapping(value = "/joinview.do", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	
		// 아이디 중복 검사
		@ResponseBody
		@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST, produces = "application/json")
		public Map<Object, Object> idChk(@RequestBody String id) throws Exception {
			logger.info(id);

			Map<Object, Object> map = new HashMap<Object, Object>();
			int result = 0;

			result = memberService.idCheck(id);

			map.put("check", result);

			return map;
		}

		// 연락처 중복 검사
		@ResponseBody
		@RequestMapping(value = "/telCheck.do", method = RequestMethod.POST, produces = "application/json")
		public Map<Object, Object> telChk(@RequestBody String tel) throws Exception {
			logger.info(tel);

			Map<Object, Object> map = new HashMap<Object, Object>();
			int result = 0;

			result = memberService.telCheck(tel);

			map.put("check", result);

			return map;
		}

		// 닉네임 중복 검사
		@ResponseBody
		@RequestMapping(value = "/nicknameCheck.do", method = RequestMethod.POST, produces = "application/json")
		public Map<Object, Object> nameChk(@RequestBody String nickname) throws Exception {
			logger.info(nickname);

			Map<Object, Object> map = new HashMap<Object, Object>();
			int result = 0;

			result = memberService.nameCheck(nickname);

			map.put("check", result);

			return map;
		}

		// 회원가입
		   @ResponseBody
		   @RequestMapping(value = "/memberInsert.do", method = RequestMethod.POST)
		   public String memberInsert(@ModelAttribute("memberVO") MemberVO memberVO, String email1, String email2)
		         throws NoSuchAlgorithmException {

		      String id = email1 + "@" + email2;
		      memberVO.setId(id);
		      log.info(memberVO.getId());

//		      String pw = PwEncoding.sha256(memberVO.getPw());
//		      memberVO.setPw(pw);

		      // BCryptPasswordEncoder 통해 비밀번호 인코딩
		      String encryptedPassword = bCryptPasswordEncoder.encode(memberVO.getPw());
		      memberVO.setPw(encryptedPassword);

		      log.info(memberVO.getPw());

		      boolean join = memberService.insertMember(memberVO);

		      if (join == true) {
		         return "success";
		      } else {
		         return "fail";
		      }
		   }
	
	    //관리자-회원 전체보기
		@RequestMapping(value="/getAllMember.do")  
		public String getAllMember(Model model) throws Exception{
			ArrayList <MemberVO> mlist = memberService.getAllMember();
			model.addAttribute("mlist",mlist);
			
			return "member_mngr"; 
		}
		
		//관리자-회원 검색기능
		@RequestMapping(value="/memberFilter.do")  
		public String memberFilter(@Param("memberFilter") String memberFilter,@Param("memberSearch") String memberSearch,Model model) throws Exception{
			String memberSearch2 = "%" + memberSearch.toUpperCase() + "%";
			
			ArrayList <MemberVO> mlist = memberService.memberFilter(memberFilter,memberSearch2);
			model.addAttribute("mlist",mlist);
			
			return "member_mngr"; 
		}
	
		//관리자-회원 상세보기
		@RequestMapping(value="/memberGetOne.do") 
		public String memberGetOne(@ModelAttribute("memberVO")MemberVO memberVO, Model model) throws Exception {
		   
		    model.addAttribute("memberVO", memberVO);
		    
		    return "memberGetOne_mngr";
		 }
		
		//관리자 - 회원정보 수정
		@RequestMapping(value="/memberUpdate.do") 
		public String memberUpdate(MemberVO memberVO, Model model,HttpServletResponse res) throws IOException {
			res.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = res.getWriter();
		    
		   
			boolean result = memberService.memberUpdate(memberVO);
		    
		    return "redirect:/memberPage.do";
		 }
	
		//관리자 - 회원정보 삭제
		@RequestMapping(value="/memberDelete.do") 
		public String memberDelete(MemberVO memberVO, Model model) {
		   
			memberService.memberDelete(memberVO);
		    
		    return "redirect:/getAllMember.do";
		 }
	
		//관리자-회원 상세보기 
		@RequestMapping(value="/getMyInfo.do") 
		public String getMyInfo(@ModelAttribute("memberVO")MemberVO memberVO, Model model) throws Exception {
			   
			MemberVO memberVO2 = memberService.getMyInfo(memberVO);
			int[] list=new int [3];
			for(int i=0;i<3;i++) {
				list[i]=i;
			}
			
			
			model.addAttribute("memberVO",memberVO2);
			model.addAttribute("list",list);
				    
		return "myPage";
		}
		
	    //마이페이지 내정보 수정하기
		@RequestMapping(value="/myPageUpdate.do") 
		public String myPageUpdate(MemberVO memberVO, Model model,HttpServletResponse res,HttpSession session) throws IOException, NoSuchAlgorithmException {
			res.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = res.getWriter();
		    String pw=bCryptPasswordEncoder.encode(memberVO.getPw());
		    memberVO.setPw(pw);
		    session.setAttribute("sid", memberVO); //
	        session.setMaxInactiveInterval(1800); // 30
	        int mem_num=memberVO.getMem_num();
			boolean result = memberService.myPageUpdate(memberVO);
		   
		    return "redirect:/getMyInfo.do?mem_num="+mem_num;
		 }
		
		//마이페이지 회원탈퇴
		@RequestMapping(value="/myPageDelete.do") 
		public String myPageDelete(HttpSession session,MemberVO memberVO, Model model) throws IOException {
				   
		memberService.memberDelete(memberVO);
		
		session.removeAttribute("sid");
	
		return "main";		
		}
		
		
		//관리자 - 회원 전체보기 (페이징)
		@RequestMapping(value="/memberPage.do")
		public String memberPage(HttpServletRequest request,PageVO paging, Model model) throws Exception{
			
			int totalcount = memberService.getTotalCount();
			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

			if (totalcount == 0)
				totalcount = 1;

			paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalcount);
			
			page = (page - 1) * 10 + 1; // select해오는 기준을 구한다.
			int page2 = page + 9;   
			
			
			ArrayList <MemberVO> mlist = memberService.getList(page, page2);
			model.addAttribute("mlist",mlist);
			model.addAttribute("paging",paging);
			
			return "member_mngr"; 
		}
		
		//관리자-회원 검색기능 (페이징)
		@RequestMapping(value="/memberPageFilter.do")  
		public String memberPageFilter(@Param("memberFilter") String memberFilter,@Param("memberSearch") String memberSearch,
									HttpServletRequest request,PageVO paging, Model model) throws Exception{
			
			String memberSearch2 = "%" + memberSearch.toUpperCase() + "%";
			
			int totalcount = memberService.getFilterTotal(memberFilter,memberSearch2);
			
			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

			if (totalcount == 0)
				totalcount = 1;

			paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalcount);
			
			page = (page - 1) * 10 + 1; // select해오는 기준을 구한다.
			int page2 = page + 9;
			
			ArrayList <MemberVO> mlist = memberService.getFilterList(memberFilter,memberSearch2,page,page2);
			model.addAttribute("mlist",mlist);
			model.addAttribute("paging",paging);
	
			return "member_mngr"; 
		}
		
}
