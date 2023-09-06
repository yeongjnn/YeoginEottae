<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루프탑</title>
</head>
<body>
<%@include file ="header.jsp" %>

<div class="my_wrapper">

	<div class="page-title">
		<div class="container">
			<h2 class="company_name">루프탑</h2>
			<div class="search_bx">
				<form action="roomAllPage.do" class="look_all"><button type="submit" class="mini_bk_btn">전체 파티룸 보기</button></form>
			</div>
		</div>
	</div>

	<div class="product_country_bx">
	
	<!-- 베이직 룸 전체 조회 -->
	<!-- roomVO 와 reviewVO -->
	<c:forEach var="i" items="${alist}" varStatus="status">
	
		<div class="card">
			<!-- 이미지 클릭 시 파티룸 상세 조회 -->
			<!-- 상세 조회창에서 출력하려는 값 모두 넘겨야 한다 -->
			<a href="roomGetOne.do?room_num=${i.room_num}&purpose=${i.purpose}&price=${i.price}&width=${i.width}&bed=${i.bed}
			&music=${i.music}&explanation=${i.explanation}&room_img_1=${i.room_img_1}&room_img_2=${i.room_img_2}&room_img_3=${i.room_img_3}
			<%-- &nickname=${revArr[status.index].nickname}&rev_content=${revArr[status.index].rev_content}
			&star=${revArr[status.index].star} --%>">
				<img src="./resources/images/${i.room_img_1}" class="card_img"> <!-- 일단 전체 화면에선 room_img_1 만 보이게 -->
			</a>
			<div>
				<p class="card_text">가격 : ${i.price}</p>
				<p class="card_text">면적 : ${i.width}</p>
				<p class="card_text">침대 : ${i.bed}</p>
				<p class="card_text">노래방 : ${i.music}</p>
				<p class="card_text">위치 : ${i.explanation}</p>
			</div>
		</div>
	
	</c:forEach>
	
	</div>
	
</div>

<%@include file ="footer.jsp" %>

</body>
</html>