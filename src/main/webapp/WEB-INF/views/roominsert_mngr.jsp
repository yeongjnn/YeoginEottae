<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여긴어때-파티룸 추가</title>

<%@include file="header_mngr.jsp"%>
	
<!-- 모달 모음 -->
<%@include file="modal.jsp"%>

	<div class=my_wrapper>

		<span class="s_title">파티룸 추가</span>

		<form method="post" action="roomInsert_mngr.do" enctype="multipart/form-data" name="roomForm">
			<table class="cl_info">
				<tr class="pd_row">
					<td class="pd_col">유형</td>
					<td class="input_pdinfo">
						<select name="purpose" class="country-select">
							<option selected value="">유형 선택</option>
							<option>기본</option>
							<option>주방 포함</option>
							<option>키즈 전용</option>
						</select>
					<td class="pd_col">방호수</td>
					<td class="input_pdinfo"><input type="text" name="room_name" class="pdinfo_text" style="width:100%;"></td>
					</td>
				</tr>
				<tr class="pd_row">
					<td class="pd_col">침대</td>
					<td class="input_pdinfo"><select name="bed" class="country-select">
							<option selected value="">종류 선택</option>
							<option>없음</option>
							<option>싱글</option>
							<option>더블</option>
							<option>퀸</option>
					</select></td>
					<td class="pd_col">노래시설</td>
					<td class="input_pdinfo"><select name="music" class="country-select">
							<option selected value="">유무 선택</option>
							<option>없음</option>
							<option>있음</option>
					</select></td>
				</tr>
				<tr class="pd_row">
					<td class="pd_col">넓이</td>
					<td class="input_pdinfo"><input type="text" name="width" class="pdinfo_text"> m²</td>
					<td class="pd_col">가격</td>
					<td class="input_pdinfo"><input type="text" name="price" class="pdinfo_text"> 원</td>
				</tr>
				<tr class="pd_row">
					<td class="pd_col">상세설명</td>
					<td class="input_pdinfo" style="width: 87.5%;">
						<textarea name="explanation" class="pdinfo_text" style="width:100%; height:80px;"></textarea>
					</td>
				</tr>
				<tr class="pd_row">
					<td class="pd_col00">사진 1</td>
					<td class="pd_col0"><input type="file" name="room_img" class="fileup" id="imgup1">
					</td>
					<td class="pd_col00">사진 2</td>
					<td class="pd_col0"><input type="file" name="room_img" class="fileup pd_col0" id="imgup2">
					</td>
					<td class="pd_col00">사진 3</td>
					<td class="pd_col0"><input type="file" name="room_img" class="fileup" id="imgup3">
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
			<div class="pd_up_btn_row">
			<button value="추가" class="cl_li_btn roomIn_btn">추가</button>
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
	</script>