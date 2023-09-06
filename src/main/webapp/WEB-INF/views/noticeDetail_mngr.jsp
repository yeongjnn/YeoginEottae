<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>

<%@include file ="header_mngr.jsp" %>

<body>
<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>공지사항</h2>
        </div>
    </div>


<div class="notice_div">
    <table class="notice_board"  >

	<tr>
	    <th class="ntd_col1"><h4>${noticeVO.n_num}</h4></th>
	    <th class="ntd_col2"><h2>${noticeVO.n_title}</h2></th>
	    <th class="ntd_col3"><h4>${noticeVO.n_date}</h4></th>
	    <th class="ntd_col4"><h4>${noticeVO.hits}</h4></th>
	</tr>
	<tr>
		<td class="notice_board" colspan="4">${noticeVO.n_content}</td>
	</tr>	
</table> 
</div>

<div class=notice_update>
		<a href="noticeUpdateForm.do?n_num=${noticeVO.n_num}&n_title=${noticeVO.n_title}&n_content=${noticeVO.n_content}">
	<button class = notice_button>
		수정하기			
	</button></a>

	<a href="noticeDelete.do?n_num=${noticeVO.n_num}">
	<button class = notice_button>
		삭제하기			
	</button></a>
</div>



</div>



</body>
</html>