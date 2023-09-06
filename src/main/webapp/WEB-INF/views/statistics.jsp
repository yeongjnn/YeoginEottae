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
			<h2 class="company_name">${staticticsVO.year}년 통계</h2>
		</div>
	</div>

<div class="statistics_month">
	
	<!-- 베이직 룸 전체 조회 -->
	<!-- roomVO 와 reviewVO -->

	
		<c:forEach var="i" begin="1" end="12">
		    <div class="calendar">
		        <a href="statisticsDetail.do?month=${i}&year=${staticticsVO.year}">
		            <img src="./resources/images/23${i}.png" class="card_img">
		        </a>
		    </div>
		</c:forEach>

	
	</div>
</div>

	


   <%-- <%@include file ="footer.jsp" %>  --%>



</body>
</html>