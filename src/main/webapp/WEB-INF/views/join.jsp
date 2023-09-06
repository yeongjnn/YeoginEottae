<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여긴어때-회원가입</title>

<%@include file="header.jsp"%>

<!-- 모달 모음 -->
<%@include file="modal.jsp"%>


<div class=my_wrapper>

	<h2 class=company_name>회원가입</h2>

		
	<form class="join" action="memberInsert.do" method="post" name="joinForm">


		<p id="p1"></p>
			<input type="text" placeholder="이메일" class="in email1" id="email1"
				name="email1" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">


		
			<select id="email2" name="email2" title="이메일 주소 선택" class="ui_select in email2">
				<option value="">주소 선택</option>
				<option value="naver.com">@naver.com</option>
				<option value="nate.com">@nate.com</option>
				<option value="gmail.com">@gmail.com</option>
				<option value="yahoo.com">@yahoo.com</option>
				<option value="hanmail.net">@hanmail.net</option>
			</select>
	
	<!-- onclick="mailSending()" -->
			<input id="emailAuth"
			type="button" value="본인인증" class="in_btn half mail_btn mini_bk_btn" style="float:right;">
		
		
		<p id="emailAuthWarn"></p>
		<input  id="authCode" type="text" class="in" placeholder="인증번호 입력">
		<!-- <input type="button" value="인증확인" class="in_btn half mail_btn mini_bk_btn" style="float:right;"> -->

		<input type="text" placeholder="비밀번호" id="pw" class="in pw" name="pw">
		<br>
		<p id="p2"></p>
		<input type="password" placeholder="비밀번호 확인" id="pw2" class="in re_pw" name="pw2">
		<br>
		<p id="p4"></p>
		<input type="text" placeholder="닉네임" id ="nickname" class="in name" name="nickname">
		<br>
		
		<p id="p3"></p>
		<input type="text" placeholder="연락처" class="in phone" id="tel" name="tel" maxlength=13>
		<br>

		<div class=modal_join_btn>
			<button value="가입하기" id="registerBtn" class="in_btn half m_join_btn mini_bk_btn">가입하기</button>
			<button type="button" value="취소" class="in_btn half m_join_cancel mini_bk_btn">취소</button>
		</div>
		
		<% String afterjs="Hello~!"; %>
		
	</form>

</div>


