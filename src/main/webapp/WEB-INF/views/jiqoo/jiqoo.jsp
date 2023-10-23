<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- 부트스트랩 CSS -->

<!-- 부트스트랩 JavaScript 및 jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Template Main CSS File -->
<link href="../resources/assets/css/jiqoo.css" rel="stylesheet">
<link href="../resources/assets/css/header.css" rel="stylesheet">
<link href="../resources/assets/css/footer.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<!-- <script src="../resources/assets/vendor/summernote/summernote-lite.js"></script>
<script src="../resources/assets/vendor/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/assets/vendor/summernote/summernote-lite.css"> -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86452fa459f600c914e3aa3a57039abd"></script>

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
		<!-- ======= Search Section ======= -->
		<div class="search-container">
			<form action="" method="" class="search-form">
				<input type="text" placeholder="search" />
				<button type="submit" id="search-btn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
            </svg>
				</button>
			</form>
		</div>

		<!-- ======= Tab Section ======= -->
		<!-- ======= 목록으로 이동 ======= -->
		<div id="tab">
			<button id="btn-myMap" class="btn-get-started scrollto">내꾸만 보기</button>
			<button id="btn-allMap" class="btn-get-started scrollto qoo">남꾸도 보기</button>
		</div>
		<!-- ======= Modal ======= -->
		<div class="modal-body"></div>
		<!-- ======= Map Section ======= -->
		<!-- 지도를 표시할 div 입니다 -->
		<a href="/jiqoo/list"><i class="bi bi-list"></i></a>
		<div id="map"></div>

		<button type="button" class="btn insert-jiqoo-btn"
			data-bs-toggle="modal" data-bs-target=".modal">지꾸 +</button>
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
							<div class="mb-3 row date-tag-container">
								<div class="date-container col-md-3">
									<input type="date" class="form-control" id="date" name="jiqooDate"
										required>
								</div>
								<div class="col-md-2 c-btn">
									<span>카테고리</span> <i class="bi bi-caret-down-fill"
										onclick="toggleCC()"></i>
								</div>
								<div class="category-container" style="display: none;">
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
<!-- 									<div class="form-check"> -->
<!-- 										<input class="form-check-input" type="radio" name="category" -->
<!-- 											id="category1" value="option1" required> <label -->
<!-- 											class="form-check-label" for="category1"> <img -->
<!-- 											class="tag-img" src="../resources/assets/img/rice.png" -->
<!-- 											alt="밥"> -->
<!-- 										</label> -->
<!-- 									</div> -->
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
		showAllMap();
    });
    

  // JavaScript 코드를 추가합니다.
  var btnMyMap = $("#btn-myMap");
  var btnAllMap = $("#btn-allMap");
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

//지도

var map = null;
var mapContainer = document.getElementById('map') // 지도를 표시할 div 
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            
		var mapOption = { 
		        center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		    
      });

function showMyMap(){
	navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            
			var mapOption = { 
			        center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };
			
			map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			    
	      });
	if(btnAllMap.hasClass("qoo")) {
   	 	// "qoo" 클래스를 삭제합니다
	    btnAllMap.removeClass("qoo");
	    // "qoo" 클래스를 추가합니다
	    btnMyMap.addClass("qoo");
	}
	
	 // 커스텀 오버레이 배열을 선언합니다
	  var customOverlays = [];
	 $.ajax({
	        url: "/jiqoo/showMyMap",
	        type: "GET",
	        success: function (data) {
	  	      for (var i = 0; i < data.length; i++) {
	  	        // 마커 이미지의 이미지 크기 입니다
	  	        var imageSize = new kakao.maps.Size(70, 70);

	  	        // 마커 이미지를 생성합니다    
	  	        var markerImage = new kakao.maps.MarkerImage(data[i].category.cImgPath, imageSize);

	  	        // 마커를 생성합니다
	  	        var marker = new kakao.maps.Marker({
	  	          map: map, // 마커를 표시할 지도
	  	          position: new kakao.maps.LatLng(data[i].jiqooLat, data[i].jiqooLng),
	  	          image: markerImage,
	  	          clickable: true
	  	        });
	  	        
	  	        

	  	        // 커스텀 오버레이에 표시될 내용을 생성합니다
	  	        var overlayContent =  '<div class="infoWindow" id="custom-'+ data[i].jiqooNo +'">' +
	  	          '<div class="info-header"><a href="/jiqoo/detail?jiqooNo='+data[i].jiqooNo +'">' + data[i].jiqooW3W + '</a></div>' +
	  	          '<div class="info-footer">' + data[i].jiqooContent + '</div>' +
	  	          '</div>';

	  	   // 커스텀 오버레이를 생성합니다
		        var customOverlay = new kakao.maps.CustomOverlay({
		          content: overlayContent,
		          position: marker.getPosition(),
		          clickable: true
		        });

		        // 클릭된 마커의 커스텀 오버레이를 닫기 위한 클릭 상태 변수
		        var overlayClicked = false;

		     // 마커에 클릭 이벤트를 등록합니다
		        (function (customOverlay, marker) {
		            kakao.maps.event.addListener(marker, 'click', function () {
		                if (customOverlay.getMap()) {
		                    customOverlay.setMap(null);
		                } else {
		                    customOverlay.setMap(map);
		                }

		                lastClickedOverlay = customOverlay;

		                for (var j = 0; j < customOverlays.length; j++) {
		                    if (customOverlays[j] !== customOverlay) {
		                        customOverlays[j].setMap(null);
		                    }
		                }
		            });

		            customOverlays.push(customOverlay);
		        })(customOverlay, marker);
		     
		     

		      }
		    }
		  });
		}
	
