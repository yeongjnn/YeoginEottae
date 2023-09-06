<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세보기</title>
</head>

<%@include file ="header.jsp" %>


<body>
<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>문의사항</h2>
        </div>
    </div>

<div class="question_user_div">
<table class="question_board_user" >
	<tr>
		<th class="qsd_user_col1"><h4>${questionVO.q_num}</h4></th>
		<th class="qsd_user_col2"><h2>${questionVO.q_title}</h2></th>
		<th class="qsd_user_col3"><h4>${questionVO.q_date}</h4></th>
	</tr>
	<tr>
		<td class="question_board_user" colspan="3" style="border-bottom: 1px solid #ccc;">${questionVO.q_content}</td>
	</tr>	
	<tr>
		<td class="question_board_user" colspan="3">${questionVO.answer}</td>
	</tr>
</table> 
</div>

<div class=question_update_user>
	<%-- <a href="questionAnswer_mngr.jsp?comment=${stv.q_comment}&answer=${stv.answer}&title=${stv.q_title}&num=${stv.q_num}">
	<button class = question_button>
		수정하기			
	</button></a> --%>
	<a href="questionDelete.do?q_num=${questionVO.q_num}&mem_num=${sid.mem_num}">
	<button class=board_change onclick="return confirm('삭제하시겠습니까?')">
		삭제하기			
	</button></a>
</div>

</div>
</body>
</html>