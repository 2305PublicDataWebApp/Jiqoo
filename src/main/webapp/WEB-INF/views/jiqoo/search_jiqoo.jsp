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
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
<!-- <script src="../resources/assets/vendor/summernote/summernote-lite.js"></script>
<script src="../resources/assets/vendor/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/assets/vendor/summernote/summernote-lite.css"> -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  
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
		<button id="btn-myList" class="btn-get-started scrollto" onclick="loadInitialJiqooMyList();">내꾸만 보기</button>
		<button id="btn-allList" class="btn-get-started scrollto qoo" onclick="loadInitialJiqooAllList();">남꾸도 보기</button>
	</div>
	<div id="map-icon">
		<a href="/jiqoo/mapList"><i class="bi bi-map"></i></a>
	</div>
    <div id="container">
	    <div id="list-container"  data-aos="fade-up">
		</div>
	</div>
    		<button type="button" class="btn insert-jiqoo-btn" id="confirmButton">지꾸 +</button>
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
									name="jiqooW3W" value="" readonly>
								<button id="open-map-btn">+</button>
							</div>
							<div class="mb-3 date-tag-container">
								<div class="date-container col-md-3">
									<input type="date" class="form-control" id="date" name="jiqooDate"
										required>
								</div>
<!-- 								<div id="show-ctgr-btn" class="col-md-2 c-btn" onmouseenter="showCategory()" onmouseleave="hideCategory()"> -->
								<div id="show-ctgr-btn" class="col-md-2 c-btn" onclick="toggleCC()">
									<span>카테고리</span> <i class="bi bi-caret-down-fill"></i>
								</div>
