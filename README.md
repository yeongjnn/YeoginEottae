# <div align="center">**여긴어때**</div>

## PartyRoom

# 📌 프로젝트 소개
+ **프로젝트 명** : 여긴어때 (파티룸 예약 사이트)

+ **개발취지**
현재 국내 숙박어플의 독점장사로 파티룸 예약 사이트의 다양성이 필요하다고 느꼈다.
기존 숙박어플과는 차별화된 서비스를 제공하여 신선함으로 마케팅을 하며 고객 유치를한다.

+ **프로젝트 목적**
요새 인기 부업주제인 파티룸 대여 서비스를 제공하는 전문 사이트를 제작한다.
회원들은 옵션(생일파티, 브라이덜 샤워)등을 선택함으로써 파티의 컨셉에 맞게 꾸며진 파티룸에서 프라이빗한 파티를 즐길 수 있다.


+ **차별점**
기존의 서비스들은 파티룸 컨셉에 맞게 꾸며달라고 추가 부탁을 할 수 없어 컨셉에 맞는 방을 직접 고르고 선택해야 하지만,
프로젝트로 개발된 사이트의 경우 옵션을 선택하여 파티룸 대여시 다양한 선택의 폭을 가질 수 있어 이용객들에게 편리함을 제공한다.


## 📌기간 : 2023.07.17 ~ 2023.08.01 , 2023.08.21 ~ 2023.08.30 
<img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/88a3818d-8234-4980-a721-c2cd2ca72b9f" width="800" height="300"/><br><br>
<img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/1e26e5fb-0c2f-4d9a-9276-917f3244774c" width="800" height="300"/><br>

# 📌 팀 소개
<img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/97ee233e-3c70-49d3-b54c-5e20aa89863c" width="800" height="300"/><br>

## 📌 백엔드 및 프론트엔드 

### 프론트
1. 메인페이지 제작
2. 회사소개/오시는길 제작
3. 회원가입,로그인 페이지 제작
4. 파티룸 전체보기 페이지 제작
5. 파티룸 종류별 페이지 제작
6. 예약페이지 제작
7. 마이페이지(내정보/예약목록/내가쓴리뷰/내가쓴문의사항)제작
8. 커뮤니티 페이지(공지사항/Q&A/회원게시판)제작
9. 관리자페이지(회원관리,파티룸관리,예약관리,커뮤니티관리,월 별 통계)제작
10. 찜목록페이지
</br>

### 백
1. DB설계
2. 파티룸 조회 구현
3. 페이지별 CRUD 구현
4. 파일 업로드 구현
5. 결제API 검증 및 환불 구현
6. 로그인세션/로그아웃 기능 구현
7. 비밀번호 5회 오류시 계정 비활성화 구현
8. 비동기 중복확인 및 회원가입 기능 구현
9. 비밀번호 암호화 구현
10. 비동기 찜하기 기능 구현
11. 네이버 메일 본인인증 구현
12. 네이버 메일 임시비밀번호 발급 구현
13. 조회수기능 구현
14. 대댓글 기능 구현
15. 페이징 기능 구현
</br>

## 📌 개발 환경

<img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=black"/>
<img src="https://img.shields.io/badge/ORACLE-F80000?style=flat-square&logo=oracle&logoColor=white"/>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=black">
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/>
<img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white"/>
<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>
<img src="https://img.shields.io/badge/RStudio-75AADB?style=flat-square&logo=rstudio&logoColor=white"/>

</br>

