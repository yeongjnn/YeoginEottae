<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
   .timeButton {
       background-color: #ff7da1; /* Light gray background color */
       border: none;
       color: #333; /* Dark gray text color */
       padding: 10px 20px; /* Add some padding for a wider appearance */
       margin: 5px; /* Add some spacing between buttons */
       font-size: 14px;
       border-radius: 5px; /* Add rounded corners */
       cursor: pointer;
   }
   
   .timeButton2 {
       background-color: #f0f0f0; /* Light gray background color */
       border: none;
       color: #333; /* Dark gray text color */
       padding: 10px 20px; /* Add some padding for a wider appearance */
       margin: 5px; /* Add some spacing between buttons */
       font-size: 14px;
       border-radius: 5px; /* Add rounded corners */
       cursor: pointer;
   }   

   /* On hover, change the background color to a slightly darker shade */
   .timeButton:hover {
       background-color: #e0e0e0;
   }
   
   .timeButton.active {
       background-color: #007bff; /* Blue background color for active buttons */
       color: #fff; /* White text color for active buttons */
   }
</style>
<script>
   function toggleButton_9(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 9;   
   }
   function toggleButton_10(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 10;   
   }
   function toggleButton_11(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 11;   
   }
   function toggleButton_12(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 12;   
   }
   function toggleButton_13(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 13;   
   }
   function toggleButton_14(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 14;   
   }
   function toggleButton_15(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 15;   
   }
   function toggleButton_16(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 16;   
   }
   function toggleButton_17(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 17;   
   }
   function toggleButton_18(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 18;   
   }
   function toggleButton_19(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 19;   
   }
   function toggleButton_20(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 20;   
   }
   function toggleButton_21(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 21;   
   }
   function toggleButton_22(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 22;   
   }
   function toggleButton_23(button) {
      var bt1 = $('.timeButton').val();
      button.classList.toggle("active");
      document.getElementById('selectedTime').value = 23;   
   }
