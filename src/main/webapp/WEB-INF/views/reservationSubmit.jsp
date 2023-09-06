<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>

<style type="text/css">

  body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 80vh; /* Viewport Height */
        margin: 0;
        background-color: #f3f3f3;
        font-family: Arial, sans-serif;
    }
    .result-container {
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
        padding: 50px;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    .table-row th {
        border: 1px solid black;
        padding: 10px;
        color: white;
    }
    
     .table-row td {
         text-align:center; /* 텍스트 가운데 정렬 */
         padding: 10px; 
     }

    .table-row th {
       background-color:#ff5383 ;
       text-align:center; /* 텍스트 가운데 정렬 */
       padding :10px;

   }
    
   .button-container {
       display:flex ;
       justify-content:center ;
       margin-top :20px ;

   }

   .button-container a{
      display:inline-block ;
      padding :10px 60px ;
        margin-right :8px ;
          margin-left :8px ;
   
      background-color:#ff5383 ; 
      color:white ; 
      text-decoration:none ; 

}
</style>

</head>
<body>
<div class="result-container">
   <h2>예약이 완료되었습니다.</h2>

   <table border ="1">
       <tr class="table-row" >
           <th>예약번호:</th>
           <td><%= request.getParameter("merchant_uid") %></td> 
       </tr>

       <tr class="table-row">
           <th>회원 이름:</th>
           <td><%= request.getParameter("nickname") %></td> 
       </tr>

       <tr class="table-row">
           <th>결제 금액:</th>
           <td><%= request.getParameter("total_cost") %> 원</td> 
       </tr>

   </table>
    <div class="button-container">
       <a href="start.do">메인으로</a> 
       <a href="reservation.do?mem_num=${sid.mem_num}">예약목록</a> 
   </div>
</div>
</body>
</html>
