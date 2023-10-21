<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

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

<!-- Template Main CSS File -->
<link href="../resources/assets/css/post_jiqoo.css" rel="stylesheet">
<link href="../resources/assets/css/header.css" rel="stylesheet">
<link href="../resources/assets/css/footer.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<!-- <script src="../resources/assets/vendor/summernote/summernote-lite.js"></script>
  <script src="../resources/assets/vendor/summernote/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="../resources/assets/vendor/summernote/summernote-lite.css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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

		<div id="container" data-aos=fade-in>


			<!-- ======= Post ======= -->
			<div id="post" class="col-md-12 col-xxl-10 mx-auto">
				<div class="post-header">
					<c:if test="${sessionScope.userId ne jiqoo.user.userId }">
						<span id="action_menu_btn"><i
							class="bi bi-three-dots-vertical"></i></span>
						<div class="action_menu">
							<ul>
								<li><a href="#"><i class="bi bi-person-vcard"></i> 프로필
										보기</a></li>
								<li><a href="#" data-bs-toggle="modal"
									data-bs-target="#reportModal"><i
										class="bi bi-exclamation-triangle"></i> 신고하기</a></li>
							</ul>
						</div>
					</c:if>
					<div style="text-align: center;">
						<div id="post-category-img-container">
							<img id="post-category-img" alt="" src="${category.cImgPath}">
						</div>
						<div class="location col-xs-12 col-sm-8 col-md-6">
							<span id="location-text">${jiqoo.jiqooW3W}</span>
						</div>
					</div>
					<div id="title">${jiqoo.jiqooTitle }</div>
					<div id="writer-info">
						<div id="profile-img" class="col-sm-12">
							<img src="${jiqoo.user.userPhotoPath }" alt="프로필 이미지"
								class="profile-image">
						</div>
						<div class="col-md-10">
							<div class="author">${jiqoo.user.userNickname }</div>
							<div class="row">
								<div class="info post-date col-lg-6 col-md-12">
									<fmt:formatDate pattern="yy/MM/dd HH:mm"
										value="${jiqoo.jCreateDate }" />
								</div>
								<div class="info view-count col-lg-3 col-md-12">
									<span>조회수</span>${jiqoo.jViewCount }</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div id="content">${jiqoo.jiqooContent }</div>
				<div class="post-footer">
					<div id="heart-container">
						<button id="likeButton"  onclick="like(${jiqoo.jiqooNo})">
						    <c:if test="${likeOrNot == 0 }">
						        <i class="bi bi-heart heart"></i>
						    </c:if>
						    <c:if test="${likeOrNot == 1 }">
						    	<i class="bi bi-heart-fill heart"></i>
						    </c:if>
						</button>
						<span id="like-count">${likeCount }</span>
						<!-- 좋아요 버튼 -->
					</div>
					<c:if
						test="${not empty sessionScope.userId && sessionScope.userId eq jiqoo.user.userId}">
						<div class="button-container">
							<button class="btn postbtn" id="modify-btn"
								data-bs-toggle="modal" data-bs-target=".modal">수정</button>
							<button class="btn postbtn" id="delete-btn"
								onclick="deleteJiqoo()">삭제</button>
						</div>
					</c:if>
				</div>
			</div>
			<!-- ======= Modal ======= -->
			<div class="modal" tabindex="-1" id="insert-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content"
						style="background-color: #6DBE45; color: #fff;">
						<div class="modal-header">
							<h5 class="modal-title">게시물 입력</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- 게시물 입력 폼 -->
							<form action="/jiqoo/insert" method="POST">
								<div class="mb-3 col-lg-5 mx-auto location-container">
									<input type="text" class="form-control" id="location"
										name="jiqooW3W" value="${jiqoo.jiqooW3W }" readonly>
									<button id="open-map-btn">+</button>
								</div>
								<div class="mb-3 row date-tag-container">
									<div class="date-container col-md-3">
										<input type="date" class="form-control" id="date"
											name="jiqooDate" value="${jiqoo.jiqooDate }" required>
									</div>
									<div class="col-md-2 c-btn">
										<span>카테고리</span> <i class="bi bi-caret-down-fill"
											onclick="toggleCC()"></i>
									</div>
									<div class="category-container" style="display: none;">
										<div class="category-list">
											<c:forEach var="categoryList" items="${categoryList }">
												<div class="form-check category">
													<input class="form-check-input" type="radio"
														name="jiqooCtgr"
														<c:if test="${jiqoo.jiqooCtgr eq categoryList.cName }">checked</c:if>
														required> <label class="form-check-label"
														for="${categoryList.cName }"> <img class="tag-img"
														src="${categoryList.cImgPath }"
														alt="${categoryList.cName }">
													</label>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<input type="hidden" id="lat" name="jiqooLat"
									value="${jiqoo.jiqooLat }"> <input type="hidden"
									id="lng" name="jiqooLng" value="${jiqoo.jiqooLng }"> <input
									type="hidden" id="jiqoo-writer" name="jiqooWriter"
									value="${sessionScope.userId }">
								<div class="mb-3">
									<input type="text" class="form-control" id="modify-title"
										name="jiqooTitle" placeholder="제목"
										value="${jiqoo.jiqooTitle }" required>
								</div>
								<div class="mb-3">
									<textarea id="summernote" name="jiqooContent" required> ${jiqoo.jiqooContent }</textarea>
								</div>
								<div class="mb-3 form-switch">
									<input type="checkbox" class="form-check-input" id="private"
										name="jOpenStatus"
										<c:if test="${jiqoo.jOpenStatus eq 'Y' }">checked</c:if>>
									<label class="form-check-label" for="private">비공개</label>
								</div>
								<div class="mb-3 form-switch">
									<input type="checkbox" class="form-check-input"
										id="allowComments" name="jAllowComt"
										<c:if test="${jiqoo.jAllowComt eq 'Y' }">checked</c:if>>
									<label class="form-check-label" for="allowComments">댓글
										허용</label>
								</div>
								<div class="modal-footer">
									<button type="reset" class="btn reset" data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn insert">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 댓글 -->
			<div class="comment-section col-md-12 col-xxl-10 mx-auto">
				<div class="comment-form col-md-12 col-xxl-10 mx-auto">
					<textarea id="comtContent" placeholder="댓글을 입력하세요"></textarea>
					<button class="btn" id="c-submit">등록</button>
				</div>
				<div id="comment-container"></div>
				<div id="reportPopup" class="popup">
					<h2>댓글 신고하기</h2>
					<textarea id="reportReason" placeholder="신고 이유를 입력하세요"></textarea>
					<button onclick="reportComment()">신고</button>
					<button onclick="closeReportPopup()">닫기</button>
				</div>
			</div>
			<div class="comment-page-container">
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

	<!-- 썸머노트 -->
	<script>
    $(document).ready(function() {
    //여기 아래 부분
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '내용을 입력하세요.',	//placeholder 설정
            toolbar: [
                    // [groupName, [list of button]]
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    ['color', ['forecolor','color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert',['picture','link','video']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                callbacks:{ 
                    onImageUpload : function(files){ 
                       uploadSummernoteImageFile(files[0],this); 
                   } 
                } 
        });
        function uploadSummernoteImageFile(file,editor){ 
            data = new FormData(); 
            data.append("file",file); 
            $.ajax({ 
        data:data, 
        type:"POST", 
        url:"/uploadSummernoteImageFile", 
        /* dataType:"JSON", */ 
        enctype:'multipart/form-data',
        contentType:false, 
        processData:false
        
    }).done(function(data) {
    	console.log(data)
    	var imgNode = $("<img>");
    	imgNode.attr("src", data);
    	$(".note-editable").append(imgNode);
    }).fail(function(a,b,c){
    	console.log(a);
    	console.log(b);
    	console.log(c);
    });
        }

        
    	// 페이지가 로드될 때 초기 댓글을 로드
    	loadInitialComments();
    });

    function toggleReportDiv() {
        const reportDiv = document.getElementById("report-div");
        reportDiv.style.display = reportDiv.style.display === "none" ? "block" : "none";
    }
    
    function deleteJiqoo() {
    	if(confirm("정말 삭제하시겠습니까?")){
    		location.href= "/jiqoo/delete?jiqooNo=${jiqoo.jiqooNo}";
    	}
    }
     
	// 전역변수
	var jiqooNo = "${jiqoo.jiqooNo}";
	var currentUserId = "${sessionScope.userId}"
	
  function toggleCC() {
    const categoryContainer = document.querySelector(".category-container");
    categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
  }
  
//댓글 등록
  $("#c-submit").on("click", function() {
      const comtContent = $("#comtContent").val();
      const refPostNo = "${jiqoo.jiqooNo}";
      const sessionUserId = "${sessionScope.userId }";
      if (currentUserId == "") {
	        if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
	            // 사용자가 확인을 누르면 로그인 페이지로 이동
	            window.location.href = "/user/login";
	            return; // 이동 후 함수를 종료
	        }
	    }else {
			$.ajax({
			    url: "/jiqoo/insertComt",
			    data: { comtContent: comtContent, refPostNo: refPostNo },
			    type: "GET",
			    success: function(result) {
			        if (result === "success") {
			            alert("댓글이 등록되었습니다.");
			            loadInitialComments();
			            console.log(loading);
			            $("#comtContent").val("");
			        } else {
			            alert("댓글이 등록되지 않았습니다.");
			        }
			    },
			    error: function() {}
			});
	    }
  });

  
  // 댓글 삭제
	const removeComment = (comtNo) => {
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				url : "/jiqoo/delComment",
				data : {comtNo : comtNo},
				type : "GET",
				success : function(result) {
					if(result == "success") {
						alert("댓글이 삭제되었습니다.");
						loadInitialComments();
					}else {
						alert("댓글이 삭제되지 않았습니다.");
					}
				},
				error : function() {
					alert("Ajax 오류~ 관리자에게 문의하삼");
				}
			})
		}
  		
		}
  
  // 댓글 수정폼 조회
  const modifyView = (obj, comtContent, comtNo) => {
	  console.log("comtNo:", comtNo);
	    // 이미 수정 폼이 표시되고 있는지 확인
	    const existingForm = $(obj).closest('.comment').find('.modify-form');

	    if (existingForm.length > 0) {
	        // 폼이 이미 표시 중이면, 폼을 숨깁니다.
	        existingForm.remove();
	    } else {
	        // 폼이 표시 중이 아니면, 폼을 생성하고 추가합니다.
	        const formDiv = $('<div>').addClass('modify-form');
	        const inputField = $("<input>").attr("type", "text").attr("size", "50").attr("value", comtContent);
	        const saveButton = $("<button type='button'>").text("수정 완료").click(function() {
	            const newContent = inputField.val();
	            const refPostNo = "${jiqoo.jiqooNo}";
	            modifyComment(obj, refPostNo, comtNo, newContent);
	        });

	        formDiv.append(inputField, saveButton);
	        $(obj).closest('.comment').append(formDiv);
	    }
	};


	// 댓글 수정
	const modifyComment = (obj, refPostNo, comtNo, newContent) => {
	    const comment = {
	    	refPostNo: refPostNo,
	        comtNo: comtNo,
	        comtContent: newContent
	    };

	    $.ajax({
	        url: "/jiqoo/updateComt",
	        data: {
	        	refPostNo: refPostNo,
		        comtNo: comtNo,
		        comtContent: newContent
	        },
	        type: "GET",
	        success: function (result) {
	            if (result === "success") {
	                alert("댓글이 수정되었습니다.");
	                loadInitialComments();
	            } else {
	                alert("댓글이 수정되지 않았습니다.");
	            }
	        },
	        error: function () {
	            alert("Ajax 오류~ 관리자에게 문의하삼");
	        }
	    });
	};


	// 대댓글 폼, 대댓글 작성
	function showReplyForm(obj, pComtNo) {
	 	if (currentUserId == "") {
	        if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
	            // 사용자가 확인을 누르면 로그인 페이지로 이동
	            window.location.href = "/user/login";
	            return; // 이동 후 함수를 종료
	        }
	    }else {
		    const targetComment = $(obj).closest('.comment'); // 'comment' 클래스를 가진 요소를 찾음
		    // 'comment-text' 클래스를 가진 요소 뒤에 replyForm 추가
		    const replyForm = $("<div>").addClass("reply-form");
		    const replyTextarea = $("<textarea>").attr("placeholder", "답글을 작성하세요");
		    const replyButton = $("<button>").addClass("reply-btn").text("작성");
			if($(".reply-form").length != 1){
			    replyForm.append(replyTextarea);
			    replyForm.append(replyButton);
			 // 'comment-text' 뒤에 추가
			    targetComment.find('.comment-text').after(replyForm);
			}else {
				$(".reply-form").remove();
			}
		 
			replyButton.on("click", function() {
			    const comtContent = replyTextarea.val();
			    if (comtContent.trim() !== "") {
			    	$.ajax({
			    	    url: "/jiqoo/insertReply",
			    	    type: "get",
			    	    data: {
			    	    	refPostNo : jiqooNo,
			    	        pComtNo: pComtNo,
			    	        comtContent: comtContent
			    	    },
			    	    success: function(data) {
			    	        if (data === "success") {
								alert("답글등록에 성공하였습니다.");
			    	            replyForm.remove(); // 답글 작성 폼 제거
			    	            loadInitialComments();
			    	        } else {
			    	            // 서버에서 success가 false인 경우, errorMessage를 표시
			    	            alert("서버에서 오류가 발생했습니다: " + data.errorMessage);
			    	        }
			    	    },
			    	    error: function(xhr, status, error) {
			    	        // AJAX 요청이 실패했을 때 실행되는 코드
			    	        alert("서버 오류로 인해 답글을 작성하지 못했습니다. 관리자에게 문의하세요.");
			    	        console.log("에러 상태:", status);
			    	        console.log("에러 내용:", error);
			    	    }
			    	});
			    }
			});
	    }
	}
	
	var loading = false; // 중복 로드 방지용 플래그
	var currentOffset = 0; // 현재 offset 값

	// 초기 댓글을 로드하는 함수
	function loadInitialComments() {
		currentOffset = 0;
	    var jiqooNo = "${jiqoo.jiqooNo}";
	    // 페이지 로딩 중 메시지를 표시
	    const loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
	    const commentContainer = $("#comment-container");
	    commentContainer.append(loadingMessage);

	    $.ajax({
	        url: "/jiqoo/loadInitialComments", // 서버로 요청 보낼 URL
	        type: "get",
	        data: {
	            jiqooNo: jiqooNo
	        },
	        success: function (data) {
                var commentContainer = $("#comment-container");
				commentContainer.empty();
            	 // 로딩 메시지를 제거
	            loadingMessage.remove();
                if (data.length > 0) {
                	console.log(data)
                    var commentList = $("<ul>").addClass("comment-list");
					
                    for(var i = 0; i < data.length; i++){
                    	var comment = data[i];
                    	var listItem = createCommentItem(comment);
                    	commentList.append(listItem);
                    }
                    commentContainer.append(commentList);
                    currentOffset += 10;
                }

                loading = false; // 로딩 완료 후 플래그 재설정
            },
	        error: function () {
	            // 서버 통신 오류 시 오류 메시지를 표시
	            const errorContainer = $("#error-container");
	            errorContainer.text("댓글을 불러오는 중 오류가 발생했습니다.");

	            // 로딩 메시지를 제거
	            loadingMessage.remove();
	        }
	    });
	}



	// 스크롤 이벤트 핸들러
	$(window).scroll(function () {
	    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
	        if (!loading) { // 로딩 중인지 확인
	            loading = true; // 로딩 중 플래그 설정

	            $.ajax({
	                url: "/jiqoo/loadMoreComments",
	                type: "get",
	                data: {
	                    jiqooNo: jiqooNo,
	                    offset: currentOffset,
	                    limit: 10
	                },
	                success: function (data) {
	                    var commentContainer = $("#comment-container");

	                    if (data.length > 0) {
	                        var commentList = $("<ul>").addClass("comment-list");

	                        data.forEach(comment => {
	                            var commentItem = createCommentItem(comment);
	                            commentList.append(commentItem);
	                        });

	                        commentContainer.append(commentList);

	                        currentOffset += 10;
	                    }

	                    loading = false; // 로딩 완료 후 플래그 재설정
	                },
	                error: function () {
	                    const errorContainer = $("#error-container");
	                    errorContainer.text("댓글을 불러오는 중 오류가 발생했습니다.");

	                    loading = false; // 로딩 완료 후 플래그 재설정
	                }
	            });
	        }
	    }
	});


	function createCommentItem(comment) {
		var currentUserId = "${sessionScope.userId}";
		console.log(currentUserId);
	    var commentItem = $("<li>").addClass("comment");
	    var commentText = $("<p>").addClass("comment-text").text(comment.comtContent);
	    if(commentText.text().includes('삭제된 댓글입니다.')){
	    	commentText.css({
	    		color : '#ccc'
	    	})
	    }
	    // 댓글 작성자의 정보와 작성 날짜, 액션 메뉴 등을 추가합니다
	    var userInfo = $("<div>").addClass("user-info");
	    var userImage = $("<img>").attr("src", comment.user.userPhotoPath).attr("alt", "UserPhoto");
	    var username = $("<span>").addClass("username").text(comment.user.userNickname);
	    var date = $("<span>").addClass("date").text(formatDate(comment.comtDate));

	    // 액션 메뉴 추가
	    var actionMenuBtn = $("<span>").attr("id", "action_menu_btn").html("<i class='bi bi-three-dots-vertical'></i>");
	    var actionMenu = $("<div>").addClass("action_menu");
	    var actionMenuList = $("<ul>");

	    // 프로필 보기 메뉴
	    var profileMenuItem = $("<li>").html("<a href='#'><i class='bi bi-person-vcard'></i> 프로필 보기");

	    actionMenuList.append(profileMenuItem);


	    actionMenu.append(actionMenuList);

	    userInfo.append(userImage);
	    userInfo.append(username);
	    userInfo.append(date);

	    // 수정 및 삭제 메뉴 (댓글 작성자와 현재 사용자를 비교하여 표시 여부 결정)
	    var isCurrentUser = comment.user.userId === currentUserId;
	    console.log(isCurrentUser);
	    if (isCurrentUser) {
	        var modifyLink = $("<a>").attr("href", 'javascript:void(0)').html('<i class="bi bi-pencil"></i>').data("comtNo", comment.comtNo).data("comtContent", comment.comtContent).on("click", function() { modifyView(this, comment.comtContent, comment.comtNo);});
	        var removeLink = $("<a>").attr("href", 'javascript:void(0)').html('<i class="bi bi-x"></i>').data("comtNo", comment.comtNo).on("click", function() {removeComment(comment.comtNo);});
	        userInfo.append(modifyLink);
	        userInfo.append(removeLink);
	    }

	    // 답글쓰기 링크 (pComtNo가 0이 아닌 경우에 표시)
	    if (comment.pComtNo === 0) {
	        var replyLink = $("<a>").attr("href", 'javascript:void(0)').data("pComtNo", comment.comtNo).text("답글쓰기");
	        replyLink.on("click", function() {
	            var pComtNo = $(this).data("pComtNo");
	            showReplyForm(this, pComtNo);
	        });
	        userInfo.append(replyLink);
	    }

	    // 신고하기 메뉴 (댓글 작성자와 현재 사용자를 비교하여 표시 여부 결정)
	    var showReportLink = !isCurrentUser;
	    if (showReportLink) {
	        var reportMenuItem = $("<li>").html(`<a href='#' data-bs-toggle='modal' data-bs-target='#reportModal'><i class='bi bi-exclamation-triangle'></i> 신고하기`);
	        actionMenuList.append(reportMenuItem);
	    }

	    commentItem.append(actionMenuBtn);
	    commentItem.append(actionMenu);
	    commentItem.append(userInfo);
	    commentItem.append(commentText);

	    // comtNo를 input hidden 요소로 추가
	    var comtNoInput = $("<input>").attr("type", "hidden").val(comment.comtNo);
	    commentItem.append(comtNoInput);

	    // comment.pComtNo가 0이 아닌 경우 클래스 추가
	    if (comment.pComtNo !== 0) {
	        commentItem.addClass("has-parent-comment");
	    }

	    return commentItem;
	}
	
	function formatDate(date) {
	    var d = new Date(date);
	    var year = d.getFullYear().toString().slice(-2);
	    var month = ('0' + (d.getMonth() + 1)).slice(-2);
	    var day = ('0' + d.getDate()).slice(-2);
	    var hours = ('0' + d.getHours()).slice(-2);
	    var minutes = ('0' + d.getMinutes()).slice(-2);
	    var formattedDate = year + '/' + month + '/' + day + ' ' + hours + ':' + minutes;
	    return formattedDate;
	}

	// 좋아요
	function like() {
		var jiqooNo = ${jiqoo.jiqooNo };
		var likeCount = ${likeCount };
		if (currentUserId == "") {
	        if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
	            // 사용자가 확인을 누르면 로그인 페이지로 이동
	            window.location.href = "/user/login";
	            return; // 이동 후 함수를 종료
	        }
	    }else {
	    	$.ajax({
	    		url: "/jiqoo/like",
	    		type: "get",
	    		data: {
	    			refPostNo : jiqooNo
	    		},
	    		success: function(data) {
	    			if (data === "insert") {
	                    $("#likeButton i").removeClass("bi-heart").addClass("bi-heart-fill");
	                    updateLikeCount(1); // 좋아요 숫자를 1 증가
	                    alert("좋아요를 등록하였습니다.");
	                } else if (data === "delete") {
	                    $("#likeButton i").removeClass("bi-heart-fill").addClass("bi-heart");
	                    updateLikeCount(-1); // 좋아요 숫자를 1 감소
	                    alert("좋아요를 취소하였습니다.");
	                } else if (data === "fail") {
	                    alert("좋아요에 실패하였습니다.");
	                }
	    		}, error: function () {
		            alert("관리자에게 문의해주세요");
		        }
	    	});
	    }
	}
	
	function updateLikeCount(change) {
	    var likeCountElement = document.getElementById("like-count");
	    var currentLikeCount = parseInt(likeCountElement.textContent);
	    var newLikeCount = currentLikeCount + change;
	    likeCountElement.textContent = newLikeCount;
	}

	</script>

</body>

</html>