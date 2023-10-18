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

	<!-- ======= Tab Section ======= -->
	<div id="tab">
		<button id="btn-myList" class="btn-get-started scrollto myqoo" onclick="showJiqooMyList();">내꾸만 보기</button>
		<button id="btn-allList" class="btn-get-started scrollto allqoo" onclick="showJiqooAllList();">남꾸도 보기</button>
	</div>
    <div id="container" data-aos=fade-in>
	    <div id="list-container">
		</div>
<!-- 	    <div id="jiqooAllList"> -->
<!-- 		    결과 목록 아이템 -->
<%-- 		    <c:forEach var="jiqooAllList" items="${jiqooAllList }"> --%>
<!-- 			    <div class="row result-item"> -->
<!-- 			      <div class="post-header"> -->
<!-- 			      	<div class="category"> -->
<%-- 			      		<img class="category-img" alt="" src="${jiqooAllList.category.cImgPath}"> --%>
<!-- 			      	</div> -->
<%-- 			        <div class="location"><span class="location-text">${jiqooAllList.jiqooW3W }</span></div> --%>
<!-- 			      </div> -->
<!-- 			      <div id="profile-img" class="col-sm-12"> -->
<%-- 			          <img src="${jiqooAllList.user.userPhotoPath }" alt="프로필 이미지" class="profile-image"> --%>
<!-- 			      </div> -->
<!-- 			      <div class="col-md-10"> -->
<%-- 			          <div class="title">${jiqooAllList.jiqooTitle }</div> --%>
<!-- 			          <div class="content">게시물 내용 ㅇㄴㅇㅇㅇㄴㄹㅇㄹ ...</div> -->
<!-- 			          <div class="row"> -->
<%-- 			            <div class="author col-md-12">${jiqooAllList.user.userNickname }</div> --%>
<%-- 			            <div class="info col-lg-6 col-sm-12"><fmt:formatDate pattern="yy/MM/dd HH:mm" value="${jiqooAllList.jCreateDate }"/></div> --%>
<!-- 			            <div class="heart-container"> -->
<!-- 			              <img class="heart" src="../resources/assets/img/heart(full).png" alt=""> -->
<!-- 			            </div> -->
<!-- 			          </div> -->
<!-- 			      </div> -->
<!-- 			    </div> -->
<%-- 		    </c:forEach> --%>
<!-- 	    </div> -->
<!-- 	    <div id="jiqooMyList"> -->
<!-- 		    결과 목록 아이템 -->
<%-- 		    <c:if test="${empty jiqooMyList }"> --%>
<!-- 		    	<div id="empty-container"> -->
<!-- 		    		<img src="../resources/assets/img/jiqooLogo.png"> -->
<%-- 		    		<span><span style='color: #388E3C'>${sessionScope.userId }</span>님 환영합니다!<br> --%>
<!-- 		    		+버튼을 클릭하여 지꾸를 시작해보세요.</span> -->
<!-- 		    	</div> -->
<%-- 		    </c:if> --%>
<%-- 		    <c:if test="${!empty jiqooMyList }"> --%>
<%-- 			    <c:forEach var="jiqooMyList" items="${jiqooMyList }"> --%>
<!-- 				    <div class="row result-item"> -->
<!-- 				      <div class="post-header"> -->
<!-- 				      	<div class="category"> -->
<%-- 				      		<img class="category-img" alt="" src="${jiqooMyList.category.cImgPath}"> --%>
<!-- 				      	</div> -->
<%-- 				        <div class="location"><span class="location-text">${jiqooMyList.jiqooW3W }</span></div> --%>
<!-- 				      </div> -->
<!-- 				      <div id="profile-img" class="col-sm-12"> -->
<%-- 				          <img src="${jiqooMyList.user.userPhotoPath }" alt="프로필 이미지" class="profile-image"> --%>
<!-- 				      </div> -->
<!-- 				      <div class="col-md-10"> -->
<%-- 				          <div class="title">${jiqooMyList.jiqooTitle }</div> --%>
<!-- 				          <div class="content">게시물 내용 ㅇㄴㅇㅇㅇㄴㄹㅇㄹ ...</div> -->
<!-- 				          <div class="row"> -->
<%-- 				            <div class="author col-md-12">${jiqooMyList.user.userNickname }</div> --%>
<%-- 				            <div class="info col-lg-6 col-sm-12"><fmt:formatDate pattern="yy/MM/dd HH:mm" value="${jiqooMyList.jCreateDate }"/></div> --%>
<!-- 				            <div class="heart-container"> -->
<!-- 				              <img class="heart" src="../resources/assets/img/heart(full).png" alt=""> -->
<!-- 				            </div> -->
<!-- 				          </div> -->
<!-- 				      </div> -->
<!-- 				    </div> -->
<%-- 			    </c:forEach> --%>
<%-- 		    </c:if>  --%>
<!-- 	    </div> -->
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
	$(document).ready(function() {
		var userId = "${sessionScope.userId}";
		
// 		지꾸 전체리스트 함수 실행
		showJiqooAllList();
	});
		
