<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <title>지꾸 마이페이지</title>
        
        <!-- Favicons -->
        <link href="../resources/assets/img/earth-globe.png" rel="icon">
        
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        
        <!-- Vendor CSS Files -->
        <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        
        <!-- Template Main CSS File -->
        <link href="../resources/assets/css/style.css" rel="stylesheet">
        <link href="../resources/assets/css/header.css" rel="stylesheet">
        <link href="../resources/assets/css/footer.css" rel="stylesheet">

        <!-- datepicker css, js -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
        

        <!-- myPage css-->
        <link href="../resources/assets/css/myPage.css" rel="stylesheet">
    </head>


    <body class="text-center">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include> 
        <!-- ======== hero section ===========-->
        <section id="hero">
            <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                viewBox="0 24 150 28 " preserveAspectRatio="none">
                <defs>
                <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
                </defs>
                <g class="wave1">
                <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .1)">
                </g>
                <g class="wave2">
                <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .2)">
                </g>
                <g class="wave3">
                <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
                </g>
            </svg>
        </section>
        <!-- main -->
        <main>
            <!-- 프로필 -->
            <div>
                <div class="profile-header bg"></div>
                <div class="profile-body text-center">
                	<c:if test="${user.userPhotoRename eq null}">
	                	<img alt="프로필사진" class="profile-img" src="../resources/assets/img/no-profile.png">
                	</c:if>
                	<c:if test="${user.userPhotoRename ne null}">
	                	<img alt="프로필사진" class="profile-img img-border-light" src="${user.userPhotoPath }">
                	</c:if>
                	<c:if test="${user.userId eq sessionScope.userId}">
                	<div class="icon-relative">
	                	<img alt="프로필사진변경" id="openChangePhotoModal" class="change-profile-icon" src="../resources/assets/img/user/pencil.png">
                	</div>
                	</c:if>
                    <h2 class="zero-margin">${user.userNickname }</h2>
                    <p class="zero-margin fontGray">${user.userId }</p><br>
                    <p class="zero-margin fontGray">${user.userInfo }</p>
                    <div class="profile-cnt">
                        <div class="profile-cnt-item">
                            <div class="profile-cnt-total"><a href="#">21</a></div>
                            <div class="profile-cnt-text">게시글</div>
                        </div>
                        <div class="profile-cnt-item profile-cnt-border">
                            <div class="profile-cnt-total"><a data-bs-toggle="modal" href="#followerModal">${user.followers }</a></div>
                            <div class="profile-cnt-text">팔로워</div>
                        </div>
                        <div class="profile-cnt-item">
                            <div class="profile-cnt-total"><a data-bs-toggle="modal" href="#followingModal">${user.followings }</a></div>
                            <div class="profile-cnt-text">팔로잉</div>
                        </div>
                    </div>
                    <div class="profile-button">
                    <c:if test="${user.userId ne sessionScope.userId}">
                    	<button class="btn btn-sm profile-btn">Follow</button>
                    </c:if>
                    <c:if test="${user.userId eq sessionScope.userId}">
                    	<a href="/user/modify" class="btn btn-sm profile-btn" >Edit</a>
                    </c:if>
                    <button class="btn btn-sm profile-btn" style="margin-left: 40px;">Message</button>
                    </div>
                </div>
            </div>
            <input type="hidden" id="dateInput">
            <div class="container">
                <div class="row justify-content-center">
                    <!-- 캘린더 -->
                    <div class="col-md-12 col-lg-5">
                        <div id="calendar"></div>
                    </div>
                    <div class="col-md-12 col-lg-7">
                        <!-- 마이페이지 네비탭 -->
                        <div id="myPageNav">
                            <ul class="nav nav-pills" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a href="#jiqoo" class="nav-link active" data-toggle="pill" role="tab" aria-controls="jiqoo" aria-selected="true">지꾸</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="#moqoo" class="nav-link" data-toggle="pill" role="tab" aria-controls="moqoo" aria-selected="false">모꾸</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="#reply" class="nav-link" data-toggle="pill" role="tab" aria-controls="reply" aria-selected="false">댓글</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="#like" class="nav-link" data-toggle="pill" role="tab" aria-controls="like">좋아요</a>
                                </li>
                            </ul>
                        </div>
                        <!-- 탭 내용 -->
                        <div class="tab-content" id="pills-tabContent" style="margin-top: 30px;">
                            <!-- 지꾸리스트 -->
                            <%-- <c:if test="${ }"> --%>
	                            <div class="tab-pane fade show active" id="jiqoo" role="tabpanel" aria-labelledby="jiqoo"> 
	                                <div class="noData">
	                                    <img src="../resources/assets/img/user/jiqooNoData.png" alt="noData" style="width: 100px;"><br><br>
	                                    <p>해당 날짜에 활동하신 내역이 없습니다!</p>
	                                </div>
	                            </div>
                            <%-- </c:if> --%>
                            <!-- 모꾸리스트 -->
                            <div class="tab-pane fade" id="moqoo" role="tabpanel" aria-labelledby="moqoo">
                                <span>총 </span><span class="greenColor">5</span>개의 <span class="greenColor">모꾸</span>를 등록하셨습니다.
                                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            </div>
                            <!-- 댓글리스트 -->
                            <div class="tab-pane fade" id="reply" role="tabpanel" aria-labelledby="reply">
                                <span>총 </span><span class="greenColor">5</span>개의 <span class="greenColor">댓글</span>을 등록하셨습니다.
                                <div class="myReply row">
                                    <a class="myReplyRefTitle" href="#">부대찌개 맛집</a>
                                    <div class="col-2 myReplyProfile">
                                        <img src="../resources/assets/img/testimonials/testimonials-3.jpg"><br>
                                        <p>바소잔</p>
                                    </div>
                                    <div class="col-10 myReplyContent text-start">
                                        <p>존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛</p>
                                        <div class="row align-items-center">
                                            <span class="col-7">2023-10-01</span>
                                            <div class="col-5 myReplyContentBtn">
                                                <button class="btn btn-sm follow-btn col-2">수정</button>
                                                <button class="btn btn-sm follow-btn col-3">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="myReply row">
                                    <a class="myReplyRefTitle" href="#">부대찌개 맛집</a>
                                    <div class="col-2 myReplyProfile">
                                        <img src="../resources/assets/img/testimonials/testimonials-3.jpg"><br>
                                        <p>바소잔</p>
                                    </div>
                                    <div class="col-10 myReplyContent text-start">
                                        <p>존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛</p>
                                        <div class="row align-items-center">
                                            <span class="col-7">2023-10-01</span>
                                            <div class="col-5 myReplyContentBtn">
                                                <button class="btn btn-sm follow-btn col-2">수정</button>
                                                <button class="btn btn-sm follow-btn col-3">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="myReply row">
                                    <a class="myReplyRefTitle" href="#">부대찌개 맛집</a>
                                    <div class="col-2 myReplyProfile">
                                        <img src="../resources/assets/img/testimonials/testimonials-3.jpg"><br>
                                        <p>바소잔</p>
                                    </div>
                                    <div class="col-10 myReplyContent text-start">
                                        <p>존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛</p>
                                        <div class="row align-items-center">
                                            <span class="col-7">2023-10-01</span>
                                            <div class="col-5 myReplyContentBtn">
                                                <button class="btn btn-sm follow-btn col-2">수정</button>
                                                <button class="btn btn-sm follow-btn col-3">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="myReply row">
                                    <a class="myReplyRefTitle" href="#">부대찌개 맛집</a>
                                    <div class="col-2 myReplyProfile">
                                        <img src="../resources/assets/img/testimonials/testimonials-3.jpg"><br>
                                        <p>바소잔</p>
                                    </div>
                                    <div class="col-10 myReplyContent text-start">
                                        <p>존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛</p>
                                        <div class="row align-items-center">
                                            <span class="col-7">2023-10-01</span>
                                            <div class="col-5 myReplyContentBtn">
                                                <button class="btn btn-sm follow-btn col-2">수정</button>
                                                <button class="btn btn-sm follow-btn col-3">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="myReply row">
                                    <a class="myReplyRefTitle" href="#">부대찌개 맛집</a>
                                    <div class="col-2 myReplyProfile">
                                        <img src="../resources/assets/img/testimonials/testimonials-3.jpg"><br>
                                        <p>바소잔</p>
                                    </div>
                                    <div class="col-10 myReplyContent text-start">
                                        <p>존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛</p>
                                        <div class="row align-items-center">
                                            <span class="col-7">2023-10-01</span>
                                            <div class="col-5 myReplyContentBtn">
                                                <button class="btn btn-sm follow-btn col-2">수정</button>
                                                <button class="btn btn-sm follow-btn col-3">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                                <div class="myReply row">
                                    <a class="myReplyRefTitle" href="#">부대찌개 맛집</a>
                                    <div class="col-2 myReplyProfile">
                                        <img src="../resources/assets/img/testimonials/testimonials-3.jpg"><br>
                                        <p>바소잔</p>
                                    </div>
                                    <div class="col-10 myReplyContent text-start">
                                        <p>존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛 존맛</p>
                                        <div class="row align-items-center">
                                            <span class="col-7">2023-10-01</span>
                                            <div class="col-5 myReplyContentBtn">
                                                <button class="btn btn-sm follow-btn col-2">수정</button>
                                                <button class="btn btn-sm follow-btn col-3">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 좋아요리스트 -->
                            <div class="tab-pane fade" id="like" role="tabpanel" aria-labelledby="like">
                                <span>총 </span><span class="greenColor">5</span>개의 글에 <span class="greenColor">좋아요</span>를 누르셨습니다.
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--Follower Modal-->
            <div class="modal fade" id="followerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">${user.userNickname}님의 팔로워</h1>
                        <button type="button" class="btn-close closeModalButton" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    <c:forEach items="${followersList}" var="follower">
                        <div class="row">
	                        <div class="col-3 modal-padding">
	                        	<c:if test="${follower.userPhotoRename eq null}">
		                			<img class="modal-profile-img" src="../resources/assets/img/no-profile.png" alt="프로필사진" >
	                			</c:if>
	                			<c:if test="${follower.userPhotoRename ne null}">
	                                <img class="modal-profile-img modal-profile-border" src="${follower.userPhotoPath }" alt="프로필사진" >
	                            </c:if>
	                        </div>
                            <div class="col-6 list-sort">
                                <div class="row">
                                    <div>${follower.userId }</div>
                                </div>
                                <div class="row">
                                    <div>${follower.userNickname }</div>
                                </div>
                            </div>
                            <div class="col-3 list-sort">
				                <c:if test="${follower.checkFollow}">
				                    <button class="btn btn-sm unfollow-btn" data-user-id="${follower.userId}">Unfollow</button>
				                </c:if>
				                <c:if test="${not follower.checkFollow}">
				                    <button class="btn btn-sm follow-btn" data-user-id="${follower.userId}">Follow</button>
				                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    </div>
                </div>
            </div>
            <!--Following Modal-->
            <div class="modal fade" id="followingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">${user.userNickname}님의 팔로잉</h1>
                        <button type="button" class="btn-close closeModalButton" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    <c:forEach items="${followingsList }" var="following">
                        <div class="row">
                            <div class="col-3 modal-padding">
                                <c:if test="${following.userPhotoRename eq null}">
		                			<img class="modal-profile-img" src="../resources/assets/img/no-profile.png" alt="프로필사진" >
	                			</c:if>
	                			<c:if test="${following.userPhotoRename ne null}">
	                                <img class="modal-profile-img modal-profile-border" src="${following.userPhotoPath }" alt="프로필사진" >
	                            </c:if>
                            </div>
                            <div class="col-6 list-sort">
                                <div class="row">
                                    <div>${following.userId }</div>
                                </div>
                                <div class="row">
                                    <div>${following.userNickname }</div>
                                </div>
                            </div>
                            <div class="col-3 list-sort">
                                <button class="btn btn-sm unfollow-btn" data-user-id="${following.userId}">Unfollow</button>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    </div>
                </div>
            </div>
            <!-- 사진변경 Modal -->
            <div class="modal fade" id="changePhotoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                	<div class="modal-header">
				    	<h5 class="modal-title">프로필 사진 변경</h5>
				    	<button type="button" class="btn-close photo-reset" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
                    <div class="modal-body" style="margin-top: 20px;">
                    	<%-- <img src="${pageContext.request.contextPath}/user/photoView" class="profilePhoto"> --%>
			            <input type="file" class="form-control form-control-sm" id="modalUploadFile" name="uploadFile" accept="image/gif, image/png, image/jpeg" style="float:left;">
                    </div>
                    <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;">
                        <button type="button" class="btn btn-sm follow-btn" id="photoChange" >변경</button>
                        <button type="button" class="btn btn-sm follow-btn" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
                </div>
            </div>            
        </main>
        
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

        <!-- Vendor JS Files -->
        <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="../resources/assets/vendor/aos/aos.js"></script>
        <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="../resources/assets/js/main.js"></script>

        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script>
        	// unfollow 버튼
        	$(".unfollow-btn").on("click", function(){
        		const userId = $(this).data('user-id'); // 클릭한 버튼의 데이터(팔로잉userId) 저장
        		const button = $(this);
        		$.ajax({
                    type: 'POST',
                    url: '/user/unfollow',
                    data: { userId: userId },
                    success: function(result) {
                        if (result === "success") {
                        	button.removeClass("unfollow-btn").addClass("follow-btn");
                            button.text("Follow");
                        } else if (result === "checkLogin") {
                            alert("로그인 후 이용해주세요.");
                            window.location.href = "/user/login"; 
                        } else {
                            alert("언팔로우가 실행되지 않았습니다. 다시 시도해주세요.");
                            location.reload();
                        }
                    },
                    error: function(error) {
                    	alert("서버오류가 발생했습니다. 다시 시도해주세요.");
                    	location.reload();
                    }
        		});
        	})
        	
        	//follow버튼
        	$(".follow-btn").on("click", function () {
			    const userId = $(this).data('user-id'); 
			    const button = $(this);
			
			    $.ajax({
			        type: 'POST',
			        url: '/user/follow', 
			        data: { userId: userId },
			        success: function (result) {
			            if (result === "success") {
			                button.removeClass("follow-btn").addClass("unfollow-btn");
			                button.text("Unfollow");
			            } else if (result === "checkLogin") {
			                alert("로그인 후 이용해주세요.");
			                window.location.href = "/user/login";
			            } else {
			                alert("팔로우가 실행되지 않았습니다. 다시 시도해주세요.");
			                location.reload();
			            }
			        },
			        error: function (error) {
			            alert("서버오류가 발생했습니다. 다시 시도해주세요.");
			            location.reload();
			        }
			    });
			});
        	
        	//모달 닫기버튼 누르면 리로드
            $(".closeModalButton").on("click", function() {
                $("this").modal("hide");
                location.reload();
            });
        	
        	// 사진변경모달오픈
			$("#openChangePhotoModal").on("click", function(){
				$("#changePhotoModal").modal("show");
			})
        
        	// 사진변경
			$("#photoChange").on("click", function(){
			    let uploadFile = $("#modalUploadFile")[0].files[0];
			
			    if (uploadFile) {
			        let formData = new FormData();
			        formData.append("uploadFile", uploadFile);
			
			        $.ajax({
			            url: "/user/updatePhoto",
			            type: "POST",
			            data: formData,
			            processData: false,
			            contentType: false,
			            success: function(response) {
			                if (response.success === "success") {
			                    alert("프로필 사진 변경 성공");
			                    $(".modal").modal("hide");
			                    location.reload();
			                } else if (response.checkLogin === "checkLogin") {
			                    alert("로그인 후 이용바랍니다.");
			                    window.location.href = "/user/login";   
			                } else {
			                    alert("프로필 사진이 변경되지 않았습니다. 다시 시도해주세요.");
			                }
			            },
			            error: function(error) {
			                alert("[서버오류] 관리자에게 문의바랍니다.");
			            }
			        });
			    } else {
			        alert("프로필 사진을 선택해주세요.");
			        return;
			    }
			});
			
	        // $.datepicker.setDefaults({
	        //     prevText: "이전달",
	        //     nextText: "다음달",
	        //     currentText: "오늘",
	        //     monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
	        //     "7월", "8월", "9월", "10월", "11월", "12월"
	        //     ],
	        //     monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
	        //     "7월", "8월", "9월", "10월", "11월", "12월"
	        //     ],
	        //     dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
	        //     dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	        //     dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	        //     weekHeader: "주",
	        //     dateFormat: "yy.m.d", // 날짜형태 예)yy년 m월 d일
	        //     firstDay: 0,
	        //     isRTL: false,
	        //     showMonthAfterYear: true,
	        //     yearSuffix: "년"
	        // })
	
	        $("#calendar").datepicker({
	            dateFormat: "yy-mm-dd", // 날짜 형식을 설정
	            onSelect: function(dateText) {
	                // 선택한 날짜를 #dateInput의 값으로 설정
	                $('#dateInput').val(dateText);
	            }
	        })
	
	        // 탭을 클릭했을 때 발생하는 이벤트 처리
	        $(document).ready(function () {
	            $('.nav-link').on('click', function () {
	                $('.nav-link').removeClass('active'); // 현재 활성화된 탭의 active 클래스 제거
	                $(this).addClass('active'); //클릭한 탭에 active클래스 추가 후 활성화
	
	                var target = $(this).attr('href'); // show active 클래스 제거 전에 현재 클릭한 탭의 href 속성값 저장
	                $('.tab-pane').removeClass('show active'); // tab내용(.tab-pane)에 적용되어있는 show active클래스를 모두 제거
	                $(target).addClass('show active'); // target에 저장된 탭내용에 addClass로 show active 추가->활성화
	            });
	        });
        </script>
    </body>
</html>
