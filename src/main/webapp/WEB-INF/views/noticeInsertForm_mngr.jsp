<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>

<body>



<%@include file="header_mngr.jsp"%>

    
<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>공지사항 작성</h2>
        </div>
    </div>

<div class="notice_insertform">

<form action="noticeInsert.do" method="post">
<table class="notice_insertboard">
	<tr>
		<th style="width:100%"><input type="text" name="n_title" style="width: 80%;margin: auto;left: 50%;transform: translateX(-50%);position: relative;padding: 5px;height: 40px;" onclick="this.select();" placeholder="제목을 입력하세요"></th>
	</tr>
	<tr>
		<td><textarea cols="128" rows="25" 
		style="width: 80%;left: 50%;position: relative;transform: translateX(-50%);padding: 5px;"
		name="n_content" id="idtextarea" onclick="this.select();" placeholder="내용을 입력하세요"></textarea></td>
	</tr>
</table>
<div class="notice_update_btn">
<input type=submit id="searchone" value="작성완료"></td>
</div>
</form>

</div>
	
</div>
</body>
</html>