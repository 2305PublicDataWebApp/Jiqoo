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

<style>
.infoWindow {
	border: 1px solid #00000042;
    border-radius: 10px;
	position: absolute;
	left: 0;
	bottom: 70px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
	background: #e8ffdded; 
}

.infoWindow * {
	padding: 0;
	margin: 0;
}

.infoWindow .w3w { 
	text-align: center;
 	padding: 5px 0;
	border-bottom: 1px solid #ddd; 
 	font-size: 18px; 
 	font-weight: bold; 
 } 

.body {
	margin : 0 7px;
	position: relative;
	overflow: hidden;
}

.moqooTitle{
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 18px;
}

.moqooContent{
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 15px;
    height: 23px;
}
.moqooContent > p{
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 15px;
}

.infoImg{
	width: 25px;
    height: 25px;
    border-radius: 50%;
    margin-right: 5px;
}

.moqooProfile{
	font-size: 13px;
 	margin: 8px 0;
}

.detail-link{
	position: absolute;
    top: 60px;
    right: 10px;
    font-size: 13px;
}

.infoWindow .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

</style>


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

<!-- 부트스트랩 CSS -->

<!-- 부트스트랩 JavaScript 및 jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Template Main CSS File -->
<link href="../resources/assets/css/moqoo.css" rel="stylesheet">
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
		<!--  ========= Tap Section========= -->
		<div class="main-container" data-aos="fade-in">
			<div id="tab">
				<button id="btn-map" class="btn-get-started scrollto">지도</button>
				<button id="btn-list" class="btn-get-started scrollto">리스트</button>
			</div>
		</div>

		<!-- ======= Search Section ======= -->
		<div class="search-container">
			<form action="" method="" class="search-form">
				<input type="text" placeholder="search">
				<button type="submit" id="search-btn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
            		</svg>
				</button>
			</form>
		</div>


		<!-- ======= Modal ======= -->
		<div class="modal-body"></div>


		<!-- ======= Map Section ======= -->
		<div id="map" class="col-sm-12 mx-auto"></div>

		<button type="button" class="btn insert-jiqoo-btn"
			data-bs-toggle="modal" data-bs-target=".modal">모꾸 +</button>


		<!-- ======= List Section ======= -->
		<div id="container" data-aos=fade-in>

