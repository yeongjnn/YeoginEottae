<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티룸 상세 조회</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
<%@include file="header.jsp" %>
<style>
    .red-heart {
      color: red;
    }

  </style>
  
  <script>
    function openImagePopup(imageURL) {
        // 팝업 창을 화면 가운데에 띄우기 위해 필요한 정보들을 계산합니다.
        var width = 417;
        var height = 385;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;
        var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes";

        // 이미지 URL을 팝업 창 열기 위한 URL로 설정합니다.
        var popupURL = imageURL;

        // 팝업 창 열기
        window.open(popupURL, "ImagePopup", options);
    }
</script>
  

<script>
  
	function reserve() {
		var sid = '<%=session.getAttribute("sid")%>';
		
	     if(sid=="null") {
	 
	      var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하겠습니까?');
	      if (result == true) {
	         window.location.href='loginForm.do';
	      } else {
	        
	      }
	   } 
	     else{
	    	 var addToBasketForm = document.getElementById('addToBasketForm');
	         if (addToBasketForm) {
	             addToBasketForm.submit();
	         }
	     }
	}

	
	function reserve2() {
		var sid = '<%=session.getAttribute("sid")%>';
		
	     if(sid=="null") {
	      var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하겠습니까?');
	      if (result == true) {
	         window.location.href='loginForm.do';
	      } else {
	        
	      }
	   } 
	     else{
	    	 var addToBasketForm = document.getElementById('addToBasketForm');
	         if (addToBasketForm) {
	             addToBasketForm.submit();
	         }
	     }
	}
    
    function checkLikeStatus() {
	    // 기존 코드를 수정
	    var $likeBtn = $('.like-btn');
	    var room_num = $likeBtn.data('room-num');
	    var mem_num = $likeBtn.data('mem-num');

	    // 좋아요 상태를 확인하기 위해 데이터베이스에 AJAX 요청을 보냅니다.
	    $.ajax({
	        url: 'checkLikeStatus.do',
	        type: 'GET', 
	        data: {
	            mem_num: mem_num,
	            room_num: room_num
	        },
	        dataType: 'text',
	        success: function(data) {
	            if (data == "true") {
	                $likeBtn.find('i').addClass('fas').removeClass('far').addClass('red-heart');
	                $likeBtn.data('like-state', 1);
	            
	            } else {
	                $likeBtn.find('i').removeClass('fas').addClass('far').removeClass('red-heart');
	                $likeBtn.data('like-state', 0);
	            }
	        },
	    });
	  }

	
    $(document).ready(function() {
    	  checkLikeStatus();
    	  $('.bxslider2').bxSlider({
  	        auto: true,
  	        speed: 500,
  	        pause: 4000,
  	        mode:'fade',
  	        autoControls: true,
  	        pager: true,
  	    });

    	  $('.like-btn').on('click', function() {
    	    var $likeBtn = $(this);
    	    var room_num = $likeBtn.data('room-num');
    	    var mem_num = $likeBtn.data('mem-num');
    	    var like_num = $likeBtn.data('like-num');
    	    var heartIcon = $likeBtn.find('i');
    	    var likeState = $likeBtn.data('like-state');

    	    if (likeState == 0) {
    	      $.ajax({
    	        url: 'addLike.do',
    	        type: 'POST',
    	        data: {
    	          mem_num: mem_num,
    	          room_num: room_num
    	        },
    	        success: function(data) {
    	          if (data !== "success") {
    	        	  var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하겠습니까?');
    	        	  if (result == true) {
    	     	         window.location.href='loginForm.do';
    	     	      }
    	          } else {
    	            alert('찜하기성공');
    	            heartIcon.addClass('fas').removeClass('far').addClass('red-heart');
    	            $likeBtn.data('like-state', 1);
    	          }
    	        },
    	      });
    	    } else {
    	      $.ajax({
    	        url: 'removeLike.do',
    	        type: 'POST',
    	        data: {
    	          like_num: like_num,
    	          mem_num: mem_num,
    	          room_num: room_num
    	        },
    	        success: function(data) {
    	          if (data == "success") {
    	            alert('취소성공');
    	            heartIcon.addClass('far').removeClass('fas').removeClass('red-heart');
    	            $likeBtn.data('like-state', 0);
    	          }
    	        },
    	      });
    	    }
    	  });
    	  
    	});

  </script>
  
