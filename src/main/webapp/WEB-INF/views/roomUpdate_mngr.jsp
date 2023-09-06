<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여긴어때-파티룸 수정</title>
</head>
<style>
.room_file {
   position: absolute;
   top: 66%;
   width: 100%;
   text-align: center;
}
</style>
<body>

	<%@include file="header_mngr.jsp"%>

	<div class=my_wrapper>

		<span class="s_title">파티룸 수정</span>

		<form method="post" action="roomUpdate_mngr.do" enctype="multipart/form-data">
			<table class="cl_info">
				<tr class="pd_row">
				    <td class="pd_col">유형</td>
				    <td class="input_pdinfo">
				        <select name="purpose" class="country-select">
				            <option value="유형 선택" ${roomVO.purpose == '유형 선택' ? 'selected' : ''}>유형 선택</option>
				            <option value="기본" ${roomVO.purpose == '기본' ? 'selected' : ''}>기본</option>
				            <option value="주방 포함" ${roomVO.purpose == '주방 포함' ? 'selected' : ''}>주방 포함</option>
				            <option value="키즈 전용" ${roomVO.purpose == '키즈 전용' ? 'selected' : ''}>키즈 전용</option>
				        </select>
				    </td>
					<td class="pd_col">방 이름</td>
					<td class="input_pdinfo"><input type="text" name="room_name" value="${roomVO.room_name}" class="pdinfo_text"></td>
				</tr>
				<tr class="pd_row">
				    <td class="pd_col">침대</td>
				    <td class="input_pdinfo">
				        <select name="bed" class="country-select">
				            <option value="종류 선택" ${roomVO.bed == '종류 선택' ? 'selected' : ''}>종류 선택</option>
				            <option value="없음" ${roomVO.bed == '없음' ? 'selected' : ''}>없음</option>
				            <option value="싱글" ${roomVO.bed == '싱글' ? 'selected' : ''}>싱글</option>
				            <option value="더블" ${roomVO.bed == '더블' ? 'selected' : ''}>더블</option>
				            <option value="퀸" ${roomVO.bed == '퀸' ? 'selected' : ''}>퀸</option>
				        </select>
				    </td>
				    <td class="pd_col">노래시설</td>
				    <td class="input_pdinfo">
				        <select name="music" class="country-select">
				            <option value="유무 선택" ${roomVO.music == '유무 선택' ? 'selected' : ''}>유무 선택</option>
				            <option value="있음" ${roomVO.music == '있음' ? 'selected' : ''}>있음</option>
				            <option value="없음" ${roomVO.music == '없음' ? 'selected' : ''}>없음</option>
				        </select>
				    </td>
				</tr>
				<tr class="pd_row">
					<td class="pd_col">넓이</td>
					<td class="input_pdinfo"><input type="text" name="width" value="${roomVO.width}" class="pdinfo_text"> m²</td>
					<td class="pd_col">가격</td>
					<td class="input_pdinfo"><input type="text" name="price" value="${roomVO.price}" class="pdinfo_text"> 원</td>
				</tr>
				<tr class="pd_row">
					<td class="pd_col">상세설명</td>
					<td class="input_pdinfo" style="width: 87.5%;">
						<textarea name="explanation" class="pdinfo_text" style="width:100%; height:80px;">${roomVO.explanation}</textarea>
					</td>
				</tr>
				
				<tr class="pd_row">
					<td class="pd_col00">사진 1</td>
					<td class="pd_col0"><input type="file" name="room_img" class="fileup" id="imgup1">
					<input type="hidden" name="room_img_1" value="${roomVO.room_img_1}">
					</td>
					<td class="pd_col00">사진 2</td>
					<td class="pd_col0"><input type="file" name="room_img" class="fileup" id="imgup2">
					<input type="hidden" name="room_img_2" value="${roomVO.room_img_2}">
					</td>
					<td class="pd_col00">사진 3</td>
					<td class="pd_col0"><input type="file" name="room_img" class="fileup" id="imgup3">
					<input type="hidden" name="room_img_3" value="${roomVO.room_img_3}">
					</td>
				</tr>
				<tr class="pd_row">
					<td style="width:33%; border:none; height:150px; padding:3px;">
						<div id="imgchk1">
						<img src="http://localhost:8080/imgpath/${roomVO.room_img_1}" style="width:100%; height:144px;">
						</div>
					</td>
					<td style="width:33%; border:none; height:150px; padding:3px;">
						<div id="imgchk2">
						<img src="http://localhost:8080/imgpath/${roomVO.room_img_2}" style="width:100%; height:144px;">
						</div>
					</td>
					<td style="width:34%; border:none; height:150px; padding:3px;">
						<div id="imgchk3">
						<img src="http://localhost:8080/imgpath/${roomVO.room_img_3}" style="width:100%; height:144px;">
						</div>
					</td>
				</tr>
			</table>
			
			<div class="pd_up_btn_row">
			<input type="hidden" name="room_num" value="${roomVO.room_num}">
			<input type="submit" value="변경" class="cl_li_btn">
			<input type="button" value="삭제" onclick="location.href='deleteRoom.do?room_num?${roomVO.room_num}'" class="cl_li_btn">
			</div>
			
		</form>
		
	</div>

	<script>
	
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
						url : "roomImg_mngr.do",
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
	</script>
	
</body>
</html>

