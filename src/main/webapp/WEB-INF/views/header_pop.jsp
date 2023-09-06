<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/css/star.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/index.css">
<link rel="stylesheet" type="text/css" href="${path}/css/productDetail.css">
<link rel="stylesheet" type="text/css" href="${path}/css/MY_jquery.bxslider.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${path}/js/jquery-3.4.1.min.js"></script>
<script src="${path}/js/jquery.bxslider.min.js"></script>
<script src="${path}/js/index.js"></script>
<!-- 달력 plugin : datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>



$(document).ready(function(){
    var sid = '<%=session.getAttribute("sid")%>';
	//alert(uid);
     if(sid=="null"){ // 로그아웃 상태
 		$("a.login").addClass('display_block');
		$("a.join").addClass('display_block');
		$("a.mypage").addClass('display_none');
		$("a.logout").addClass('display_none');
		
		$("#Question").click(function () {
            var result = confirm("로그인이 필요한 서비스 입니다.\n로그인 해주세요.");
            if (result == true){
            	window.location.href='loginForm.do'; //==> 일단 로그인 화면으로..
            }
            return false;
        });
		
     }
     else{ // 로그인 상태
   	  //alert(sid);
  		$("a.login").addClass('display_none');
		$("a.join").addClass('display_none');
		$("a.mypage").addClass('display_block');
		$("a.logout").addClass('display_block'); 
		
	}
     
}) 

</script>
<title>여긴어때</title>
</head>
<body>

<%
response.setHeader("cache-control","no-store"); // http 1.1
response.setHeader("Pragma","no-cache"); // http 1.0
response.setDateHeader("Expires",0); // proxy server 에 cache방지
%>

	<header>
		<h1 id=head>찜 목록</h1></a>
	</header>

	<nav>
	
		<ul id=menu_box>
		
			
		</ul>



		
		
	</nav>
<script>
$("#openLikelist").click(function(event) {
    event.preventDefault(); 
    var mem_num = $(this).data("mem-num");
    var url = "likelist.do?mem_num=" + mem_num;

    window.open(url, "likelist", "width=800,height=600,scrollbars=yes");
});
</script>
</body>
</html>