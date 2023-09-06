<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-문의사항 답변</title>
</head>

<%@include file ="header_mngr.jsp" %>


<body>
<%
  String q_title = request.getParameter("q_title");
  String q_content = request.getParameter("q_content");
  String answer = request.getParameter("answer");
  int q_num=Integer.parseInt(request.getParameter("q_num"));
%>
<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>문의사항 답변</h2>
        </div>
    </div>


<div class=answer_div>
<form action="answer_update.do" method="post">
<table class="answer_board">
	<tr>
		<th class="answer_col1"><h4>${questionVO.q_title}</h4></th>
	</tr>
	<tr>
		<td class="answer_board ans_board" style="padding:0 60px;">${questionVO.q_content}</td>
	</tr>
	<tr>
		<td class="answer_board"><textarea style="width:100%;margin-bottom: 20px;padding:5px;"
		cols="128" rows="12" name="answer" id="idtextarea" 
		onclick="this.select();">${param.answer}</textarea></td>
	</tr>
</table>
	<input type="submit" value="답변하기" id="searchone">
	<input type="hidden" value="${questionVO.q_num}" name="q_num">
</form>
</div>

</div>
</body>
</html>