<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
div .bd_insert {
	position: absolute;
	left: 73%;
	top: 226px;
}

#bd_modal {
	display: none;
	z-index: 1;
	background-color: rgba(0, 0, 0, .3);
	position: fixed;
	left: 0;
	top: 154px;
	width: 100%;
	height: 100%;
}

#bd_modal>#content {
	width: 550px;
	margin: 100px auto;
	padding: 20px;
	position: relative;
	background-color: #fff;
}

#bd_modal .close {
	position: absolute;
	top: 4px;
	right: 4px;
	font-size: 20px;
	border: 0;
	background-color: #fff;
}

#bd_modal .close:hover, #qs_modal .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#ans_modal{
	display: none;
	z-index: 1;
	background-color: rgba(0, 0, 0, .3);
	position: fixed;
	left: 0;
	top: 154px;
	width: 100%;
	height: 100%;	
}
#ans_modal>#content{
	width: 550px;
	margin: 100px auto;
	padding: 20px;
	position: relative;
	background-color: #fff;
}

#ans_modal .close{
	position:absolute;
	top:4px;
	right:4px;	
	font-size:20px;
	border:0;
	background-color: #fff;
}

#ans_modal .close:hover,
#ans_modal .close:focus {
  color : #000;
  text-decoration: none;
  cursor :pointer;
}

</style>
<body>
	<%@include file="header.jsp"%>

	<div class=my_wrapper>

		<div class="page-title">
			<div class="container">
				<h2 class=notice_board>게시판</h2>
			</div>
		</div>


		<div class=board_changes>
	<a href="notice.do"><button class = board_change>
		공지사항		
	</button></a>
	

	<a id="Question1" href="question.do"><button class = board_change>
		회원게시판			
	</button></a>
