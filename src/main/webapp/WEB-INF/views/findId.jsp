<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<%@include file ="header.jsp" %>


<!-- 모달 모음 -->
<%@include file ="modal.jsp" %> 

<div class=my_wrapper>

	<h2 class = company_name>아이디 찾기</h2>
	
	 <form action="findId.do" class="login" method="post" name="find_id_tel">
          <input type="text" placeholder="닉네임" class="in" name=nickname id=nickname>
          <input type="text" placeholder="연락처" class="in" name=tel id=tel> 
     	
      	<div class=modal_btn>
      		<input type="button"  onClick="id_search2()" value="아이디 찾기" class="in_btn m_login_btn mini_bk_btn" id="findId">
      		<input type="button" class="join in_btn mini_bk_btn" id="join" onclick="location.href='joinview.do'" value="회원가입">
      	</div>
</form>
	 
	 <script>
$(document).ready(function(){
	$('#findId').click(function(){
		let form = document.find_id_tel;
		
		/*alert('ddddd');*/
		
		if(form.nickname.value.length < 1){
			/*alert("닉네임을 입력해주세요.");*/
			$('.modal9').show();
			$('#close9').click(function(e){
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
			form.action = "./findId.do"; //넘어간화면
			form.submit(); 
		}
	});
})

</script>
</body>

</html>