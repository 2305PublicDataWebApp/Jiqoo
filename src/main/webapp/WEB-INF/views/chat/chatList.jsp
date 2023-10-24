<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>지꾸 : No.1 지도 다이어리</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../resources/assets/img/earth-globe.png" rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>

<!-- Template Main CSS File -->
<link href="../resources/assets/css/chatList.css" rel="stylesheet">
<link href="../resources/assets/css/header.css" rel="stylesheet">
<link href="../resources/assets/css/footer.css" rel="stylesheet">

<!-- socket.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- =======================================================
  * Template Name: Bootslander
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!-- ======= Hero Section ======= -->
	<section id="hero">

		<svg class="hero-waves" xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 "
			preserveAspectRatio="none">
      <defs>
        <path id="wave-path"
				d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
      </defs>
      <g class="wave1">
        <use xlink:href="#wave-path" x="50" y="3"
				fill="rgba(255,255,255, .1)">
      </g>
      <g class="wave2">
        <use xlink:href="#wave-path" x="50" y="0"
				fill="rgba(255,255,255, .2)">
      </g>
      <g class="wave3">
        <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
      </g>
    </svg>

	</section>
	<!-- End Hero -->

	<main id="main">
		<section>
			<div class="d-flex justify-content-center align-items-center"
				data-aos="fade-in">
				<h2>
					채팅 <i class="bi bi-chat-dots"></i>
				</h2>
			</div>
		</section>
		<section>
			<c:if test="${!empty chatRoomList }">
				<div class="container-fluid h-100" data-aos="fade-in"
					style="background-color: #FFF9C5; padding-top: 100px; padding-bottom: 100px; margin-bottom: 100px; position: relative;">
					<div class="row justify-content-center h-100">
						<div class="col-md-4 col-xl-3 chat">
							<div class="card mb-sm-3 mb-md-0 contacts_card"
								data-aos="fade-right">
								<div class="card-header">
									<div class="input-group">
										<input type="text" placeholder="채팅방을 추가하려면 클릭하세요." name=""
											class="form-control search" id="newChat">
										<div class="input-group-prepend">
											<a href="javascript:void(0)" data-bs-toggle="modal"
												data-bs-target="#addUserModal"> <span
												class="input-group-text search_btn"><i
													class="bi bi-plus-circle" id="newChatBtn"></i></span></a>
										</div>
									</div>
								</div>
								<div class="card-body contacts_body">
									<ul class="contacts">
										<c:forEach items="${chatRoomList }" var="chatRoom">
											<li class="a_active"
												id="chat-room-${chatRoom.chatRoom.chatNo }"><input
												type="hidden" class="chat-room-id"
												value="${chatRoom.chatRoom.chatNo }"> <input
												type="hidden" class="chat-room-name"
												value="${chatRoom.chatRoom.chatName }">
												<div class="d-flex bd-highlight">
													<div class="img_cont">
														<img
															src=<c:if test="${chatRoom.chatRoom.cImagePath eq null}">"../resources/assets/img/earth-globe.png"</c:if>
															<c:if test="${chatRoom.chatRoom.cImagePath ne null }">"${chatRoom.chatRoom.cImagePath }"</c:if>
															class="rounded-circle user_img" id="chat-list-img">
														<!-- 													<span class="online_icon"></span> -->
													</div>
													<div class="user_info">
														<div class="col d-flex justify-content-between">
															<span>${chatRoom.chatRoom.chatName }</span><br>
															<fmt:formatDate
																value="${chatRoom.chatRoom.chatMessage.msgSendDate}"
																pattern="yyyy-MM-dd" var="formattedDate" />
															<c:choose>
																<c:when test="${formattedDate == currentDate}">
																	<!-- 오늘인 경우 -->
																	<fmt:formatDate
																		value="${chatRoom.chatRoom.chatMessage.msgSendDate}"
																		pattern="a h:mm" var="formattedTime" />
																	<p class="user_info_time"
																		style="font-size: 16px; color: #5f5f5f;">${formattedTime}</p>
																</c:when>
																<c:otherwise>
																	<!-- 오늘이 아닌 경우 -->
																	<p class="user_info_time"
																		style="font-size: 16px; color: #5f5f5f;">${formattedDate}</p>
																</c:otherwise>
															</c:choose>


															<%-- <p class="user_info_time"
														style="font-size: 16px; color: #5f5f5f;">${chatRoom.chatRoom.chatMessage.msgSendDate }</p> --%>
														</div>
														<div class="col d-flex justify-content-between">
															<p>${chatRoom.chatRoom.chatMessage.msgContent }</p>
															<c:if
																test="${chatRoom.unreadMsgCount != 0 && chatRoom.chatRoom.chatMessage.msgSenderId != userId}">
																<p id="unreadCount-${chatRoom.chatRoom.chatNo }"
																	style="border-radius: 50px; color: white; background-color: #F24E1E; width: 25px; height: 25px; text-align: center;">
																	${chatRoom.unreadMsgCount }</p>
															</c:if>
														</div>
													</div>
												</div></li>
										</c:forEach>

									</ul>
								</div>
								<div class="card-footer"></div>
							</div>
						</div>
						<div class="col-md-8 col-xl-6 chat" id="chat_info_div"
							data-aos="fade-left">
							<div
								class='chat_none row d-flex justify-content-center align-items-center'>
								<div class='text-center'>
									<img src='../resources/assets/img/jiqooLogo.png'>
								</div>
								<div class='text-center'>
									<p>
										<span style='color: #388E3C'>${userNickname }</span>님 환영합니다!<br>목록을
										클릭하여 채팅을 시작해보세요.
									<p>
								</div>
							</div>
							<div class="card chat-info">
								<div class="card-header msg_head">
									<div class="d-flex bd-highlight">
										<div class="img_cont">
											<img src="../resources/assets/img/earth-globe.png"
												class="rounded-circle user_img" id="info-img">
											<!-- 											<span -->
											<!-- 											class="online_icon"></span> -->
										</div>
										<div class="user_info">
											<span id="chatName"></span>
											<p id="chat-users"></p>
										</div>

									</div>
									<span id="action_menu_btn"><i
										class="bi bi-three-dots-vertical"></i></span>
									<div class="action_menu">
										<ul>
											<li><a href="#" data-bs-toggle="modal"
												data-bs-target="#profileModal"> <i
													class="bi bi-person-vcard"></i>프로필 보기
											</a></li>
											<li><a href="#" data-bs-toggle="modal"
												data-bs-target="#inviteModal"> <i
													class="bi bi-person-add"></i> 초대하기
											</a></li>
											<li><a href="javascript:void(0)"
												onClick="chatRoomOut();"><i class="bi bi-x-circle"></i>
													채팅방 나가기</a></li>
											<li><a href="#" data-bs-toggle="modal"
												data-bs-target="#reportModal"><i
													class="bi bi-exclamation-triangle"></i> 신고하기</a></li>
										</ul>
									</div>
								</div>
								<div id="chat_body" class="card-body msg_card_body"></div>
								<div class="card-footer">
									<div class="input-group">
										<input type="file" id="fileInput" style="display: none;">
										<div class="input-group-append">
											<span class="input-group-text attach_btn" id="fileInputButton"><i
												class="bi bi-paperclip"></i></span>
										</div>

										<textarea name="" class="form-control type_msg"
											placeholder="메시지를 입력해주세요." id="textMessage"></textarea>
										<div class="input-group-append">
											<a href="javascript:void(0)" id="send_btn"> <span
												class="input-group-text send_btn"><i
													class="bi bi-send"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty chatRoomList }">
				<div class="container-fluid h-100" data-aos="fade-in"
					style="background-color: white; padding-top: 120px; padding-bottom: 120px; margin-bottom: 100px; position: relative;">
					<div class="row justify-content-center h-100">
						<div class="col-md-12 col-xl-12 chat" id="chat_start_div"
							data-aos="fade-in">
							<div
								class='chat_none row d-flex justify-content-center align-items-center'>
								<!-- 						<div class='text-center'> -->
								<!-- 							<img src='../resources/assets/img/jiqooLogo.png'> -->
								<!-- 						</div> -->
								<div class="text-center">
									<button class="btn add-btn" id="none-add-btn"
										data-bs-toggle="modal" data-bs-target="#addUserModal">
										<img alt="add-chat" src="../resources/assets/img/chat-add.png"
											style="width: 100px; height: 100px;">
									</button>
								</div>
								<div class='text-center' style="margin-top: 20px;">
									<p>
										<span style='color: #388E3C'>${userNickname }</span>님 환영합니다!<br>
										아직 개설된 채팅방이 없네요<img alt="없음"
											src="../resources/assets/img/thingking.png"
											style="width: 18px; height: 18px;"> <br> 버튼을 클릭하여
										채팅을 시작해보세요!
									<p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</section>
		<!-- 프로필 페이지 Modal -->
		<div class="modal fade" id="profileModal" tabindex="-1"
			aria-labelledby="profileModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h1 class="modal-title fs-5" id="addUserModalLabel">프로필</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body col">
						<div id="user-profile" class="row d-flex"></div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- 채팅방 개설 Modal -->
		<div class="modal fade" id="addUserModal" tabindex="-1"
			aria-labelledby="addUserModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="addUserModalLabel">채팅방 개설하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body col">
						<div>
							<input type="text" class="form-control" name="add-user-input"
								id="add-user-input" placeholder="아이디나 닉네임을 입력해주세요.">
						</div>
						<div id="add-user-result" class="row">
							<table id="add-user-result-table"
								style="text-align: center; margin-top: 10px;">
								<tbody></tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="addUsersButton" class="btn send-report">완료</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 사용자 추가 Modal -->
		<div class="modal fade" id="inviteModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">초대하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body col">
						<div>
							<input type="text" class="form-control" name="user-input"
								id="user-input" placeholder="아이디나 닉네임을 입력해주세요.">
						</div>
						<div id="result" class="row">
							<table id="resultTable"
								style="text-align: center; margin-top: 10px;">
								<tbody></tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="inviteUsersButton"
							class="btn send-report">완료</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 신고 Modal -->
		<div class="modal fade" id="reportModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<select name="report" id="reportSelect">
							<option value="none" disabled selected>신고 사유를 선택해주세요</option>
							<option value="abusive">욕설사용</option>
							<option value="advertising">광고글</option>
							<option value="noSubject">주제와 맞지 않는 글</option>
							<option value="violent">폭력적인 내용</option>
							<option value="Discrimination">차별적인 내용</option>
							<option value="pornography">음란물</option>
							<option value="Personal">민감한 개인정보 노출</option>
							<option value="etc">기타 (직접 작성)</option>
						</select>
						<textarea id="customReason" style="display: none"
							spellcheck="false"></textarea>
						<div>
							<small>게시물을 신고하신 이유를 제출해주시면 관리자 검토 후 조치하겠습니다.</small>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn send-report" id="report-send">보내기</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>

	</main>
	<!-- End #main -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="../resources/assets/vendor/aos/aos.js"></script>
	<script
		src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="../resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="../resources/assets/js/main.js"></script>
	<script>
		var chatNo;
		var userId = "${sessionScope.userId}"; // 사용자 ID
		var userPhotoPath = "${sessionScope.userPhotoPath}";
		var userNickname = "${sessionScope.userNickname}";
		var stompClient = null;
		var chatRoomId;
		// 변수를 사용하여 이전 메시지의 날짜를 추적
        var previousDate = null;
		$(document).ready(function() {
			var chatMessages = $('.chat-info');
			chatMessages.hide();
			$('#action_menu_btn').click(function() {
				$('.action_menu').toggle();
			});
			chatListReload();
		});
		$(window).on('beforeunload', function() {
		    disconnectWebSocket();
		});
		 // 모달이 열릴 때 데이터를 불러오는 함수
		  function openProfileModal() {
		    $.ajax({
		      url: "/chat/users",
		      type: "GET",
		      data : {
		    	  chatNo : chatRoomId
		      },
		      dataType : 'json',
		      success: function(data) {
		        displayUserInformation(data);
		      }
		    });
		  }
		 // 신고 제출
		 $("#report-send").on('click', function() {
			 chatNo = $("#hiddenChatNo").val();
			 var chatReportContent = $("#reportSelect").val();
			 if($("#reportSelect").val() === "etc") {
				 chatReportContent = $("#customReason").val();
			 }
			 if(chatReportContent !== "none" || chatReportContent === "") {
				 $.ajax({
					 url : "/chat/report",
					 data : {
						 chatReportWriter : userId,
						 chatReportContent : chatReportContent,
						 reportChatNo : chatNo
					 },
					 type : "POST",
					 success : function(data) {
						 if(data == "success"){
							 alert("신고가 완료되었습니다. 관리자 확인 후 처리 예정입니다. 감사합니다.");
							 $('#reportModal').modal('hide');
						 }else {
							 alert("오류가 발생하였습니다. 다시 시도해주세요.");
						 }
					 }
				 })
				 
			 }
		 })

		  // 불러온 데이터를 모달에 표시하는 함수
		  function displayUserInformation(data) {
			  var userProfile = $("#user-profile");
			  userProfile.empty(); // 기존 내용을 비웁니다.
			  var userPhoto;
			  $.each(data, function(index, user) {
			    userPhoto = user.userPhotoPath;
			    if (userPhoto == "" || userPhoto == null) {
			      userPhoto = "../resources/assets/img/earth-globe.png";
			    }
			    var userBox = $("<div>").addClass("user-box");
			    var userImg = $("<img>").addClass("rounded-circle user_img").attr({
			      alt: user.userNickname,
			      src: userPhoto
			    });
			    var userName = $("<p>").text(user.userNickname);
			    userBox.on("click", function() {
			        location.href = "/user/profile?userId=" + user.userId;
			      });
			    userBox.append(userImg, userName);
			    userProfile.append(userBox);
			  });
			
			  // 사용자 정보 상자의 개수에 따라 justify-content 조정
			  var userBoxes = userProfile.find(".user-box");
			  if (userBoxes.length < 4) {
			    userProfile.css("justify-content", "center");
			  } else {
			    userProfile.css("justify-content", "space-between");
			  }
			}

		  // 모달이 열릴 때 데이터를 불러오도록 이벤트 리스너를 추가합니다.
		  $("#profileModal").on("shown.bs.modal", openProfileModal);
		// 날짜 비교 함수
	    function areDatesEqual(date1, date2) {
	        return (
	            date1.getFullYear() === date2.getFullYear() &&
	            date1.getMonth() === date2.getMonth() &&
	            date1.getDate() === date2.getDate()
	        );
	    }

	    // 날짜 표시를 생성하는 함수
	    function createDateDisplay(date) {
	        var dateDisplay = document.createElement("div");
	        dateDisplay.className = "date-display d-flex justify-content-center";
	        var text = document.createElement("p");
	        text.style.backgroundColor = "var(--color-default)";
	        text.style.padding = "5px";
	        text.style.borderRadius = "15px";
	        text.textContent = formatDate(date);
	        dateDisplay.appendChild(text);
	        return dateDisplay;
	    }
	    function formatDate(date) {
	        const options = { year: 'numeric', month: 'short', day: 'numeric' };
	        return new Date(date).toLocaleDateString(undefined, options);
	    }
		function disconnectWebSocket() {
			if (stompClient) {
		        stompClient.disconnect(); // 현재 연결 해제
		        console.log(chatRoomId + "번 방의 연결이 해제되었습니다.");
		        $.ajax({
		        	url : "/chat/disconnect",
		        	data : {
		        		refChatNo : chatRoomId,
		        		userId : userId
		        	},
		        	type : "POST",
		        	success : function(data) {
		        		if(data == "success") {
		        			console.log("마지막 접속시간 업데이트 성공");
		        		}
		        	}
		        })
		        stompClient = null; // 연결 객체 초기화
		    }
		}
		function scrollToBottom() {
		    var chatBody = $("#chat_body");
		    var chatMessages = chatBody.find(".msg_cotainer img");

		    if (chatMessages.length > 0) {
		        // 이미지 로드 이벤트 리스너를 추가
		        chatMessages.on("load", function() {
		            // 모든 이미지가 로드된 후에 스크롤 위치를 조절
		            chatBody.scrollTop(chatBody[0].scrollHeight);
		        });

		        // 이미지 로딩 중일 때도 현재 스크롤 위치를 하단으로 설정
		        chatBody.scrollTop(chatBody[0].scrollHeight);
		    } else {
		        // 이미지가 없는 경우에는 그냥 스크롤을 아래로 내림
		        chatBody.scrollTop(chatBody[0].scrollHeight);
		    }
		}
		function formatTimestamp(timestamp) {
			var date = new Date(timestamp); // SQL timestamp를 JavaScript Date 객체로 변환
		    var today = new Date(); // 현재 날짜 및 시간을 가져옵니다

/* 		    // 오늘 날짜와 메시지 날짜를 비교하여 처리합니다
		    if (date.toDateString() === today.toDateString()) {*/
 		        // 오늘 보낸 메시지인 경우, 시간만 표시
	        var options = { hour: '2-digit', minute: '2-digit' };
	        return date.toLocaleTimeString(undefined, options);
		   /*  } else { */
		        // 오늘이 아닌 경우, 날짜 및 시간 표시
		        /* var options = { year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true };
		        return date.toLocaleString(undefined, options);
		    } */
		}
		
		// 메시지 로드하는 함수
		function addMessage(isSent, senderNickname, senderPhotoPath, message, time) {
		    var chatBody = $("#chat_body");
		    var messageContainer = $("<div>").addClass("d-flex justify-content-" + (isSent ? "end" : "start align-items-center") + " mb-4");
		
		    var imgContainer = $("<div>").addClass("img_cont_msg");
		    userPhotoPath = userPhotoPath != "" ? userPhotoPath : "../resources/assets/img/no-profile.png";
		    senderPhotoPath = senderPhotoPath != null ? senderPhotoPath : "../resources/assets/img/no-profile.png";
		    var img = $("<img>").attr("src", isSent ? userPhotoPath : senderPhotoPath).addClass("rounded-circle user_img_msg");
		
		    imgContainer.append(img);
		
		    var messageDiv;
		    if (isSent) {
		        messageDiv = $("<div>").addClass("msg_cotainer_send");
		    } else {
		        messageDiv = $("<div>").addClass("msg_cotainer");
		    }
		
		    var messageSender = $("<span>").text(senderNickname);
		    var messageText = $("<p>").html(message); // <p> 태그로 변경
		 	// 이미지가 있는지 여부를 검사
		    var hasImage = messageText.find("img").length > 0;
		    var messageTime = $("<span>").addClass("msg_time_send").text(time);
		    var downloadButton = null;
		    if (hasImage) {
		        // 이미지가 있는 경우 다운로드 버튼을 추가
		        downloadButton = $("<button>")
		            .addClass("download-button btn")
		            .append($("<i>").addClass("bi bi-download"))
		            .on("click", function() {
		            	// 이미지 URL을 가져옴
		                var imageUrl = messageText.find("img").attr("src");
		            	var downloadLink = document.createElement('a');
		                downloadLink.href = imageUrl;
		                downloadLink.download = 'image.jpg'; // 다운로드될 파일명 설정
		                document.body.appendChild(downloadLink);
		                downloadLink.click();
		                document.body.removeChild(downloadLink);
		            });
		    }
		    var buttonDiv = $("<div>");
		    messageText.find("img").css ({
		    	maxWidth : '300px',
		    	maxHeight : '300px'
		    });
		    messageSender.css({
		        marginLeft: '10px',
		        fontSize: '12px',
		        color: '#388e3c'
		    });
		
		    if (senderPhotoPath == "out" || message.includes("채팅방을 나갔습니다.")) {
		        messageText = $("<p>").text(senderNickname + "님이 채팅방을 나갔습니다.");
		        var alertDiv = $("<div>").addClass("d-flex justify-content-center");
		        alertDiv.append(messageText);
		        chatBody.append(alertDiv);
		    } else if (message.includes("님이 초대되었습니다.")) {
		        messageText = $("<p>").text(senderNickname + "님이 초대되었습니다.");
		        var alertDiv = $("<div>").addClass("d-flex justify-content-center");
		        alertDiv.append(messageText);
		        chatBody.append(alertDiv);
		    } else if (message.includes("님이 채팅에 참여합니다.")) {
		        messageText = $("<p>").text(message);
		        var alertDiv = $("<div>").addClass("d-flex justify-content-center");
		        alertDiv.append(messageText);
		        chatBody.append(alertDiv);
		    } else {
		        if (isSent) {
		            messageDiv.append(messageText);
		            messageDiv.append(messageTime);
		            messageContainer.append(downloadButton);
		            messageContainer.append(messageDiv);
		            messageContainer.append(imgContainer);
		        } else {
		            messageDiv.append(messageSender);
		            messageDiv.append(messageText);
		            messageDiv.append(messageTime);
		            buttonDiv.append(downloadButton);
		            messageContainer.append(imgContainer);
		            messageContainer.append(messageDiv);
		            messageContainer.append(buttonDiv);
		        }
		        chatBody.append(messageContainer);
		    }
		}
		 // 웹소켓 연결 초기화
	    function connect(chatRoomId) {
	        var chatSocket = new SockJS('http://localhost:9999/chat/list');
	        stompClient = Stomp.over(chatSocket);
	        stompClient.connect({}, function(frame) {
	            console.log('Connected: ' + frame);
	            /* stompClient.send('/toppic/chatRoom-'+ chatRoomId,{},JSON.stringify({refChatNo : chatNo, msgSenderId : userId}),function(test){
					
				})	 */
			
	            stompClient.subscribe('/toppic/chat/chatRoom-' + chatRoomId, function(message) {
	                var messageData = JSON.parse(message.body);
	                console.log(messageData);
	                var isCurrentUser = (messageData.msgSenderId === userId);
	                var messageText = messageData.msgContent;
	                var messageSenderNickname = messageData.msgSenderNickname;
	                var messageSenderPhotoPath = messageData.msgSenderPhotoPath;
	                if (!isCurrentUser) {
	                    var messageText = messageData.msgContent;
	                    addMessage(isCurrentUser, messageSenderNickname, messageSenderPhotoPath, messageText, getCurrentTime());
	                    updateUnreadMessageCount();
	                }
	                chatListReload();
	                $("#unreadCount-" + chatRoomId).text("");
                    $("#unreadCount-" + chatRoomId).hide();
	                scrollToBottom();
	                
	            });
	        });
	        stompClient.onclose = function(event) {
	            console.log('WebSocket connection closed:', event);

	            // 여기에서 연결이 끊겼을 때 수행해야 할 작업을 수행합니다.
	            // 예를 들어, 재연결 시도 또는 사용자에게 알림 표시 등의 작업을 수행할 수 있습니다.
	        };
	    }

	    // 메시지 수신
	    /* function receiveMessage(message) {
	        
	        var isSent = message.sender === userId;

	        addMessage(isSent, message, getCurrentTime());
	        scrollToBottom();
	    } */
	    
	    function updateUnreadMessageCount() {
		    $.ajax({
		        url: "/chat/unreadCount/" + chatRoomId + "/" + userId,
		        type: "GET",
		        success: function(unreadCount) {
		            if (unreadCount > 0) {
		                // 안읽은 메시지가 있을 때 처리
		                $("#unreadCount-" + chatRoomId).text(unreadCount);
		                $("#unreadCount-" + chatRoomId).show(); // 숨겨진 카운트를 표시
		            } else {
		                // 안읽은 메시지가 없을 때 처리
		                $("#unreadCount-" + chatRoomId).text("");
		                $("#unreadCount-" + chatRoomId).hide(); // 카운트를 숨김
		            }
		        }
		    });
		}
	    // 현재 시간 문자열 반환
	    function getCurrentTime() {
	        var now = new Date();
	        var hours = now.getHours();
	        var minutes = now.getMinutes();
	        var ampm = hours >= 12 ? 'PM' : 'AM';
	        hours = hours % 12;
	        hours = hours ? hours : 12;
	        minutes = minutes < 10 ? '0' + minutes : minutes;
	        var currentTime = hours + ':' + minutes + ' ' + ampm;
	        return currentTime;
	    }
		
	 // 메시지 전송
        function sendMessage() {
            var message = $("#textMessage").val();
			if(message == "") {
				alert("내용을 입력해주세요.");
				return false;
			}
            // 메시지를 서버로 전송
            stompClient.send('/app/chat/chatRoom-'+chatRoomId, {}, JSON.stringify({
            	refChatNo : chatRoomId,
            	msgSenderId: userId,
            	msgContent: message,
            	msgSenderNickname : userNickname,
            	msgSenderPhotoPath : userPhotoPath
            }));
            $.ajax({
            	url : "/chat/users",
            	data : {
            		chatNo : chatRoomId
            	},
            	type : "GET",
            	contentType: "application/json",
            	success : function(data) {
            		var comtNo = 0;
            		for(var i = 0; i < data.length; i++) {
            			if(data[i].userId != userId) {
				            if(socket){
				    			let socketMsg = "chat,"+userId+","+data[i].userId+","+chatRoomId+","+comtNo+",채팅방"+chatRoomId;
				    			console.log(socketMsg);
				    			socket.send(socketMsg); //값을 서버로 보냄
				       		}
				            $.ajax({
						        url : '/alert/insertalarm',
						        type : 'POST',
						        data : {'fromUserId': userId , 'toUserId': data[i].userId , 'boardNo':chatRoomId, 'comtNo': comtNo, 'title':message, 'alertType': "chat"},
						        dataType : "json", 
						     	// ↑보내는거
								// ↓받는거
						        success : function(result){
	//					           		if(sessionUserId  != boardWriter){
						           		
	//						        	}
						        }
						    });
            			
            			}
            				
           			}
            	}
            })
            var currentTime = getCurrentTime();
            addMessage(true, userNickname, userPhotoPath, message, currentTime);
            chatListReload();
            scrollToBottom();
            $("#textMessage").val("");
            $("#textMessage").focus();
        }

	    // "메시지 보내기" 버튼 클릭 시 메시지 전송
	    $("#send_btn").click(sendMessage);

	    // Enter 키를 눌러 메시지 전송
	    $("#textMessage").keypress(function (e) {
	        if (e.which == 13 && !e.shiftKey) { // Enter key
	            e.preventDefault();
	            sendMessage();
	        }
	    });
		
	    // 신고 모달
		var selectElement = document.getElementById("reportSelect");
		var textareaElement = document.getElementById("customReason");
		selectElement.addEventListener("change", function() {
			if (selectElement.value === "etc") {
				textareaElement.style.display = "block";
			} else {
				textareaElement.style.display = "none";
			}
		});
		// user 검색
		$("#user-input").on('input', function (e) {
			var inputText = $(this).val();
			if(inputText != "") {
				$.ajax({
					url : "/chat/user-search",
					data : {
						chatNo : chatRoomId,
						user : inputText 
					},
					type : "GET",
					dataType : 'json',
					success : function(data) {
						var resultContainer = $("#resultTable tbody");
					    console.log(data);
					    // 검색 결과를 초기화
					    resultContainer.children().remove();
					    
					    // 검색 결과를 반복해서 HTML로 생성 및 추가
					    for (var i = 0; i < data.length; i++) {
					        var user = data[i];
					        console.log(user);
					        // 사용자 정보를 표시하는 HTML 생성
					        var userPath = user.userPhotoPath == null ? "../resources/assets/img/no-profile.png" : user.userPhotoPath;
					        var userHtml = /* `
					            <div class="col-12 d-flex justify-content-around align-items-center user-search-result">
					                <img class="img_cont_msg" src=`+userPath+`>
					                <span>`+user.userId+`</span>
					                <span>`+user.userNickname+`</span>
					                <input type="checkbox" class="user-checkbox" value=`+user.userId+`>
					            </div>
					        `; */
					        `<tr>
					        	<td><img class="rounded-circle img_cont_msg" src=`+userPath+`></td>
					        	<td>`+user.userId+`</td>
					        	<td>`+user.userNickname+`</td>
					        	<td><input type="checkbox" class="user-checkbox" value=`+user.userId+`></td>
					        </tr>`;
					        
					        
					        // HTML을 결과 영역에 추가
					        resultContainer.append(userHtml);
					    }
					}
				})
			}
		})
		// 채팅방 유저 초대 검색창
		$("#add-user-input").on('input', function (e) {
			var inputText = $(this).val();
			if(inputText != "") {
				$.ajax({
					url : "/chat/user-search-join",
					data : {
						userId : userId,
						keyword : inputText 
					},
					type : "GET",
					dataType : 'json',
					success : function(data) {
						var resultContainer = $("#add-user-result-table tbody");
					    console.log(data);
					    // 검색 결과를 초기화
					    resultContainer.children().remove();
					    
					    // 검색 결과를 반복해서 HTML로 생성 및 추가
					    for (var i = 0; i < data.length; i++) {
					        var user = data[i];
					        console.log(user);
					        // 사용자 정보를 표시하는 HTML 생성
					        var userPath = user.userPhotoPath == null ? "../resources/assets/img/no-profile.png" : user.userPhotoPath;
					        var userHtml = /* `
					            <div class="col-12 d-flex justify-content-around align-items-center user-search-result">
					                <img class="img_cont_msg" src=`+userPath+`>
					                <span>`+user.userId+`</span>
					                <span>`+user.userNickname+`</span>
					                <input type="checkbox" class="user-checkbox" value=`+user.userId+`>
					            </div>
					        `; */
					        `<tr>
					        	<td><img class="rounded-circle img_cont_msg" src=`+userPath+`></td>
					        	<td>`+user.userId+`</td>
					        	<td>`+user.userNickname+`</td>
					        	<td><input type="checkbox" class="add-user-checkbox" value=`+user.userId+`></td>
					        </tr>`;
					        
					        
					        // HTML을 결과 영역에 추가
					        resultContainer.append(userHtml);
					    }
					}
				})
			}
		})
		// 채팅방 개설 유저 선택
		$("#addUsersButton").on('click', function () {
	    // 선택한 유저들의 아이디 또는 고유한 식별자를 가져옵니다.
	    	var returnChatNo = 0;
		    var selectedAddUserIds = [];
		    $(".add-user-checkbox:checked").each(function () {
		    	selectedAddUserIds.push($(this).val());
		    });
		    selectedAddUserIds.push(userId);
			console.log(selectedAddUserIds);
		    // 서버로 선택한 유저들을 초대하는 요청을 보냅니다.
		    if($("#add-user-input").val() == "" || selectedAddUserIds.length == 0) {
		    	alert("채팅할 회원을 선택해주세요.");
		    	return;
		    }else {
			    $.ajax({
			        url: "/chat/add-room",
			        type: "POST",
			        data: JSON.stringify({
			        	selectedAddUserIds: selectedAddUserIds
			        }),
			        contentType: "application/json",
			        success: function (data) {
			        	returnChatNo = data;
			        	// 성공 메시지를 alert로 표시
			        	var comtNo = 0;
			            alert("채팅방을 개설하였습니다.");
			            $("#add-user-input").val("");
			            $("#add-user-result table tbody").children().remove();
			            // #addUserModal을 닫기
			            $('#addUserModal').modal('hide');
			            /* var newChatNo = parseInt(data);
			            connect(newChatNo);
			            console.log(newChatNo);
			        	for(var i = 0; i < selectedAddUserIds.length; i++) {
			        		$.ajax({
			        			url : "/chat/userinfo",
			        			data : {
			        				userId : selectedAddUserIds[i]
			        			},
			        			type : "GET",
			        			dataType : 'json',
			        			success : function(data) {
			        				location.reload(true);
			        				/* resultNickname = data.userNickname; */
			        				
						            /* stompClient.send('/app/chat/chatRoom-'+newChatNo, {}, JSON.stringify({
						            	refChatNo : newChatNo,
						            	msgSenderId: data.userId,
						            	msgContent: resultNickname + "님이 채팅에 참여합니다.",
						            	msgSenderNickname : resultNickname,
						            	msgSenderPhotoPath : ""
						            })); */
			        			/* }
			        		});
			        	} */
			        	
			        	location.reload(true);
			        	
			            // 추가한 메시지로 스크롤을 이동하여 가장 최근 메시지를 보여줍니다.
			            /* scrollToBottom(); */
			        }
			    });
		    }
		});
		// 채팅방 유저 초대
		$("#inviteUsersButton").on('click', function () {
	    // 선택한 유저들의 아이디 또는 고유한 식별자를 가져옵니다.
		    var selectedUserIds = [];
		    $(".user-checkbox:checked").each(function () {
		        selectedUserIds.push($(this).val());
		    });
			console.log(selectedUserIds);
		    // 서버로 선택한 유저들을 초대하는 요청을 보냅니다.
		    if($("#user-input").val() == "" || selectedUserIds.length == 0) {
		    	alert("초대할 회원을 선택해주세요.");
		    	return;
		    }else {
			    $.ajax({
			        url: "/chat/invite-users",
			        type: "POST",
			        data: JSON.stringify({
			            chatNo: chatRoomId,
			            selectedUserIds: selectedUserIds
			        }),
			        contentType: "application/json",
			        success: function (data) {
			        	// 성공 메시지를 alert로 표시
			            alert("초대에 성공했습니다.");
			            $("#user-input").val("");
			            $("#result").children().remove();
			            // #inviteModal을 닫기
			            $('#inviteModal').modal('hide');
			            var before = $("#chat-users").text();
			            var resultNickname;
			            var chatNameBefore = $("#chatName").text();
			        	for(var i = 0; i < selectedUserIds.length; i++) {
			        		$.ajax({
			        			url : "/chat/userinfo",
			        			data : {
			        				userId : selectedUserIds[i]
			        			},
			        			type : "GET",
			        			dataType : 'json',
			        			success : function(data) {
			        				resultNickname = data.userNickname;
						            stompClient.send('/app/chat/chatRoom-'+chatRoomId, {}, JSON.stringify({
						            	refChatNo : chatRoomId,
						            	msgSenderId: data.userId,
						            	msgContent: resultNickname + "님이 초대되었습니다.",
						            	msgSenderNickname : resultNickname,
						            	msgSenderPhotoPath : ""
						            }));
						        	before += resultNickname + " ";
						        	var comtNo = 0;
						        	if(socket){
					        			let socketMsg = "chat,"+userId+","+data.userId+","+chatRoomId+","+comtNo+",채팅방"+chatRoomId;
					        			console.log(socketMsg);
					        			socket.send(socketMsg); //값을 서버로 보냄
					           		}
						        	$.ajax({
			        			        url : "/alert/insertalarm",
			        			        type : 'POST',
			        			        data : {fromUserId: userId, toUserId: data.userId, boardNo:chatRoomId, comtNo: comtNo, title:"채팅방"+chatRoomId, alertType: "chat"},
			        			        dataType : "json", 
			        			     	// ↑보내는거
			        					// ↓받는거
			        			        success : function(result){
//			        			           		if(sessionUserId  != boardWriter){
			        			           		
//			        				        	}
			        			        }
			        			    
			        			    });
			        			}
			        		});
			        	}
			        	chatNameBefore += data;
			        	$("#chatName").text(chatNameBefore);
			        	$("#chat-users").text("참여자 : " + chatNameBefore);
			            // 생성한 메시지를 chat_body에 추가
						chatListReload();
			            // 추가한 메시지로 스크롤을 이동하여 가장 최근 메시지를 보여줍니다.
			            scrollToBottom();
			        }
			    });
		    }
		});
		// 채팅방 나가기
		function chatRoomOut() {
			if(confirm('정말 이 채팅방에서 나가시겠습니까?')) {
				$.ajax({
					url : "/chat/delete-chat-user",
					data : {
						refChatNo : chatRoomId,
						userId : userId
					},
					type : "GET",
					success : function(data) {
						if(data == "success"){
							alert(chatRoomId + "번 방을 삭제하였습니다.");
							stompClient.send('/app/chat/chatRoom-'+chatRoomId, {}, JSON.stringify({
				            	refChatNo : chatRoomId,
				            	msgSenderId: userId,
				            	msgContent: userNickname + "님이 채팅방을 나갔습니다.",
				            	msgSenderNickname : userNickname,
				            	msgSenderPhotoPath : "out"
				            }));
							chatListReload();
							$(".chat-info").hide();
							location.reload(true);
						}
					}
				})
			}
		}
		
		function chatListReload() {
			$.ajax({
				url : "/chat/list-ajax",
				data : {
					userId : userId
				},
				type : "GET",
				success : function(data) {
					console.log(data);
					updateChatList(data);
				}
			})
		}
	    // JavaScript 함수 내에서 조건을 검사하고 HTML을 생성
	    function updateChatList(data) {
	        var chatList = $(".contacts"); // 채팅 리스트가 있는 DOM 요소를 선택
	        chatList.children().remove();// 기존 목록 지우기
	     // 비동기 함수를 Promise로 변환
	        function fetchChatUserInfo(chatRoom) {
	            return new Promise(function (resolve) {
	                var chatChatNo = chatRoom.chatRoom.chatNo;
	                $.ajax({
	                    url: "/chat/users",
	                    data: {
	                        chatNo: chatChatNo
	                    },
	                    type: "GET",
	                    dataType: 'json',
	                    success: function (userData) {
	                        var isGroup = true;
	                        var indUserInfo;

	                        if (userData.length == 2) {
	                            isGroup = false;
	                            for (var i = 0; i < userData.length; i++) {
	                                if (userData[i].userId != userId) {
	                                    indUserInfo = userData[i];
	                                }
	                            }
	                        }

	                        var chatName;
	                        var photo;
							
	                        if (!isGroup) {
	                            chatName = indUserInfo.userNickname;
	                            photo = indUserInfo.userPhotoPath;
	                        } else {
	                            chatName = chatRoom.chatRoom.chatName;
	                            photo = chatRoom.chatRoom.cImagePath;
	                        }

	                       
	                        if (photo == "" || photo == null) {
	                            photo = "../resources/assets/img/earth-globe.png";
	                        }

	                        resolve({ chatRoom, chatName, photo });
	                    }
	                });
	            });
	        }
	        // Promise 배열 생성
	        var promiseArray = data.map(function (chatRoom) {
	            return fetchChatUserInfo(chatRoom);
	        });
	        Promise.all(promiseArray)
	        .then(function (results) {
	        	chatList.children().remove();
	            results.forEach(function (result) {
	                var { chatRoom, chatName, photo } = result;
	                // 나머지 코드와 li 요소 생성 부분은 그대로 유지
	                var listItem = '<li class="a_active" id="chat-room-' + chatRoom.chatRoom.chatNo + '">';
	                listItem += '<input type="hidden" class="chat-room-id" value="' + chatRoom.chatRoom.chatNo + '">';
	                listItem += '<input type="hidden" class="chat-room-name" value="' + chatName + '">';
	                // ... 이하 생략
	                listItem += '<div class="d-flex bd-highlight">';
		            listItem += '<div class="img_cont">';
		            listItem += '<img src="' + photo + '" class="rounded-circle user_img" id="chat-list-img">';
	// 	            listItem += '<span class="online_icon"></span>';
		            listItem += '</div>';
		            listItem += '<div class="user_info">';
		            listItem += '<div class="col d-flex justify-content-between">';
		            var maxLength = 18;
		            if(chatName.length >= maxLength) {
		            	chatName = chatName.substring(0, maxLength) + "...";
		            }
		            listItem += '<span>' + chatName + '</span><br>';
		            
		            // 날짜와 시간에 대한 조건 검사
		            var currentDate = new Date(); // 현재 날짜와 시간
		            var formattedDate = new Date(chatRoom.chatRoom.chatMessage.msgSendDate);
	
		            if (formattedDate.toDateString() === currentDate.toDateString()) {
		            	// 오늘인 경우
		                var hours = formattedDate.getHours();
		                var minutes = formattedDate.getMinutes();
	
		                // 분 (minutes)이 10 미만인 경우, 0을 앞에 붙여줍니다.
		                if (minutes < 10) {
		                    minutes = "0" + minutes;
		                }
		                if(hours < 10) {
		                	hours = "0" + hours;
		                }
	
		                var formattedTime = hours + ":" + minutes;
		                listItem += '<p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">' + formattedTime + '</p>';
		            } else {
		                // 오늘이 아닌 경우
		                var formattedDateStr = formattedDate.toLocaleDateString();
		                listItem += '<p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">' + formattedDateStr + '</p>';
		            }
	
		            listItem += '</div>';
		            listItem += '<div class="col d-flex justify-content-between">';
		            var chatContent = chatRoom.chatRoom.chatMessage.msgContent;
		            if(chatContent.includes("<img src")) {
		            	chatContent = "이미지";
		            }
		       
		            listItem += '<p>' + chatContent + '</p>';
		            var unread = chatRoom.unreadMsgCount;
		            if(chatRoom.chatRoom.chatMessage.msgSenderId == userId) {
		            	unread = 0;
		            }
		            if (unread != 0 && chatRoom.chatRoom.chatMessage.msgSenderId != userId) {
		                listItem += '<p id="unreadCount-' + chatRoom.chatRoom.chatNo + '" style="border-radius: 50px; color: white; background-color: #F24E1E; width: 25px; height: 25px; text-align: center;">' + unread + '</p>';
		            }
		            if($('#hiddenChatNo').val() == chatRoomId) {
		            	$('#unreadCount-' + chatRoomId).hide();
		            }
		            
		            listItem += '</div>';
		            listItem += '</div>';
		            listItem += '</div>';
		            listItem += '</li>';
		                chatList.append(listItem);
		            });
	        });
	        
	        $('.contacts').on('click', '.a_active', function() {
	            // 클릭 시 실행하고 싶은 코드를 추가하세요.
	            // 클릭한 채팅방과 관련된 동작을 이곳에 추가
	            // chatRoomId 및 chatRoomName을 사용하여 작업을 수행

	            disconnectWebSocket();
	            // 예를 들어, 클릭 시 채팅방을 열고 필요한 정보를 가져오는 코드:
	            chatRoomId = $(this).find(".chat-room-id").val();
	            if($('#hiddenChatNo')) {
					$('#hiddenChatNo').remove();
				}
				var hiddenNo = $('<input>').attr({
				    type: 'hidden',
				    name: 'hiddenChatNo',
				    id : 'hiddenChatNo',
				    value: chatRoomId
				});
				$('.chat-info').append(hiddenNo);
	            chatRoomName = $(this).find(".chat-room-name").val();
	            $.ajax({
		        	url : "/chat/disconnect",
		        	data : {
		        		refChatNo : chatRoomId,
		        		userId : userId
		        	},
		        	type : "POST",
		        	success : function(data) {
		        		if(data == "success") {
		        			console.log("마지막 접속시간 업데이트 성공");
		        		}
		        	}
		        })
	            // 아래에 채팅방 열기 및 관련 작업을 수행하는 코드를 추가
	            $('.chat_none').remove();
	            $('.chat-info').show();
	            chatRoomId = chatRoomId;
	            chatRoomName = chatRoomName;
	            if($('#hiddenChatNo')) {
					$('#hiddenChatNo').remove();
				}
				var hiddenNo = $('<input>').attr({
				    type: 'hidden',
				    name: 'hiddenChatNo',
				    id : 'hiddenChatNo',
				    value: chatRoomId
				});
				$('.chat-info').append(hiddenNo);
	            $("#chatName").text(chatRoomName);
	            chatImg = $(this).find("#chat-list-img").attr("src");
				$("#info-img").attr("src", chatImg);
	            $.ajax({
	                url : "/chat/users",
	                data : {
	                    chatNo : chatRoomId
	                },
	                type : "GET",
	                dataType: 'json',
	                success : function(data) {
	                    var users = "참여자 : "; //사용자 목록을 저장할 변수 초기화
	                    for (var i = 0; i < data.length; i++) {
	                        users += data[i].userNickname + " ";
	                    }
	                    $("#chat-users").text(users);
	                    $.ajax({
	                        url : "/chat/room",
	                        data : {
	                            chatNo : chatRoomId
	                        },
	                        type : "GET",
	                        success : function(data) {
	                            var chatBody = $("#chat_body");
	                            chatBody.children().remove();
	                            data.forEach(function(message) {
	                                var isSent = message.msgSenderId == userId;
	                                var messageText = message.msgContent;
	                                var messageTime = message.msgSendDate;
	                                var messageDate = new Date(messageTime);
	                                if (previousDate === null || !areDatesEqual(previousDate, messageDate)) {
	                                    chatBody.append(createDateDisplay(messageDate));
	                                    previousDate = messageDate;
	                                }
	                                var senderNickname = message.user.userNickname;
	                                var senderPhotoPath = message.user.userPhotoPath;
	                                addMessage(isSent, senderNickname, senderPhotoPath, messageText, formatTimestamp(messageTime));
	                                $("#unreadCount-" + chatRoomId).text("");
	                                $("#unreadCount-" + chatRoomId).hide();
	                            })
	                            //웹소켓 연결 초기화
	                            connect(chatRoomId);
	                            scrollToBottom();
	                        }
	                    })
	                }
	            });
	        });

	    }
	 // 파일 열기 버튼을 클릭하면 input 요소를 클릭
        $('#fileInputButton').click(function () {
            $('#fileInput').click();
        });

        // 파일을 선택했을 때의 처리를 추가
        $('#fileInput').change(function () {
		    var selectedFile = this.files[0];
		    if (selectedFile) {
		        var formData = new FormData();
		        formData.append('file', selectedFile);
		
		        $.ajax({
		            url: '/upload-image', // 서버 업로드 엔드포인트 URL
		            type: 'POST',
		            data: formData,
		            contentType: false,
		            processData: false,
		            success: function (imageUrl) {
		                // 이미지 업로드가 성공하면 서버에서 반환된 이미지 URL을 받음
		                console.log('이미지 업로드 성공, 이미지 URL: ' + imageUrl);
						var message = "<img src='"+ imageUrl +"'>";
		             // 메시지를 서버로 전송
		                stompClient.send('/app/chat/chatRoom-'+chatRoomId, {}, JSON.stringify({
		                	refChatNo : chatRoomId,
		                	msgSenderId: userId,
		                	msgContent: message,
		                	msgSenderNickname : userNickname,
		                	msgSenderPhotoPath : userPhotoPath
		                }));
		                var currentTime = getCurrentTime();
		                addMessage(true, userNickname, userPhotoPath, message, currentTime);
		                chatListReload();
		                scrollToBottom();
		            },
		            error: function (error) {
		                console.error('이미지 업로드 실패: ' + error);
		            }
		        });
		    }
		});





	</script>
</body>

</html>