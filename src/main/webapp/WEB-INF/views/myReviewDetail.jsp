<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
</head>

<body>
   <%@include file="header.jsp"%>


   <div class=my_wrapper>

      <div class="page-title">
         <div class="container">
            <h2 class=notice_board>상품후기 수정</h2>
         </div>
      </div>

      <form action="reviewUpdate.do" method="post" id="reviewupdatesubmit" enctype="multipart/form-data">
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
               <td  style="width:60vw;"><textarea name="rev_content" id="idtextarea" 
                     class="rv_tarea">${rev.rev_content}</textarea></td>
            </tr>
            <tr>
               <td class="pd_col0"><input type="file" name="rev_img" class="fileup" id="imgup1">
                  <input type="hidden" name="rev_img_1" value="${rev.rev_img_1}">
               </td>
               <td class="pd_col0"><input type="file" name="rev_img" class="fileup" id="imgup2">
                  <input type="hidden" name="rev_img_2" value="${rev.rev_img_2}">
               </td>
               <td class="pd_col0"><input type="file" name="rev_img" class="fileup" id="imgup3">
                  <input type="hidden" name="rev_img_3" value="${rev.rev_img_3}">
               </td>
            </tr>
            <tr class="pd_row">
               <td style="width:33%; border:none; height:150px; padding:3px;">
                  <div id="imgchk1">
                  <img src="http://localhost:8080/imgpath/${rev.rev_img_1}" style="width:100%; height:144px;">
                  </div>
               </td>
               <td style="width:33%; border:none; height:150px; padding:3px;">
                  <div id="imgchk2">
                  <img src="http://localhost:8080/imgpath/${rev.rev_img_2}" style="width:100%; height:144px;">
                  </div>
               </td>
               <td style="width:34%; border:none; height:150px; padding:3px;">
                  <div id="imgchk3">
                  <img src="http://localhost:8080/imgpath/${rev.rev_img_3}" style="width:100%; height:144px;">
                  </div>
               </td>
            </tr>
            <tr>
               <td class="rv_col3" colspan=4>별점
               <div id="myform">
                  <fieldset>
                     <input type="radio" name="star" value="5" id="rate1" ${rev.star eq '5' ? 'checked' : ''}>
                     <label for="rate1">★</label>
                     <input type="radio" name="star" value="4" id="rate2" ${rev.star eq '4' ? 'checked' : ''}>
                     <label for="rate2">★</label> 
                     <input type="radio" name="star" value="3" id="rate3" ${rev.star eq '3' ? 'checked' : ''}>
                     <label for="rate3">★</label>
                     <input type="radio" name="star" value="2" id="rate4" ${rev.star eq '2' ? 'checked' : ''}>
                     <label for="rate4">★</label>
                     <input type="radio" name="star" value="1" id="rate5" ${rev.star eq '1' ? 'checked' : ''}>
                     <label for="rate5">★</label>
                  </fieldset>
               </div>
               </td>
            </tr>
         </table>
         <div class="rvdetail_2btn">
         <input type="submit" class="rv_insert_btn" value="수정하기" onclick="reviewupdateconfirm();">
         <input type="button" class="rv_insert_btn" value="삭제하기" onclick="reviewDelete()" />
         <input type="hidden" name="rev_num" value="${rev.rev_num}">
         <input type="hidden" name="mem_num" value="${sid.mem_num}">
         </div>
         
      </form>
   </div>
   
   <script type="text/javascript">
   
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
                              $('#imgchk1').innerHTML = '';
                              $('#imgchk1').html('<img src="' + imageUrl + '" style="width:100%; height:144px;">');
                        } else if (uploadedFile === $('#imgup2')[0].files[0]) {
                              $('#imgchk2').innerHTML = '';
                              $('#imgchk2').html('<img src="' + imageUrl + '" style="width:100%; height:144px;">');
                        } else if (uploadedFile === $('#imgup3')[0].files[0]) {
                              $('#imgchk3').innerHTML = '';
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
   
        function reviewinsertconfirm() {
            var result = confirm("리뷰를 수정하시겠습니까?");
            if (result == true) {
                document.getElementById("reviewupdatesubmit").submit();
                // 확인
            } else {
                event.preventDefault(); // Prevent the default form submission
               return;
               // 취소
            }
        }
        
        function reviewDelete() {
            var result = confirm("리뷰를 삭제하시겠습니까?");
             if (result == true) {
                window.location.href = "reviewDelete.do?rev_num=${rev.rev_num}&mem_num=${sid.mem_num}";
                 
             } else {
                 event.preventDefault(); 
                return;
                // 취소
             }
         }
        
    </script>

</body>
</html>