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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ea3305868854dddd122f045e5c21b59"></script>

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
		<div id="list-icon-container">
			<div id="list-icon">
				<a href="/jiqoo/list"><i class="bi bi-list"></i></a>
			</div>
		</div>
		
		<div id="map"></div>

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
								<div class="col-md-2 c-btn" onclick="toggleCC()">
									<span>카테고리</span> <i class="bi bi-caret-down-fill"></i>
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
  var currentUserId = "${sessionScope.userId}"
  
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
		    url: "/jiqoo/showMyMap", // 서버에서 데이터를 가져올 URL
		    type: "GET", // GET 요청 사용
		    dataType: 'json', // 가져올 데이터의 형식 (JSON 사용)
		    success: function (data) { // 데이터 가져오기에 성공하면 실행
		    	if(data.length > 0) {
			        for (var i = 0; i < data.length; i++) { // 데이터 배열을 반복
			            var imageSize = new kakao.maps.Size(70, 70); // 마커 이미지의 크기 설정
			            var markerImage = new kakao.maps.MarkerImage(data[i].category.cImgPath, imageSize); // 마커 이미지 생성
			            var marker = new kakao.maps.Marker({
			                map: map, // 마커를 지도에 추가
			                position: new kakao.maps.LatLng(data[i].jiqooLat, data[i].jiqooLng), // 마커 위치 설정
			                image: markerImage, // 마커 이미지 설정
			                clickable: true // 마커 클릭 가능
			            });
	
			         	// 사용자 정의 컨텐츠를 가져오는 함수 호출
			            var contentData = parseContent(data[i].jiqooContent);
	
			            var overlayContent = '<div class="infoWindow" id="custom-' + data[i].jiqooNo + '">' +
			                '<div class="info-header"><a href="/jiqoo/detail?jiqooNo=' + data[i].jiqooNo + '">' +
			                data[i].jiqooW3W + ' <i class="bi bi-arrow-right-circle-fill"></i></a></div>' +
			                '<div class="info-content">' + contentData.pContent + '</div>';
	
			            if (contentData.imgSource) {
			                overlayContent += '<div class="info-image">' +
			                    contentData.imgSource +
			                    '</div>';
			            }
	
			            overlayContent += '</div>';
	
			            var customOverlay = new kakao.maps.CustomOverlay({
			                content: overlayContent, // 커스텀 오버레이의 내용 설정
			                position: marker.getPosition(), // 오버레이 위치 설정
			                clickable: true // 오버레이 클릭 가능
			            });
	
			            // 클릭된 마커의 커스텀 오버레이를 닫기 위한 클릭 상태 변수
			            var overlayClicked = false;
	
			            (function (customOverlay, marker) { // 클로저 함수 사용
			                kakao.maps.event.addListener(marker, 'click', function () { // 마커 클릭 이벤트 등록
			                    if (customOverlay.getMap()) {
			                        customOverlay.setMap(null); // 이미 열려있는 경우 오버레이 닫음
			                    } else {
			                        customOverlay.setMap(map); // 오버레이 열기
			                    }
	
			                    lastClickedOverlay = customOverlay; // 마지막으로 클릭된 커스텀 오버레이 업데이트
	
			                    for (var j = 0; j < customOverlays.length; j++) { // 다른 커스텀 오버레이 닫기
			                        if (customOverlays[j] !== customOverlay) {
			                            customOverlays[j].setMap(null);
			                        }
			                    }
			                });
	
			                customOverlays.push(customOverlay); // 커스텀 오버레이 배열에 추가
			            })(customOverlay, marker);
			        }
		    	}else {
		    		alert("+버튼을 눌러 지꾸를 시작해보세요!");
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
		    url: "/jiqoo/showAllMap", // 서버에서 데이터를 가져올 URL
		    type: "GET", // GET 요청 사용
		    dataType: 'json', // 가져올 데이터의 형식 (JSON 사용)
		    success: function (data) { // 데이터 가져오기에 성공하면 실행
		        for (var i = 0; i < data.length; i++) { // 데이터 배열을 반복
		            var imageSize = new kakao.maps.Size(70, 70); // 마커 이미지의 크기 설정
		            var markerImage = new kakao.maps.MarkerImage(data[i].category.cImgPath, imageSize); // 마커 이미지 생성
		            var marker = new kakao.maps.Marker({
		                map: map, // 마커를 지도에 추가
		                position: new kakao.maps.LatLng(data[i].jiqooLat, data[i].jiqooLng), // 마커 위치 설정
		                image: markerImage, // 마커 이미지 설정
		                clickable: true // 마커 클릭 가능
		            });

		         	// 사용자 정의 컨텐츠를 가져오는 함수 호출
		            var contentData = parseContent(data[i].jiqooContent);

		            var overlayContent = '<div class="infoWindow" id="custom-' + data[i].jiqooNo + '">' +
		                '<div class="info-header"><a href="/jiqoo/detail?jiqooNo=' + data[i].jiqooNo + '">' +
		                data[i].jiqooW3W + ' <i class="bi bi-arrow-right-circle-fill"></i></a></div>' +
		                '<div class="info-content">' + contentData.pContent + '</div>';

		            if (contentData.imgSource) {
		                overlayContent += '<div class="info-image">' +
		                    contentData.imgSource +
		                    '</div>';
		            }

		            overlayContent += '</div>';

		            var customOverlay = new kakao.maps.CustomOverlay({
		                content: overlayContent, // 커스텀 오버레이의 내용 설정
		                position: marker.getPosition(), // 오버레이 위치 설정
		                clickable: true // 오버레이 클릭 가능
		            });

		            // 클릭된 마커의 커스텀 오버레이를 닫기 위한 클릭 상태 변수
		            var overlayClicked = false;

		            (function (customOverlay, marker) { // 클로저 함수 사용
		                kakao.maps.event.addListener(marker, 'click', function () { // 마커 클릭 이벤트 등록
		                    if (customOverlay.getMap()) {
		                        customOverlay.setMap(null); // 이미 열려있는 경우 오버레이 닫음
		                    } else {
		                        customOverlay.setMap(map); // 오버레이 열기
		                    }

		                    lastClickedOverlay = customOverlay; // 마지막으로 클릭된 커스텀 오버레이 업데이트

		                    for (var j = 0; j < customOverlays.length; j++) { // 다른 커스텀 오버레이 닫기
		                        if (customOverlays[j] !== customOverlay) {
		                            customOverlays[j].setMap(null);
		                        }
		                    }
		                });

		                customOverlays.push(customOverlay); // 커스텀 오버레이 배열에 추가
		            })(customOverlay, marker);
		        }
		    }
		});

	}


