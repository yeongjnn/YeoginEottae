<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

<%@include file ="header.jsp" %>

<script>
$(document).ready(function(){
    var sid = '<%=session.getAttribute("sid")%>';
	//alert(uid);
     if(sid=="null"){ // 로그아웃 상태
		
		$("#Question1").click(function () {
            var result = confirm("로그인이 필요한 서비스 입니다.\n로그인 해주세요.");
            if (result == true){
            	window.location.href='loginForm.do'; //==> 일단 로그인 화면으로..
            }
            return false;
        });
		
     }
}) 
</script>

<div class=my_wrapper>

  <div class="page-title">
        <div class="container">
            <h2 class = notice_board>공지사항 게시판</h2>
        </div>
    </div>


<div class=board_changes>
	<a href="notice.do"><button class = board_change>
		공지사항		
	</button></a>
	

	<a id="Question1" href="question.do"><button class = board_change>
		회원게시판			
	</button></a>
</div>


    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
            
                <form action="noticefilter.do">
                    <div class="search-wrap">
                        <label for="search" class="blind">문의사항 내용 검색</label>
                        <input id="search" type="search" name="notice_search" placeholder="제목이나 내용으로 검색이 가능합니다." value="${param.notice_search}">
                        <button type="submit" class="b_btn btn-dark" style="margin:0;">검색</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th  class="nt_col1">번호</th>
                    <th  class="nt_col2">제목</th>
                    <th  class="nt_col3">등록일</th>
                    <th  class="nt_col4">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="i" items="${ntlist}">
                    <tr>
                        <td class="nt_col1">${i.n_num}</td>
                        <td class="nt_col2"><a href="noticeSearchOne.do?n_num=${i.n_num}&n_title=${i.n_title}&n_date=${i.n_date}&n_content=${i.n_content}&hits=${i.hits}">${i.n_title}</a></td>
                        <td class="nt_col3">${i.n_date}</td>
                        <td class="nt_col4">${i.hits}</td>
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