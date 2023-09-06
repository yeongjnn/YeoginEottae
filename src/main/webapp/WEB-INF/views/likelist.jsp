<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>

<style>
body {
	font-family: Arial, sans-serif;
}

.my_wrapper {
	max-width: 800px;
	margin: 0 auto;
	padding-top: 20vh;
	padding-bottom: 20vh;
}

span {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	display: inline-block;
	text-align: center;
}

a{
	position: absolute;
    width: 95%;
    height: 100px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 2px;
	text-align: center;
}

th {
	background-color: #ff7da1;
	font-weight: bold;
	color: white;
	text-align: center;
}
</style>

</head>
<%@include file="header_pop.jsp"%>
<body>
	<div class="my_wrapper">

		<div class="like-list-container">
			<table class="cl_list" style="margin-top: 0; margin-bottom: 0;">
				<thead>
					<tr>
						<th>방 사진</th>
						<th>카테고리</th>
						<th>방 호수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${likedRoom}">
						<tr>
							<td style="width: 40%;"><a href="javascript:void(0);"
								onclick="goBackToRoomDetail(${i.room_num}, ${mem_num})" class="roomGetOne.do">
							</a>
								<img src="./resources/images/${i.room_img_1}" style="width:150px;height:100px;"></td>
							<td style="width: 35%;">${i.purpose}</td>
							<td style="width: 25%;">${i.room_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%--  <%@ include file="footer.jsp" %> --%>
	
	<script type="text/javascript">
	function goBackToRoomDetail(room_num, mem_num) {
		window.opener.location.href = 'roomGetOne.do?room_num=' + room_num + '&mem_num=' + mem_num;
	    window.close();
	}
</script>
</body>
</html>
