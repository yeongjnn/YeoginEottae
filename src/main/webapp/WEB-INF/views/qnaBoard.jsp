<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판</title>

<%@include file ="header.jsp" %>


<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = review_board>QnA 게시판</h2>
        </div>
    </div>


<div class=board_changes>
	<a href="questionMyOne.do?mem_num=${sid.mem_num}&answer=${questionVO.answer}"><button class = board_change>
		문의사항			
	</button></a>

	<a href="myReview.do?mem_num=${sid.mem_num}"><button class = board_change>
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
            
                <form action="questionfilter.do">
                    <div class="search-wrap">
                        <label for="search" class="blind">리뷰 내용 검색</label>
                        <input type="hidden" value="${sid.mem_num}" name="mem_num">
                        <input id="search" type="search" name="question_search" placeholder="제목이나 내용으로 검색이 가능합니다." value="${param.question_search}">
                        <button type="submit" class="b_btn btn-dark" style="margin:0;">검색</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
				<%-- <input value="${param.m_n}" name=mem_num>${sid.mem_num} --%>
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">답변여부</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="i" items="${qtlist}">
                        <input style="display:none;"value="${i.mem_num}" name=mem_num>
                    <tr>
                        <td class="qsm_col1">${i.q_num}</td>
                        <td class="qsm_col2"><a href="questionSearchOne.do?q_num=${i.q_num}&mem_num=${i.mem_num}&q_title=${i.q_title}&q_date=${i.q_date}&q_content=${i.q_content}&answer=${i.answer}">${i.q_title}</a></td>
                        <td class="qsm_col3">${i.q_date}</td>
                        <td class="qsm_col4 ${empty i.answer ? 'waiting' : 'completed'}">${empty i.answer ? '답변 대기중' : '답변 완료'}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

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
	
<%@include file ="footer.jsp" %>

</body>
</html>