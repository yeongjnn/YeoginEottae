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


<%@include file="header_mngr.jsp"%>

<div class="my_wrapper">
    <span class="s_title">회원 목록</span>
	<div class="clientsum">총 회원수 : ${paging.totalCount}명</div>

    <table class="cl_list" border=1>
        <tr>
            <th class="cl_col1">회원번호</th>
            <th class="cl_col2">아이디</th>
            <th class="cl_col3">닉네임</th>
            <th class="cl_col4">전화번호</th>
            <th class="cl_col5">가입일</th>
            <th class="cl_col6">최종수정일</th>
            <th class="cl_col7">상세정보</th>
        </tr>
        <c:forEach var="mlist" items="${mlist}"> <!-- list1 -->
            <form action="memberGetOne.do">
                <tr>
                    <td class="cl_col1">${mlist.mem_num}</td>
                    <td class="cl_col2">${mlist.id}</td>
                    <td class="cl_col3">${mlist.nickname}</td>
                    <td class="cl_col4">${mlist.tel}</td>
                    <td class="cl_col5">${mlist.mem_regdate}</td>
                    <td class="cl_col6">${mlist.mem_moddate}</td>
                    <td class="cl_col7">
                        <input type="submit" id="searchone2" value="상세정보">
                        <input type="hidden" name="mem_num" value="${mlist.mem_num}">
                        <input type="hidden" name="id" value="${mlist.id}">
                        <input type="hidden" name="nickname" value="${mlist.nickname}">
                        <input type="hidden" name="tel" value="${mlist.tel}">
                        <input type="hidden" name="mem_regdate" value="${mlist.mem_regdate}">
                        <input type="hidden" name="mem_moddate" value="${mlist.mem_moddate}">
                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>
    
    <form action="memberPageFilter.do" method="get">
        <div class="subm">
            <select name="memberFilter">
			    <option value="MEM_NUM" ${param.memberFilter eq 'MEM_NUM' ? 'selected' : ''}>회원번호</option>
			    <option value="ID" ${param.memberFilter eq 'ID' ? 'selected' : ''}>아이디</option>
			    <option value="NICKNAME" ${param.memberFilter eq 'NICKNAME' ? 'selected' : ''}>닉네임</option>
			    <option value="TEL" ${param.memberFilter eq 'TEL' ? 'selected' : ''}>전화번호</option>
			</select>
            <input type="text" name="memberSearch" value="${param.memberSearch}">
            <input type="submit" value="검색" id="search_in">
        </div>
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