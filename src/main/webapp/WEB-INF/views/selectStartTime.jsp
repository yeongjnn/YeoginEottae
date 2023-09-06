<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작 시간 설정</title>
<%@include file ="header.jsp" %>
</head>
<body>

	<div class=my_wrapper>
		<div class="qFrm_bx">

			<div class="qFrm_table">
				<h2>시작 날짜</h2>
				<input type="text" id="datepicker" placeholder="시작날짜" name="start_date">
			</div>
			<div class="qFrm_table">
				<h2>시작 시간</h2>
				<input type="text" id="timepicker" placeholder="시작시간" name="start_time">
			</div>
			
			<div class="qFrm_table">
				<h2>예약 현황</h2>
				
			</div>
			
		</div>
	</div>
<%@include file ="footer.jsp" %>
</body>
</html>