</head>
<!-- 이미지 3개가 출력되어야 한다 -->
<body>

	<div class="my_wrapper">
	
		<h2 class="pd_name">파티룸 상세</h2>
		
		<div class="pdDetail_bx">
		
			<!-- 찜하기 폼 -->
			<form id="addToBasketForm" action="reservationInsertForm.do" method="post">
			<!-- product_detail css 수정 -->
			
				<input type="hidden" id="mem_num" name="mem_num" value="${sid.mem_num}" /> <!-- 로그아웃 상태일 때 mem_num 값이 아예 없어서 error 페이지 출력 -->
			    <input type="hidden" name="room_num" value="${roomVO.room_num}" />
			    <input type="hidden" name="purpose" value="${roomVO.purpose}" />
			    <input type="hidden" name="price" value="${roomVO.price}" />
			    <input type="hidden" name="width" value="${roomVO.width}" />
			    <input type="hidden" name="bed" value="${roomVO.bed}" />
			    <input type="hidden" name="music" value="${roomVO.music}" />
			    <input type="hidden" name="explanation" value="${roomVO.explanation}" />
				<input type="hidden" name="room_name" value="${roomVO.room_name}"/>
				<!-- 사진 3개가 모여져 있는 공간 클릭하면 큰 화면으로 펼쳐지게 하는건? -->
				<div style="max-width: 750px;">
					<ul class="sliderRoom" id="">
						<li><img class="room_img_1" src="./resources/images/${roomVO.room_img_1}"/></li>
						<li><img class="room_img_2" src="./resources/images/${roomVO.room_img_2}"/></li>
						<li><img class="room_img_3" src="./resources/images/${roomVO.room_img_3}"/></li>
					</ul>
				</div>
<!-- 
        <a href="#" class="abtn lb"><span class="bld"> < </span></a>
        <a href="#" class="abtn rb"><span class="bld"> > </span></a>
 -->

				<dl>
					<%-- <input type="hidden" name="mem_num" value="${sessionScope.sid}">
					<input type="hidden" name="room
					_num" value="${roomVO.room_num}"> --%>
					
					<!-- 가격을 맨 아래로 -->
					<dd>기본 옵션 : ${roomVO.purpose}</dd>
					<dd>면적 : ${roomVO.width}</dd>
					<dd>침대 : ${roomVO.bed}</dd>
					<dd>노래방 : ${roomVO.music}</dd>
					<dd>위치 : ${roomVO.explanation}</dd>
					<dd>가격 : ${roomVO.price}</dd> 
					<dd>
					    <input type="button" value="예약하기" class="styled-button"
					        onclick="reserve()"> <!-- 클릭하면 안내창 출력 후(confirm) 예약 페이지로 이동 -->
					    <button type="button" class="like-btn"
						  data-mem-num="${sid.mem_num}"
						  data-room-num="${roomVO.room_num}"
						  data-like-state="${likeState}">
						  <i class="fa-heart ${likeState == 1 ? 'fas red-heart' : 'far'}"></i>
						</button>
  					</dd>
  					
				</dl>
			</form>
			
			<!-- 구매하기 폼 -->
    		<form id="orderForm">
			  <input type="hidden" name="mem_num" value="${memberVO.mem_num}" />
			  <input type="hidden" name="room_num" value="${roomVO.room_num}" />
			  <input type="hidden" name="price" value="${roomVO.price}" />
			  <input type="hidden" name="room_name" value="${roomVO.room_name}"/>
			</form>
	
		</div> <!-- pdDetail_bx - end -->
	
			
			<!-- 옵션 선택 이미지들이랑 설명들 -->
			
			<ul class="select_optionBx" style="	padding: 0;text-align: center;width: 60vw;    height: 700px;">
			<!-- 	<li><img src="./resources/images/party.jpg" alt=""></li> -->
				<li style="width:100%;"><p style="position: absolute; width: 60vw;">💜8월 방학맞이 할인 이벤트💜<br>