<!-- 			<!-- 결과 목록 아이템 -->
<%-- 			<c:forEach var="moqooList" items="${moqooList }"> --%>
<%-- 				<c:url var="post_moqooUrl" value="/moqoo/detail"> --%>
<%-- 					<c:param name="moqooNo" value="${moqooList.moqooNo }"></c:param> --%>
<%-- 				</c:url> --%>
<!-- 				<div class="row result-item"> -->
<!-- 					<div class="post-header"> -->
<%-- 						<div class="list-location">${moqooList.moqooW3W }</div> --%>
<!-- 						<div class="report-button"> -->
<!-- 							<img id="dots" src="../resources/assets/img/dots.png" alt="" onclick="toggleReportDiv()"> -->
<!-- 						</div> -->
<!-- 						<div id="report-div" style="display: none;"> -->
<!-- 							<div id="report-text" onclick="reportUser()">신고하기</div> -->
<!-- 							<i class="bi bi-exclamation-circle"></i> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div id="profile-img" class="col-sm-12"> -->
<%-- 					  <c:if test="${moqooList.moqooThumPath eq null }"> --%>
<!-- 						<img src="../resources/assets/img/no-profile.png" alt="프로필 이미지" class="profile-image"> -->
<%-- 					  </c:if> --%>
<%-- 					  <c:if test="${moqooList.moqooThumPath ne null }"> --%>
<%-- 						<img src="${moqooList.moqooThumPath }" alt="프로필 이미지" class="profile-image"> --%>
<%-- 					  </c:if> --%>
<!-- 					</div> -->
<%-- 					<a href="${post_moqooUrl }" class="post-a"> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<div class="title">${moqooList.moqooTitle }</div> --%>
<%-- 							<div class="content">${moqooList.moqooContent }</div> --%>
<!-- 							<div class="row"> -->
<%-- 								<div class="author col-lg-3 col-md-12">${moqooList.user.userNickname }</div> --%>
<%-- 								<div class="info col-lg-6 col-md-12"><fmt:formatDate pattern="yyyy-MM-dd" value="${moqooList.moqooDate }"/></div> --%>
<!-- 								<div class="heart-container col-lg-3 col-md-12"> -->
<!-- 									<img class="heart" -->
<!-- 										src="../resources/assets/img/heart(full).png" alt=""> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</a> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->


		<!-- ======= Modal ======= -->
		<div class="modal" tabindex="-1" id="insert-modal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content"
					style="background-color: #6DBE45; color: #fff;">
					<div class="modal-header">
						<h5 class="modal-title">게시물 입력</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<form action="/moqoo/insert" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<!-- 게시물 입력 폼 -->
							<div class="mb-3 col-lg-5 mx-auto location-container">
								<input type="text" class="form-control" id="location"
									name="moqooW3W" value="" readonly>
								<button id="open-map-btn">+</button>
							</div>
							<div class="mb-3 row date-tag-container">
								<div class="date-container col-md-3">
									<input type="date" class="form-control" id="date" name="moqooDay" required>
								</div>
								<div class="col-md-2 c-btn">
									<span>카테고리</span><i class="bi bi-caret-down-fill" onclick="toggleCC()"></i>
								</div>
								<div class="category-container" style="display: none;">
									<div class="category-list">
										<c:forEach var="categoryList" items="${categoryList }">
											<div class="form-check category">
												<input class="form-check-input" type="radio" name="category"
													id="${categoryList.cName }" value="${categoryList.cName }" required> 
													<label class="form-check-label" for="${categoryList.cName }">
														<img class="tag-img" src="${categoryList.cImgPath }" alt="${categoryList.cName }">
													</label>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<input type="hidden" id="lat" name="moqooLat">
							<input type="hidden" id="lng" name="moqooLng">
							<input type="hidden" id="moqoo-writer" name="moqooWriter" value="${sessionScope.userId }">
							<div class="mb-3">
								<input type="text" class="form-control" id="title" name="moqooTitle" placeholder="제목" required>
							</div>
							<div class="mb-3" style="display: flex;">
								<div>
									<label for="thum" class="custom-button">파일 선택</label>
									<input type="file" class="custom-file-input" id="thum" name="uploadFile" placeholder="썸네일" required> 
								</div>
								<!-- 파일 정보 표시 영역 -->
								<div id="fileInfo"></div>
							</div>
							<div class="mb-3">
								<textarea id="summernote" name="moqooContent" required></textarea>
							</div>
							<div class="mb-3">
								<input type="number" min="2" max="8" class="form-control" id="people" name="moqooJoin" placeholder="참여인원" required>
							</div>
						</div>
						<div class="modal-footer">
							<button type="reset" class="btn reset" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn insert">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 신고 모달 -->
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
	<!-- 썸머노트 -->
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
                   muploadSummernoteImageFile(files[0],this); 
               } 
            } 
        });
        function muploadSummernoteImageFile(file,editor){ 
            data = new FormData(); 
            data.append("file",file); 
            $.ajax({ 
		        data:data, 
		        type:"POST", 
		        url:"/muploadSummernoteImageFile", 
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
    });
	</script>

	<!-- 카카오맵 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee58f1de69883c91d0d43b37d1a713ff&libraries=services,clusterer,drawing"></script>
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    
    function showAllMap() {
    	  // 커스텀 오버레이 배열을 선언합니다
    	  var customOverlays = [];
  		
    	  $.ajax({
    	    url: "/moqoo/showAllMap",
    	    type: "GET",
    	    dataType: 'json',
    	    success: function (data) {
    	      for (var i = 0; i < data.length; i++) {
    	        // 마커 이미지의 이미지 크기 입니다
    	        var imageSize = new kakao.maps.Size(70, 70);

    	        // 마커 이미지를 생성합니다    
    	        var markerImage = new kakao.maps.MarkerImage(data[i].ctgr.cImgPath, imageSize);

    	        // 마커를 생성합니다
    	        var marker = new kakao.maps.Marker({
    	          map: map, // 마커를 표시할 지도
    	          position: new kakao.maps.LatLng(data[i].moqooLat, data[i].moqooLng),
    	          image: markerImage,
    	          clickable: true
    	        });

    	        // 커스텀 오버레이에 표시될 내용을 생성합니다
    	        var overlayContent = '<div class="infoWindow">' + 
              '        <div class="w3w">' + data[i].moqooW3W + '</div>' + 
              '        <div class="body">' + 
              '			   <div class ="moqooTitle">' + data[i].moqooTitle + '</div>' +
              '			   <div class ="moqooContent">' + data[i].moqooContent + '</div>' +
              '			   <div class ="moqooProfile">' + '<img class="infoImg" src="' + data[i].user.userPhotoPath + '" >' + data[i].user.userNickname + '</div>' +
              '            <div class="detail-link"><a href="/moqoo/detail?moqooNo='+data[i].moqooNo +'" class="link">상세보기</a></div>' + 
              '        </div>' + 
              '</div>';
    	        	
    	        // 커스텀 오버레이를 생성합니다
    	        var customOverlay = new kakao.maps.CustomOverlay({
    	          content: overlayContent,
    	          position: marker.getPosition(),
    	          clickable: true
    	        });

    	        // 커스텀 오버레이를 배열에 추가합니다
    	        customOverlays.push(customOverlay);
    	   		
    	        // 마커에 클릭 이벤트를 등록합니다
    	        (function (customOverlay) {
    	          kakao.maps.event.addListener(marker, 'click', function () {
    	        	// 클릭된 마커의 커스텀 오버레이만 엽니다
    	            if (customOverlay.getMap()) {
    	                customOverlay.setMap(null);
    	            } else {
    	        	  
  	  	        	// 모든 커스텀 오버레이를 닫습니다
  	  	            for (var j = 0; j < customOverlays.length; j++) {
  	  	              customOverlays[j].setMap(null);
  	  	            }	
  	  	            // 클릭된 마커의 커스텀 오버레이만 엽니다
  	  	            customOverlay.setMap(map);
    	            }
    	          });
    	        })(customOverlay);
    		    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    	        function closeOverlay(clickedOverlay) {
    	          var customOverlay = customOverlays.find(function(overlay) {
    	              return overlay.getContent() === clickedOverlay.parentElement;
    	          });

    	          if (customOverlay) {
    	              customOverlay.setMap(null);
    	          }
    	        }
    	      }
  	    }
  	  });
      }
    
    
	
//      //btn-allMap 버튼 클릭 이벤트 처리
//      $("#btn-map").click(function() {
//          showAllMap(); // showAllMap 함수 호출
//      });
     
  </script>
  
  
	<script>
	// 버튼 클릭 시 div 숨기기
	const mapDiv = document.querySelector('#map');
	const container = document.querySelector('#container');
	const btnListDiv = document.querySelector('#btn-list');
	const btnMapDiv = document.querySelector('#btn-map');
	const btnModal = document.querySelector('.insert-jiqoo-btn');

	btnListDiv.addEventListener('click', () => {
		container.style.display = 'block';
		mapDiv.style.display = 'none';
    btnModal.style.display='none';
	});

	btnMapDiv.addEventListener('click', () => {
	  mapDiv.style.display = 'block';
	  container.style.display = 'none';
	  btnModal.style.display='block';
	  showAllMap();
	});
	
	
  	var currentOffsetList = 0; // 현재 offset 값 for List
	var currentOffsetSearch = 0; // 현재 offset 값 for search
	var loadingList = false; // 중복 로드 방지용 플래그 for List
	var loadingSearch = false; // 중복 로드 방지용 플래그 for search
	var loadingInProgress = false;
  	var searchValue = $("#search-input").val();

	var btnList = $("#btn-list");
	var btnMap = $("#btn-map");
	
	$("#search-btn").on('click', function() {
		loadInitialMoqooSearchList();
	})
  
	//초기 모꾸 전체 리스트 로드하는 함수
	function loadInitialMoqooAllList() {
		
		loadingSearch = false;
		currentOffsetList = 0;
		
		var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
		
		// 버튼 클릭시 색상 변경
		if(btnMap.hasClass("qoo")) {
      	 // "qoo" 클래스를 삭제합니다
		    btnMap.removeClass("qoo");
		    // "qoo" 클래스를 추가합니다
		    btnList.addClass("qoo");
		}
	    
	    $.ajax({
	        url: "/moqoo/loadInitialMoqooAllList",
	        type: "GET",
	        success: function (result) {
			    
				// 로딩 메시지를 제거
	            loadingMessage.remove();
	            if (result.length > 0) {
	                var listContainer = $("#container");
	                
	                for (var i = 0; i < result.length; i++) {
	                    var moqooAllList = result[i];
	                    var listItem = createResultItem(moqooAllList);
	                    listContainer.append(listItem);
	                }
	                
	             	// 현재 offset 값을 업데이트
	                currentOffsetList += 10;
	             	loadingList = true;
	            }
	        },
	        error: function () {
	            alert("모꾸를 불러오는 중 오류가 발생했습니다.");
	        }
	    });
	}

	// 모꾸 전체 리스트 스크롤 이벤트 핸들러 
	$(window).scroll(function () {
		if (!loadingInProgress && $(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
      		// 스크롤이 아래로 내려갈 때 댓글 로드 시작
      		if (loadingList && !loadingSearch) {
      			loadingInProgress = true;
          		// 서버로 데이터를 요청합니다.
				$.ajax({
				    url: "/moqoo/loadMoreMoqooAllList", // 서버로 요청 보낼 URL
				    type: "get", // GET 요청
				    data: {
				        offset: currentOffsetList, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
				        limit: 10 // 페이지당 표시할 댓글 수
				    },
				    success: function (result) {
				        // 서버에서 성공적으로 데이터를 받아온 경우
				        // data에는 서버에서 반환한 데이터가 들어 있습니다.
					    if (result.length > 0) {
					        var listContainer = $("#container");
					        
					        for (var i = 0; i < result.length; i++) {
					            var moqooAllList = result[i];
					            var listItem = createResultItem(moqooAllList);
					            listContainer.append(listItem);
					        }
					        
					     	// 현재 offset 값을 업데이트
					        currentOffsetList += 10;
				    	}else if(result.length < 10) {
				    		loadingList = false;	
				    	}else {
				    		loadingList = false;	
				    	}
				        // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
				        alert("전체지롱" + loadingList);
				        loadingInProgress = false;
					},
				    error: function () {
				        // 서버 통신 중 오류 발생 시 오류 메시지를 표시
				        const errorContainer = $("#error-container");
				        errorContainer.text("모꾸 리스트를 불러오는 중 오류가 발생했습니다.");
				        // 로딩 플래그를 다시 false로 설정하여 다음 스크롤 이벤트를 기다립니다.
				        loadingList = false;
				    }
				});
			}
      		
      		// 스크롤이 아래로 내려갈 때 댓글 로드 시작
      		if (!loadingList && loadingSearch) {
	        	searchValue = $("#search-input").val();
	        	loadingInProgress = true;
	        	console.log(searchValue);
	            // 서버로 데이터를 요청합니다.
	            $.ajax({
	                url: "/moqoo/loadMoreMoqooSearchList", // 서버로 요청 보낼 URL
	                type: "get", // GET 요청
	                data: {
			        	searchValue: searchValue,
	                    offset: currentOffsetSearch, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
	                    limit: 10 // 페이지당 표시할 댓글 수
	                },
	                success: function (result) {
	                    // 서버에서 성공적으로 데이터를 받아온 경우
	                    // data에는 서버에서 반환한 데이터가 들어 있습니다.
			            if (result.length > 0) {
			                var listContainer = $("#container");
			                
			                for (var i = 0; i < result.length; i++) {
			                    var moqooSearchList = result[i];
			                    var listItem = createResultItem(moqooSearchList);
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
			            alert("서치지롱" + loadingList + ", " + loadingSearch);
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
		loadInitialMoqooAllList();
	});
	
	
	// 초기 모꾸 검색 리스트 로드하는 함수
	function loadInitialMoqooSearchList() {
	    // 검색어를 가져옴
	    var searchValue = $("#search-input").val();
	    
		if(!btnList.hasClass("qoo")){
			
		    btnList.addClass("qoo");
		    btnMap.removeClass("qoo");
		}
		
		currentOffsetSearch = 0;
		loadingList = false;
		console.log(searchValue);
		
		var loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
//     	 // "qoo" 클래스를 삭제합니다
//		    btnMyList.classList.remove("qoo");
	    
//		    // "qoo" 클래스를 추가합니다
//		    btnAllList.classList.add("qoo");
	    $.ajax({
	        url: "/moqoo/loadInitialMoqooSearchList",
	        type: "GET",
	        data: {
	        	searchValue: searchValue,
                offset: currentOffsetSearch, // 현재 페이지에서 마지막으로 로드한 댓글의 인덱스
                limit: 10 // 페이지당 표시할 댓글 수
            },
	        success: function (result) {
			    
				// 로딩 메시지를 제거
	            loadingMessage.remove();
                var listContainer = $("#container");
	            if (result.length > 0) {
		            listContainer.empty();
	                
	                for (var i = 0; i < result.length; i++) {
	                    var moqooSearchList = result[i];
	                    var listItem = createResultItem(moqooSearchList);
	                    listContainer.append(listItem);
	                }
	                
	             	// 현재 offset 값을 업데이트
	                currentOffsetSearch += 10;
	             	loadingSearch = true;
	            } else{
	                // result가 비어있는 경우 표시할 내용
	                listContainer.empty();
	                
	                listContainer.html(`<div id="empty-container">
		                    <img id="logo-img" src="../resources/assets/img/moqooLogo.png">
		                    <span id="empty-text"><br>
		                    검색결과가 없습니다.</span></div>`);
	            }
	        },
	        error: function () {
	            alert("검색결과를 불러오는 중 오류가 발생했습니다.");
	        }
	    });
	}
	
	
	function createResultItem(moqooList) {
	    var listItem = $('<div class="row result-item">');
	    var postLink = $('<a>').attr('href', '/moqoo/detail?moqooNo=' + moqooList.moqooNo);
	    
	    var postHeader = $('<div class="post-header">');
	    var category = $('<div class="category">');
	    var categoryImg = $('<img class="category-img" alt=""/>').attr('src', moqooList.ctgr.cImgPath);
	    var location = $('<div class="location"><span class="location-text">' + moqooList.moqooW3W + '</span></div');
	    
	    var profileImg = $('<div id="profile-img" class="col-sm-12">');
	    var profileImage = $('<img alt="프로필 이미지" class="profile-image">').attr('src', moqooList.user.userPhotoPath);
	    
	    var colMd10 = $('<div class="col-md-10">');
	    var title = $('<div class="title">' + moqooList.moqooTitle + '</div>');
	    var content = $('<div class="content">' + moqooList.moqooContent + '</div>');
	    var author = $('<div class="author col-md-12">' + moqooList.user.userNickname + '</div>');
	    var info = $('<div class="info col-lg-6 col-sm-12">' + formatDate(moqooList.moqooDate) + '</div>');
	    
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
	
	</script>

	<script>
    // 버튼 클릭 시 팝업 창 열기
    document.getElementById("open-map-btn").onclick = function() {
		// 팝업 창을 열기 위한 윈도우.open 함수 사용
		window.open("popupMap", "Popup", "width=1200,height=800,resizable=no");
    };
	</script>

	<script>
	function toggleCC() {
		const categoryContainer = document.querySelector(".category-container");
		categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
	}

	// JavaScript 코드를 추가합니다.
	const radioButtons = document.querySelectorAll('.form-check-input');
	const imageLabels = document.querySelectorAll('.form-check-label');

	imageLabels.forEach((label, index) => {
	    label.addEventListener('click', () => {
	        radioButtons[index].checked = true;
	    });
	});

// 	// 버튼 클릭 시 div 숨기기
// 	const mapDiv = document.querySelector('#map');
// 	const container = document.querySelector('#container');
// 	const btnList1 = document.querySelector('#btn-list');
// 	const btnMap = document.querySelector('#btn-map');
// 	const btnModal = document.querySelector('.insert-jiqoo-btn');

// 	btnList1.addEventListener('click', () => {
// 		container.style.display = 'block';
// 		mapDiv.style.display = 'none';
//     btnModal.style.display='none';
// 	});

// 	btnMap.addEventListener('click', () => {
// 	  mapDiv.style.display = 'block';
// 	  container.style.display = 'none';
// 	  btnModal.style.display='block';
// 	  showAllMap();
// 	});

	// JavaScript로 버튼 클릭 이벤트 처리
	// 이전에 클릭된 버튼을 추적하기 위한 변수
	let previousButton = null;

	// 버튼 클릭 이벤트 처리
	const buttons = document.querySelectorAll(".btn-get-started");

	buttons.forEach(button => {
	    button.addEventListener("click", function() {
	        // 이전에 클릭된 버튼이 있으면 스타일 초기화
	        if (previousButton !== null && previousButton !== this) {
	            previousButton.classList.remove("clicked");
	        }
	
	        // 클릭된 버튼에 clicked 클래스 토글
	        this.classList.toggle("clicked");
	
	        // 이전에 클릭된 버튼 업데이트
	        previousButton = this;
	    });
	});
 
	    
// 	  // ■■■■■■■■■■■■ input date에서 오늘 기준으로 이전날짜는 선택할 수 없게 하는 방법 ■■■■■■■■■■■■■■■■■
// 	  // 현재 날짜를 가져오는 함수
// 	  function getTodayDate() {
// 	      const today = new Date();
// 	      const year = today.getFullYear();
// 	      const month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
// 	      const day = today.getDate().toString().padStart(2, '0');
// 	      return `${year}-${month}-${day}`;
// 	  }
	
// 	  // 오늘 날짜를 가져와서 dateInput 요소의 min 속성에 할당
// 	  document.getElementById('minDate').min = getTodayDate();   // 아 왜 안돼;;
	
	
	// ■■■■■■■■■■■■■■■■■ 파일 버튼 변경 및 선택된 파일 이름 가져오기 ■■■■■■■■■■■■■■■■■
	// 파일 선택 이벤트 리스너 추가
	document.getElementById('thum').addEventListener('change', function () {
	  // 선택된 파일 가져오기
	  const selectedFile = this.files[0];
	
	  // 파일 정보 표시
	  if (selectedFile) {
	      document.getElementById('fileInfo').innerHTML = `파일 이름 : ${selectedFile.name}`;
	  } else {
	      document.getElementById('fileInfo').innerHTML = '파일을 선택하지 않았습니다.';
	  }
	});

  
	</script>



<script>
  function toggleReportDiv() {
    const reportDiv = document.getElementById("report-div");
    reportDiv.style.display = reportDiv.style.display === "none" ? "block" : "none";
  }
  
//신고 모달
  var selectElement = document.getElementById("reportSelect");
  var textareaElement = document.getElementById("customReason");
  selectElement.addEventListener("change", function() {
    if (selectElement.value === "etc") {
      textareaElement.style.display = "block";
    } else {
      textareaElement.style.display = "none";
    }
  });
</script>

</body>

</html>