<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>


</head>
<body>

<%@include file ="header.jsp" %>

<div class=my_wrapper>

	<div class="page-title">
		<div class="container">
			<h2 class=notice_board>예약 목록</h2>
		</div>
	</div>


	<div class="board_changes"> <!-- 내 정보 수정, 장바구니, 주문목록, 게시글 관리 -->
         <a href="getMyInfo.do?mem_num=${sid.mem_num}"><button class=board_change>내 정보 수정</button></a>
         <a href="#"><button class=board_change>예약목록</button></a>
         <a href="questionMyOne.do?mem_num=${sid.mem_num}"><button class=board_change>게시글 관리</button></a>
   </div>


	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="reviewfilter.page">
					<div class="search-wrap">
						<label for="search" class="blind">문의사항 내용 검색</label>
						<input id="search" type="search" name="review_search"
							placeholder="날짜를 입력해 주세요." value="" style="width: 80%;">
						<button type="submit" class="b_btn btn-dark" style="margin: 0;">검색</button>
						<input type="hidden" name="review_filter" value="PD_NAME">
						<input type="hidden" name="id" value="${sid}">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- board list area -->
			<table class="board_list">
				<thead>
					<tr>
						<th class="res_col11" style="width:8%">방번호</th>
						<th class="res_col22" style="width:12%">이용시간</th>
						<th class="res_col33" style="width:16%">입실시간</th>
						<th class="res_col44" style="width:16%">퇴실시간</th>
						<th class="res_col55" style="width:12%">인원수</th>
						<th class="res_col66" style="width:12%">옵션</th>
						<th class="res_col77" style="width:12%">가격</th>
						<th class="res_col88" style="width:12%">리뷰</th>
					</tr>

				</thead>
				<tbody>
				<c:forEach var="i" items="${reslist}">
						<tr>
							<td class="res_col11" style="width:8%">${i.room_name}</td>
							<td class="res_col22" style="width:12%">${i.play_time}</td>
							<td class="res_col33" style="width:16%">
							 <a href="resDetail.do?res_num=${i.res_num}">${i.start_time}시</a></td>
							<td class="res_col44" style="width:16%">${i.finish_time}시</td>
							<td class="res_col55" style="width:12%">${i.people}명</td>
							<td class="res_col66" style="width:12%">${i.options}</td>
							<td class="res_col77" style="width:12%">${i.cost}원</td>
							<td class="res_col88" style="width:12%">
							<form action="reviewInsertForm.do" method="get">
							
							 <c:set var="rev" value="false" />
							 
							 <c:forEach var="rv" items="${revlist}">
			                     <c:if test="${i.res_num eq rv.res_num}">
			                        <c:set var="rev" value="true" />
			                     </c:if>
			                  </c:forEach>
							
							<c:if test="${i.compare < strdate}">
							  <c:if test="${rev eq 'true'}">
							    <input type="button" class="revo" style="margin: 0; font-size: 14px; font-weight: bold;
   							 border: none; border-radius: 3px; color: #fff; cursor: pointer; width:100%; height:100%; 
   							 background-color:gray;" value="작성완료">
							  </c:if>
							
							  <c:if test="${rev eq 'false'}">
							    <input type="submit" id="searchone2" value="리뷰쓰기">
							  </c:if>
							</c:if>
							
							<c:if test="${i.compare >= strdate}">
							<input type="button" class="revx" style="margin: 0; font-size: 14px; font-weight: bold;
   							 border: none; border-radius: 3px; color: #fff; cursor: pointer; width:100%; height:100%; 
   							 background-color:gray;" value="리뷰쓰기">
							</c:if>	
							
							<input type="hidden" name="res_num" value="${i.res_num}">
							<input type="hidden" name="mem_num" value="${i.mem_num}">
							<input type="hidden" name="room_num" value="${i.room_num}">
							<input type="hidden" name="play_time" value="${i.play_time}">
							<input type="hidden" name="start_time" value="${i.start_time}">
							<input type="hidden" name="finish_time" value="${i.finish_time}">
							<input type="hidden" name="people" value="${i.people}">
							<input type="hidden" name="options" value="${i.options}">
							<input type="hidden" name="cost" value="${i.cost}">
							<input type="hidden" name="res_time" value="${i.res_time}">
							<input type="hidden" name="room_name" value="${i.room_name}">
							</form>
							</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<script type="text/javascript">
				    function PageMove(page) {
				        const url = new URL(window.location.href);
				        url.searchParams.set("page", page);
				        window.location.href = url.toString();
				    }
			</script>
		
		
			<div class="board_pages">
				<ul class="pagination">
					<li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>
					<li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">
								<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:PageMove(${i})">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>
					<li><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
				</ul>
			</div>

</div>

<script type="text/javascript">
  function reviewInsert() {
    // 특정 URL로 이동
    window.location.href = 'reviewInsertForm.do?res_num';
  }
</script>

<script>
document.querySelectorAll('.revx').forEach(button => {
    button.addEventListener('click', function() {
        alert('리뷰는 이용일 다음날부터 작성 할 수 있습니다.');
    });
});

document.querySelectorAll('.revo').forEach(button => {
    button.addEventListener('click', function() {
        alert('이미 작성한 리뷰입니다.');
    });
});
</script>



</body>
</html>