<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-방조회</title>

</head>
<body>

	<%@include file="header_mngr.jsp"%>



	<div class="my_wrapper">

		<span class="s_title">상품 목록 </span>
		<div class="clientsum">총 상품수 : ${paging.totalCount}개</div>
		

		<table class="cl_list" border=1>
			<tr>
				<th class="r_col2">No.</th>
				<th class="r_col2">방 이름</th>
				<th class="r_col3">종류</th>
				<th class="r_col4">가격</th>
				<th class="r_col5">면적</th>
				<th class="r_col6">침대</th>
				<th class="r_col7">노래방</th>
				<th class="r_col8">등록일</th>
				<th class="r_col9">수정일</th>
				<th class="r_col10">수정하기</th>
			</tr>


			<c:forEach var="rlist" items="${rlist}">
				<form action="roomSearchOne_mngr.do" method="get">
					<tr>
						<td class="r_col2">${rlist.room_num}</td>
						<td class="r_col2">${rlist.room_name}</td>
						<td class="r_col3">${rlist.purpose}</td>
						<td class="r_col4">${rlist.price}원</td>
						<td class="r_col5">${rlist.width}m²</td>
						<td class="r_col6">${rlist.bed}</td>
						<td class="r_col7">${rlist.music}</td>
						<td class="r_col8">${rlist.room_regdate}</td>
						<td class="r_col9">${rlist.room_moddate}</td>
						<td class="r_col10">
						<input type="submit" id="searchone2" value="수정하기">
						<input type="hidden" name="room_num" value="${rlist.room_num}">
						<input type="hidden" name="room_name" value="${rlist.room_name}">
						<input type="hidden" name="purpose" value="${rlist.purpose}">
						<input type="hidden" name="price" value="${rlist.price}">
						<input type="hidden" name="width" value="${rlist.width}">
						<input type="hidden" name="bed" value="${rlist.bed}">
						<input type="hidden" name="music" value="${rlist.music}">
						<input type="hidden" name="explanation" value="${rlist.explanation}">
						<input type="hidden" name="room_regdate" value="${rlist.room_regdate}">
						<input type="hidden" name="room_moddate" value="${rlist.room_moddate}">
						<input type="hidden" name="room_img_1" value="${rlist.room_img_1}">
						<input type="hidden" name="room_img_2" value="${rlist.room_img_2}">
						<input type="hidden" name="room_img_3" value="${rlist.room_img_3}">
						</td>
					</tr>
				</form>
			</c:forEach>
		</table>

		<form action="roomPageFilter.do" method="get">
			<div class="subm">
				<select name="roomFilter">
				    <option value="ROOM_NAME" ${param.product_filter eq 'room_name' ? 'selected' : ''}>방이름</option>
				</select>
				<input type="text" name="roomSearch" value="${param.roomSearch}"> 
				<input type="submit" value="검색" id="search_in">
			
			</div>
		</form>


		<form action="roomInsertForm_mngr.do">
			<input type="submit" value="추가하기" class="pd_insert">
		</form>

		<script type="text/javascript">
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
		</div>


		<%-- <%@include file="footer.jsp"%> --%>
	</div>
	

</body>
</html>