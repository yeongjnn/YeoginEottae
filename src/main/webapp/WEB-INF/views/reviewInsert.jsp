<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>

<body>
   <%@include file="header.jsp"%>


   <div class=my_wrapper>

      <div class="page-title">
         <div class="container">
            <h2 class=notice_board>상품후기 작성</h2>
         </div>
      </div>

      <form action="reviewInsert.do" enctype="multipart/form-data" method="post" id="reviewinsertsubmit">
         <table class="review_insertboard">
            <tr>
               <td class="rv_col1">예 약 번 호</td>
               <td class="rv_col2">${res.res_num}</td>
               <td class="rv_col1">방 &nbsp; 이 &nbsp; 름</td>
               <td class="rv_col2">${res.room_name}</td>
            </tr>
            <tr>
               <td class="rv_col1">입 실 시 간</td>
               <td class="rv_col2">${res.start_time}시</td>
               <td class="rv_col1">퇴 실 시 간</td>
               <td class="rv_col2">${res.finish_time}시</td>
            </tr>
            <tr>
               <td class="rv_col1">옵 &nbsp; &nbsp; &nbsp; &nbsp; 션</td>
               <td class="rv_col2">${res.options}</td>
               <td class="rv_col1">인 &nbsp; 원 &nbsp; 수</td>
               <td class="rv_col2">${res.people}명</td>
            </tr>
            <%-- <tr>
               <td class="rv_col1">도 &nbsp; &nbsp; &nbsp; &nbsp; 수</td>
               <td class="rv_col2">${ov.alcohol}</td>
               <td class="rv_col1">제 작 년 도</td>
               <td class="rv_col2">${ov.made_year}</td>
            </tr> --%>
            <tr>
               <td  style="width:60vw;"><textarea name="rev_content" id="idtextarea" class="rv_tarea"
                     onclick="this.select();" placeholder="내용을 입력하세요" value="${rev.rev_content}"></textarea></td>
            </tr>
            <tr>
               <td class="rv_col3" colspan=4>별점
               <b id="myform">
                  <fieldset>
                     <input type="radio" name="star" value="5" id="rate1">
                     <label for="rate1">★</label>
                     <input type="radio" name="star" value="4" id="rate2">
                     <label for="rate2">★</label> 
                     <input type="radio" name="star" value="3" id="rate3">
                     <label for="rate3">★</label>
                     <input type="radio" name="star" value="2" id="rate4">
                     <label for="rate4">★</label>
                     <input type="radio" name="star" value="1" id="rate5">
                     <label for="rate5">★</label>
                  </fieldset>
               </b>
               </td>
            </tr>
            <tr class="rv_col3">
               <td class="pd_col00">사진 1</td>
               <td class="pd_col0"><input type="file" name="rev_img" class="fileup" id="imgup1">
               </td>
               <td class="pd_col00">사진 2</td>
               <td class="pd_col0"><input type="file" name="rev_img" class="fileup" id="imgup2">
               </td>
               <td class="pd_col00">사진 3</td>
               <td class="pd_col0"><input type="file" name="rev_img" class="fileup" id="imgup3">
               </td>
            </tr>
            <tr class="pd_row">
               <td style="width:33%; border:none; height:150px; padding:3px;">
               <div id="imgchk1"></div>
               </td>
               <td style="width:33%; border:none; height:150px; padding:3px;">
               <div id="imgchk2"></div>
               </td>
               <td style="width:34%; border:none; height:150px; padding:3px;">
               <div id="imgchk3"></div>
               </td>
            </tr>
         </table>
         <div class="rvdetail_btn">
            <input type="submit" class="rv_insert_btn" value="작성완료" onclick="reviewinsertconfirm();">
            <input type="hidden" name="res_num" value="${res.res_num}">
            <input type="hidden" name="mem_num" value="${sid.mem_num}">
         </div>
         
      </form>
   </div>
   
   <script type="text/javascript">
   
   // 사진 리뷰를 위한 ajax
    $('#imgup1, #imgup2, #imgup3').on('change',
         function() {
            const uploadedFile = this.files[0];
            const imgname = uploadedFile.name;
            console.log("File uploaded:", imgname);
              const imageUrl = "http://localhost:8080/imgpath/" + imgname;

            const formData = new FormData(); // Create a FormData object
               if (this.id === 'imgup1') {
                  formData.append('file', uploadedFile);
               } else if (this.id === 'imgup2') {
                  formData.append('file', uploadedFile);
               } else if (this.id === 'imgup3') {
                  formData.append('file', uploadedFile);
               }            

            $.ajax({
                  url : "revImgInsert.do",
                  type : "POST",
                  data : formData, // Send the FormData instead of the file directly
                  contentType : 'application/json; chareset=utf-8',
                  dataType : 'json',
                  contentType : false,
                  processData : false,
                  success : function(result) {
                     if (result === 1) {
                        if (uploadedFile === $('#imgup1')[0].files[0]) {
                              $('#imgchk1').html('<img src="' + imageUrl + '" style="width:100%; height:144px;">');
                        } else if (uploadedFile === $('#imgup2')[0].files[0]) {
                              $('#imgchk2').html('<img src="' + imageUrl + '" style="width:100%; height:144px;">');
                        } else if (uploadedFile === $('#imgup3')[0].files[0]) {
                              $('#imgchk3').html('<img src="' + imageUrl + '" style="width:100%; height:144px;">');
                        }
                     }
                  },
                  error : function(request, error) {
                     console.log("code : " + request.status + "\n" 
                              + "message : " + request.responseText + "\n" 
                              + "error : " + error);
                  }
            });
      });
   
     /*    function reviewinsertconfirm() {
            var result = confirm("리뷰를 등록하시겠습니까?");
            if (result == true) {
                document.getElementById("reviewinsertsubmit").submit();
                // 확인
            } else {
                event.preventDefault(); // Prevent the default form submission
               return;
               // 취소
            }
        } */
        
        
    </script>

</body>
</html>