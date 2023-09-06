<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
</head>
<body>

<%@include file ="header.jsp" %>

<div class=my_wrapper>

	<div class="page-title">
		<div class="container">
			<h2 class=notice_board>파티룸 리뷰</h2>
		</div>
	</div>


	<div class=board_changes>
	<a href="questionMyOne.do?mem_num=${sid.mem_num}"><button class = board_change>
		문의사항			
	</button></a>

	<a href="#"><button class = board_change>
		리뷰관리			
	</button></a>
	
	<a href="getMyInfo.do?mem_num=${sid.mem_num}"><button class = board_change>
		마이페이지			
	</button></a>
</div>


	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="reviewfilter.page">
					<div class="search-wrap">
						<label for="search" class="blind">문의사항 내용 검색</label>
						<input id="search" type="search" name="review_search"
							placeholder="방번호를 입력해주세요." value="" style="width: 80%;">
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
						<th class="rv_col11">방번호</th>
						<th class="rv_col22">별점</th>
						<th class="rv_col44">리뷰</th>
						<th class="rv_col55">날짜</th>
					</tr>

				</thead>
				<tbody>
					<c:forEach var="i" items="${revlist}">
						<tr>
							<td class="rv_col11">${i.room_name}</td>
							<td class="rv_col22">
							<c:forEach var="a" begin="1" end="5">
								<c:if test="${i.star eq a}">
									<img src="http://localhost:8080/imgpath/stars_${a}.png" style="height: 1em;">
								</c:if>
							</c:forEach>
							</td>
							<td class="rv_col44">
								<a href="reviewGetOne.do?rev_num=${i.rev_num}&res_num=${i.res_num}">
									${i.rev_content}
								</a>
							</td>
							<td class="rv_col55">${i.rev_date}</td>
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

</body>
</html>