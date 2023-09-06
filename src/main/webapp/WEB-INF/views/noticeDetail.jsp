<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>

<%@include file ="header.jsp" %>

<body>
<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>공지사항</h2>
        </div>
    </div>


<div class="notice_div_admin">
    <table class="notice_board">

	<tr>
	    <th class="ntd_col1"><h4>${noticeVO.n_num}</h4></th>
	    <th class="ntd_col2"><h2>${noticeVO.n_title}</h2></th>
	    <th class="ntd_col3"><h4>${noticeVO.n_date}</h4></th>
	    <th class="ntd_col4"><h4>${ntlist.hits}</h4></th>
	</tr>
	<tr>
		<td class="notice_board" colspan="3">${noticeVO.n_content}</td>
	</tr>	
</table> 
</div>
</div>


<%@include file ="footer.jsp" %>

</body>
</html>