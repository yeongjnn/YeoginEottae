package com.party.controller.email;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.party.controller.login.service.LoginService;
import com.party.controller.member.PwEncoding;
import com.party.member.vo.MemberVO;
 
@Controller
public class MailController {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@Resource(name = "LoginService")
	private LoginService loginService;

  //임시비밀번호 난수
  public String getRamdomPassword(int size) {
	    char[] charSet = new char[] {
	        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	        '!', '@', '#', '$', '%', '^', '&' };

	    StringBuffer sb = new StringBuffer();
	    SecureRandom sr = new SecureRandom();
	    sr.setSeed(new Date().getTime());

	    int idx = 0;
	    int len = charSet.length;

	    // 최소한 하나의 대문자, 소문자, 숫자, 특수문자를 추가하도록 조정
	    sb.append(charSet[sr.nextInt(10)]);  // 숫자
	    sb.append(charSet[sr.nextInt(26) + 10]);  // 대문자
	    sb.append(charSet[sr.nextInt(26) + 36]);  // 소문자
	    sb.append(charSet[sr.nextInt(7) + 62]);  // 특수문자

	    // 나머지 글자 생성
	    for (int i = 4; i < size; i++) {
	        idx = sr.nextInt(len);
	        sb.append(charSet[idx]);
	    }

	    // 생성된 문자열을 랜덤하게 섞음
	    char[] passwordChars = sb.toString().toCharArray();
	    for (int i = passwordChars.length - 1; i > 0; i--) {
	        int swapIdx = sr.nextInt(i + 1);
	        char temp = passwordChars[i];
	        passwordChars[i] = passwordChars[swapIdx];
	        passwordChars[swapIdx] = temp;
	    }

	    return new String(passwordChars);
	}
 
 
  // mailForm
  @RequestMapping(value = "/mail/mailForm")
  public String mailForm() {
   
    return "/mail/mailForm";
  }  
 
  // mailSending 코드
  @RequestMapping(value = "pwMail.do")
  public String mailSending(MemberVO mvo, HttpServletResponse res,HttpServletRequest request) throws Exception {
	
	  	String newpw=getRamdomPassword(10);
	    String newpw2=bCryptPasswordEncoder.encode(newpw);
	    mvo.setPw(newpw2);
	  
	  	MemberVO mvo2 = loginService.findPw(mvo);
	    res.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = res.getWriter();
	    
	    if (mvo2 == null) {
	        out.println("<script>alert(\"해당 아이디가 없습니다.\")</script>");
	        out.flush();
	        return "findPw"; 
	    }else {    
	    
			    String setfrom = "osj0203@naver.com";         
			    String tomail  = request.getParameter("id");     // 받는 사람 이메일
			    String title   = "여긴어때 임시 비밀번호 발급입니다."; // 제목
			    String content = "여긴어때 임시 비밀번호는 "+newpw+"입니다. 로그인 후 비밀번호 변경바랍니다.";    // 내용
			   
			    try {
			      MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper 
			                        = new MimeMessageHelper(message, true, "UTF-8");
			 
			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(tomail);     // 받는사람 이메일
			      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			      messageHelper.setText(content);  // 메일 내용
			     
			      mailSender.send(message);
			      
			      boolean result = loginService.findPwUpdate(mvo);
			      loginService.tryReset(mvo);
			    } catch(Exception e){
			      System.out.println(e);
			    }
	    	}
   
    return "findPw2";
  }
  
  @RequestMapping(value = "mailSending.do")
  public void mailSending(HttpServletRequest request, HttpServletResponse response) throws IOException {
	Random random = new Random();
  	int checkNum = random.nextInt(999999);
	 
	  
	PrintWriter out = response.getWriter();
	  
    String setfrom = "osj0203@naver.com";         
    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
    String title   = "여긴어때? 인증번호입니다";      // 제목
    String content = "인증코드는 " + checkNum +  " 입니다"+
			 "<br>" +
			 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";    // 내용
    
//    String title   = request.getParameter("title");      // 제목
//    String content = request.getParameter("content");    // 내용
   
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content, true);  // 메일 내용
     
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
    System.out.println("checkNum::::::"+ checkNum);
    
    out.write(checkNum+"");
  }
  
  
} 
