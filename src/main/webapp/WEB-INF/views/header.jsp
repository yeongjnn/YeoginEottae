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

function reserve_header() {
	var sid = '<%=session.getAttribute("sid")%>';
	
     if(sid=="null") {
      
      var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하겠습니까?');
      if (result == true) {
         window.location.href='loginForm.do';
      } 
     }
     else{
    	 $("#openLikelist").click(function(event) {
    		    event.preventDefault(); 
    		    var mem_num = $(this).data("mem-num");
    		    var url = "likelist.do?mem_num=" + mem_num;
    		    
    		    // 팝업 창을 화면 가운데에 띄우기 위해 필요한 정보들을 계산합니다.
    		    var width = 600;
    		    var height = 600;
    		    var left = (window.innerWidth - width) / 2;
    		    var top = (window.innerHeight - height) / 2;
    		    var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes";

    		    // 새 창을 엽니다.
    		    window.open(url, "likelist", options);
    		});
     }
     
    
}

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




<title>여긴어때</title>
</head>
<body>

<%
response.setHeader("cache-control","no-store"); // http 1.1
response.setHeader("Pragma","no-cache"); // http 1.0
response.setDateHeader("Expires",0); // proxy server 에 cache방지
%>

	<header>
		<a href="start.do"><h1 id=head>여긴어때?</h1></a>
	</header>

	<nav>
	
		<ul id=menu_box>
		
			<li class=t_menu><a class=white href="aboutCompany.do">회사 소개</a>
				<ul class=s_menu>
					<li><a href="aboutCompany.do">회사 소개</a></li>
					<li><a href="wayToCome.do">오시는 길</a></li>
				</ul>
			</li>
			
			<li class=t_menu>
				<a class=white href="basic.do">베이직룸</a>
				<ul class=s_menu></ul>
			</li>

			<li class=t_menu>
				<a class=white href="cooking.do">쿠킹룸</a>
				<ul class=s_menu></ul>
			</li>

			<li class=t_menu><a class=white href="kids.do">키즈룸</a>
				<ul class=s_menu></ul>
			</li>

			<li class=t_menu><a class=white href="rooftop.do">루프탑</a>
				<ul class=s_menu></ul>
			</li>

			<li class=t_menu><a class=white href="notice.do">커뮤니티</a>
				<ul class=s_menu>
					<li><a href="notice.do">공지사항</a></li>
					<!-- <li><form id="qFrm"><a href="question.question" onclick="qLogChk()">문의사항</a></form></li> -->
					<li><form id=""><a id="Question1" href="question.do" onclick="">문의사항</a></form></li>
					<li><form id=""><a href="getAllBoard.do" onclick="">회원게시판</a></form></li>
				</ul>
			</li>

			<li class=t_menu><a class=white href="reviewInsertForm.do">예약현황</a>
				<ul class=s_menu></ul>
			</li>
			
			<li class=t_menu>
				<a id="openLikelist" class=white href="#" data-mem-num="${sid.mem_num}" onclick="reserve_header();">찜목록보기</a>
				<ul class=s_menu></ul>
			</li>
			
		</ul>



		<div class=lj_line>
			<a class="login white" href="loginForm.do"><span> login </span></a>
			<a class="join white" href="joinview.do"><span> 회원가입 </span></a>
			<%-- <a class="mypage white" href="getmyinfo.do"><span id=name> <%= sid2%>님 </span></a> --%>
			<a class="mypage white" href="getMyInfo.do?mem_num=${sid.mem_num}"><span id=name> ${sid.nickname}님 </span></a>
			<a class="logout white" href="logout.do"><span> 로그아웃 </span></a>
		</div>
		
	</nav>
<script>

</script>
</body>
</html>