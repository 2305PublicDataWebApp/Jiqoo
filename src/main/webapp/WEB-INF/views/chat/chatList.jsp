<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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
			<div class="container-fluid h-100" data-aos="fade-in"
				style="background-color: #FFF9C5; padding-top: 100px; padding-bottom: 100px; margin-bottom: 100px; position: relative;">
				<div class="row justify-content-center h-100">
					<c:if test="${!empty chatRoomList }">
					<div class="col-md-4 col-xl-3 chat">
						<div class="card mb-sm-3 mb-md-0 contacts_card"
							data-aos="fade-right">
							<div class="card-header">
								<div class="input-group">
									<input type="text" placeholder="Search..." name=""
										class="form-control search">
									<div class="input-group-prepend">
										<span class="input-group-text search_btn"><i
											class="bi bi-search"></i></span>
									</div>
								</div>
							</div>
							<div class="card-body contacts_body">
								<ul class="contacts">
								<c:forEach items="${chatRoomList }" var="chatRoom">
									<li class="a_active" id="chat-room-${chatRoom.chatRoom.chatNo }"><input type="hidden"
										class="chat-room-id" value="${chatRoom.chatRoom.chatNo }">
										<input type="hidden" class="chat-room-name" value="${chatRoom.chatRoom.chatName }">
										<div class="d-flex bd-highlight">
											<div class="img_cont">
												<img src="../resources/assets/img/basozan.png"
													class="rounded-circle user_img"> <span
													class="online_icon"></span>
											</div>
											<div class="user_info">
												<div class="col d-flex justify-content-between">
													<span>${chatRoom.chatRoom.chatName }</span><br>
													<fmt:formatDate value="${chatRoom.chatRoom.chatMessage.msgSendDate}" pattern="yyyy-MM-dd" var="formattedDate" />
													<c:choose>
													  <c:when test="${formattedDate == currentDate}">
													    <!-- 오늘인 경우 -->
													    <fmt:formatDate value="${chatRoom.chatRoom.chatMessage.msgSendDate}" pattern="a h:mm" var="formattedTime" />
													    <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">${formattedTime}</p>
													  </c:when>
													  <c:otherwise>
													    <!-- 오늘이 아닌 경우 -->
													    <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">${formattedDate}</p>
													  </c:otherwise>
													</c:choose>
													
													
													<%-- <p class="user_info_time"
														style="font-size: 16px; color: #5f5f5f;">${chatRoom.chatRoom.chatMessage.msgSendDate }</p> --%>
												</div>
												<div class="col d-flex justify-content-between">
													<p>${chatRoom.chatRoom.chatMessage.msgContent }</p>
													<c:if test="${chatRoom.unreadMsgCount != 0 }">
													<p id="unreadCount-${chatRoom.chatRoom.chatNo }"
													style="border-radius: 50px; color: white; background-color: #F24E1E; width: 25px; height: 25px; text-align: center;">
													${chatRoom.unreadMsgCount }</p>
													</c:if>
												</div>
											</div>
										</div>
									</li>								
								</c:forEach>
								
								</ul>
							</div>
							<div class="card-footer"></div>
						</div>
					</div>
					</c:if>
					<div class="col-md-8 col-xl-6 chat" id="chat_info_div"
						data-aos="fade-left">
						<div
							class='chat_none row d-flex justify-content-center align-items-center'>
							<div class='text-center'>
								<img src='../resources/assets/img/jiqooLogo.png'>
							</div>
							<div class='text-center'>
								<p>
									<span style='color: #388E3C'>${userNickName }</span>님 환영합니다!<br>목록을
									클릭하여 채팅을 시작해보세요.
								<p>
							</div>
						</div>
						<div class="card chat-info">
							<div class="card-header msg_head">
								<div class="d-flex bd-highlight">
									<div class="img_cont">
										<img src="../resources/assets/img/basozan.png"
											class="rounded-circle user_img"> <span
											class="online_icon"></span>
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
										<li><a href="#"><i class="bi bi-person-vcard"></i>
												프로필 보기</a></li>
										<li><a href="#" data-bs-toggle="modal" data-bs-target="#inviteModal">
											<i class="bi bi-person-add"></i> 초대하기</a>
										</li>
										<li><a href="javascript:void(0)" onClick="chatRoomOut();"><i class="bi bi-x-circle"></i> 채팅방
												나가기</a></li>
										<li><a href="#" data-bs-toggle="modal"
											data-bs-target="#reportModal"><i
												class="bi bi-exclamation-triangle"></i> 신고하기</a></li>
									</ul>
								</div>
							</div>
							<div id="chat_body" class="card-body msg_card_body">
								
							</div>
							<div class="card-footer">
								<div class="input-group">
									<div class="input-group-append">
										<span class="input-group-text attach_btn"><i
											class="bi bi-paperclip"></i></span>
									</div>

									<textarea name="" class="form-control type_msg"
										placeholder="메시지를 입력해주세요." id="textMessage"></textarea>
									<div class="input-group-append">
										<a href="javascript:void(0)" id="send_btn">
											<span class="input-group-text send_btn"><i
												class="bi bi-send"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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
							<input type="text" class="form-control" name="user-input" id="user-input" placeholder="아이디나 닉네임을 입력해주세요.">
						</div>
						<div id="result" class="row">
							<table id="resultTable" align="center">
								<tbody></tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="inviteUsersButton" class="btn send-report">완료</button>
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
						<button type="button" class="btn send-report">보내기</button>
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
		var userNickname = "${sessionScope.userNickName}";
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
			$('.a_active').on('click', function() {
				// 클릭 시 실행하고 싶은 코드를 추가하세요.
				// $('.chat_none').remove();
				// $('#chat_info_div').append("<div class='chat_none row d-flex justify-content-center align-items-center'><div class='text-center'><img src='../resources/assets/img/jiqooLogo.png'></div><div class='text-center'><p><span style='color:#388E3C'>채채채</span>님 환영합니다!<br>목록을 클릭하여 채팅을 시작해보세요.<p></div></div>");
				$('.chat_none').remove();
				$('.chat-info').show();
				disconnectWebSocket();
				chatRoomId = $(this).find(".chat-room-id").val();
				chatRoomName = $(this).find(".chat-room-name").val();
				$("#chatName").text(chatRoomName);
				$.ajax({
					url : "/chat/users",
					data : {
						chatNo : chatRoomId
					},
					type : "GET",
					dataType: 'json',
					success : function(data) {
						var users = "참여자 : "; // 사용자 목록을 저장할 변수 초기화
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
									// 현재 메시지의 날짜를 가져오고, 그 날짜와 이전 메시지의 날짜를 비교
				                    var messageDate = new Date(messageTime);
				                 
		
				                    if (previousDate === null || !areDatesEqual(previousDate, messageDate)) {
				                        // 날짜가 바뀌면 새로운 날짜 표시를 추가
				                        chatBody.append(createDateDisplay(messageDate));
				                        previousDate = messageDate;
				                    }
				                    var senderNickname = message.user.userNickname;
				                    var senderPhotoPath = message.user.userPhotoPath;
									addMessage(isSent, senderNickname, senderPhotoPath, messageText, formatTimestamp(messageTime));
									$("#unreadCount-" + chatRoomId).text("");
									$("#unreadCount-" + chatRoomId).hide();
								})
								// 웹소켓 연결 초기화
								console.log(chatRoomId);
			        			connect(chatRoomId);
								scrollToBottom();
							}
						})
					}
				})
				
			});

		});
		$(window).on('beforeunload', function() {
		    disconnectWebSocket();
		});
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
		    chatBody.scrollTop(chatBody[0].scrollHeight);
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
		    var messageText = $("<p>").text(message);
		    var messageTime = $("<span>").addClass("msg_time_send").text(time);
		    
		    messageSender.css({
		        marginLeft: '10px',         // 텍스트 색상
		        fontSize: '12px',      // 글꼴 크기
		        color: '#388e3c'     // 글꼴 굵기
		    });
			if(senderPhotoPath == "out" || message.includes("채팅방을 나갔습니다.")) {
				messageText = $("<span>").text(senderNickname + "님이 채팅방을 나갔습니다.");
				var alertDiv = $("<div>").addClass("d-flex justify-content-center");
				alertDiv.append(messageText);
				chatBody.append(alertDiv);
			}else if(message.includes("님이 초대되었습니다.")){
				messageText = $("<span>").text(senderNickname + "님이 초대되었습니다.");
				var alertDiv = $("<div>").addClass("d-flex justify-content-center");
				alertDiv.append(messageText);
				chatBody.append(alertDiv);
			}else {
			    if (isSent) {
			    	messageDiv.append(messageText);
				    messageDiv.append(messageTime);
			        messageContainer.append(messageDiv);
			        messageContainer.append(imgContainer);
			    } else {
			    	messageDiv.append(messageSender);
			    	messageDiv.append(messageText);
				    messageDiv.append(messageTime);
			        messageContainer.append(imgContainer);
			        messageContainer.append(messageDiv);
			    }
			    chatBody.append(messageContainer);
			}
		}
		 // 웹소켓 연결 초기화
	    function connect(chatRoomId) {
	        var socket = new SockJS('http://127.0.0.1:9999/chat/list');
	        stompClient = Stomp.over(socket);
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
            
            var currentTime = getCurrentTime();
            addMessage(true, userNickname, userPhotoPath, message, currentTime);
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
					        	<td><img class="img_cont_msg" src=`+userPath+`></td>
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
			        	for(var i = 0; i < selectedUserIds.length; i++) {
				            stompClient.send('/app/chat/chatRoom-'+chatRoomId, {}, JSON.stringify({
				            	refChatNo : chatRoomId,
				            	msgSenderId: selectedUserIds[i],
				            	msgContent: selectedUserIds[i] + "님이 초대되었습니다.",
				            	msgSenderNickname : selectedUserIds[i],
				            	msgSenderPhotoPath : ""
				            }));
				        	before += selectedUserIds[i] + " ";
			        	}
			        	$("#chat-users").text(before);
			            // 생성한 메시지를 chat_body에 추가
						
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
				            	msgContent: userId + "님이 채팅방을 나갔습니다.",
				            	msgSenderNickname : userNickname,
				            	msgSenderPhotoPath : "out"
				            }));
							location.reload(true);
						}
					}
				})
			}
		}
	</script>
</body>

</html>