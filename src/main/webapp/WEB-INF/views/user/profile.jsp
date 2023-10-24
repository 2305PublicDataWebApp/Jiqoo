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
        <title>지꾸 : No.1 지도 다이어리</title>
        
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
        	<input type="hidden" id="profileUserId" value="${user.userId }">
            <!-- 프로필 -->
            <div>
                <div class="profile-header bg"></div>
                <div class="profile-body text-center">
                	<c:if test="${user.userPhotoRename eq null}">
	                	<img alt="프로필사진" class="profile-img" src="../resources/assets/img/no-profile.png" >
                	</c:if>
                	<c:if test="${user.userPhotoRename ne null}">
	                	<img alt="프로필사진" class="profile-img img-border-light" src="${user.userPhotoPath }">
                	</c:if>
                    <h2 class="zero-margin">${user.userNickname }</h2>
                    <c:if test="${user.platformType eq 'normal'}">
                    	<p class="zero-margin fontGray">${user.userId }</p><br>
                    </c:if>
                    <c:if test="${user.platformType ne 'normal'}">
                    	<p class="zero-margin fontGray">${user.userEmail }</p><br>
                    </c:if>
                    <p class="zero-margin fontGray">${user.userInfo }</p>
                    <div class="profile-cnt">
                        <div class="profile-cnt-item">
                            <div class="profile-cnt-total"><a href="#">${user.jiqooCount + user.moqooCount }</a></div>
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
<%--                     <input type="text" value="${user.checkIsFollow}"> --%>
                    <c:if test="${sessionScope.userId ne null and sessionScope.userId ne follower.userId}">
		                <c:if test="${user.checkIsFollow}">
		                    <button class="btn btn-sm unfollow-btn" data-user-id="${user.userId}">Unfollow</button>
		                </c:if>
		                <c:if test="${not user.checkIsFollow}">
		                    <button class="btn btn-sm follow-btn" data-user-id="${user.userId}">Follow</button>
		                </c:if>
                    <button class="btn btn-sm profile-btn" style="margin-left: 40px;">Message</button>
	                </c:if>
                    </div>
                </div>
            </div>
            
            <input type="hidden" id="inputDate" name="inputDate" value="">
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
                                    <a href="javascript:void(0)" id="jiqoo" class="nav-link active" data-toggle="pill" role="tab" aria-controls="jiqoo" aria-selected="true">지꾸</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="javascript:void(0)" id="moqoo"class="nav-link" data-toggle="pill" role="tab" aria-controls="moqoo" aria-selected="false">모꾸</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="javascript:void(0)" id="myComment" class="nav-link" data-toggle="pill" role="tab" aria-controls="myComment" aria-selected="false">댓글</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="javascript:void(0)" id="like" class="nav-link" data-toggle="pill" role="tab" aria-controls="like">좋아요</a>
                                </li>
                            </ul>
                        </div>
                        <!-- 탭 내용 -->
                        <div class="tab-content" id="pills-tabContent" style="margin-top: 30px;">
                        	<div id="tabCount"></div>
                        	<div class="container" id="tabContainer" style="margin-top:20px;">
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
                    <c:if test="${user.followers eq 0}">
                    	<div style="padding:20px;">
	                    	${user.userNickname}님의 팔로워 사용자가 없습니다.
                    	</div>
                    </c:if>
                    <c:if test="${user.followers ne 0}">
	                    <c:forEach items="${followersList}" var="follower">
	                        <div class="row">
		                        <div class="col-3 modal-padding">
		                    	<a href="/user/profile?userId=${follower.userId }">
		                        	<c:if test="${follower.userPhotoRename eq null}">
			                			<img class="modal-profile-img" src="../resources/assets/img/no-profile.png" alt="프로필사진" >
		                			</c:if>
		                			<c:if test="${follower.userPhotoRename ne null}">
		                                <img class="modal-profile-img modal-profile-border" src="${follower.userPhotoPath }" alt="프로필사진" >
		                            </c:if>
			                    </a>
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
	                            	<c:if test="${sessionScope.userId ne null and sessionScope.userId ne follower.userId}">
						                <c:if test="${follower.checkIsFollow}">
						                    <button class="btn btn-sm follow unfollow-btn" data-user-id="${follower.userId}">Unfollow</button>
						                </c:if>
						                <c:if test="${not follower.checkIsFollow}">
						                    <button class="btn btn-sm follow follow-btn" data-user-id="${follower.userId}">Follow</button>
						                </c:if>
					                </c:if>
	                            </div>
	                        </div>
	                    </c:forEach>
                    </c:if>
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
                    <c:if test="${user.followings eq 0}">
                    	<div style="padding:20px;">
	                    	${user.userNickname}님의 팔로잉 사용자가 없습니다.
                    	</div>
                    </c:if>
                    <c:if test="${user.followings ne 0}">
	                    <c:forEach items="${followingsList }" var="following">
	                        <div class="row">
	                            <div class="col-3 modal-padding">
			                    <a href="/user/profile?userId=${following.userId }">
	                                <c:if test="${following.userPhotoRename eq null}">
			                			<img class="modal-profile-img" src="../resources/assets/img/no-profile.png" alt="프로필사진" >
		                			</c:if>
		                			<c:if test="${following.userPhotoRename ne null}">
		                                <img class="modal-profile-img modal-profile-border" src="${following.userPhotoPath }" alt="프로필사진" >
		                            </c:if>
		                        </a>
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
	                            	<c:if test="${sessionScope.userId ne null and sessionScope.userId ne follower.userId}">
						                <c:if test="${following.checkIsFollow}">
						                    <button class="btn btn-sm follow unfollow-btn" data-user-id="${following.userId}">Unfollow</button>
						                </c:if>
						                <c:if test="${not following.checkIsFollow}">
						                    <button class="btn btn-sm follow follow-btn" data-user-id="${following.userId}">Follow</button>
						                </c:if>
					                </c:if>
	                            </div>
	                        </div>
	                    </c:forEach>
                    </c:if>
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
                        <button type="button" class="btn btn-sm change-photo-btn" id="photoChange" >변경</button>
                        <button type="button" class="btn btn-sm change-photo-btn" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
                </div>
            </div>            
        </main>
        
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>
<%--         <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script> --%>

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
			// 공통설정
			var currentPage = 1;
			var perPage = 3;
			var tabCount = $("#tabCount");
			var tabContainer = $("#tabContainer");
			var isLoading = false; // 현재 페이지가 로딩중인지 여부
			var hasMoreData = true; // 더 불러올 데이터가 있는지 여부
			var dataType = null;
			var loadMoreType = null;
	        
	     	// 각 카테고리별 버튼 클릭 이벤트
	        $("#jiqoo").on("click", function(e) {
	        	e.preventDefault();
	        	console.log("지꾸클릭")
	        	loadMoreType = "jiqoo";
	            loadTabContent("jiqoo");
	        });

	        $("#moqoo").on("click", function(e) {
	        	e.preventDefault();
	        	console.log("모꾸클릭")
	        	loadMoreType = "moqoo";
	            loadTabContent("moqoo");
	        });

	        $("#myComment").on("click", function(e) {
	        	e.preventDefault();
	        	console.log("댓글클릭")
	        	loadMoreType = "myComment";
	            loadTabContent("comment");
	        });
	        
	        $("#like").on("click", function(e) {
	        	e.preventDefault();
	        	console.log("좋아요클릭")
	        	loadMoreType = "like";
    	 		loadTabContent("like");
    	 	});
	        
	        $(".profile-cnt-total a").on("click", function() {
	            loadTabContent("jiqoo");
	            $("#jiqoo").tab("show");
	        });
	        
	        // 버튼 클릭하면 실행될 함수-> container비우고 페이징세팅
	        function loadTabContent(dataType) {
	        	console.log("dataType : "+dataType)
// 	            if (isLoading || !hasMoreData) {
// 	                return;
// 	            }
	            tabContainer.empty();
	            currentPage = 1;
	            perPage = 3;
	            console.log("loadTabContent()->loadTabData() 호출");
	            loadTabData(dataType); // 각 카테고리별 list를 호출하도록 필터 역할 함 
	        }
	        
	     	// 페이지 로드 시 초기 탭 데이터 로딩
	        loadTabContent("jiqoo");
	        
	        $(window).scroll(function() {
				if (isLoading || !hasMoreData) {
				    return;
				}
  
				if ($(window).scrollTop() + $(window).height() >= $(document).height() - 200) {
					console.log('스크롤이벤트실행중');
					var result = 0;
					if(!loadMoreType || loadMoreType === "jiqoo") {
// 						isLoading = true;
						loadJiqooList(currentPage, perPage);
					}else if(loadMoreType === "moqoo") {
						loadMoqooList(currentPage, perPage);
					}else if(loadMoreType === "myComment") {
						loadComments(currentPage, perPage);
					}else if(loadMoreType === "like") {
						loadLikedPosts(currentPage, perPage);
					}
				}
	        });

	        
	        function loadTabData(dataType) {
            	console.log("loadTabData함수 : " + dataType);
            	var count = 0;
	            if (dataType === 'jiqoo') { // dataType이 'jiqoo'이면 지꾸 데이터 로드
	            	count = loadJiqooList(currentPage, perPage);
	            	console.log("loadJiqooList실행")
	            } else if (dataType === 'moqoo') { // dataType이 'moqoo'이면 지꾸 데이터 로드
	            	loadMoqooList(currentPage, perPage);
	            	console.log("loadMoqooList실행")
	            } else if (dataType === 'comment') { // dataType이 'comment'이면 댓글 데이터 로드
	                loadComments(currentPage, perPage);
	            	console.log("loadComments실행")
	            } else if (dataType === 'like') { // dataType이 'comment'이면 댓글 데이터 로드
	            	loadLikedPosts(currentPage, perPage);
	            	console.log("loadLikedPosts실행")
	            }
	        }
	        
			//////////////////////////////////////////////// 지꾸 ////////////////////////////////////////////////

			
			function loadJiqooList(page, perPage) {
// 	        	if(!hasMoreData) {
// 	        		return;
// 	        	}
	        	var userId = $("#profileUserId").val();
				var startNo = (page * perPage) - (perPage - 1);
 		        var endNo =  page * perPage;
 		        var searchDate = $("#inputDate").val();
				var requestData = {
					startNo : startNo, 
        			endNo : endNo,
        			searchDate : searchDate,
        			userId : userId
				}
				var result = 0;
	        	$.ajax({
	        		url: "/user/jiqooList",
	        		type: "POST",
	        		data: requestData,
	        		success: function(data){
	        			result = data.length;
// 	        			isLoading = false;
	        			if(data === null || data.length === 0) {
	        				if(page === 1) {
	        					tabCount.empty();
	        					tabContainer.empty();
	        					var noDataHtml = 
	        						"<div class='tab-pane fade show active' id='jiqoo' role='tabpanel' aria-labelledby='jiqoo'>" +
			                        "   <div class='noData'>" +
			                        "       <img src='../resources/assets/img/user/jiqooNoData.png' alt='noData' style='width: 100px;'><br><br>" +
			                        "       <p>작성하신 게시글 없습니다.</p>" +
			                        "   </div>" +
			                        "</div>";
		                        tabContainer.append(noDataHtml);
	        				}
	        				//hasMoreData = false;
	        			} else {
	        				for(var i = 0; i < data.length; i++) {
	        					var myJiqooList = data[i];
	        					var jiqooHtml = "<div class='listContent row'>"+
					                           	"	<a href='/jiqoo/detail?jiqooNo="+myJiqooList.jiqooNo+"'>"+
					                       		"	<div class='post-header'>"+
					                       		"		<div class='category'>"+
					                       		"			<img class='category-img' alt='카테고리' src='"+myJiqooList.cImgPath+"'>"+
					                       		"		</div>"+
					                       		"		<div class='location'>"+
					                       		"			<span class='location-text'>"+myJiqooList.jiqooW3W+"</span>"+
					                       		"		</div>"+
					                       		"	</div>"+
					                   			"	<div class='title text-start'>"+myJiqooList.jiqooTitle+"</div>"+
					                   			"	<hr>"+
					                       		"	<div class='jiqoo-writer-info'>"+
					                           	"		<div id='profile-img' class='jiqooProfile text-start' >";
	                            if (myJiqooList.userPhotoPath !== null && myJiqooList.userPhotoPath !== '') {
	                            	jiqooHtml += "			<img src='" + myJiqooList.userPhotoPath + "'><br>";
	                            } else {
	                            	jiqooHtml += "			<img src='../resources/assets/img/no-profile.png'><br>";
	                            }
	                            	jiqooHtml +="		</div>"+
					                           	"		<div class='jiqoo-writer'>"+
					                           	"			<div class='author text-start'>"+myJiqooList.jiqooWriter+"</div>"+
							                	"          	<div>"+
							                   	"				<span>"+myJiqooList.jiqooDate+"</span>"+
							                   	"				<span style='margin:0 5px 0 20px;'>조회수</span>"+
							                   	"				<span>"+myJiqooList.jViewCount+"</span>"+
						                   		"			</div>"+
					                           	"		</div>"+
					                       		"	</div>"+
					                   			"	<div class='content text-start'>"+myJiqooList.jiqooContent+"</div>"+
					                       		"	</a>"+
										    	"</div>";

						    	tabContainer.append(jiqooHtml);
	        				}
	        			}
		                //$("#jiqooCount").text(data.length);
// 		                isLoading = false;
		                currentPage++;
	        		},
		            error: function(error) {
		            	console.log(error);
		            	alert("[지꾸]서버오류가 발생했습니다. 다시 시도해주세요.");
                    	location.reload();
		            }
	        	})
	        }
			
			
			//////////////////////////////////////////////// 모꾸 ////////////////////////////////////////////////
			function loadMoqooList(page, perPage) {
// 	        	if(!hasMoreData) {
// 	        		return;
// 	        	}
				var userId = $("#profileUserId").val();
				var startNo = (page * perPage) - (perPage - 1);
 		        var endNo =  page * perPage;
 		        var searchDate = $("#inputDate").val();
	        	$.ajax({
	        		url: "/user/moqooList",
	        		type: "GET",
	        		data: {
	        			startNo : startNo, 
	        			endNo : endNo,
	        			searchDate : searchDate,
	        			userId : userId
	        		},
	        		success: function(data){
// 	        			isLoading = false;
	        			if(data === null || data.length === 0) {
	        				if(page === 1) {
	        					tabCount.empty();
	        					tabContainer.empty();
	        					var noDataHtml = 
	        						"<div class='tab-pane fade show active' id='jiqoo' role='tabpanel' aria-labelledby='jiqoo'>" +
			                        "   <div class='noData'>" +
			                        "       <img src='../resources/assets/img/user/jiqooNoData.png' alt='noData' style='width: 100px;'><br><br>" +
			                        "       <p>작성하신 게시글 없습니다.</p>" +
			                        "   </div>" +
			                        "</div>";
		                        tabContainer.append(noDataHtml);
	        				}
// 	        				hasMoreData = false;
	        			} else {
	        				for(var i = 0; i < data.length; i++) {
	        					var myMoqooList = data[i];
	        					var moqooHtml = "<div class='listContent row'>"+
					                           	"	<a href='/moqoo/detail?moqooNo="+myMoqooList.moqooNo+"'>"+
					                       		"	<div class='post-header'>"+
					                       		"		<div class='category'>"+
					                       		"			<img class='category-img' alt='카테고리' src='"+myMoqooList.cImgPath+"'>"+
					                       		"		</div>"+
					                       		"		<div class='location'>"+
					                       		"			<span class='location-text'>"+myMoqooList.moqooW3W+"</span>"+
					                       		"		</div>"+
					                       		"	</div>"+
					                   			"	<div class='title text-start'>"+myMoqooList.moqooTitle+"</div>"+
					                   			"	<hr>"+
					                       		"	<div class='jiqoo-writer-info'>"+
					                           	"		<div id='profile-img' class='jiqooProfile text-start' >";
	                            if (myMoqooList.userPhotoPath !== null && myMoqooList.userPhotoPath !== '') {
	                            	moqooHtml += "			<img src='" + myMoqooList.userPhotoPath + "'><br>";
	                            } else {
	                            	moqooHtml += "			<img src='../resources/assets/img/no-profile.png'><br>";
	                            }
	                            	moqooHtml +="		</div>"+
					                           	"		<div class='jiqoo-writer'>"+
					                           	"			<div class='author text-start'>"+myMoqooList.moqooWriter+"</div>"+
							                	"          	<div>"+
							                   	"				<span>"+myMoqooList.moqooDay+"</span>"+
							                   	"				<span style='margin:0 5px 0 20px;'>조회수</span>"+
							                   	"				<span>"+myMoqooList.mViewCount+"</span>"+
						                   		"			</div>"+
					                           	"		</div>"+
					                       		"	</div>"+
					                   			"	<div class='content text-start'>"+myMoqooList.moqooContent+"</div>"+
					                       		"	</a>"+
										    	"</div>";

						    	tabContainer.append(moqooHtml);
	        				}
	        			}
		                //$("#jiqooCount").text(data.length);
// 		                isLoading = false;
		                currentPage++;
	        		},
		            error: function(error) {
		            	alert("서버오류가 발생했습니다. 다시 시도해주세요.");
                    	location.reload();
		            }
	        	})
	        }
			
			
        	//////////////////////////////////////////////// 댓글 ////////////////////////////////////////////////
        	
			// 댓글 조회
			function loadComments(page, perPage) {
// 			    if (!hasMoreData) {
// 			        return; //댓글 없으면 스크롤 이벤트 중지
// 			    }
			    var userId = $("#profileUserId").val();
				var startNo = (page * perPage) - (perPage - 1);
 		        var endNo =  page * perPage;
 		        var searchDate = $("#inputDate").val();
		        
		        $.ajax({
		            url: "/user/comtList",
		            type: "GET",
		            data: {
		            	startNo: startNo,
		            	endNo: endNo,
		            	searchDate : searchDate,
		            	userId
		            },
		            success: function(data) {
		                isLoading = false;
		                if (data === null || data.length === 0) {
		                	if(page === 1) {
		                		tabCount.empty();
		                		tabContainer.empty();
			                    var noDataHtml = 
			                        "<div class='tab-pane fade show active' id='jiqoo' role='tabpanel' aria-labelledby='jiqoo'>" +
			                        "   <div class='noData'>" +
			                        "       <img src='../resources/assets/img/user/jiqooNoData.png' alt='noData' style='width: 100px;'><br><br>" +
			                        "       <p>작성하신 댓글이 없습니다.</p>" +
			                        "   </div>" +
			                        "</div>";
		                        tabContainer.append(noDataHtml);
		                	}
// 		                	hasMoreData = false;
		                } else {
			                for (var i = 0; i < data.length; i++) {
			                	var myComtList = data[i];
				                var formatDate = myComtList.comtDate.split("T")[0];
			                	
			                	var boardType = null;
			                	var detailUrl = null;
			                	if(myComtList.cBoardType === 'M') {
			                		boardType = "모꾸";
			                		detailUrl = "/moqoo/detail?moqooNo=";
			                	} else if(myComtList.cBoardType === 'J'){
			                		boardType = "지꾸";
			                		detailUrl = "/jiqoo/detail?jiqooNo=";
			                	}
			                	
								var commentHtml = "<div class='comtListContent row'>"
													+"<div class='comtTitleArea'>"
														+"<span class='comtListTitle'>"+boardType+"</span>"
						                            	+"<a class='myReplyRefTitle' href='"+detailUrl+myComtList.refPostNo+"'>"+myComtList.postTitle+"</a>"
						                            +"</div>"
						                            +"<div class='col-2 myReplyProfile'>";
	                            // 조건부로 이미지를 추가
	                            if (myComtList.userPhotoPath !== null && myComtList.userPhotoPath !== '') {
	                                 commentHtml += "<img src='" + myComtList.userPhotoPath + "'><br>";
	                            } else {
	                                 commentHtml += "<img src='../resources/assets/img/no-profile.png'><br>";
	                            }             
	                            
	                            	commentHtml += "<p>"+myComtList.comtWriter+"</p>"
					                            +"</div>"
					                            +"<div class='col-10 myReplyContent text-start'>"
					                                +"<p>"+myComtList.comtContent+"</p>"
					                                +"<div class='row align-items-center'>"
					                                    +"<span class='col-7'>"+formatDate+"</span>"
					                                    +"<div class='col-5 myReplyContentBtn'>"
					                                        +"<button class='btn btn-sm follow-btn col-2'>수정</button>"
					                                        +"<button class='btn btn-sm follow-btn col-3'>삭제</button>"
					                                    +"</div>"
					                                +"</div>"
					                            +"</div>"
					                        +"</div>";				
		                        tabContainer.append(commentHtml);
			                }
		                }
						
		                $("#commentCount").text(data.length);
// 		                isLoading = false;
			            currentPage++;
		            },
		            error: function(error) {
		            	alert("서버오류가 발생했습니다. 다시 시도해주세요.");
                    	location.reload();
		            }
		        });
		    }
			//-----------------------------------------------------------------------------------------------------

			//////////////////////////////////////////////// 좋아요 ////////////////////////////////////////////////

        	
			// 좋아요 조회
			function loadLikedPosts(page, perPage) {
				console.log("like리스트 불러오기")
// 			    if (!hasMoreData) {
// 			        return; //댓글 없으면 스크롤 이벤트 중지
// 			    }
				var userId = $("#profileUserId").val();
				var startNo = (page * perPage) - (perPage - 1);
 		        var endNo =  page * perPage;
 		        var searchDate = $("#inputDate").val();
 		        
		        $.ajax({
		            url: "/user/likedList",
		            type: "GET",
		            data: {
		            	startNo: startNo,
		            	endNo: endNo,
		            	searchDate : searchDate,
		            	userId : userId
		            },
		            success: function(data) {
		                isLoading = false;
		                if (data === null || data.length === 0) {
		                	if(page === 1) {
		                		tabCount.empty();
		                		tabContainer.empty();
			                    var noDataHtml = 
			                        "<div class='tab-pane fade show active' id='jiqoo' role='tabpanel' aria-labelledby='jiqoo'>" +
			                        "   <div class='noData'>" +
			                        "       <img src='../resources/assets/img/user/jiqooNoData.png' alt='noData' style='width: 100px;'><br><br>" +
			                        "       <p>좋아요 게시물이 없습니다.</p>" +
			                        "   </div>" +
			                        "</div>";
		                        tabContainer.append(noDataHtml);
		                	}
// 		                	hasMoreData = false;
		                } else {
		                	
			                for (var i = 0; i < data.length; i++) {
			                	var likedList = data[i];
			                	
			                	var boardType = null;
			                	var detailUrl = null;
			                	if(likedList.boardType === 'M') {
			                		boardType = "모꾸";
			                		detailUrl = "/moqoo/detail?moqooNo=";
			                	} else if(likedList.boardType === 'J'){
			                		boardType = "지꾸";
			                		detailUrl = "/jiqoo/detail?jiqooNo=";
			                	}
			
	        					var likeHtml = "<div class='listContent row'>"+
					                           	"	<a href='"+detailUrl+likedList.postNo+"'>"+
					                           	"		<div class='text-start' style='margin-top:10px;'>"+
			                        			"			<span class='post-catagory'>"+boardType+"</span>"+
			                        			"		</div>"+
					                       		"	<div class='post-header'>"+
					                       		"		<div class='category'>"+
					                       		"			<img class='category-img' alt='카테고리' src='"+likedList.cImgPath+"'>"+
					                       		"		</div>"+
					                       		"		<div class='location'>"+
					                       		"			<span class='location-text'>"+likedList.postW3w+"</span>"+
					                       		"		</div>"+
					                       		"	</div>"+
					                   			"	<div class='title text-start'>"+likedList.postTitle+"</div>"+
					                   			"	<hr>"+
					                       		"	<div class='jiqoo-writer-info'>"+
					                           	"		<div id='profile-img' class='jiqooProfile text-start' >";
					            if (likedList.writerPhotoPath !== null && likedList.writerPhotoPath !== '') {               	
					            	likeHtml += "			<img src='" + likedList.writerPhotoPath + "'><br>";
	                            } else {
	                            	likeHtml += "			<img src='../resources/assets/img/no-profile.png'><br>";
	                            }
					            	likeHtml +="		</div>"+
					                           	"		<div class='jiqoo-writer'>"+
					                           	"			<div class='author text-start'>"+likedList.postWriter+"</div>"+
							                	"          	<div>"+
							                   	"				<span>"+likedList.postDate+"</span>"+
							                   	"				<span style='margin:0 5px 0 20px;'>조회수</span>"+
							                   	"				<span>"+likedList.viewCount+"</span>"+
						                   		"			</div>"+
					                           	"		</div>"+
					                       		"	</div>"+
// 					                   			"	<div class='content text-start'>"+likedList.jiqooContent+"</div>"+
					                       		"	</a>"+
										    	"</div>";
			
		                        tabContainer.append(likeHtml);
			                }
		                }

// 		                isLoading = false;
			            currentPage++;
		            },
		            error: function(error) {
		            	alert("서버오류가 발생했습니다. 다시 시도해주세요.");
                    	location.reload();
		            }
		        });
		    }
			
			//////////////////////////////////////////////// follow ////////////////////////////////////////////////        
        	// unfollow 버튼
        	$(".unfollow-btn").on("click", function(){
         		console.log("언팔로우이벤트 시작")
        		const toUnfollowUserId = $(this).data('user-id'); // 클릭한 버튼의 데이터(팔로잉userId) 저장
        		const button = $(this);
        		$.ajax({
                    type: 'POST',
                    url: '/user/unfollow',
                    data: { toUnfollowUserId: toUnfollowUserId },
                    success: function(result) {
                        if (result === "success") {
                        	console.log("언팔로우성공")
                        	button.removeClass("unfollow-btn").addClass("follow-btn");
                            button.text("Follow");
                        } else if (result === "checkLogin") {
                        	console.log("언팔로우실패")
                            alert("로그인 후 이용해주세요.");
                            window.location.href = "/user/login"; 
                        } else {
                        	console.log("오류발생")
                            alert("언팔로우가 실행되지 않았습니다. 다시 시도해주세요.");
                            location.reload();
                        }
                    },
                    error: function(error) {
                    	console.log(error)
                    	alert("서버오류가 발생했습니다. 다시 시도해주세요.");
                    	location.reload();
                    }
        		});
        	})
        	
        	//follow버튼
         	$(".follow-btn").on("click", function () {
         		console.log("팔로우이벤트 시작")
			    const toFollowUserId = $(this).data('user-id'); 
			    const button = $(this);
			
			    $.ajax({
			        type: 'POST',
			        url: '/user/follow', 
			        data: { toFollowUserId: toFollowUserId },
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
			        	console.log(error);
			            alert("서버오류가 발생했습니다. 다시 시도해주세요.");
			            location.reload();
			        }
			    });
			});
			//-----------------------------------------------------------------------------------------------------

			
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
	
// 	        $("#calendar").datepicker({
// 	            dateFormat: "yy-mm-dd", // 날짜 형식을 설정
// 	            onSelect: function(dateText) {
// 	                // 선택한 날짜를 #dateInput의 값으로 설정
// 	                $('#dateInput').val(dateText);
// 	            }
// 	        })

			$("#calendar").datepicker({
	            dateFormat: "yy-mm-dd", // 날짜 형식을 설정
	            onSelect: function(dateText) {
	                // 선택한 날짜를 #dateInput의 값으로 설정
	            	$('#inputDate').val(dateText);
	                loadTabContent("jiqoo");
	                $("#jiqoo").tab("show");
	                loadMoreType = "jiqoo";
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
