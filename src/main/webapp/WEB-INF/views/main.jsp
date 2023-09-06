<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여긴어때 홈</title>

<%@include file="header.jsp"%>


<div class=my_wrapper>

	<div id=banner>

		<ul class="bxslider">
			<li><img class=b_img alt="" src="${path}/images/banner_room1.jpg"></li>
			<li><img class=b_img alt="" src="${path}/images/banner_room2.jpg"></li>
			<li><img class=b_img alt="" src="${path}/images/banner_room3.jpg"></li>
		</ul>

	</div>
	<!-- div#banner-end -->

</div>

<div class=centerBtn>

	<ul>
		<li><a class="btn" id="fst" href="roomAllPage.do">둘러보기</a></li>
		<li><a class="btn" id="scd" href="notice.page">공지사항</a></li>
	</ul>

</div>


<%@include file="footer.jsp"%>