<script>
	$('#email1, #email2').on('change', // 1 또는 2가 바뀔때마다
			function() {
				if ($('#email1').val() == "" || $('#email2').val() == "") {
					$("#p1").text(""); // 둘중에 하나라도 비어있으면(아직 입력 안했으면) 문구 띄우지 않게
					$("#p1").attr("disabled", false);
					return;
				} else {
					var id = $('#email1').val() + "@" + $('#email2').val(); // email 입력값+선택값
					console.log(id);

					$.ajax({
						url : "idCheck.do",
						type : "POST",
						data : id,
						contentType : 'application/json; charset=utf-8',
						dataType : 'json', // 컨트롤러에서 Map 으로 반환받기 때문에
						success : function(data) {
							//console.log(data);
							//console.log("result.check : " + data.check);
							if (data.check > 0) {
								$("#p1").text("이미 사용중인 계정입니다");
								$("#p1").attr('class', 'red');
								//$("#joinsub").attr("disabled", true);
							} else if (data.check == 0) {
								$("#p1").text("사용 가능한 계정입니다");
								$("#p1").attr('class', 'green');
								//$("#joinsub").removeAttr("disabled");
							}
						},
						error : function(request, error) {
							console.log("code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "\n" + "errer : " + error);
						}
					});
				}
			});


	$('#nickname').focusout(
			function() {
				var nickname = $('#nickname').val();
				console.log(nickname);

				$.ajax({
					url : "nicknameCheck.do",
					type : "POST",
					data : nickname,
					contentType : 'application/json; charset=utf-8',
					dataType : 'json',
					success : function(data) {
						//console.log(data);
						//console.log("result.check : " + data.check);
						if (data.check > 0) {
							$("#p4").text("이미 사용중인 닉네임입니다");
							$("#p4").attr('class', 'red');
							//$("#joinsub").attr("disabled", true);
						} else if (data.check == 0) {
							$("#p4").text("사용 가능한 닉네임입니다");
							$("#p4").attr('class', 'green');
							//$("#joinsub").removeAttr("disabled");
						}
					},
					error : function(request, error) {
						console.log("code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "errer : " + error);
					}
				});
			});


	$('#tel').focusout(
			function() {
				var tel = $('#tel').val(); // input phone 에 입력되는 값
				console.log(tel);

				$.ajax({
					url : "telCheck.do",
					type : "POST",
					data : tel,
					contentType : 'application/json; charset=utf-8',
					dataType : 'json',
					success : function(data) {
						//console.log(data);
						//console.log("result.check : " + data.check);
						if (data.check > 0) {
							$("#p3").text("이미 사용중인 연락처입니다");
							$("#p3").attr('class', 'red');
							//$("#joinsub").attr("disabled", true);
						} else if (data.check == 0) {
							$("#p3").text("사용 가능한 연락처입니다");
							$("#p3").attr('class', 'green');
							//$("#joinsub").removeAttr("disabled");
						}
					},
					error : function(request, error) {
						console.log("code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "errer : " + error);
					}
				});
			});



	$('#pw, #pw2').on('change', // 1 또는 2가 바뀔때마다
	function() {
		var pw = $('#pw').val();
		var pw2 = $('#pw2').val();
		console.log(pw);
		console.log(pw2);
		
		if (pw == pw2) {
			$("#p2").text("비밀번호가 일치합니다");
			$("#p2").attr('class', 'green');
			//$("#joinsub").attr("disabled", true);
		} else {
			$("#p2").text("비밀번호가 일치하지 않습니다");
			$("#p2").attr('class', 'red');
			//$("#joinsub").removeAttr("disabled");
		}
	});

	$( "#emailAuth" ).on( "click", function() {
		  /* alert( "Handler for `click` called." ); */
		
	
		
		var em1 = $("#email1").val();
		var em2 = $("#email2").val();
		var tomail = em1 + "@" + em2;
		
		
		/* alert(em1+"\n"+"@"+em2+"\n"+tomail);  */// => 이메일 잘 들어오는거 확인완료
		/* alert("인증 코드가 입력하신 이메일로 전송 되었습니다."); */
		 $.ajax({
	        	type : "post",
	        	url : 'mailSending.do',
	        	data : {
	        		tomail : tomail
	        	},
	        	dataType : 'json',
	        	success : function(result) {
	        		console.log("result :::: " + result);
	        		$("#authCode").attr("disabled", false);
	        		
	        		code = result; // 여기에 인증코드 값이 제대로 안 들어옴 ㅜ
	        						// 임의로 값을 입력해주면 일치되었다고 나옴
	        		console.log("code :::: " + code);
	        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
	       		},
	    		error : function(request, error){
	    			console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "errer : " + error);
	    		} 
	        }); //End Ajax
	        
	} );

	/* $("#p3").text("이미 사용중인 연락처입니다");
	$("#p3").attr('class', 'red'); */
		    $("#authCode").on("focusout", function() {
		    	var inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
		    	
		    	console.log("입력코드 : " + inputCode);
		    	console.log("인증코드 : " + code);
		    		
		    	if(Number(inputCode) == code){
		        	$("#emailAuthWarn").text('인증번호가 일치합니다.');
		        	/* $("#emailAuthWarn").css('color', 'green'); */
		    		$('#emailAuthWarn').attr("class", "green");
		    		$('#email1').attr('readonly', true);
		    		$('#email2').attr('readonly', true);
		    		$("#registerBtn").attr("disabled", false);
		    	}else{
		        	$("#emailAuthWarn").text('인증번호가 불일치 합니다.');
		        	/* $("#emailAuthWarn").css('color', 'red'); */
		        	$("#emailAuthWarn").attr("class", "red");
		    	}
		    });
			
	
	
	
	// 이메일 주소 정보를 해당 필드에 넣는다.
    //document.getElementById("sample5_address").value = addr;
	
	
	
	
	
	
	
	
	
	
</script>

<%@include file="footer.jsp"%>