function parseContent(content) {
    var parser = new DOMParser();
    var doc = parser.parseFromString(content, 'text/html');

 // <p> 요소를 추출
    var pElements = doc.querySelectorAll('p');
    var pContent = '';

    for (var i = 0; i < pElements.length; i++) {
        var innerHTML = pElements[i].innerHTML.trim(); // 텍스트 내용을 얻고 좌우 공백을 제거
        if (innerHTML) { // 비어있지 않은 경우에만 <p> 요소 추가
            pContent += '<p>' + innerHTML + '</p>';
        }
    }

    // <img> 요소를 추출
    var imgElements = doc.querySelectorAll('img');
    var imgSource = ''; // 이미지가 없을 경우 빈 문자열
    if (imgElements.length > 0) {
        // 이미지가 있을 경우 img 태그 생성
        imgSource = imgElements[0].getAttribute('src');
        imgSource = '<img src="' + imgSource + '" alt="Image">';
    }

    // 만약 pContent의 길이가 특정 길이를 초과하면 자르고 "..."을 추가
    var maxContentLength = 10; // 원하는 최대 길이로 설정하세요
    if (pContent.length > maxContentLength) {
        pContent = pContent.substring(0, maxContentLength) + '...';
    }
    
    // <p><br></p>를 제거
    pContent = pContent.replace(/<p><br><\/p>/g, '');

    return {
        pContent: pContent,
        imgSource: imgSource
    };
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

    
</script>


</body>

</html>