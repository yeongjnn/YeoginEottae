<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세보기</title>
</head>

<body>
	<%@include file="header.jsp"%>


	<div class=my_wrapper>

		<div class="page-title">
			<div class="container">
				<h2 class=notice_board>예약 상세보기</h2>
			</div>
		</div>

		<form action="reservationRefund.do" method="post" id="resDelete">
			<table class="review_insertboard">
				<tr>
					<td class="rv_col1">예 약 번 호</td>
					<td class="rv_col2">${res.res_num}</td>
					<td class="rv_col1">방 &nbsp; 이 &nbsp; 름</td>
					<td class="rv_col2">${res.room_name}</td>
				</tr>
				<tr>
					<td class="rv_col1">입 실 시 간</td>
					<td class="rv_col2">${res.start_time}시</td>
					<td class="rv_col1">퇴 실 시 간</td>
					<td class="rv_col2">${res.finish_time}시</td>
				</tr>
				<tr>
					<td class="rv_col1">옵 &nbsp; &nbsp; &nbsp; &nbsp; 션</td>
					<td class="rv_col2">${res.options}</td>
					<td class="rv_col1">인 &nbsp; 원 &nbsp; 수</td>
					<td class="rv_col2">${res.people}명</td>
				</tr>
				<tr>
					<td class="rv_col1">이 용 시 간</td>
					<td class="rv_col2">${res.play_time}시간</td>
					<td class="rv_col1">금 &nbsp; &nbsp; &nbsp; &nbsp; 액</td>
					<td class="rv_col2">${res.cost}원</td>
				</tr>
				
			</table>
			<div class="rvdetail_btn" style="left:38%">
			<input type="hidden" name="res_num" value="${res.res_num}">
			<input type="hidden" name="mem_num" value="${sid.mem_num}">
			<input type="hidden" name="imp_uid" value="${res.imp_uid}">
			<input type="hidden" name="start_time" value="${res.start_time}">
			<input type="hidden" name="play_time" value="${res.play_time}">
			<input type="hidden" name="cost" value="${res.cost}">
			               
			<c:if test="${todayDate < resDate}">
			<input type="submit" class="rv_insert_btn" value="취소하기" onclick="resDelete();">
			</c:if>
			
			<c:if test="${todayDate >= resDate}">
			<input type="button" id="notCancel" class="res_not_cancel" value="취소불가" onclick="">
			</c:if>	
			
			
			
			</div>
			
			
		</form>
	</div>
	
	<script type="text/javascript">
        function resDelete() {
            var result = confirm("예약을 취소하시겠습니까?");
            if (result == true) {
                document.getElementById("resDelete").submit();
                // 확인
            } else {
                event.preventDefault(); // Prevent the default form submission
            	return;
            	// 취소
            }
        }
        
        document.getElementById('notCancel').addEventListener('click', function() {
            alert('예약취소는 이용 전날까지만 가능합니다.');
        });
        
    </script>

</body>
</html>