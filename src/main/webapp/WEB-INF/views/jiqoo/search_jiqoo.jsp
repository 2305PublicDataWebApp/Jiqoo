<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link href="../resources/assets/css/search_jiqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
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
    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
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
  </section><!-- End Hero -->
  <main id="main">
     <!-- ======= Search Section ======= -->
     <div class="search-container">
     	<div class="search-form">
	     	 <select id="search-option">
	     	 	<c:if test="${sessionScope.userId ne null}">
			    <option value="내꾸">내꾸</option>
			    </c:if>
			    <option value="남꾸">남꾸</option> 
			  </select>
	          <input id="search-input" type="text" placeholder="search"/>
	          <button id="search-btn" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	          </svg></button>
     	</div>
    </div>
	<!-- ======= Tab Section ======= -->
	<div id="tab">
		<button id="btn-myList" class="btn-get-started scrollto myqoo" onclick="showJiqooMyList();">내꾸만 보기</button>
		<button id="btn-allList" class="btn-get-started scrollto allqoo" onclick="showJiqooAllList();">남꾸도 보기</button>
	</div>
    <div id="container" data-aos=fade-in>
	    <div id="list-container">
		</div>
	</div>
      
	</main><!-- End #main -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	<div id="preloader"></div>
	
	<!-- Vendor JS Files -->
	<script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="../resources/assets/vendor/aos/aos.js"></script>
	<script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="../resources/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="../resources/assets/js/main.js"></script>
	
	<script>
	 function toggleReportDiv() {
	    const reportDiv = document.getElementById("report-div");
	    reportDiv.style.display = reportDiv.style.display === "none" ? "block" : "none";
	}
	</script>

	<script>
	
	$("#search-btn").on('click', function() {
		searchJiqooList();
	})
		// 스타일 클래스 없애기
		document.getElementById("btn-myList").classList.remove("qoo");
		$("#search-btn").on('click', function() {
			searchJiqooList();
		})

		var currentOffset = 0; // 현재 offset 값
		var loading = false; // 중복 로드 방지용 플래그
	    // 스타일 클래스 생성
	    document.getElementById("btn-allList").classList.add("qoo");
	    
		
		// 초기 지꾸 전체 리스트 로드하는 함수
		function loadInitialJiqooAllList() {
// 			var btnMyList = $("#btn-myList");
// 			var btnAllList = $("#btn-allList");
			
			var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
//         	 // "qoo" 클래스를 삭제합니다
// 		    btnMyList.classList.remove("qoo");
		    
// 		    // "qoo" 클래스를 추가합니다
// 		    btnAllList.classList.add("qoo");
		    $.ajax({
		        url: "/jiqoo/loadInitialJiqooAllList",
		        type: "GET",
		        success: function (result) {
				    
					// 로딩 메시지를 제거
		            loadingMessage.remove();
		            if (result.length > 0) {
		                var listContainer = $("#list-container");
		                
		                for (var i = 0; i < result.length; i++) {
		                    var jiqooAllList = result[i];
		                    var listItem = createResultItem(jiqooAllList);
		                    listContainer.append(listItem);
		                }
		                
		             	// 현재 offset 값을 업데이트
		                currentOffset += 10;
		            }
		        },
		        error: function () {
		            alert("지꾸 불러오는 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		// 지꾸 전체 리스트 스크롤 이벤트 핸들러 
		$(window).scroll(function () {
	    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
	        // 스크롤이 아래로 내려갈 때 댓글 로드 시작
	        if (!loading) {
	            loading = true;
	            // 서버로 데이터를 요청합니다.
	            $.ajax({
	                url: "/jiqoo/loadMoreJiqllAllList", // 서버로 요청 보낼 URL
	                type: "get", // GET 요청
	                data: {
	                    offset: currentOffset, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
	                    limit: 10 // 페이지당 표시할 댓글 수
	                },
	                success: function (result) {
	                    // 서버에서 성공적으로 데이터를 받아온 경우
	                    // data에는 서버에서 반환한 데이터가 들어 있습니다.
			            if (result.length > 0) {
			                var listContainer = $("#list-container");
			                
			                for (var i = 0; i < result.length; i++) {
			                    var jiqooAllList = result[i];
			                    var listItem = createResultItem(jiqooAllList);
			                    listContainer.append(listItem);
			                }
			                
			             	// 현재 offset 값을 업데이트
			                currentOffset += 10;
			            	}	
	                    
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loading = false;
	                },
	                error: function () {
	                    // 서버 통신 중 오류 발생 시 오류 메시지를 표시
	                    const errorContainer = $("#error-container");
	                    errorContainer.text("지꾸 불러오는 중 오류가 발생했습니다.");
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loading = false;
	                }
            	});
	    	}
	  		  }
        	});
		
		$(document).ready(function () {
			loadInitialJiqooAllList();
		});
		
		
		// 초기 지꾸 본인 리스트 로드하는 함수
		function loadInitialJiqooMyList() {
// 			var btnMyList = $("#btn-myList");
// 			var btnAllList = $("#btn-allList");
			
			var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
//         	 // "qoo" 클래스를 삭제합니다
// 		    btnMyList.classList.remove("qoo");
		    
// 		    // "qoo" 클래스를 추가합니다
// 		    btnAllList.classList.add("qoo");
		    $.ajax({
		        url: "/jiqoo/loadInitialJiqooMyList",
		        type: "GET",
		        success: function (result) {
				    
					// 로딩 메시지를 제거
		            loadingMessage.remove();
		            if (result.length > 0) {
		                var listContainer = $("#list-container");
		                
		                for (var i = 0; i < result.length; i++) {
		                    var jiqooMyList = result[i];
		                    var listItem = createResultItem(jiqooMyList);
		                    listContainer.append(listItem);
		                }
		                
		             	// 현재 offset 값을 업데이트
		                currentOffset += 10;
		            }
		        },
		        error: function () {
		            alert("지꾸 불러오는 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		// 지꾸 전체 리스트 스크롤 이벤트 핸들러 
		$(window).scroll(function () {
	    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
	        // 스크롤이 아래로 내려갈 때 댓글 로드 시작
	        if (!loading) {
	            loading = true;
	            // 서버로 데이터를 요청합니다.
	            $.ajax({
	                url: "/jiqoo/loadMoreJiqllMyList", // 서버로 요청 보낼 URL
	                type: "get", // GET 요청
	                data: {
	                    offset: currentOffset, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
	                    limit: 10 // 페이지당 표시할 댓글 수
	                },
	                success: function (result) {
	                    // 서버에서 성공적으로 데이터를 받아온 경우
	                    // data에는 서버에서 반환한 데이터가 들어 있습니다.
			            if (result.length > 0) {
			                var listContainer = $("#list-container");
			                
			                for (var i = 0; i < result.length; i++) {
			                    var jiqooMyList = result[i];
			                    var listItem = createResultItem(jiqooMyList);
			                    listContainer.append(listItem);
			                }
			                
			             	// 현재 offset 값을 업데이트
			                currentOffset += 10;
			            	}	
	                    
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loading = false;
	                },
	                error: function () {
	                    // 서버 통신 중 오류 발생 시 오류 메시지를 표시
	                    const errorContainer = $("#error-container");
	                    errorContainer.text("지꾸 불러오는 중 오류가 발생했습니다.");
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loading = false;
	                }
            	});
	    	}
	  		  }
        	});
	function createResultItem(jiqooAllList) {
	    var listItem = $('<div class="row result-item">');
	    var postLink = $('<a>').attr('href', '/jiqoo/detail?jiqooNo=' + jiqooAllList.jiqooNo);
	    
	    var postHeader = $('<div class="post-header">');
	    var category = $('<div class="category">');
	    var categoryImg = $('<img class="category-img" alt=""/>').attr('src', jiqooAllList.category.cImgPath);
	    var location = $('<div class="location"><span class="location-text">' + jiqooAllList.jiqooW3W + '</span></div');
	    
	    var profileImg = $('<div id="profile-img" class="col-sm-12">');
	    var profileImage = $('<img alt="프로필 이미지" class="profile-image">').attr('src', jiqooAllList.user.userPhotoPath);
	    
	    var colMd10 = $('<div class="col-md-10">');
	    var title = $('<div class="title">' + jiqooAllList.jiqooTitle + '</div>');
	    var content = $('<div class="content">' + jiqooAllList.jiqooContent + '</div>');
	    var author = $('<div class="author col-md-12">' + jiqooAllList.user.userNickname + '</div>');
	    var info = $('<div class="info col-lg-6 col-sm-12">' + formatDate(jiqooAllList.jCreateDate) + '</div>');
	    
	    var heartContainer = $('<div class="heart-container">');
	    var heartImage = $('<img class="heart" alt="" src="../resources/assets/img/heart(full).png">');
	    
	    category.append(categoryImg);
	    postHeader.append(category, location);
	    profileImg.append(profileImage);
	    colMd10.append(title, content, author, info, heartContainer);
	    heartContainer.append(heartImage);
	    
	    postLink.append(postHeader, profileImg, colMd10);
	    listItem.append(postLink);
	    
	    return listItem;
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
	
	
	
/////

$(document).ready(function () {
    var currentOffsetAll = 0; // 현재 offset 값 for all
    var currentOffsetMy = 0; // 현재 offset 값 for my
    var loadingAll = false; // 중복 로드 방지용 플래그 for all
    var loadingMy = false; // 중복 로드 방지용 플래그 for my

    // 초기 지꾸 전체 리스트 로드하는 함수
    function loadInitialJiqooAllList() {
        // ...
        // 여기에 all 리스트 로드 관련 코드 추가
    }

    // 초기 지꾸 본인 리스트 로드하는 함수
    function loadInitialJiqooMyList() {
        // ...
        // 여기에 my 리스트 로드 관련 코드 추가
    }

    // 지꾸 전체 리스트 스크롤 이벤트 핸들러 for all
    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            if (!loadingAll) {
                loadingAll = true;
                var ajaxUrlAll = "/jiqoo/loadMoreJiqllAllList"; // URL for all

                $.ajax({
                    url: ajaxUrlAll,
                    type: "get",
                    data: {
                        offset: currentOffsetAll,
                        limit: 10
                    },
                    success: function (result) {
                        if (result.length > 0) {
                            var listContainer = $("#list-container");
                            for (var i = 0; i < result.length; i++) {
                                var jiqooAllList = result[i];
                                var listItem = createResultItem(jiqooAllList);
                                listContainer.append(listItem);
                            }
                            currentOffsetAll += 10;
                        }
                        loadingAll = false;
                    },
                    error: function () {
                        const errorContainer = $("#error-container");
                        errorContainer.text("지꾸 불러오는 중 오류가 발생했습니다.");
                        loadingAll = false;
                    }
                });
            }
        }
    });

    // 지꾸 본인 리스트 스크롤 이벤트 핸들러 for my
    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            if (!loadingMy) {
                loadingMy = true;
                var ajaxUrlMy = "/jiqoo/loadMoreJiqllMyList"; // URL for my

                $.ajax({
                    url: ajaxUrlMy,
                    type: "get",
                    data: {
                        offset: currentOffsetMy,
                        limit: 10
                    },
                    success: function (result) {
                        if (result.length > 0) {
                            var listContainer = $("#list-container");
                            for (var i = 0; i < result.length; i++) {
                                var jiqooMyList = result[i];
                                var listItem = createResultItem(jiqooMyList);
                                listContainer.append(listItem);
                            }
                            currentOffsetMy += 10;
                        }
                        loadingMy = false;
                    },
                    error: function () {
                        const errorContainer = $("#error-container");
                        errorContainer.text("지꾸 불러오는 중 오류가 발생했습니다.");
                        loadingMy = false;
                    }
                });
            }
        }
    });

    loadInitialJiqooAllList();
    loadInitialJiqooMyList();
});

	</script>
</body>
</html>