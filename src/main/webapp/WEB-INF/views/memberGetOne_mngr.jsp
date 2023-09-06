<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>

<script>
    function confirmDelete() {
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            // 삭제 진행
            location.href = "memberDelete.do?mem_num=${memberVO.mem_num}";
        } else {
            // 삭제 취소
            return false;
        }
    }
    
    function confirmUpdate() {
        var result = confirm("수정하시겠습니까?");
        if (result) {
            // 수정 진행
            document.forms["updateForm"].submit();
        } else {
            // 수정 취소
            return false;
        }
    }
</script>

	<%@include file="header_mngr.jsp"%>

	<div class=my_wrapper>

		<span class="s_title">회원 정보</span>

		<form action="memberUpdate.do" method="post" name="updateForm">
			<table class="cl_info">
				<tr>
					<td class="col">회원번호</td>
					<td class="input_info"><span class="updat_id">${memberVO.mem_num}</span>
						<input type="hidden" name="mem_num" value="${memberVO.mem_num}"></td>
				</tr>
				<tr>
					<td class="col">아이디</td>
					<td class="input_info"><input type="text" value="${memberVO.id}" name="id" class="clinfo_text"></td>
				</tr>
				<tr>
				<td class="col">닉네임</td>
				<td class="input_info"><input type="text" value="${memberVO.nickname}" name="nickname" class="clinfo_text"></td>
				</tr>
				<tr>
					<td class="col">전화번호</td>
					<td class="input_info"><input type="text" value="${memberVO.tel}" name="tel" class="clinfo_text"></td>
				</tr>
				<tr>
					<td class="col">가입일</td>
					<td class="input_info">${memberVO.mem_regdate}</td>
				</tr>
				<tr>
					<td class="col">최종수정일</td>
					<td class="input_info">${memberVO.mem_moddate}</td>
				</tr>
				</table>
				<div class="cl_li_btn_row">
						<input type="button" value="수정" onclick="confirmUpdate()" class="cl_li_btn">
						<input type="button" value="삭제" onclick="confirmDelete()" class="cl_li_btn">
				</div>
		</form>
	</div>


</body>
</html>