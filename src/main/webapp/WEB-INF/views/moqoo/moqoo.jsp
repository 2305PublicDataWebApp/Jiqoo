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
.wrap {
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
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
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

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
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



<!-- 썸머노트 스타일 및 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@latest/dist/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@latest/dist/summernote-bs4.min.js"></script>

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


		<!-- ======= Modal ======= -->
		<div class="modal-body"></div>


		<!-- ======= Map Section ======= -->
		<div id="map" class="col-sm-12 mx-auto"></div>

		<button type="button" class="btn insert-jiqoo-btn"
			data-bs-toggle="modal" data-bs-target=".modal">모꾸 +</button>


		<!-- ======= List Section ======= -->
		<div id="container" data-aos=fade-in>

			<!-- 결과 목록 아이템 -->
			<c:forEach var="moqooList" items="${moqooList }">
				<c:url var="post_moqooUrl" value="/moqoo/detail">
					<c:param name="moqooNo" value="${moqooList.moqooNo }"></c:param>
				</c:url>
				<div class="row result-item">
					<div class="post-header">
						<div class="list-location">${moqooList.moqooW3W }</div>
						<div class="report-button">
							<img id="dots" src="../resources/assets/img/dots.png" alt="" onclick="toggleReportDiv()">
						</div>
						<div id="report-div" style="display: none;">
							<div id="report-text" onclick="reportUser()">신고하기</div>
							<i class="bi bi-exclamation-circle"></i>
						</div>
					</div>
					<div id="profile-img" class="col-sm-12">
					  <c:if test="${moqooList.moqooThumPath eq null }">
						<img src="../resources/assets/img/no-profile.png" alt="프로필 이미지" class="profile-image">
					  </c:if>
					  <c:if test="${moqooList.moqooThumPath ne null }">
						<img src="${moqooList.moqooThumPath }" alt="프로필 이미지" class="profile-image">
					  </c:if>
					</div>
					<a href="${post_moqooUrl }" class="post-a">
						<div class="col-md-10">
							<div class="title">${moqooList.moqooTitle }</div>
							<div class="content">${moqooList.moqooContent }</div>
							<div class="row">
								<div class="author col-lg-3 col-md-12">${moqooList.user.userNickname }</div>
								<div class="info col-lg-6 col-md-12"><fmt:formatDate pattern="yyyy-MM-dd" value="${moqooList.moqooDate }"/></div>
								<div class="heart-container col-lg-3 col-md-12">
									<img class="heart"
										src="../resources/assets/img/heart(full).png" alt="">
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
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
						<form action="/moqoo/insert" method="post" enctype="multipart/form-data">
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
									<span>카테고리</span> <i class="bi bi-caret-down-fill"
										onclick="toggleCC()"></i>
								</div>
								<div class="category-container" style="display: none;">
									<div class="category-list">
										<c:forEach var="categoryList" items="${categoryList }">
											<div class="form-check category">
												<input class="form-check-input" type="radio" name="category"
													id="${categoryList.cName }" value="${categoryList.cName }" required> 
													<label class="form-check-label"
													for="${categoryList.cName }"> <img class="tag-img"
													src="${categoryList.cImgPath }"
													alt="${categoryList.cName }">
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
									<input type="file" class="custom-file-input" id="thum"
										name="uploadFile" placeholder="썸네일" required> <label
										for="thum" class="custom-button">파일 선택</label>
								</div>
								<!-- 파일 정보 표시 영역 -->
								<div id="fileInfo"></div>
							</div>
							<div class="mb-3">
								<textarea id="summernote" name="moqooContent" required></textarea>
							</div>
							<div class="mb-3">
								<input type="number" min="2" max="8" class="form-control"
									id="people" name="moqooJoin" placeholder="참여인원" required>
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
        url:"moqoo/uploadSummernoteImageFile", 
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
    // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    
 	// ■■■■■■■■■■■■■ 지도 위에 마커 생성하기 ■■■■■■■■■■■■■
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(50, 60), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + 
	            '            카카오 스페이스닷원' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div class="img">' +
	            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	
    // 마커 위에 커스텀오버레이를 표시합니다
   	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
   	var overlay = new kakao.maps.CustomOverlay({
   	    content: content,
//    	    map: map,  // 커스텀 오버레이 숨김
   	    position: marker.getPosition()       
   	});
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	});
	    
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    overlay.setMap(null);     
	}    
    
    

//     // 장소 검색 객체를 생성합니다
//     var ps = new kakao.maps.services.Places(); 

//     // 키워드로 장소를 검색합니다
//     ps.keywordSearch('이태원 맛집', placesSearchCB); 

//     // 키워드 검색 완료 시 호출되는 콜백함수 입니다
//     function placesSearchCB (data, status, pagination) {
//         if (status === kakao.maps.services.Status.OK) {

//             // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
//             // LatLngBounds 객체에 좌표를 추가합니다
//             var bounds = new kakao.maps.LatLngBounds();

//             for (var i=0; i<data.length; i++) {
//                 displayMarker(data[i]);    
//                 bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
//             }       

//             // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
//             map.setBounds(bounds);
//         } 
//     }
    
 	
  </script>

	<script>
    // 버튼 클릭 시 팝업 창 열기
    document.getElementById("open-map-btn").onclick = function() {
      // 팝업 창을 열기 위한 윈도우.open 함수 사용
      window.open("popup_map", "Popup", "width=1200,height=800,resizable=no");
    };
  </script>

	<script>
    function toggleCC() {
      const categoryContainer = document.querySelector(".category-container");
      categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
    }
  </script>

	<script type="text/javascript">
  // JavaScript 코드를 추가합니다.
  const radioButtons = document.querySelectorAll('.form-check-input');
  const imageLabels = document.querySelectorAll('.form-check-label');

  imageLabels.forEach((label, index) => {
      label.addEventListener('click', () => {
          radioButtons[index].checked = true;
      });
  });

  // 버튼 클릭 시 div 숨기기
  const mapDiv = document.querySelector('#map');
  const container = document.querySelector('#container');
  const btnList = document.querySelector('#btn-list');
  const btnMap = document.querySelector('#btn-map');
  const btnModal = document.querySelector('.insert-jiqoo-btn');

  btnList.addEventListener('click', () => {
    container.style.display = 'block';
    mapDiv.style.display = 'none';
    btnModal.style.display='none';
  });

  btnMap.addEventListener('click', () => {
    mapDiv.style.display = 'block';
    container.style.display = 'none';
    btnModal.style.display='block';
  });

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