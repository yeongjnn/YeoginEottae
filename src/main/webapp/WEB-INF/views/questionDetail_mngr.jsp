<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-문의사항 상세보기</title>
</head>

<%@include file ="header_mngr.jsp" %>


<body>
<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>문의사항</h2>
        </div>
    </div>

<div class="question_div">
<table class="question_board" >
	<tr>
		<th class="qsd_col1"><h4>${questionVO.q_num}</h4></th>
		<th class="qsd_col2"><h2>${questionVO.q_title}</h2></th>
		<th class="qsd_col3"><h4>${questionVO.q_date}</h4></th>
	</tr>
	<tr>
		<td class="question_board" colspan="3" style="border-bottom: 1px solid #ccc;">${questionVO.q_content}</td>
	</tr>	
	<tr>
		<td class="question_board" colspan="3">${questionVO.answer}</td>
	</tr>
</table> 
</div>

<div class=question_update>
	<a href="questionAnswer.do?q_content=${questionVO.q_content}&answer=${questionVO.answer}&q_title=${questionVO.q_title}&q_num=${questionVO.q_num}">
	<button class = question_button>
		답변달기			
	</button></a>
	<a href="questionDelete_mngr.do?q_num=${questionVO.q_num}">
	<button class = question_button>
		삭제하기			
	</button></a>
</div>

</div>
</body>
</html>