function showAllMap() {
	  navigator.geolocation.getCurrentPosition(function(position) {
	    var lat = position.coords.latitude; // 위도
	    var lon = position.coords.longitude; // 경도

	    var mapOption = {
	      center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
	      level: 4 // 지도의 확대 레벨
	    };

	    map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	  });

	  if (btnMyMap.hasClass("qoo")) {
	    // "qoo" 클래스를 삭제합니다
	    btnMyMap.removeClass("qoo");
	    // "qoo" 클래스를 추가합니다
	    btnAllMap.addClass("qoo");
	  }

	  // 커스텀 오버레이 배열을 선언합니다
	  var customOverlays = [];

	  $.ajax({
	    url: "/jiqoo/showAllMap",
	    type: "GET",
	    dataType: 'json',
	    success: function (data) {
	      for (var i = 0; i < data.length; i++) {
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(70, 70);

	        // 마커 이미지를 생성합니다
	        var markerImage = new kakao.maps.MarkerImage(data[i].category.cImgPath, imageSize);

	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	          map: map, // 마커를 표시할 지도
	          position: new kakao.maps.LatLng(data[i].jiqooLat, data[i].jiqooLng),
	          image: markerImage,
	          clickable: true
	        });

	        // 커스텀 오버레이에 표시될 내용을 생성합니다
	         var overlayContent =  '<div class="infoWindow" id="custom-'+ data[i].jiqooNo +'">' +
	  	        '<div class="info-header"><a href="/jiqoo/detail?jiqooNo=' + data[i].jiqooNo + '">' +
	  	        data[i].jiqooW3W + ' <i class="bi bi-arrow-right-circle-fill"></i></a></div>' +
	  	        '<div class="info-footer">' + data[i].jiqooContent + '</div>' +
	  	        '</div>'; 

	        // 커스텀 오버레이를 생성합니다
	        var customOverlay = new kakao.maps.CustomOverlay({
	          content: overlayContent,
	          position: marker.getPosition(),
	          clickable: true
	        });

	        // 클릭된 마커의 커스텀 오버레이를 닫기 위한 클릭 상태 변수
	        var overlayClicked = false;

	     // 마커에 클릭 이벤트를 등록합니다
	        (function (customOverlay, marker) {
	          kakao.maps.event.addListener(marker, 'click', function () {
	            // 클릭된 마커의 커스텀 오버레이를 열고 닫기
	            if (customOverlay.getMap()) {
	              customOverlay.setMap(null); // 커스텀 오버레이 닫음
	            } else {
	              customOverlay.setMap(map); // 커스텀 오버레이 열음
	            }

	            // 마지막으로 클릭된 커스텀 오버레이 업데이트
	            lastClickedOverlay = customOverlay;

	            // 다른 커스텀 오버레이 닫기
	            for (var j = 0; j < customOverlays.length; j++) {
	              if (customOverlays[j] !== customOverlay) {
	                customOverlays[j].setMap(null);
	              }
	            }
	          });

	          customOverlays.push(customOverlay);
	        })(customOverlay, marker);
	      }
	    }
	  });
	}


	
//btn-allMap 버튼 클릭 이벤트 처리
$("#btn-allMap").click(function() {
    showAllMap(); // showAllMap 함수 호출
});

// btn-myMap 버튼 클릭 이벤트 처리
$("#btn-myMap").click(function() {
    showMyMap(); // showMyMap 함수 호출
});

  function toggleCC() {
    const categoryContainer = document.querySelector(".category-container");
    categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
  }


    
</script>


</body>

</html>