🚍종로 파티룸 여긴어때는 종로3가역역 9번출구에서 도보 1분거리에 위치해있습니다.<br>



🎉8인용 책상,바베큐, 보드게임, 노래방 등이 구비되어있는 종로파티룸 여긴어때에서는 최대 10명의 넓은 공간에서 모임장소, 생일파티, 스튜디오로 함께 즐길 수 있습니다.<br>





대형 루프탑이 있는 파티룸에서 바베큐파티와 홍대의 야경을 즐겨보세요!<br>



🐕애견 동반 가능. 카톡 문의<br>



🏢여긴어때 소개<br>



- 국내 최대규모 No.1 파티룸 , 2030 놀이문화를 선도하는 여긴어때<br>

- 전문 예약팀으로 발 빠른 응대와 기분좋은 친절한 서비스<br>

- 파티룸 사용 전,후 전문청소업체를 통한 깨끗한 청결 관리 + 정기방역<br>

- 대형 빔프로젝터 or TV 및 미러볼, 마이크, 음향시설 완비!<br>

- 전문보안업체 KT텔레캅과 함께하는 안전한 여긴어때 파티룸!!<br>

- 입구 비상벨 등 SAFE ZONE 설치로 안전한 이용<br>

- 남녀노소 누구나 안전하게 즐길 수 있는 공간!</p><br></li>


		

				
			</ul>
	
	
	
	
	
	
		<div id="board-list">
       <div class="container">
          <table class="board-table under_review">
             <thead>
                <tr> <!-- 일단 사진은 제외 -->
                   <th scope="col" class="th-rv-star" style="width:8%">별점</th>
                   <th scope="col" class="th-rv-star" style="width:35%">사진</th>
                       <th scope="col" class="th-rv-con" style="width:27%">내용</th>         
                       <th scope="col" class="th-rv-nickname" style="width:15%">닉네임</th>
                       <th scope="col" class="th-rv-date" style="width:15%">작성일</th> <!-- th-rv-date 새로 만들어야 함 -->
                </tr>
             </thead>
             <tbody>
                <c:forEach var="r" items="${revArr}">
                   <tr>
                      <td class="th-rv-star" style="width:8%"><c:forEach var="a" begin="1" end="5">
                        <c:if test="${r.star eq a}">
                           <img src="http://localhost:8080/imgpath/stars_${a}.png" style="height: 1em;">
                        </c:if>
                     </c:forEach></td>
                     <td class="th-rv-img" style="width:30%">
                     	<c:if test="${not empty r.rev_img_1}">                    		
                     	<img src="http://localhost:8080/imgpath/${r.rev_img_1}" style="width:25%; height:48px; cursor:pointer" onclick="openImagePopup('http://localhost:8080/imgpath/${r.rev_img_1}');">		                                     
                        </c:if>
                        <c:if test="${not empty r.rev_img_2}">                    
                        <img src="http://localhost:8080/imgpath/${r.rev_img_2}" style="width:25%; height:48px; cursor:pointer" onclick="openImagePopup('http://localhost:8080/imgpath/${r.rev_img_2}');">	                      
                        </c:if>
                        <c:if test="${not empty r.rev_img_3}">                    	
                        <img src="http://localhost:8080/imgpath/${r.rev_img_3}" style="width:25%; height:48px; cursor:pointer" onclick="openImagePopup('http://localhost:8080/imgpath/${r.rev_img_3}');">	               
                        </c:if>
                     </td>
                      <td class="th-rv-con" style="width:32%">${r.rev_content}</td>
                      <td class="th-rv-nickname" style="width:15%">${r.nickname}</td>
                      <td class="th-rv-date" style="width:15%">${r.rev_date}</td>
                   </tr>
                </c:forEach>
             </tbody>
          </table>
       </div>
    </div>
	
	</div> <!-- my_wrapper - end -->
	
<%@include file="footer.jsp" %>	
</body>
</html>