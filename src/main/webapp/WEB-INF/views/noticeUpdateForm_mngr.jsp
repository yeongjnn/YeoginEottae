<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>

<body>
<%@include file="header_mngr.jsp"%>

    
<div class=my_wrapper>

 <div class="page-title">
        <div class="container">
            <h2 class = notice_board>공지사항 수정</h2>
        </div>
    </div>

<div class="notice_updateform">
<form action="noticeUpdate.do" method="post">
<table class="notice_insertboard">
	<tr>
		<th style="width:100%"><input type="text" name="n_title" value="${noticeVO.n_title}" 
		style="width: 80%;margin: auto;left: 50%;transform: translateX(-50%);position: relative;padding: 5px;height: 40px;"  ></th>
	</tr>
	<tr>
		<td><textarea cols="128" rows="25" id="idtextarea"
		style="width: 80%;left: 50%;position: relative;transform: translateX(-50%);padding: 5px;"
		name="n_content" id="idtextarea" onclick="this.select();" name="n_content" >${noticeVO.n_content}</textarea></td>
	</tr>
</table>
	<div class="notice_update_btn">
	<input type="hidden" value="${noticeVO.n_num}" name="n_num">
	<input type="submit" value="변경하기" id="searchone">
	</div>
</form>
</div>

</div>
</body>
</html>