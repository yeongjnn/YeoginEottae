<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여긴어때-예약관리</title>

<%@include file="header_mngr.jsp"%>

<div class=my_wrapper>
	<span class="s_title">예약 목록</span>
	<%-- <div class="clientsum">총 주문수 : ${orderssum}건</div> --%>

	<form action="reservationfilter_mngr.do" method="post">
		<div class="subm">
			<select name="reservation_filter">
				<option value="room_num" ${param.reservation_filter eq 'room_num' ? 'selected' : ''}>파티룸</option>
				<option value="start_time" ${param.reservation_filter eq 'start_time' ? 'selected' : ''}>입실날짜</option>
				<option value="res_time" ${param.reservation_filter eq 'res_time' ? 'selected' : ''}>예약날짜</option>
			</select>
			<input type="text" id="res_srch1" name="reservation_search1"
				placeholder="방번호를 입력해주세요. (예: 1)" style="width: 188px;">
			<input type="date" id="res_srch2" name="reservation_search2" class="display_none">
			<input type="submit" value="검색" id="search_in">
		</div>
	</form>

	<table class="cl_list" border=1>
		<tr>
			<th class="od_col1">No.</th>
			<th class="od_col2">회원</th>
			<th class="od_col3">방번호</th>
			<th class="od_col4">입실</th>
			<th class="od_col5">퇴실</th>
			<th class="od_col6">인원</th>
			<th class="od_col7">추가옵션</th>
			<th class="od_col8">결제방법</th>
			<th class="od_col9">총금액</th>
			<th class="od_col10">예약날짜</th>
		</tr>
		<c:forEach var="res" items="${reslist}">
			<tr>
				<td class="od_col1">${res.res_num}</td>
				<td class="od_col2">${res.mem_num}</td>
				<td class="od_col3">${res.room_num}</td>
				<td class="od_col4">${res.start_time}시</td>
				<td class="od_col5">${res.finish_time}시</td>
				<td class="od_col6">${res.people}</td>
				<td class="od_col7">${res.options}</td>
				<td class="od_col8">${res.pay}</td>
				<td class="od_col9">${res.cost}</td>
				<td class="od_col10">${res.res_time}</td>
			</tr>
		</c:forEach>
	</table>

	<script>
		var reservation_filter = document.querySelector('select[name="reservation_filter"]'); // 드롭다운 메뉴에서 선택한 검색옵션
		reservation_filter.addEventListener("change", filterToggle); // // 드롭다운 메뉴에서 선택이 변할때마다 인식하는 이벤트리스너

		// 드롭다운 메뉴에서 선택하는 옵션에 따라 별점선택/검색어 입력중 하나만 나타내게 하는 기능
		function filterToggle() {
			var res_srch1 = document.getElementById("res_srch1"); //  방번호 선택값
			var res_srch2 = document.getElementById("res_srch2"); // 날짜 입력값

			if (reservation_filter.value === "room_num") { // 드롭다운에서 별점 선택하면
				res_srch1.style.display = "inline-block"; // 별점선택은 보이게
				res_srch2.style.display = "none"; // 검색어 입력은 안보이게
			} else if (reservation_filter.value === "start_time" || reservation_filter.value === "res_time") {
				res_srch1.style.display = "none";
				res_srch2.style.display = "inline-block";
			}
		}

		// Initialize the form visibility based on the selected option
		filterToggle();
	</script>


	<%-- 		<script type="text/javascript">
		    function PageMove(page) {
		        const url = new URL(window.location.href);
		        url.searchParams.set("page", page);
		        window.location.href = url.toString();
		    }
		</script>



		<div class="pages">
			<ul class="pagination">
				<li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>
				<li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
				<c:forEach var="i" begin="${paging.startPageNo}"
					end="${paging.endPageNo}" step="1">
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
		</div> --%>

	</div>
	
</body>
</html>