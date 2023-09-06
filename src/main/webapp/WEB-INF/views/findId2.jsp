<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<%@include file ="header.jsp" %>


<div class=my_wrapper>


	<h2 class = company_name>아이디 찾기</h2>



      
      <div class=find_id_bx>
		<p style="font-family: 'SUITE-Regular';">
			${nickname}님의 아이디는 ${id} 입니다.
		<div class=modal_btn>
 			<input type="button" class="in_btn m_login_btn mini_bk_btn" value="로그인하러 가기" onclick="location.href='loginForm.do'">
      		<input type="button" value="메인으로" class="in_btn m_login_btn mini_bk_btn" onclick="location.href='index.jsp'" value="회원가입">
      	</div>
		</p>      
      </div>
      
 
</div>
	
<%@include file ="footer.jsp" %>

</body>
</html>