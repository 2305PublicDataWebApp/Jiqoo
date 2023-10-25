# Jiqoo

![jiqooLogo](https://github.com/2305PublicDataWebApp/Jiqoo/assets/134674198/4c393233-d519-478c-ab2e-15bec1fc4131)
# 지꾸
No.1 지도 다이어리
<br>
<br>
<br>
## 🌏 프로젝트 목적

### 다꾸? 이젠 지꾸!

지꾸란 지도꾸미기의 약자로 지도 위 모든 공간에 나의 기록물을 저장할 수 있는 신개념 다이어리 서비스입니다😃
<br>
<br>
<br>
## 📆 개발 기간

2023.09.26 - 2023.10.26
<br>
<br>
<br>
## 💻 개발 환경
<img src="https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=flat&logo=Apache%20Tomcat&logoColor=white"> <img src="https://img.shields.io/badge/Apache%20Maven-C71A36?style=flat&logo=Apache%20Maven&logoColor=white"> 
<img src="https://img.shields.io/badge/Mybatis-000000?style=flat&logo=Mybatis&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white">
<br>
<img src="https://img.shields.io/badge/spring-6DB33F?style=flat&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white">
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-4682B4?style=flat&logo=JAVA&logoColor=white">
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Ajax-D3D3D3?style=flat&logo=Ajax&logoColor=white">
<img src="https://img.shields.io/badge/JSON-000000?style=flat&logo=JSON&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white">
<br><br><br>

## 🌏 팀 소개 및 팀원 소개
### 꽃보다 파이널 
![지꾸_기획발표-003](https://github.com/2305PublicDataWebApp/Jiqoo/assets/134674198/31117ebe-83b2-486d-bb32-11b8d34e063d)

<br><br><br>

## 📓 주요 기능
### 회원관리
기능명 | 상세
-------|-----
회원가입 | 아이디, 비밀번호, 이름, 닉네임, 이메일, 성별, 전화번호, SMS/메일 수신 여부를 입력하면 가입이 가능하다. 필수 정보는 반드시 입력해야 하며 닉네임은 중복 확인을 통해 고유한 정보임을 확인해야 한다. 이메일은 이메일 인증을 통해 사용자가 실제 사용하는 계정임을 인증해야 한다. 아이디, 닉네임, 이메일은 회원 간 중복될 수 없다. 선택입력사항으로 성별, 생년월일, 전화번호, 프로필사진, 자기소개를 등록할 수 있다.
로그인 | 회원가입 시 입력한 정보와 아이디, 비밀번호가 일치하면 로그인이 가능하다. 로그인 창에서 회원가입, 아이디 찾기, 비밀번호 찾기 페이지로 이동할 수 있다. 아이디 찾기에서는 이름과 이메일을 입력하면 일부가 가려진 아이디 정보를 확인할 수 있고 비밀번호 찾기 페이지에서는 아이디와 이메일을 입력하면 입력한 이메일에 임시 비밀번호가 전송된다.
소셜 로그인 | 회원은 자신의 카카오 계정과 네이버 계정을 이용하여 회원가입을 할 수 있다. 회원은 자신의 활동 내역(좋아요, 댓글, 채팅) 목록을 조회, 상세글 열람, 내역삭제를 할 수 있다.
마이페이지 | 회원은 캘린더 형식을 통해 자신의 작성글을 조회할 수 있고 모임조회메뉴를 통해 주최 및 참가했던 모임 내역을 조회할 수 있다.
프로필페이지 | 회원은 다른 회원의 프로필페이지에 접근하여 팔로우/언팔로우할 수 있다. 프로필페이지에는 회원의 프로필사진, 닉네임, 등록한 게시물수가 표시된다. 회원은 자신의 팔로잉, 팔로워 목록을 확인할 수 있고 해당 사용자를 클릭하여 프로필을 조회할 수 있다.
### 지꾸
기능명 | 상세
-------|-----
지꾸 등록 | 로그인 한 회원은 지도 상의 특정 위치를 클릭하여 게시물을 작성할 수 있다. 게시물 작성 시에는 제목, 내용, 사진, 날짜, 시간, 공개여부를 입력한 다음 등록버튼을 통해 게시물을 등록할 수 있다.
지도로 조회 | 자신 또는 다른 회원이 작성한 게시물 위치를 지도 상에서 마커 또는 아이콘으로 확인할 수 있다. 클릭시 상세 조회 페이지로 이동한다.
리스트로 조회 | 등록된 지꾸 목록을 최신순으로 조회할 수 있다. 클릭시 게시물 상세페이지로 이동한다.
지꾸 상세 조회 | 공개로 등록된 지꾸의 상세내역을 확인할 수 있다. 로그인시 좋아요 및 댓글 등록이 가능하다. 
신고 기능 | 회원은 부적절한 게시물과 댓글을 관리자에게 신고할 수 있다.
### 모꾸
기능명 | 상세
-------|-----
모꾸 등록 | 회원은 지도 상의 특정 위치를 클릭하여 모임을 등록할 수 있다. 모임 작성시 카테고리, 제목, 내용, 날짜, 주소, 도로명주소, 참여인원을 입력한 다음 등록버튼 클릭 시 모임을 등록할 수 있다. 이미지 카테고리 마커를 클릭하면 지도상에서 해당 이미지 마커로 표시된다. 모꾸 등록시 자동으로 모꾸채팅방이 생성된다.
모꾸 목록 지도로 조회 | 회원은 등록된 모꾸의 위치를 지도상에서 이미지 마커로 확인할 수 있다. 마커를 클릭하면 해당 위치의 모임에 대한 정보를 일부 조회할 수 있고, 상세보기 버튼을 누르면 상세 페이지로 이동할 수 있다.
모꾸 목록 리스트로 조회 | 등록된 모꾸 목록을 최신순으로 조회할 수 있다. 클릭시 게시물 상세페이지로 이동한다.
모꾸 상세 조회 | 회원은 모꾸(모임게시판)에서 게시물을 클릭하여 해당 게시물에 대한 상세정보를 조회할 수 있다.
모꾸 참여하기 | 회원은 모꾸(모임게시판)에서 게시물을 클릭하여 해당 게시물에 참여 신청을 할 수 있다. 해당 신청내역은 주최자가 확인하여 승인/거절 여부를 결정한다. 승인시 해당 회원은 자동으로 모꾸 채팅방에 초대된다.
### 채팅
기능명 | 상세
-------|-----
채팅방 생성 | 회원은 채팅방 생성 버튼을 클릭하여 1:1 채팅 및 그룹 채팅을 생성할 수 있다.
채팅 목록 조회 | 채팅 페이지 접속시 참여하는 채팅목록이 표시되며 각 목록은 해당 채팅방의 마지막 메시지와 회원이 읽지 않은 메시지 갯수를 나타낸다. 클릭시 해당 채팅방에 접속할 수 있다.
채팅 상세 조회 | 회원이 채팅방 접속시 이전 메시지가 로드되며 새로 메시지를 전송할 수 있고, 수신된 메시지가 실시간으로 채팅창에 표시된다.
이미지 전송 | 회원은 채팅방에서 이미지를 전송하거나 수신할 수 있고, 다운로드 버튼을 클릭하면 이미지를 다운받을 수 있다. 
신고 기능 | 회원은 참여하는 채팅방이 부적절한 내용을 주고 받고 있을 경우 관리자에게 신고할 수 있다. 
### 알림
기능명 | 상세
-------|-----
실시간 알림 | 회원은 자신이 작성한 게시글에 댓글, 좋아요 등이 달렸을 경우, 다른 회원이 나를 팔로우 하는 경우, 채팅메시지가 온 경우 실시간 알림을 받을 수 있다. 
### 관리자 페이지
기능명 | 상세
-------|-----
회원 관리 | 관리자는 모든 회원의 정보를 관리자 페이지에서 조회하고 관리할 수 있다. 
지꾸 관리 | 관리자는 모든 지꾸글을 관리자 페이지에서 조회하고 관리할 수 있다. 
모꾸 관리 | 관리자는 모든 모꾸글을 관리자 페이지에서 조회하고 관리할 수 있다. 
채팅 관리 | 관리자는 모든 채팅방을 관리자 페이지에서 조회하고 관리할 수 있다. 
신고 관리 | 관리자는 신고 내역을 관리하고 각 10회 이상 신고가 누적된 대상을 삭제할 수 있다.