</script>
</head>
<body>
   <div class="my_wrapper">

      <div class="page-title">
         <h2 class="notice_board">예약 등록</h2>
      </div>

      <form id="reservationForm" action="reservationInsert.do" method="post">
         <div class="qFrm_bx">
            <div class="qFrm_table">
               <h2>
                  <b>파티룸 정보</b>
               </h2>
               <br>
               <br>
               <ul>
                  <li class="qFrm_tit"><b>기본 옵션</b></li>
                  <li>${roomVO.purpose}</li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>위치</b></li>
                  <li>${roomVO.explanation}</li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>면적</b></li>
                  <li>${roomVO.width}</li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>침대</b></li>
                  <li>${roomVO.bed}</li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>노래방</b></li>
                  <li>${roomVO.music}</li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>가격</b></li>
                  <li>${roomVO.price}</li>
               </ul>
            </div>


            <div class="qFrm_table">
               <h2>
                  <b>예약 정보</b>
               </h2>
               <br>
               <br>
               <!-- <form action="reservationInsert.do" method="post"> -->

               <ul>
                  <li class="qFrm_tit"><b>신청인</b></li>
                  <li>${sid.id}</li>
               </ul>
               <p id="message1"></p>
               <ul>
                  <li class="qFrm_tit"><b>이용 날짜</b></li>
                  <li>${res_timeVO.reserve_date}</li>
                  
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>이용 인원 수</b></li>
                  <!-- 최소 2명, 최대 8명 -->
                  <li>${reservationVO.people}
                  </li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>추가 옵션</b></li>
                  <li class="qFrm_tit">
                     ${reservationVO.options}
                  </li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>결제 수단</b></li>
                  <li class="qFrm_tit">
                     ${reservationVO.pay}
                  </li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>금액</b></li>
                  <li>${roomVO.price} 원 <input type="hidden" name="cost"
                     value="${roomVO.price}">
                  </li>
               </ul>

            </div>
            
            

            <div class="qFrm_table">
               <div class="qFrm_tit">
               <h3>이용 시간</h3>
               
                  <c:if test="${timeList[9] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_9(this)" value="9" name="button">09:00</button>                  
                  </c:if>
                  <c:if test="${timeList[9] == 1}">           
                     <button type="button" class="timeButton2">09:00</button>
                  </c:if>
                  <c:if test="${timeList[10] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_10(this)" value="10" name="button">10:00</button>
                  </c:if>
                  <c:if test="${timeList[10] == 1}">           
                     <button type="button" class="timeButton2">10:00</button>
                  </c:if>
                  <c:if test="${timeList[11] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_11(this)" value="11" name="button">11:00</button>
                  </c:if>
                  <c:if test="${timeList[11] == 1}">           
                     <button type="button" class="timeButton2">11:00</button>
                  </c:if>
                  <br>
                  <c:if test="${timeList[12] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_12(this)" value="12">12:00</button>
                  </c:if>
                  <c:if test="${timeList[12] == 1}">           
                     <button type="button" class="timeButton2">12:00</button>
                  </c:if>
                  <c:if test="${timeList[13] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_13(this)" value="13">13:00</button>
                  </c:if>
                  <c:if test="${timeList[13] == 1}">           
                     <button type="button" class="timeButton2">13:00</button>
                  </c:if>
                  <c:if test="${timeList[14] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_14(this)" value=14>14:00</button>
                  </c:if>
                  <c:if test="${timeList[14] == 1}">           
                     <button type="button" class="timeButton2">14:00</button>
                  </c:if>
                  <br>
                  <c:if test="${timeList[15] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_15(this)" value=15>15:00</button>
                  </c:if>
                  <c:if test="${timeList[15] == 1}">           
                     <button type="button" class="timeButton2">15:00</button>
                  </c:if>
                  <c:if test="${timeList[16] == 0}">          
                     <button type="button" class="timeButton" onclick="toggleButton_16(this)" value="16">16:00</button>
                  </c:if>
                  <c:if test="${timeList[16] == 1}">           
                     <button type="button" class="timeButton2">16:00</button>
                  </c:if>
                  <c:if test="${timeList[17] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_17(this)" value="17">17:00</button>
                  </c:if>
                  <c:if test="${timeList[17] == 1}">           
                     <button type="button" class="timeButton2">17:00</button>
                  </c:if>
                  <br>
                  <c:if test="${timeList[18] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_18(this)" value="18">18:00</button>
                  </c:if>
                  <c:if test="${timeList[18] == 1}">           
                     <button type="button" class="timeButton2">18:00</button>
                  </c:if>
                  <c:if test="${timeList[19] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_19(this)" value="19">19:00</button>
                  </c:if>
                  <c:if test="${timeList[19] == 1}">           
                     <button type="button" class="timeButton2">19:00</button>
                  </c:if>
                  <c:if test="${timeList[20] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_20(this)" value="20">20:00</button>
                  </c:if>
                  <c:if test="${timeList[20] == 1}">           
                     <button type="button" class="timeButton2">20:00</button>
                  </c:if>
                  <br>
                  <c:if test="${timeList[21] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_21(this)" value="21">21:00</button>
                  </c:if>
                  <c:if test="${timeList[21] == 1}">           
                     <button type="button" class="timeButton2">21:00</button>
                  </c:if>
                  <c:if test="${timeList[22] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_22(this)" value="22">22:00</button>
                  </c:if>
                  <c:if test="${timeList[22] == 1}">           
                     <button type="button" class="timeButton2">22:00</button>
                  </c:if>
                  <c:if test="${timeList[23] == 0}">           
                     <button type="button" class="timeButton" onclick="toggleButton_23(this)" value="23">23:00</button>
                  </c:if>
                  <c:if test="${timeList[23] == 1}">           
                     <button type="button" class="timeButton2">23:00</button>
                  </c:if>

                  </div>
               </div>
            
            <div id="timeDisplay"></div>         

         </div>
         
         <div class="timeState"><b style="color:#ff5383;">●</b>예약가능&nbsp;
         	  <b style="color:#f0f0f0;">●</b>예약마감&nbsp;
         	  <b style="color:#007bff;">●</b>선택됨
         	  </div>

         <input class="qFrm_input" type="button" value="예약하기" onclick="requestPay();">
         
         <input type="hidden" id="selectedTime" name="selectedTime">
         
         <input type="hidden" name="reserve_date" value="${res_timeVO.reserve_date}">
         <input type="hidden" name="res_num" value="${reservationVO.res_num}">
         <input type="hidden" name="mem_num" value="${sid.mem_num}">
         <input type="hidden" name="room_num" value="${roomVO.room_num}">
         <input type="hidden" name="people" value="${reservationVO.people}">
         <input type="hidden" name="cost" value="${reservationVO.cost}">
         <input type="hidden" name="options" value="${reservationVO.options}">
         <input type="hidden" name="pay" value="${reservationVO.pay}">
      </form>
   
   </div>

   <%@include file="footer.jsp"%>
<script>
  function requestPay() {
    const selectedTime = document.getElementById('selectedTime').value;
   
    
    if (selectedTime) {
      IMP.init("imp76264221"); // 아임포트 가맹점 식별코드를 입력해주세요.
      
      IMP.request_pay({
        pg: 'html5_inicis', // PG사를 입력하세요.
        pay_method: 'card', // 결제수단을 입력하세요.
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: '201호', // 주문명
        amount: 10, // 결제금액
        buyer_name: '홍길동',
        buyer_email: 'asd123@gmail.com',
        buyer_tel: '010-1234-5678' // 구매자 전화번호
      }, function (rsp) {
        if (rsp.success) {
           
            document.getElementById('reservationForm').submit();
        
        } else {
          alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
        }
      });
    } else {
      alert('시간을 선택해주세요.');
    }
  }
</script>
</body>
</html>