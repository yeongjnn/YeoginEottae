<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap -->
<link href='<c:url value="/css/bootstrap.min.css" />' rel="stylesheet">
<link href='<c:url value="/css/kfonts2.css" />' rel="stylesheet">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src='<c:url value="/jquery/jquery-1.11.3.min.js" />'></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="/js/bootstrap.min.js"  />'></script>

<title>비밀번호 찾기</title>
</head>
<body>
<%@include file ="header.jsp" %>


<!-- 모달 모음 -->
<%@include file ="modal.jsp" %> 

<div class=my_wrapper>

	<h2 class = company_name>비밀번호 찾기</h2>
	
	 <form action="pwMail.do" class="login" method="post" name="find_pw_tel">
          <input type="text" placeholder="이메일" class="in" name=id id=id>
          <input type="text" placeholder="연락처" class="in" name=tel id=tel> 
     	
      	<div class=modal_btn>
      		<input type="button"  onClick="id_search2()" value="비밀번호 찾기" class="in_btn m_login_btn mini_bk_btn" id="pwMail">
   		    <input type="button" class="join in_btn mini_bk_btn" id="join" onclick="location.href='joinview.do'" value="회원가입">
      	</div>
</form>
	 
	 <script>
$(document).ready(function(){
	$('#pwMail').click(function(){
		let form = document.find_pw_tel;
		
		/*alert('ddddd');*/
		
		if(form.id.value.length < 1){
			/*alert("계정을 입력해주세요.");*/
			$('.modal1').show();
			$('#close1').click(function(e){
				$(this).parents('#modal').hide();
			});
			form.nickname.focus();
			return false;
		} 
		if(!form.tel.value){
			/*alert("연락처를 입력해주세요.");*/
			$('.modal14').show();
			$('#close14').click(function(e){
				$(this).parents('#modal').hide();
			});
			form.tel.focus();
			return false;
		}
		else{
			form.method = "post";
			form.action = "./pwMail.do"; //넘어간화면
			form.submit(); 
		}
	});
})

</script>
</body>

</html>