## 📌 프로젝트 상세
<ul>
    <li><h3>메인화면</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/2d9adb9f-3191-4b26-8dca-42256407d95d" width="800" height="450"/><br>
    • 메인화면<br>   
    • 회사소개<br>
    • 오시는길(카카오API를 이용한 지도 구현)<br>
    <br><br>
    <li><h3>회원가입</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/151686c5-0d98-4519-9ff2-712df46587d4" width="800" height="600" /><br>
    • 네이버 SMTP를 이용한 본인인증<br>
    • AJAX를 이용한 비동기 메일인증,중복체크<br>
    • Spring Security를 이용한 비밀번호 암호화<br>
    <br><br>
    <li><h3>로그인/로그아웃</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/a101abf0-f050-4a3e-9e13-0be741618770" width="800" height="600" /><br>
    • 로그인 세션 등록<br>
    • 관리자와 사용자 계정 분리<br>
    • 아이디 찾기 기능<br>
    • 네이버 SMTP를 이용한 임시비밀번호 발급<br>
    • 비밀번호 5회 오류시 계정 비활성화(메일인증으로 활성화) <br>
    <br><br>
    <li><h3>파티룸 조회</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/a1e354e3-0288-4303-aa60-4eac7f4c8b04" width="800" height="450"/><br>
    • 파티룸 전체 조회 가능<br>
    • 파티룸 종류 별 조회 가능<br>
    • 파티룹 침대,노래방 유무 검색 가능<br>
    • 페이징 기능
    <br><br>
    <li><h3>파티룸 상세 보기</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/d5578fd7-20e3-4c2e-8484-8c5a2eadf52f"/><br>
    • 파티룸 사진 및 정보 조회<br>
    • AJAX를 이용한 비동기 찜하기<br>
    • 해당 파티룸 포토리뷰 조회(사진 클릭 시 확대)<br>
    • 찜목록보기 클릭 시 팝업창 출력<br>
    <br><br>
    <li><h3>파티룸 예약</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/e717ea2b-34a7-4b0f-82e4-6dcc486dc5af" width="800" height="450"/><br>
    • 인원수,옵션,결제수단 선택<br>
    • 옵션에 따른 실시간 가격변경<br>
    • 날짜에 따라 예약가능시간 버튼 활성화<br>
    • 아임포트를 이용한 검증 및 결제<br>
    <br><br>
    <li><h3>예약목록</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/1eddd482-4d2a-411f-90f7-929074a3e77b" width="800" height="450"/><br>
    • 예약목록 조회<br>
    • 예약 상세보기<br>
    • 예약 취소 및 환불(이용일 하루 전까지만 가능)<br>
    • 이용일 다음날 부터 리뷰작성 버튼 활성화<br>
    • 이용당일,전날 또는 리뷰작성시 리뷰작성 버튼 비활성화<br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>공지사항</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/47a4210a-c269-4a77-911b-0bd3a86f4716" width="800" height="230"/><br>
    • 공지사항 리스트 조회 <br>
    • 공지사항 상세 조회 <br>
    • 조회수 기능<br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>문의사항</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/d99faa60-bf75-46d5-bb30-cf0a1eeb44b9" width="800" height="450"/><br>
    • 문의사항 작성/삭제 <br>
    • 문의사항 조회(답변 상태 조회) <br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>회원게시판</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/7b8657a6-cfd0-4d20-9b6f-d53bf632e74f" width="800" height="230"/><br>
    • 대댓글 기능 <br>
    • 본인 글 삭제버튼 출력, 다른회원 글 답변버튼 출력 <br>
    • 글 작성, 답변 시 모달 입력창 출력 <br>
    • 검색기능 <br>
    <br><br>
    <li><h3>포토리뷰</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/d3eeba12-fca5-413f-a2ba-26d5b22326e6" width="800" height="300"/><br>
    • 포토리뷰 조회/입력/변경/삭제 <br>
    • 파일 업로드 기능(실시간 출력)<br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>마이페이지</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/2a69b778-cc8e-48ba-9087-f4968383ecad" width="800" height="350"/><br>
    • 내정보 조회/수정 <br>
    • 회원탈퇴 <br>    
    <br><br>
    <li><h3>관리자-회원정보,파티룸정보</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/7f6619bf-438d-4f29-8420-83a4421fe7f4" width="800" height="450"/><br>
    • 회원정보 조회/수정/탈퇴 <br>
    • 파티룸정보 조회/추가/수정/삭제 <br>
    • 파일 업로드 기능(실시간 출력) <br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>관리자-공지사항</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/595bf422-5e43-4825-9c71-2029573b12e7" width="800" height="450"/><br>
    • 공지사항 조회/추가/수정/삭제 <br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>관리자-문의사항</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/f1f4a67d-9f1d-4000-bfb7-802aef64d7f3" width="800" height="450"/><br>
    • 문의사항 답변달기/삭제 <br>
    • 문의사항 조회(답변 상태 조회) <br>
    • 페이징,검색기능 <br>
    <br><br>
    <li><h3>관리자-월 별 예약통계</h3>
    <img src="https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/170ce41d-b909-4c6d-aae5-875d69e56539" width="800" height="350"/><br>
    • 룸 종류별 예약횟수 조회 <br>
    • 옵션 종류별 예약횟수 조회 <br>    
    <br><br>
        
</ul>

## 📌데이터베이스

<br/>


![ERD](https://github.com/ProjectGroup5/YeoginEottae/assets/131237772/9d605f1f-fcc7-41bc-9474-ad70c84a9a17)




<br/>

## 📌효과 및 전망

컨셉에 맞는 파티룸 대여를 원하는 소비자의 수요를 옵션 설정등으로 충족시킴,
장소대여 시장에 대한 경쟁력을 선점할 것으로 기대

## 📌향후 업데이트 사항

1. 소셜로그인 기능 추가 예정


   
