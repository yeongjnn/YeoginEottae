<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/css/star.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/index_mngr.css">
<link rel="stylesheet" type="text/css" href="${path}/css/productDetail.css">
<link rel="stylesheet" type="text/css" href="${path}/css/MY_jquery.bxslider.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${path}/js/jquery-3.4.1.min.js"></script>
<!-- 복붙 필수 -->
<script src="${path}/js/jquery.bxslider.min.js"></script>
<script src="${path}/js/index.js?ver=2"></script>
<!-- 달력 plugin : datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<header>
		<a href="index_mngr.do"><h1 id=head>여긴 어때?</h1></a>
	</header>


	<nav>
		<ul id=menu_box>
			<li class=t_menu><a href="memberPage.do">회원 관리</a></li>

			<li class=t_menu><a href="roomPage_mngr.do">룸 관리</a></li>

			<li class=t_menu><a href="reservation_mngr.do">예약 관리</a></li>

			<li class=t_menu>커뮤니티 관리
				<ul class=s_menu>
					<li><a href="notice_mngr.do">공지사항</a></li>
					<li><a href="getAllQuestion.do">고객센터</a></li>
					<li><a href="review_mngr.do">이용후기</a></li>
				</ul>
			</li>
			
			<li class=t_menu>통계
				<ul class=s_menu>
					<li><a href="statistics.do?year=2022">2022년</a></li>
					<li><a href="statistics.do?year=2023">2023년</a></li>
					<li><a href="statistics.do?year=2024">2024년</a></li>
				</ul>
			</li>
		</ul>

		<div class=lj_line>
			<span class=logout> <!-- style="display:none;" --> <a href="logout.do">로그아웃</a>
			</span>
		</div>
	</nav>


</body>
</html>