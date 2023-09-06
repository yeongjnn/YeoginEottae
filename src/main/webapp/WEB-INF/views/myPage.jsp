<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script>

   function deleteClient() {
      var result = confirm("정말로 회원탈퇴 하시겠습니까?");
      if (result == true) {
         var form = document.getElementById("myPageFrm");
         form.action = "myPageDelete.do?mem_num=${memberVO.mem_num}";
         form.submit();
         alert("회원탈퇴가 완료되었습니다.");
      } else {
         alert("회원탈퇴가 취소되었습니다.");
      }
   }
</script>
</head>
<body>

<%@include file ="header.jsp" %>
<%@include file ="modal.jsp" %> 

<div class=my_wrapper>

   <div class="page-title">
      <div class="container">
         <h2 class=notice_board>마이페이지</h2>
      </div>
   </div>

   
   <div class = "my_page_bx">
   
   <div class="board_changes"> <!-- 내 정보 수정, 장바구니, 주문목록, 게시글 관리 -->
         <a href="#"><button class=board_change>내 정보 수정</button></a>
        <%--  <a href="BasketGetAll.basket?mem_id=${sid}"><button class=board_change>장바구니</button></a> --%>
         <a href="reservation.do?mem_num=${sid.mem_num}"><button class=board_change>예약목록</button></a>
         <a href="questionMyOne.do?mem_num=${sid.mem_num}"><button class=board_change>게시글 관리</button></a>
   </div>


      <div class = "clientinfo_bx my_page_bx">
      <form id="myPageFrm" name="myPageForm" method="post">
      <input type="hidden" name="mem_num" value="${memberVO.mem_num}">
            <ul>
               <li>기본 회원 정보</li>
               <li>아이디 <input type=text value="${memberVO.id}" name="id"></li>
               <li>비밀번호 <input type=password name="pw"></li>
               <li>닉네임   <input type=text value="${memberVO.nickname}" name="nickname"></li>
               <li>연락처 <input type=text value="${memberVO.tel}" name="tel"></li>
            </ul>
            <div>
            
               <button type="submit" onclick="updateClient()" id="update" value="수정" class="cl_li_btn mini_bk_btn class m_mp_btn">수정</button>         
               <button type="submit" onclick="deleteClient()" value="회원탈퇴" class="cl_li_btn mini_bk_btn">회원탈퇴</button>
            
            </div>
      </form>
      </div> 
   

   </div>

</div>


</body>
</html>