// 	// 초기에는 '내꾸만 보기'가 선택되어 있으므로 'jiqooMyList'를 보이게 설정
// 	$('#jiqooAllList').show();
// 	$('#jiqooMyList').hide();
	
// 	// '내꾸만 보기' 버튼 클릭 시
// 	$('#btn-myList').click(function() {
// 	if(userId == null || userId === "") {
// 		alert("로그인이 필요한 서비스입니다.");  
// 	  }else {
// 		$('#jiqooMyList').show();
// 		$('#jiqooAllList').hide();			  
// 	  }
// 	 });
	
// 	  // '남꾸도 보기' 버튼 클릭 시
// 	  $('#btn-allList').click(function() {
// 	    $('#jiqooMyList').hide();
// 	    $('#jiqooAllList').show();
// 	  });
	  
// 	// search-btn 버튼을 클릭했을 때 searchJiqooList 함수 실행
// 	    $('#search-btn').click(function() {
// 	        searchJiqooList();
// 	    });

// 	});
	
	$("#search-btn").on('click', function() {
		searchJiqooList();
	})
	function showJiqooAllList() {
		// 스타일 클래스 없애기
		document.getElementById("btn-myList").classList.remove("qoo");

	    // 스타일 클래스 생성
	    document.getElementById("btn-allList").classList.add("qoo");
	    
		
	    $.ajax({
	        url: "/jiqoo/AllList",
	        type: "GET",
	        success: function (result) {
	            if (result.length > 0 ) {
	                var listContainer = $("#list-container");

	                // 결과를 표시하기 전에 기존 결과를 지우기
	                listContainer.empty();

	                // 결과를 반복해서 표시
	                for (var i = 0; i < result.length; i++) {
	                    var jiqooAllList = result[i];

	                    // 새로운 결과 항목을 생성
	                    var listItem = $('<div class="row result-item">');
	                    var postHeader = $('<div class="post-header">');
	                    var category = $('<div class="category">');
	                    var categoryImg = $('<img class="category-img" alt="">').attr('src', jiqooAllList.category.cImgPath);
	                    var location = $('<div class="location"><span class="location-text">' + jiqooAllList.jiqooW3W + '</span></div>');
	                    var profileImg = $('<div id="profile-img" class="col-sm-12">');
	                    var profileImage = $('<img alt="프로필 이미지" class="profile-image">').attr('src', jiqooAllList.user.userPhotoPath);
	                    var colMd10 = $('<div class="col-md-10">');
	                    var title = $('<div class="title">' + jiqooAllList.jiqooTitle + '</div>');
	                    var content = $('<div class="content">' + jiqooAllList.jiqooContent + '</div>'); // 실제 게시물 내용을 표시
	                    var author = $('<div class="author col-md-12">' + jiqooAllList.user.userNickname + '</div>');
	                    var info = $('<div class="info col-lg-6 col-sm-12">' + formatDate(jiqooAllList.jCreateDate) + '</div>');
	                    var heartContainer = $('<div class="heart-container">');
	                    var heartImage = $('<img class="heart" alt="" src="../resources/assets/img/heart(full).png">');

	                    // 필요한 하위 요소들을 조립합니다.
	                    category.append(categoryImg);
	                    postHeader.append(category, location);
	                    profileImg.append(profileImage);
	                    colMd10.append(title, content, author, info, heartContainer);
	                    heartContainer.append(heartImage);

	                    // 결과를 결과 리스트 컨테이너에 추가
	                    listItem.append(postHeader, profileImg, colMd10);
	                    listContainer.append(listItem);
	                }
	            } else {
	                // 결과가 없는 경우 처리
	                alert("검색 결과가 없습니다.");
	            }
	        },
	        error: function () {
	            alert("Ajax 오류~ 관리자에게 문의하삼");
	        }
	    });
	}
	
	function showJiqooMyList() {
		// 스타일 클래스 없애기
		document.getElementById("btn-allList").classList.remove("qoo");

	    // 스타일 클래스 생성
	    document.getElementById("btn-myList").classList.add("qoo");
		
	    $.ajax({
	        url: "/jiqoo/MyList",
	        type: "GET",
	        success: function (result) {
					console.log(result);
	            if (result.length > 0 ) {
	                var listContainer = $("#list-container");

	                // 결과를 표시하기 전에 기존 결과를 지우기
	                listContainer.empty();
	                // 결과를 반복해서 표시
	                for (var i = 0; i < result.length; i++) {
	                    var jiqooMyList = result[i];

	                    // 새로운 결과 항목을 생성
	                    var listItem = $('<div class="row result-item">');
	                    var postHeader = $('<div class="post-header">');
	                    var category = $('<div class="category">');
	                    var categoryImg = $('<img class="category-img" alt="">').attr('src', jiqooMyList.category.cImgPath);
	                    var location = $('<div class="location"><span class="location-text">' + jiqooMyList.jiqooW3W + '</span></div>');
	                    var profileImg = $('<div id="profile-img" class="col-sm-12">');
	                    var profileImage = $('<img alt="프로필 이미지" class="profile-image">').attr('src', jiqooMyList.user.userPhotoPath);
	                    var colMd10 = $('<div class="col-md-10">');
	                    var title = $('<div class="title">' + jiqooMyList.jiqooTitle + '</div>');
	                    var content = $('<div class="content">' + jiqooMyList.jiqooContent + '</div>'); // 실제 게시물 내용을 표시
	                    var author = $('<div class="author col-md-12">' + jiqooMyList.user.userNickname + '</div>');
	                    var info = $('<div class="info col-lg-6 col-sm-12">' + formatDate(jiqooMyList.jCreateDate) + '</div>');
	                    var heartContainer = $('<div class="heart-container">');
	                    var heartImage = $('<img class="heart" alt="" src="../resources/assets/img/heart(full).png">');

	                    // 필요한 하위 요소들을 조립합니다.
	                    category.append(categoryImg);
	                    postHeader.append(category, location);
	                    profileImg.append(profileImage);
	                    colMd10.append(title, content, author, info, heartContainer);
	                    heartContainer.append(heartImage);

	                    // 결과를 결과 리스트 컨테이너에 추가
	                    listItem.append(postHeader, profileImg, colMd10);
	                    listContainer.append(listItem);
	                }
	            } else {
	                // 결과가 없는 경우 처리
	                alert("검색 결과가 없습니다.");
	            }
	        },
	        error: function () {
	            alert("Ajax 오류~ 관리자에게 문의하삼");
	        }
	    });
	}
	
	function searchJiqooList() {
		// 스타일 클래스 없애기
		document.getElementById("btn-myList").classList.remove("qoo");
		document.getElementById("btn-allList").classList.remove("qoo");
		
	    // 검색어를 가져옴
	    var searchValue = $("#search-input").val();
		var searchOption = $("#search-option").val();
		
	    // 검색어를 서버로 전달하여 Ajax 요청 수행
	    $.ajax({
	        url: "/jiqoo/searchList",
	        type: "GET",
	        data: { searchValue: searchValue 
	        		, searchOption : searchOption},
	        success: function (result) {
	            if (result.length > 0 ) {
	                var listContainer = $("#list-container");

	                // 결과를 표시하기 전에 기존 결과를 지우기
	                listContainer.empty();

	                // 결과를 반복해서 표시
	                for (var i = 0; i < result.length; i++) {
	                    var jiqooSearchList = result[i];

	                    // 새로운 결과 항목을 생성
	                    var listItem = $('<div class="row result-item">');
	                    var postHeader = $('<div class="post-header">');
	                    var category = $('<div class="category">');
	                    var categoryImg = $('<img class="category-img" alt="">').attr('src', jiqooSearchList.category.cImgPath);
	                    var location = $('<div class="location"><span class="location-text">' + jiqooSearchList.jiqooW3W + '</span></div>');
	                    var profileImg = $('<div id="profile-img" class="col-sm-12">');
	                    var profileImage = $('<img alt="프로필 이미지" class="profile-image">').attr('src', jiqooSearchList.user.userPhotoPath);
	                    var colMd10 = $('<div class="col-md-10">');
	                    var title = $('<div class="title">' + jiqooSearchList.jiqooTitle + '</div>');
	                    var content = $('<div class="content">' + jiqooSearchList.jiqooContent + '</div>'); // 실제 게시물 내용을 표시
	                    var author = $('<div class="author col-md-12">' + jiqooSearchList.user.userNickname + '</div>');
	                    var info = $('<div class="info col-lg-6 col-sm-12">' + formatDate(jiqooSearchList.jCreateDate) + '</div>');
	                    var heartContainer = $('<div class="heart-container">');
	                    var heartImage = $('<img class="heart" alt="" src="../resources/assets/img/heart(full).png">');

	                    // 필요한 하위 요소들을 조립합니다.
	                    category.append(categoryImg);
	                    postHeader.append(category, location);
	                    profileImg.append(profileImage);
	                    colMd10.append(title, content, author, info, heartContainer);
	                    heartContainer.append(heartImage);

	                    // 결과를 결과 리스트 컨테이너에 추가
	                    listItem.append(postHeader, profileImg, colMd10);
	                    listContainer.append(listItem);
	                }
	            } else {
	                // 결과가 없는 경우 처리
	                alert("검색 결과가 없습니다.");
	            }
	        },
	        error: function () {
	            alert("Ajax 오류~ 관리자에게 문의하삼");
	        }
	    });
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

	</script>
</body>

</html>