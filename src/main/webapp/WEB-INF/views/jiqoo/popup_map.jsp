<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
  <!-- 부트스트랩 CSS -->
  
  <!-- 부트스트랩 JavaScript 및 jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/jiqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">



    <!-- 서머노트를 위해 추가해야할 부분 -->
    <!-- <script src="../resources/assets/vendor/summernote/summernote-lite.js"></script>
    <script src="../resources/assets/vendor/summernote/summernote-ko-KR.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="../resources/assets/vendor/summernote/summernote-lite.css"> -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
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
        <form action="" method="" class="search-form">
            <input type="text" placeholder="search"/>
            <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
        </form>
      </div>

      <!-- ======= Tab Section ======= -->
      <section id="tab" class="d-flex flex-column flex-sm-row">
        <div id="my-tab" class="col-6" style="max-width: 400px;">내꾸만 보기</div>
        <div id="other-tab" class="col-6" style="max-width: 400px;">남꾸도 보기</div>
    </section>
      <!-- ======= Modal ======= -->
      <div class="modal-body">
      </div>
    <!-- ======= Map Section ======= -->
    <!-- 지도를 표시할 div 입니다 -->
    <div id="map" style="width:100%;height:650px;"></div>


    <button type="button" class="btn insert-jiqoo-btn" data-bs-toggle="modal" data-bs-target=".modal">지꾸 +</button>
    <!-- ======= Modal ======= -->
    <div class="modal" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content" style="background-color: #6DBE45; color: #fff;">
          <div class="modal-header">
            <h5 class="modal-title">게시물 입력</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <!-- 게시물 입력 폼 -->
            <form>
              <div class="mb-3 col-lg-5 mx-auto location-container">
                <input type="text" class="form-control" id="location" name="location" value="할아버지.집.가고싶다" readonly>
                <button id="open-map-btn">+</button>
              </div>
              <div class="mb-3 row date-tag-container">
                <div class="date-container col-md-3">
                  <input type="date" class="form-control" id="date" name="date" required>
                </div>
                <div class="col-md-2 c-btn">
                  <span>카테고리</span>
                  <i class="bi bi-caret-down-fill" onclick="toggleCC()"></i>
                </div>
                  <div class="category-container" style="display: none;">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category1" value="option1" required>
                        <label class="form-check-label" for="category1">
                            <img class="tag-img" src="../resources/assets/img/rice.png" alt="밥">
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category2" value="option2" required>
                        <label class="form-check-label" for="category2">
                            <img class="tag-img" src="../resources/assets/img/alcohol.png" alt="술">
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category3" value="option3" required>
                        <label class="form-check-label" for="category3">
                            <img class="tag-img" src="../resources/assets/img/study.png" alt="공부">
                        </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="category" id="category4" value="option4" required>
                      <label class="form-check-label" for="category4">
                          <img class="tag-img" src="../resources/assets/img/exercise.png" alt="운동">
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="category" id="category5" value="option5" required>
                      <label class="form-check-label" for="category5">
                          <img class="tag-img" src="../resources/assets/img/movie.png" alt="영화">
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="category" id="category6" value="option6" required>
                      <label class="form-check-label" for="category6">
                          <img class="tag-img" src="../resources/assets/img/pet.png" alt="반려동물">
                      </label>
                    </div>
                  </div>
                  <!-- 다른 옵션들도 동일한 방식으로 추가 -->
          
              </div>
              <div class="mb-3">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목" required>
              </div>
              <div class="mb-3">
                <textarea id="summernote" name="content" required></textarea>
              </div>
              <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="publicSwitch" checked>
                <label class="form-check-label" for="publicSwitch">공개 여부</label>
              </div>
              <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="commentSwitch" checked>
                <label class="form-check-label" for="commentSwitch">댓글 허용</label>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn reset" data-bs-dismiss="modal">취소</button>
            <button type="button" class="btn insert">등록</button>
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
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
    });
</script>

<script>
  // JavaScript 코드를 추가합니다.
  const radioButtons = document.querySelectorAll('.form-check-input');
  const imageLabels = document.querySelectorAll('.form-check-label');

  imageLabels.forEach((label, index) => {
      label.addEventListener('click', () => {
          radioButtons[index].checked = true;
      });
  });
</script>

<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86452fa459f600c914e3aa3a57039abd"></script>
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

  var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
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

 // 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('이태원 맛집', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
  </script>


<script>
// 버튼 클릭 시 팝업 창 열기
document.getElementById("open-map-btn").onclick = function() {
  // 팝업 창을 열기 위한 윈도우.open 함수 사용
  window.open("popup_map.html", "Popup", "width=1200,height=800,resizable=no");
};

</script>

<script>
  function toggleCC() {
    const categoryContainer = document.querySelector(".category-container");
    categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
  }
</script>
</body>

</html>