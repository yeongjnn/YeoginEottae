package com.party.controller.login;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.party.controller.login.service.LoginService;
import com.party.controller.member.PwEncoding;
import com.party.member.vo.MemberVO;
import com.party.statistics.vo.StatisticsVO;

@Controller
public class LoginController {
	
	@Autowired
	  private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Resource(name="LoginService")
	private LoginService loginService;
	
	
	//로그인 폼으로 이동
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET) 
	public String loginForm() {
		return "login";
	}
	
	// 로그인 진행 - BCryptPasswordEncoder
	   @RequestMapping(value = "/login.do", method = RequestMethod.POST)
	   public String memberLogin(MemberVO mvo, HttpServletResponse res, HttpServletRequest request) throws Exception {

	      res.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = res.getWriter();
	      HttpSession session = request.getSession();
	      
	      MemberVO mvo2 = loginService.memberlogin(mvo);
	     
	      
	      
	      if(mvo2 == null) {
	    	   out.println("<script>alert(\"아이디나 비밀번호가 틀렸습니다.\")</script>");
		       out.flush();
		    return "login";
	      }
	      
	      int trynum=mvo2.getTrynum();
	      
	      
	      boolean passMatch = bCryptPasswordEncoder.matches(mvo.getPw(), mvo2.getPw());
	     
	      if(trynum!=5) {
		      if (mvo2 != null && passMatch) {
		         session.setAttribute("sid", mvo2);
		         loginService.tryReset(mvo);
		      } else {
		    	  
		    	 if(mvo2 !=null) { 
		    		 loginService.tryUp(mvo);
		    	 }
		    	  
		         out.println("<script>alert(\"아이디나 비밀번호가 틀렸습니다.\")</script>");
		         out.flush();
		         return "login"; 	 
		      }
	      }else if(trynum==5) {
	    	  return "lockId";
	      }
	      if("admin".equals(mvo2.getId()))
	        	return "index_mngr";
	      
	      return "main";
	   }
	
	// 로그아웃 진행
	@RequestMapping(value = "/logout.do",method = RequestMethod.GET) 
	public String memberLogout(HttpSession session, HttpServletResponse res)throws Exception{
		session.removeAttribute("sid");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert(\"로그아웃 되었습니다.\")</script>");
		out.flush();
		return "main";
	}
	
	//아이디찾기 폼으로 이동
	@RequestMapping(value = "/findIdForm.do", method = RequestMethod.GET) 
	public String findIdForm() {
		return "findId";
	}
	
	//비밀번호찾기 폼으로 이동
	@RequestMapping(value = "/findPwForm.do", method = RequestMethod.GET) 
	public String findPwForm() {
		return "findPw";
	}	
		
	//아이디 찾기 진행
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST) 
	public String findId(Model model, MemberVO mvo, HttpServletResponse res) throws Exception {
	    MemberVO mvo2 = loginService.findId(mvo);
	    res.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = res.getWriter();

	    if (mvo2 == null) {
	        out.println("<script>alert(\"해당 아이디가 없습니다.\")</script>");
	        out.flush();
	        return "findId"; 
	    } else {
	    	model.addAttribute("id",mvo2.getId());
	        model.addAttribute("nickname",mvo2.getNickname());
	    }

	    out.flush();
	    return "findId2";
	}
	
	
	
	
	@RequestMapping(value = "/statistics.do", method = RequestMethod.GET) 
	public String statistics(Model model,StatisticsVO staticticsVO) {
		
		model.addAttribute("staticticsVO",staticticsVO);
		return "statistics";
	}
	
	@RequestMapping(value = "/statisticsDetail.do", method = RequestMethod.GET) 
	public String statisticsDetail(Model model,StatisticsVO staticticsVO) {
		
		model.addAttribute("staticticsVO",staticticsVO);
		return "statisticsDetail";
	}
	
	
	
	
	
	
}
