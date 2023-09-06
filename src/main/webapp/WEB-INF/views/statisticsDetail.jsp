<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>

    
</head>
<body>
<%@include file ="header_mngr.jsp" %>

<div class="my_wrapper">

	<div class="page-title">
		<div class="container">
			<h2 class="company_name">${staticticsVO.year}년 ${staticticsVO.month}월 통계</h2>
		</div>
	</div>

<div class="product_country_bx">
	
	<img src="./resources/images/${staticticsVO.year}${staticticsVO.month}room.png" class="card_img" style="width: 430px; height: 430px;">
	<img src="./resources/images/${staticticsVO.year}${staticticsVO.month}option.png" class="card_img" style="width: 430px; height: 430px;">
	
	</div>
</div>

	


   <%-- <%@include file ="footer.jsp" %>  --%>



</body>
</html>