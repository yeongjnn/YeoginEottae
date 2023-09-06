<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여긴어때-이용후기</title>

<%@include file="header_mngr.jsp"%>

<div class=my_wrapper>

	<div class="page-title">
		<div class="container">
			<h2 class=notice_board>이용후기</h2>
		</div>
	</div>


	<div class=board_changes>
		<a href="notice_mngr.do"><button class=board_change>공지사항</button></a>
		<a href="getAllQuestion.do"><button class=board_change>문의사항</button></a>
		<a href="review_mngr.do"><button class=board_change>이용후기</button></a>
	</div>


	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
               <form action="reviewFilter_mngr.do" method="post">
					<div class="search-wrap">
						<label for="search" class="blind">리뷰 검색</label>
						<select name="review_filter" class="board_filter">
							<option value="rev.star">별점</option>
							<option value="res.room_num">방번호</option>
						</select>
						<div id="myform" style="display:block; width: 100%; text-align:left;">
						<fieldset style="margin-left: 2%;">
							<input type="radio" name="review_search1" value="5" id="rate1">
							<label for="rate1">★</label>
							<input type="radio" name="review_search1" value="4" id="rate2">
							<label for="rate2">★</label> 
							<input type="radio" name="review_search1" value="3" id="rate3">
							<label for="rate3">★</label>
							<input type="radio" name="review_search1" value="2" id="rate4">
							<label for="rate4">★</label>
							<input type="radio" name="review_search1" value="1" id="rate5">
							<label for="rate5">★</label>
						</fieldset>
						</div>
						<div id="myform1" class="display_none" style="display:block; width:100%;">
							<input id="search" type="search" name="review_search2" placeholder="방호수를 입력해주세요. (예: 1)" value="${param.review_search}">
						</div>
						<button type="submit" class="b_btn btn-dark" style="margin: 0;">검색</button>
						<!-- <input type="hidden" name="id" value=""> -->
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- board list area -->
	<table class="board_list_mngr">
		<thead>
			<tr>
				<th class="qs_col1">방번호</th>
				<th class="qs_col3">별점</th>
				<th class="qs_col2">이용후기</th>
				<th class="qs_col4">닉네임</th>
				<th class="qs_col5">작성일</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="i" items="${revlist}">
				<tr>
					<td class="qs_col1">${i.room_name}</td>
					<td class="qs_col3">
						<c:forEach var="a" begin="1" end="5">
							<c:if test="${i.star eq a}">
								<img src="http://localhost:8080/imgpath/stars_${a}.png" style="height: 1em;">
							</c:if>
						</c:forEach>
					</td>
					<td class="qs_col2"><a href="#">${i.rev_content}</a></td>
					<td class="qs_col4">${i.nickname}</td>
					<td class="qs_col5">${i.rev_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
		var review_filter = document
				.querySelector('select[name="review_filter"]'); // 드롭다운 메뉴에서 선택한 검색옵션
		review_filter.addEventListener("change", filterToggle); // // 드롭다운 메뉴에서 선택이 변할때마다 인식하는 이벤트리스너

		// 드롭다운 메뉴에서 선택하는 옵션에 따라 별점선택/검색어 입력중 하나만 나타내게 하는 기능
		function filterToggle() {
			var myform = document.getElementById("myform"); // 별점 선택값
			var myform1 = document.getElementById("myform1"); // 검색어 입력값

			if (review_filter.value === "rev.star") { // 드롭다운에서 별점 선택하면
				myform.style.display = "block"; // 별점선택은 보이게
				myform1.style.display = "none"; // 검색어 입력은 안보이게
			} else if (review_filter.value === "res.room_num") {
				myform.style.display = "none";
				myform1.style.display = "block";
			}
		}

		// Initialize the form visibility based on the selected option
		filterToggle();
		
	</script>


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