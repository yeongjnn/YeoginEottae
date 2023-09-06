<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/star.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1">
			<label for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2">
			<label for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3">
			<label for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4">
			<label for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5">
			<label for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" id="reviewContents"
				  placeholder="저희 파티룸의 이용 소감은 어떠셨나요? 좋은 후기를 남겨주시면 여긴어때에 큰 힘이 됩니다."></textarea>
	</div>
</form>


</body>
</html>