<!-- 								<div class="category-container" onmouseenter="showCategory()" onmouseleave="hideCategory()"> -->
								<div class="category-container">
									<div class="category-list">
										<c:forEach var="categoryList" items="${categoryList }">
											<div class="form-check category"> 
												<input class="form-check-input" type="radio" id="${categoryList.cName }" name="jiqooCtgr"
													 value="${categoryList.cName }" required> <label
													class="form-check-label" for="${categoryList.cName }"> <img
													class="tag-img" src="${categoryList.cImgPath }"
													alt="${categoryList.cName }">
												</label>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<input type="hidden" id="lat" name="jiqooLat">
							<input type="hidden" id="lng" name="jiqooLng">
							<input type="hidden" id="jiqoo-writer" name="jiqooWriter" value="${sessionScope.userId }">
							<div class="mb-3">
								<input type="text" class="form-control" id="title" name="jiqooTitle"
									placeholder="제목" required>
							</div>
					           <div class="mb-3">
				                <textarea id="summernote" name="jiqooContent" required></textarea>
				              </div>
							 <div class="mb-3 form-switch">
				                <input type="checkbox" class="form-check-input" id="private" name="jOpenStatus" value="N">
				                <label class="form-check-label" for="private">비공개</label>
				              </div>
				              <div class="mb-3 form-switch">
				                <input type="checkbox" class="form-check-input" id="allowComments" name="jAllowComt" value="Y" checked>
				                <label class="form-check-label" for="allowComments">댓글 허용</label>
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
	var currentUserId = "${sessionScope.userId}"
	var currentOffsetAll = 0; // 현재 offset 값 for all
	var currentOffsetMy = 0; // 현재 offset 값 for my
	var currentOffsetSearch = 0; // 현재 offset 값 for search
	var loadingAll = false; // 중복 로드 방지용 플래그 for all
	var loadingMy = false; // 중복 로드 방지용 플래그 for my
	var loadingSearch = false; // 중복 로드 방지용 플래그 for search
	var loadingInProgress = false;
    var searchValue = $("#search-input").val();
	var searchOption = $("#search-option").val();

	var btnMyList = $("#btn-myList");
	var btnAllList = $("#btn-allList");
	
	$(document).ready(function() {
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
		    	console.log(data);
		    	var imgNode = $("<img>");
		    	imgNode.attr("src", data);
		    	$(".note-editable").append(imgNode);
		    }).fail(function(a,b,c){
		    	console.log(a);
		    	console.log(b);
		    	console.log(c);
		    });
        }
	});
	
	$("#search-btn").on('click', function() {
		loadInitialJiqooSearchList();
	})

	    
		
		// 초기 지꾸 전체 리스트 로드하는 함수
		function loadInitialJiqooAllList() {
			loadingMy = false;
			loadingSearch = false;
			currentOffsetAll = 0;
			
			var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
			
			if(btnMyList.hasClass("qoo")) {
	        	 // "qoo" 클래스를 삭제합니다
			    btnMyList.removeClass("qoo");
			    // "qoo" 클래스를 추가합니다
			    btnAllList.addClass("qoo");
			}
		    
		    $.ajax({
		        url: "/jiqoo/loadInitialJiqooAllList",
		        type: "GET",
		        success: function (result) {
				    
					// 로딩 메시지를 제거
		            loadingMessage.remove();
		            if (result.length > 0) {
		                var listContainer = $("#list-container");
		                listContainer.empty();
		                
		                for (var i = 0; i < result.length; i++) {
		                    var jiqooAllList = result[i];
		                    var listItem = createResultItem(jiqooAllList);
		                    listContainer.append(listItem);
		                }
		                
		             	// 현재 offset 값을 업데이트
		                currentOffsetAll += 10;
		             	loadingAll = true;
		            }
		        },
		        error: function () {
		            alert("지꾸 불러오는 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		

		// 지꾸 전체 리스트 스크롤 이벤트 핸들러 
		$(window).scroll(function () {
	    if (!loadingInProgress && $(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
	        // 스크롤이 아래로 내려갈 때 댓글 로드 시작
	        if (!loadingMy && loadingAll && !loadingSearch) {
	        loadingInProgress = true;
	            // 서버로 데이터를 요청합니다.
	            $.ajax({
	                url: "/jiqoo/loadMoreJiqllAllList", // 서버로 요청 보낼 URL
	                type: "get", // GET 요청
	                data: {
	                    offset: currentOffsetAll, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
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
			                currentOffsetAll += 10;
			            	}else if(result.length < 10){
			            		loadingAll = false;	
			            	}else {
			            		loadingAll = false;	
			            	}
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loadingInProgress = false;
	                },
	                error: function () {
	                    // 서버 통신 중 오류 발생 시 오류 메시지를 표시
	                    const errorContainer = $("#error-container");
	                    errorContainer.text("지꾸 불러오는 중 오류가 발생했습니다.");
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loadingAll = false;
	                }
            	});
	    	}
	        
	        
	        // 스크롤이 아래로 내려갈 때 댓글 로드 시작
	        if (loadingMy && !loadingAll && !loadingSearch) {
	        	loadingInProgress = true;
	            // 서버로 데이터를 요청합니다.
	            $.ajax({
	                url: "/jiqoo/loadMoreJiqooMyList", // 서버로 요청 보낼 URL
	                type: "get", // GET 요청
	                data: {
	                    offset: currentOffsetMy, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
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
			                currentOffsetMy += 10;
			            	} else if(result.length < 10){
			            		
			                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
			                    loadingMy = false;
			            		
			            	}else {
			            		 // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
			                    loadingMy = false;
			            	}
		                loadingInProgress = false;
	                },
	                error: function () {
	                    // 서버 통신 중 오류 발생 시 오류 메시지를 표시
	                    const errorContainer = $("#error-container");
	                    errorContainer.text("지꾸 불러오는 중 오류가 발생했습니다.");
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loadingMy = false;
	                }
            	});
	    	}
	        
	        
	        if (!loadingMy && !loadingAll && loadingSearch) {
	        	searchValue = $("#search-input").val();
	        	searchOption = $("#search-option").val();
	        	loadingInProgress = true;
	        	console.log(searchValue, searchOption);
	            // 서버로 데이터를 요청합니다.
	            $.ajax({
	                url: "/jiqoo/loadMoreJiqooSearchList", // 서버로 요청 보낼 URL
	                type: "get", // GET 요청
	                data: {
			        	searchValue: searchValue,
			        	searchOption: searchOption,
	                    offset: currentOffsetSearch, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
	                    limit: 10 // 페이지당 표시할 댓글 수
	                },
	                success: function (result) {
	                    // 서버에서 성공적으로 데이터를 받아온 경우
	                    // data에는 서버에서 반환한 데이터가 들어 있습니다.
			            if (result.length > 0) {
			                var listContainer = $("#list-container");
			                
			                for (var i = 0; i < result.length; i++) {
			                    var jiqooSearchList = result[i];
			                    var listItem = createResultItem(jiqooSearchList);
			                    listContainer.append(listItem);
			                }
			                
			             	// 현재 offset 값을 업데이트
			                currentOffsetSearch += 10;
			            	}else if(result.length < 10){
			            		
			                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
			                    loadingSearch = false;
			            		
			            	}else {
			            		 // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
			                    loadingSearch = false;
			            	}
		                loadingInProgress = false;
	                },
	                error: function () {
	                    // 서버 통신 중 오류 발생 시 오류 메시지를 표시
	                    const errorContainer = $("#error-container");
	                    errorContainer.text("검색결과를 불러오는 중 오류가 발생했습니다.");
	                    // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
	                    loadingSearch = false;
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
			currentOffsetMy = 0;
			loadingAll = false;
			loadingSearch = false;
			var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
			if(btnAllList.hasClass("qoo")) {
	        	 // "qoo" 클래스를 삭제합니다
			    btnAllList.removeClass("qoo");
			    // "qoo" 클래스를 추가합니다
			    btnMyList.addClass("qoo");
			}
		    $.ajax({
		        url: "/jiqoo/loadInitialJiqooMyList",
		        type: "GET",
		        success: function (result) {
				    
	                var listContainer = $("#list-container");
		        	
					// 로딩 메시지를 제거
		            loadingMessage.remove();
					listContainer.empty();
		            if (result.length > 0) {
		                
		                for (var i = 0; i < result.length; i++) {
		                    var jiqooMyList = result[i];
		                    var listItem = createResultItem(jiqooMyList);
		                    listContainer.append(listItem);
		                }
		                
		             	// 현재 offset 값을 업데이트
		                currentOffsetMy += 10;
		             	loadingMy = true;
		        		
		            }else{
		                // result가 비어있는 경우 표시할 내용
		                listContainer.empty();
		                
		                listContainer.html(`<div id="empty-container">
			                    <img id="logo-img" src="../resources/assets/img/jiqooLogo.png">
			                    <span id="empty-text"><br>
			                    +버튼을 눌러 게시물을 작성해보세요!</span></div>
			                `);
		            }
		        },
		        error: function () {
		            alert("지꾸 불러오는 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		// 초기 지꾸 검색 리스트 로드하는 함수
		function loadInitialJiqooSearchList() {
		    // 검색어를 가져옴
		    var searchValue = $("#search-input").val();
			var searchOption = $("#search-option").val();
			if(searchOption == "남꾸"){
				if(!btnAllList.hasClass("qoo")){
				    btnAllList.addClass("qoo");
				    btnMyList.removeClass("qoo");
				}
			}else {
				if(!btnMyList.hasClass("qoo")) {
				    btnAllList.removeClass("qoo");
				    btnMyList.addClass("qoo");
				}
			}
			currentOffsetSearch = 0;
			loadingAll = false;
			loadingMy = false;
			console.log(searchValue, searchOption);
			
			var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
//         	 // "qoo" 클래스를 삭제합니다
// 		    btnMyList.classList.remove("qoo");
		    
// 		    // "qoo" 클래스를 추가합니다
// 		    btnAllList.classList.add("qoo");
		    $.ajax({
		        url: "/jiqoo/loadInitialJiqooSearchList",
		        type: "GET",
		        data: {
		        	searchValue: searchValue,
		        	searchOption: searchOption,
                    offset: currentOffsetSearch, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
                    limit: 10 // 페이지당 표시할 댓글 수
                },
		        success: function (result) {
				    
					// 로딩 메시지를 제거
		            loadingMessage.remove();
	                var listContainer = $("#list-container");
		            if (result.length > 0) {
			            listContainer.empty();
		                
		                for (var i = 0; i < result.length; i++) {
		                    var jiqooSearchList = result[i];
		                    var listItem = createResultItem(jiqooSearchList);
		                    listContainer.append(listItem);
		                }
		                
		             	// 현재 offset 값을 업데이트
		                currentOffsetSearch += 10;
		             	loadingSearch = true;
		            } else{
		                // result가 비어있는 경우 표시할 내용
		                listContainer.empty();
		                
		                listContainer.html(`<div id="empty-container">
			                    <img id="logo-img" src="../resources/assets/img/jiqooLogo.png">
			                    <span id="empty-text"><br>
			                    검색결과가 없습니다.</span></div>
			                `);
		            }
		        },
		        error: function () {
		            alert("검색결과를 불러오는 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		function createResultItem(data) {
		    var listItem = $('<div class="row result-item">');
		    var postLink = $('<a>').attr('href', '/jiqoo/detail?jiqooNo=' + data.jiqooNo);

		    var postHeader = $('<div class="post-header">');
		    var category = $('<div class="category">');
		    var categoryImg = $('<img class="category-img" alt=""/>').attr('src', data.category.cImgPath);
		    var location = $('<div class="location"><span class="location-text">' + data.jiqooW3W + '</span></div');
		    var userInfoContainer = $('<div class="user-info-container row">');
		    var userInfo = $('<div class="user-info col-md-6 col-sm-12">');
		    var profileImg = $('<div class="profile-img col-4" class="col-sm-12">');
		    var photophoto;
		    if(data.user.userPhotoPath == null || data.user.userPhotoPath == "" || data.user.userPhotoPath == undefined) {
		    	photophoto = "../resources/assets/img/no-profile.png";
		    }else {
		    	photophoto = data.user.userPhotoPath;
		    }
		    var profileImage = $('<img alt="프로필 이미지" class="profile-image">').attr('src', photophoto);

		    var userNickname = $('<div class="user-nickname">' + data.user.userNickname + '</div>');
		    // jCreateDate 값을 나타내기 위한 업데이트
		    var postDate = $('<div class="info col-lg-6 col-sm-12">' + formatDate(data.jCreateDate) + '</div>');

		    var postMain = $('<div class="post-main row">');
		    var postInfo = $('<div class="post-info col">');

		    var title = data.jiqooTitle; // 제목 문자열
		    var maxLength = 10; // 원하는 최대 길이

		    if (title.length > maxLength) {
		        title = title.substring(0, maxLength) + "...";
		    }

		    var titleDiv = $('<div class="title">' + title + '</div>');

		    // <p>와 <img> 요소를 추출하는 함수
		    function parseContent(content) {
		        var parser = new DOMParser();
		        var doc = parser.parseFromString(content, 'text/html');

		        // <p> 요소를 추출
		        var pElements = doc.querySelectorAll('p');
		        var pContent = '';
		        for (var i = 0; i < pElements.length; i++) {
		            pContent += pElements[i].innerHTML;
		        }

		        // 만약 pContent의 길이가 특정 길이를 초과하면 자르고 "..."을 추가
		        var maxContentLength = 20; // 원하는 최대 길이로 설정하세요
		        if (pContent.length > maxContentLength) {
		            pContent = pContent.substring(0, maxContentLength) + '...';
		        }

		        // <img> 요소를 추출
		        var imgElement = doc.querySelector('img'); // 첫 번째 이미지 요소만 가져옴
		        var imgSource = imgElement ? imgElement.getAttribute('src') : ''; // 이미지가 없을 경우 빈 문자열 반환

		        return {
		            pContent: pContent,
		            imgSource: imgSource
		        };
		    }

		    // jiqooAllList.jiqooContent에서 HTML 요소 추출
		    var content = data.jiqooContent;
		    var parsedContent = parseContent(content);

		    // 부모 <div>를 추가
		    var contentContainer = $('<div class="content-container row">');

		    // <p> 내용과 썸네일 이미지를 각각의 <div>에 추가
		    var pContentDiv = $('<div class="p-content-div col-md-8 col-sm-12">').append(parsedContent.pContent);
		    var thumbnailDiv = $('<div class="thumbnail-div col-md-4 col-sm-12">');
		    if (parsedContent.imgSource) {
		        var thumbnailImage = $('<img class="thumbnail-image" alt="썸네일" src="' + parsedContent.imgSource + '">');
		        thumbnailDiv.append(thumbnailImage);
		    }

		    category.append(categoryImg);
		    postHeader.append(category, location);
		    profileImg.append(profileImage);

		    // 각 요소를 부모 <div>에 추가
		    postMain.append(postInfo, thumbnailDiv);
		    postInfo.append(userInfoContainer, titleDiv, pContentDiv);
		    userInfoContainer.append(profileImg, userInfo);
		    userInfo.append(userNickname, postDate);

		    postLink.append(postHeader, postMain);
		    listItem.append(postLink, postMain);

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
	
	function toggleCC() {
	    const categoryContainer = document.querySelector(".category-container");
	    categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
	  }

	
	
	// 지꾸 게시물 작성 모달 띄우기
	  document.getElementById("confirmButton").addEventListener("click", function() {
		  if (currentUserId === "") {
		    var confirmed = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
		    if (confirmed) {
		      window.location.href = "/user/login"; // 사용자가 확인을 누르면 로그인 페이지로 이동
		    }
		  } else {
		    // 로그인된 사용자의 경우 모달을 띄우도록 설정
		    var insertModal = new bootstrap.Modal(document.getElementById('insert-modal'));
		    insertModal.show();
		  }
		});
	
	  const radioButtons = document.querySelectorAll('.form-check-input');
	  const imageLabels = document.querySelectorAll('.form-check-label');

	  imageLabels.forEach((label, index) => {
	      label.addEventListener('click', () => {
	          radioButtons[index].checked = true;
	      });
	  });
	  
	// 버튼 클릭 시 팝업 창 열기
	  document.getElementById("open-map-btn").onclick = function() {
	    // 팝업 창을 열기 위한 윈도우.open 함수 사용
	    window.open("popupW3WMap", "Popup", "width=1200,height=800,resizable=no");
	  };


	</script>
</body>
</html>