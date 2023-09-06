<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- modal 모음 -->
</head>
<body>

	<!-- ==========회원가입 유효성 검사========== -->
	<div class="modal1" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close1" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			계정을 입력해주세요.
		</div>
	</div>

	<div class="modal3" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close3" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			계정을 다시 확인해주세요.
		</div>
	</div>

	<div class="modal4" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close4" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			비밀번호를 입력해주세요.
		</div>
	</div>

	<div class="modal5" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close5" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			비밀번호를 확인해주세요.
		</div>
	</div>

	<div class="modal6" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close6" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			입력하신 비밀번호가 다릅니다.
		</div>
	</div>

	<div class="modal7" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close7" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			비밀번호는 8자리 이상이어야 하며, <br>대문자/소문자/숫자/특수문자 모두 포함해야 합니다.
		</div>
	</div>

	<div class="modal8" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close8" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			비밀번호에 공백 없이 입력해주세요.
		</div>
	</div>

	<div class="modal9" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close9" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			닉네임을 입력해주세요.
		</div>
	</div>

	<div class="modal14" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close14" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			연락처를 입력해주세요.
		</div>
	</div>

	<div class="modal17" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close17" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			연락처를 다시 입력해주세요.
		</div>
	</div>

	<div class="modal19" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close19" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			회원가입에 실패했습니다. 정보를 확인한 후 다시 한번 시도해 주세요.
		</div>
	</div>

	<div class="modal20" id="modal">
      <div class="modal_content" title="클릭하면 창이 닫힙니다.">
         회원가입이 성공적으로 완료되었습니다. 로그인 화면으로 이동하시겠습니까?
         <button type="button" id="login20" class="" title="로그인으로 이동" onclick="location.href='loginForm.do'">
            로그인
         </button>
         <button type="button" id="main20" class="" title="메인으로 이동" onclick="location.href='index.jsp'">
            메인으로
         </button>
      </div>
   </div>

   <div class="modal21" id="modal">
      <div class="modal_content" title="클릭하면 창이 닫힙니다.">
         회원가입을 취소하고 메인 화면으로 이동하시겠습니까?<br>
         <button type="button" id="main21" class="" title="메인으로 이동" onclick="location.href='index.jsp'">
            메인으로
         </button>
         <button type="reset" id="close21" class="close" title="클릭하면 창이 닫힙니다.">x</button>
      </div>
   </div>


	
	<div class="modal22" id="modal">
      <div class="modal_content" title="클릭하면 창이 닫힙니다.">
         본인인증을 해주세요.<br>
         <button type="reset" id="close22" class="close" title="클릭하면 창이 닫힙니다.">x</button>
      </div>
   </div>


	<!-- ==========회원가입 유효성 검사-끝========== -->


	<div class="modal15" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close15" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			로그인 성공
		</div>
	</div>

	<div class="modal16" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close16" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			로그인 실패
		</div>
	</div>


	<!-- ==========로그인-끝========== -->


	<div class="modal24" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close24" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			파티룸 유형을 선택해주세요
		</div>
	</div>

	<div class="modal25" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close25" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			파티룸 가격을 입력해주세요
		</div>
	</div>

	<div class="modal26" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close26" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			파티룸 넓이를 입력해주세요
		</div>
	</div>



   
	<div class="modal27" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close27" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			침대 종류를 선택해주세요
		</div>
	</div>

	<div class="modal28" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close28" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			노래시설 유무를 선택해주세요
		</div>
	</div>

	<div class="modal29" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close29" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			방호수를 입력해주세요
		</div>
	</div>

	<div class="modal30" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<button type="reset" id="close30" class="close" title="클릭하면 창이 닫힙니다.">x</button>
			사진을 모두 등록해주세요
		</div>
	</div>

	<div class="modal31" id="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			상세설명을 작성하지 않고 추가하시겠습니까?<br>
			<button type="button" id="main31" class="" title="파티룸 추가" onclick="location.href='roomPage_mngr.do'">
				계속
			</button>
			<button type="reset" id="close31" class="" title="클릭하면 창이 닫힙니다.">
				취소
			</button>
			<button type="reset" id="close31" class="close" title="클릭하면 창이 닫힙니다.">x</button>
		</div>
	</div>
	
	


	<!-- ==========파티룸추가-끝========== -->

</body>
</html>