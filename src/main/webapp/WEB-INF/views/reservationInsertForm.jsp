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
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
function updatePrice() {
    const basePrice = parseInt(document.getElementById("basePrice").value);
    const options = document.getElementsByName('options')[0];
    
    let additionalPrice = 0;

    switch (options.value) {
        case '생일':
            additionalPrice = 10000;
            break;
        case '프로포즈':
            additionalPrice = 30000;
            break;
        case '브라이덜 샤워':
            additionalPrice = 50000;
            break;
        case "없음":
           additionalPrice= 0; 
         break;   
    }

    const totalPrice = basePrice + additionalPrice;

    document.getElementById("totalPriceDisplay").innerText = totalPrice;
    document.getElementById("totalcost").value = totalPrice;
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
               <br> <br>
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
               <br><br>
               <!-- <form action="reservationInsert.do" method="post"> -->

               <ul>
                  <li class="qFrm_tit"><b>신청인</b></li>
                  <li>${sid.id}</li>
               </ul>
               <p id="message1"></p>
               <ul>
                  <li class="qFrm_tit"><b>이용 날짜</b></li>
                  <li><input type="text" name="reserve_date" id="reserve_date"
                     onchange="selectStartTime()"></li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>이용 인원 수</b></li>
                  <!-- 최소 2명, 최대 8명 -->
                  <li><input type="number" id="people" name="people" min="2"
                     max="8" value="2" required></li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>추가 옵션</b></li>
                  <li class="qFrm_tit"><select name="options" onchange="updatePrice()">
                        <option selected disabled value="">옵션을 선택해주세요</option>
                        <option value="없음">없음</option>
                        <option value="생일">생일</option>
                        <option value="프로포즈">프로포즈</option>
                        <option value="브라이덜 샤워">브라이덜 샤워</option>
                  </select></li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>결제 수단</b></li>
                  <li class="qFrm_tit"><select name="pay">
                        <option value="카드">카드</option>
                        <option value="계좌이체">계좌이체</option>
                        <!-- DB 의 '현금' -->
                  </select></li>
               </ul>
               <ul>
                  <li class="qFrm_tit"><b>금액</b></li>
                  <li><span id="totalPriceDisplay">${roomVO.price}</span> 원
                     <input type="hidden" id="basePrice" name="cost" value="${roomVO.price}">
                     <input type="hidden" id="totalPrice" name="cost" value="${roomVO.price}">
                  </li>
               </ul>

            </div>

            <!--############## 시간버튼 ##############-->
            <div class="qFrm_table">
               <div class="qFrm_tit">
                  <h3 style="margin-bottom: 40px;">이용 시간</h3>
                  <button type="button" id="timebtn_9" class="timeButton2" disabled
                     onclick="toggleButton(this)" value="9" name="">09:00</button>
                  <c:forEach var="j" begin="10" end="23">
                     <button type="button" id="timebtn_${j}" class="timeButton2"
                        disabled onclick="toggleButton(this)" value="${j}" name="">${j}:00</button>
                  </c:forEach>
                  <br>
                  <div>
                     <b style="color: #ff5383;">●</b>예약가능 &nbsp; &nbsp; &nbsp; 
                     <b style="color: #f0f0f0;">●</b>예약마감 &nbsp; &nbsp; &nbsp; &nbsp; 
                     <b style="color: #007bff;">●</b>선택됨
                  </div>
                  <div style="font-size: 5px;">
                     ✔️ 이용 시간이 연속으로 체크되지 않았을 시 확인을 위하여 업체 측<br> &nbsp; &nbsp; &nbsp; &nbsp;
                        에서 연락드릴 수 있으니 유의해 주시길 바랍니다.
                  </div>
               </div>
            </div>
         </div>
         <input class="qFrm_input" type="button" value="예약하기" onclick="requestPay();">
         <input type="hidden" id="selectedTime" name="selectedTime">
         <input type="hidden" name="mem_num" value="${sid.mem_num}">
         <input type="hidden" name="room_num" value="${roomVO.room_num}">
         <input type="hidden" id="basePrice" name="cost" value="${roomVO.price}">
         <input type="hidden" id="totalcost" name="total_cost">
         <input type="hidden" name="imp_uid">
         <input type="hidden" name="merchant_uid">
         <input type="hidden" name="nickname" value="${memberVO.nickname}">

      </form>

   </div>

   <script>
      var timearray = [];

      // 날짜 선택 변경했을때
      function selectStartTime() {
         var room_num = ${roomVO.room_num};
         var reserve_date = $("#reserve_date").val();
         var today = new Date();
         var syshour = today.getHours();
         var sysdate;
         if (today.getMonth() < 10) { // 오늘 날짜가 1-9월이면
            sysdate = today.getFullYear() + "/0" + (today.getMonth() + 1) + "/" + today.getDate();
         } else { // 오늘 날짜가 10-12월이면
            sysdate = today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + today.getDate();
         }
         //console.log("방번호 : ", room_num);
         //console.log("선택날짜 : ", reserve_date);
         //console.log("현재날짜 : ", sysdate);

         const formData = new FormData(); // Create a FormData object
         formData.append('room_num', room_num);
         formData.append('reserve_date', reserve_date);

         $.ajax({
            url : "selectTime.do",
            type : "POST",
            data : formData, // Send the FormData instead of the file directly
            contentType : 'application/json; chareset=utf-8',
            dataType : 'json',
            contentType : false, ///// 지우면 안됨 이유모름
            processData : false,
            success : function(timeList) {
               for (var i = 9; i < 24; i++) { // 버튼 막을것인지
                  if (timeList[i] === 1) { // 예약 내역이 있으면
                     $('#timebtn_' + i).removeClass('timeButton active').addClass('timeButton2').attr('disabled');
                  } else if (timeList[i] === 0) { // 예약 내역이 없으면
                     if (sysdate === reserve_date) { // 선택 날짜가 오늘 날짜일 때
                        if (i <= syshour) { // 현재 시간 이전 시간은 예약 불가
                           $('#timebtn_' + i).removeClass('timeButton active').addClass('timeButton2').attr('disabled');
                        }
                     } else {
                        $('#timebtn_' + i).removeClass('timeButton2 active').addClass('timeButton').removeAttr('disabled');
                     }
                  }
               }
               timearray = [];
            },
            error : function(request, error) {
               console.log("code : " + request.status + "\n"
                     + "message : " + request.responseText + "\n"
                     + "error : " + error);
            }
         });
      }
      
      // 시간 버튼 눌렀을때
      function toggleButton(button) {
          var selectedTime = $(button).val(); // 선택한 시간값
          if (button.classList.contains("active")) { // 선택되어있으면 선택해제
              button.classList.remove("active");
             for(var k = 0; k < timearray.length; k++){
                if(timearray[k] === selectedTime){
                   timearray.splice(k, 1);
                }
             }
              //document.getElementById('selectedTime').value = null;
          } else { // 선택 안되어있으면 선택처리
              button.classList.add("active");
              timearray.push(selectedTime);
          }
          //console.log("클릭한 버튼 값 : ", selectedTime);
          //console.log("전체 배열 : ", timearray);
          document.getElementById('selectedTime').value = timearray.sort(function(a, b) { return a - b; });;
          //console.log("컨트롤러에 넘어갈 배열값 : ", document.getElementById('selectedTime').value);
      }
      
     // 예약하기 버튼 눌렀을때
   function requestPay() {
      const selectedTime = document.getElementById('selectedTime').value;
      const people = document.getElementById('people').value;
      const options = document.getElementsByName('options')[0];
      const totalPrice = parseFloat(document.getElementById("totalcost").value);
      //console.log("선택된 시간 : ", selectedTime);
      //console.log("플레이타임 : ", selectedTime.split(',').length);
      var room_name = "${roomVO.room_name}";
      var buyer_name = "${memberVO.nickname}";
      var buyer_email = "${memberVO.id}";
      var buyer_tel = "${memberVO.tel}";
      //console.log("방이름 : ", room_name);
      //console.log("회원이름 : ", buyer_name);
      //console.log("이메일 : ", buyer_email);
      //console.log("전화번호 : ", buyer_tel);
      
      var form = document.getElementById('reservationForm');
      
      if (selectedTime && people) {
         if (selectedTime.split(',').length >= 3) { // 시간 선택 3개 이상 되었으면
            if (options.value === "") {
               alert("옵션을 선택해주세요.");
               return;  // 여기서 함수 종료
            }
            
            IMP.init("imp76264221"); // 아임포트 가맹점 식별코드를 입력해주세요.

            IMP.request_pay({
               pg : 'html5_inicis', // PG사를 입력하세요.
               pay_method : 'card', // 결제수단을 입력하세요.
               merchant_uid : 'merchant_' + new Date().getTime(),
               name : room_name, // 주문명
               amount : totalPrice, // 결제금액
               buyer_name : buyer_name,
               buyer_email : buyer_email,
               buyer_tel : buyer_tel // 구매자 전화번호
            },function(rsp) {
               console.log(rsp); // 결제검증
               if (rsp.success) {
                  console.log(rsp.imp_uid);
                  $.ajax({
                     type : "POST",
                     url : "verifyIamport.do?imp_uid=" + rsp.imp_uid,
                     success : function(data) {
                           
                        console.log("ajax success");
                        console.log(data); // 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
                        if (rsp.paid_amount == data.response.amount) {
                           console.log("res.paid_amount == data.response.amount");
                           alert('고유ID : ' + rsp.imp_uid
                                 + '\n상점 거래ID : ' + rsp.merchant_uid
                                 + '\n결제 금액 : ' + rsp.paid_amount
                                 + '\n카드 승인번호 : ' + rsp.apply_num);
                           console.log("결제 및 결제검증 완료");

                           form['imp_uid'].value = rsp.imp_uid;
                           form['merchant_uid'].value = rsp.merchant_uid;
                           form['nickname'].value = rsp.buyer_name;
                           form['total_cost'].value = rsp.paid_amount;
                           form.submit();
                           }
                        }
                  });
                  } else { // if (rsp.success) - end
                     alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
                     }
               }); // IMP.request_pay({},function(rsp){}) - end
            } else { // if (selectedTime.split(',').length >= 3){} - end
               alert('이용시간은 최소 3시간입니다');
               }
         } else { // if (selectedTime && people){} - end
            alert('이용시간 또는 인원수를 선택해주세요.');
            }
      }// function requestPay() - end
      
   </script>

</body>
<%@include file="footer.jsp"%>
</html>