<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
	<h1>사원등록</h1>
	<form action="answerInsert.do" method="post">
		<table>

			<tr>
				<td>내용</td>
				<td><input type="text" name="q_content"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
			
			<input type="hidden" name="groupord" value="${groupord}">
			<input type="hidden" name="groupnum" value="${groupnum}">
			<input type="hidden" name="lvl" value="${lvl}">
			<input type="hidden" name="mem_num" value="${sessionScope.sid.mem_num}">
		</table>
	</form>
</body>
</html>