</div>


		<!-- board seach area -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="questionfilter.page">
						<div class="search-wrap">
							<label for="search" class="blind">게시판 내용 검색</label> <input
								id="search" type="search" name="question_search"
								placeholder="검색어를 입력해주세요." value="" style="width: 80%;">
							<button type="submit" class="b_btn btn-dark" style="margin: 0;">검색</button>
							<input type="hidden" name="question_filter" value="TITLE_COMMENT">
							<input type="hidden" name="id" value="${sid}">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- board list area -->
		<table class="board_list_bd">
			<thead>
				<tr>
					<th class="bd_col11">번호</th>
					<th class="bd_col22">내용</th>
					<th class="bd_col33">닉네임</th>
					<th class="bd_col44">날짜</th>
					<th class="bd_col55">답변</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach var="i" items="${bdlist}">
					<tr>
						<c:if test="${i.b_content eq '삭제된 글 입니다' }">
						<td class="bd_col11"></td>
						</c:if>
					
						<c:if test="${i.b_content ne '삭제된 글 입니다' }">
						<td class="bd_col11">${i.b_num}</td>
						</c:if>
						
						<c:if test="${i.lvl <= 1}">
							<td class="bd_col22" onclick="toggleAnswer('${i.b_num}')">${i.b_content}</td>
						</c:if>

						<c:if test="${i.lvl >1}">
							<td class="bd_col22"><span
								style="color: red; font-style: italic; padding-left: ${(i.lvl-2) * 20}px;">ㄴRe&nbsp;</span>${i.b_content}</td>
						</c:if>
						
						<c:if test="${i.b_content eq '삭제된 글 입니다'}">
						<td class="bd_col33"></td>
						<td class="bd_col44"></td>
						</c:if>	
						
						<c:if test="${i.b_content ne '삭제된 글 입니다' }">
						<td class="bd_col33">${i.nickname}</td>
						<td class="bd_col44">${i.b_date}</td>
						</c:if>						
						
						<c:if test="${i.b_content ne '삭제된 글 입니다' }">
							<c:if test="${i.nickname eq sid.nickname}">
							<td class="bd_col55">
							    <input type="button" value="삭제하기" id="searchone2"  onclick="location.href='boardDelete.do?b_num=${i.b_num}&groupnum=${i.groupnum}'">
							</td>
							</c:if>
						</c:if>

						<c:if test="${i.b_content eq '삭제된 글 입니다' }">
						<td class="bd_col55"></td>
						</c:if>

						<c:if test="${i.b_content ne '삭제된 글 입니다' }">
							<c:if test="${i.nickname ne sid.nickname}">
								<td class="bd_col55">
								    <input type="button" value="답변하기" id="searchone2" class="ansOpen"
								        data-bnum="${i.b_num}"
								        data-groupord="${i.groupord}"
								        data-groupnum="${i.groupnum}"
								        data-lvl="${i.lvl}"
								        data-memnum="${sessionScope.sid.mem_num}">
								</td>
							</c:if>
						</c:if>
						
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="bd_insert">

			<input type='button' value='작성하기' id='bdOpen' style="margin: 0;font-size: 14px;
    font-weight: bold; border: none; border-radius: 3px; color: #fff; background-color: #ff7da1; cursor: pointer;">

		</div>

		<div id='bd_modal'>
			<div id='content'>
				<input type='button' value='X' class="close" id='btnClose' />
				 <label>내용을 입력하세요</label><br /> 
				 <input type='text' id="b_content" name="b_content"	size=60 /> 
				 <input type="hidden" id="mem_num" name="mem_num" value="${sessionScope.sid.mem_num}" /> 
				 <input type='button' value='입력하기' id='insertbd' />
			</div>
		</div>
		
		
		<div id='ans_modal'>
		    <div id='content'>
		        <input type='button' value='X' class="close" id='btnCloseAns'/>
		        <label>답변을 입력하세요</label><br/>
		        <input type='text' id='ans_content' name="b_content" size="60" />
		        <input type="hidden" id="b_num" name="b_num" value="">
		        <input type="hidden" id="groupord" name="groupord" value="">
		        <input type="hidden" id="groupnum" name="groupnum" value="">
		        <input type="hidden" id="lvl" name="lvl" value="">
		        <input type="hidden" id="mem_num" name="mem_num" value="">
		        <input type='button' value='입력하기' id='insertans' />
		    </div>
		</div>
		

		


		<!-- 모달띄워서 입력받기 -->
		<script>
				
			    var bdOpen  = document.getElementById('bdOpen');
			    var insertbd = document.getElementById('insertbd');
			    var btnClose = document.getElementById('btnClose');
			    var bd_modal = document.getElementById('bd_modal');
			    var bContentInput = document.getElementById('b_content');
			
			    // 모달 창을 감추는 함수
			    var closeRtn = function() {
			    	bd_modal.style.display = 'none';
			  
			    }
			
			    // 모달 창을 보여주는 함수
			    bdOpen.onclick = function() {
			    	bd_modal.style.display = 'block';
			     
			    }
			
			    insertbd.onclick = function() {
			        var bContentValue = bContentInput.value;
			        var memNumValue = document.getElementById('mem_num').value;
			        closeRtn();
			        // 입력한 값과 세션 값을 questionInsert.do로 전송
			        var form = document.createElement('form');
			        form.method = 'POST';
			        form.action = 'boardInsert.do';
			        var inputContent = document.createElement('input');
			        inputContent.type = 'hidden';
			        inputContent.name = 'b_content';
			        inputContent.value = bContentValue;
			        form.appendChild(inputContent);
			        var inputMemNum = document.createElement('input');
			        inputMemNum.type = 'hidden';
			        inputMemNum.name = 'mem_num';
			        inputMemNum.value = memNumValue;
			        form.appendChild(inputMemNum);
			        document.body.appendChild(form);
			        form.submit();
			    }
			
			    btnClose.onclick = closeRtn;
			</script>
			
			
			
			
			<script>
    var ansOpenButtons = document.getElementsByClassName('ansOpen');
    var insertans = document.getElementById('insertans');
    var btnCloseAns = document.getElementById('btnCloseAns');
    var ans_modal = document.getElementById('ans_modal');
    var ansContentInput = document.getElementById('ans_content');
    var bNumInput = document.getElementById('b_num');
    var groupordInput = document.getElementById('groupord');
    var groupnumInput = document.getElementById('groupnum');
    var lvlInput = document.getElementById('lvl');

    // 모달 창을 감추는 함수
    var closeAnsModal = function() {
        ans_modal.style.display = 'none';
    }

    // 모달 창을 보여주는 함수
    for (var i = 0; i < ansOpenButtons.length; i++) {
        ansOpenButtons[i].onclick = function() {
            ans_modal.style.display = 'block';
            // data- 속성을 통해 값을 가져올 때 getAttribute() 메서드를 사용해야 합니다.
            var bNumValue = this.getAttribute('data-bnum');
            var groupordValue = parseInt(this.getAttribute('data-groupord')) + 1; // 1씩 더한 값
            var groupnumValue = this.getAttribute('data-groupnum');
            var lvlValue = parseInt(this.getAttribute('data-lvl')) + 1; // 1씩 더한 값

            // 가져온 값들을 각각의 input 엘리먼트에 적용합니다.
            bNumInput.value = bNumValue;
            groupordInput.value = groupordValue;
            groupnumInput.value = groupnumValue;
            lvlInput.value = lvlValue;
            // memNumValue는 이미 세션에서 가져온 값이므로 별도의 처리가 필요하지 않습니다.
        }
    }

    insertans.onclick = function() {
        var ansContentValue = ansContentInput.value;
        var bNumValue = bNumInput.value;
        var groupordValue = groupordInput.value;
        var groupnumValue = groupnumInput.value;
        var lvlValue = lvlInput.value;
        var memNumValue = document.getElementById('mem_num').value;
        closeAnsModal();
        // 입력한 값과 세션 값을 answerInsert.do로 전송
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = 'answerInsert.do';
        var inputContent = document.createElement('input');
        inputContent.type = 'hidden';
        inputContent.name = 'b_content';
        inputContent.value = ansContentValue;
        form.appendChild(inputContent);
        form.appendChild(createHiddenInput('b_num', bNumValue));
        form.appendChild(createHiddenInput('groupord', groupordValue));
        form.appendChild(createHiddenInput('groupnum', groupnumValue));
        form.appendChild(createHiddenInput('lvl', lvlValue));

        var inputMemNum = document.createElement('input');
        inputMemNum.type = 'hidden';
        inputMemNum.name = 'mem_num';
        inputMemNum.value = memNumValue;
        form.appendChild(inputMemNum);

        document.body.appendChild(form);
        form.submit();
    }

    btnCloseAns.onclick = closeAnsModal;

    // hidden input을 생성하는 함수
    function createHiddenInput(name, value) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        input.value = isNaN(value) ? '' : value;
        return input;
    }
</script>
			
			


		<!-- 게시판 열고닫기  -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			  function toggleAnswer(b_num) {
			    var currentUrl = window.location.href;
			    if (currentUrl.indexOf("answerOpen.do?b_num=" + b_num) !== -1) {
			      // If the current URL contains "answerOpen.do?b_num=", redirect to "getAllQuestion.do"
			      window.location.href = "getAllBoard.do";
			    } else {
			      // If the current URL doesn't contain "answerOpen.do?b_num=", redirect to "answerOpen.do?b_num"
			      window.location.href = "answerOpen.do?b_num=" + b_num;
			    }
			  }
		</script>


	</div>
</body>
</html>