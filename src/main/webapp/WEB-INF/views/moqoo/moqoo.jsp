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
  <link href="../resources/assets/css/moqoo.css" rel="stylesheet">



<!-- 썸머노트 스타일 및 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@latest/dist/summernote-bs4.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@latest/dist/summernote-bs4.min.js"></script>

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
      <!-- ======= Tab Section ======= -->
      <!-- <section id="tab" class="d-flex flex-column flex-md-row">
        <div id="my-tab">내꾸만 보기</div>
        <div id="other-tab">남꾸도 보기</div>
      </section> -->
      <div class="main-container" data-aos="fade-in">
        <div id="tab">
          <button id="btn-map" class="btn-get-started scrollto">지도</button>
          <button id="btn-list" class="btn-get-started scrollto">리스트</button>
        </div>
      </div>
  
      <!-- ======= Search Section ======= -->
      <div class="search-container">
        <form action="" method="" class="search-form">
            <input type="text" placeholder="search"/>
            <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
        </form>
      </div>


      <!-- ======= Modal ======= -->
      <div class="modal-body">
      </div>


    <!-- ======= Map Section ======= -->
    <div id="map">

    </div>

    <button type="button" class="btn insert-jiqoo-btn" data-bs-toggle="modal" data-bs-target=".modal"> 모꾸 +</button>
    <!-- <div class="modal-div">
      <button type="button" class="open-modal btn btn-primary" data-bs-toggle="modal" data-bs-target=".modal">모꾸 만들기</button>
    </div> -->
    
    <!-- ======= List Section ======= -->
    <div id="container" data-aos=fade-in>

      <!-- 결과 목록 아이템 -->
      <div class="row result-item">
        <div class="post-header">
          <div class="list-location">졸려.할아버지.잠와</div>
          <div class="report-button">
            <img id="dots" src="../resources/assets/img/dots.png" alt=""  onclick="toggleReportDiv()">
          </div>
          <div id="report-div" style="display: none;">
            <div id="report-text" onclick="reportUser()"><a href="javascript:void(0);" class="comt " data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a></div>
            <i class="bi bi-exclamation-circle"></i>
          </div>
        </div>
        <div id="profile-img" class="col-sm-12">
          <img src="../resources/assets/img/준표2.png" alt="프로필 이미지" class="profile-image">
        </div>
        <a href="post_moqoo.html" class="post-a">
          <div class="col-md-10">
              <div class="title">게시물 제목</div>
              <div class="content">게시물 내용 ㅇㄴㅇㅇㅇㄴㄹㅇㄹxzdfdfdsfsfdfdss</div>
              <div class="row">
                <div class="author col-lg-3 col-md-12">소진소진</div>
                <div class="info col-lg-6 col-md-12">yyyy-mm-dd hh-mm</div>
                <div class="heart-container col-lg-3 col-md-12">
                  <img class="heart" src="../resources/assets/img/heart(full).png" alt="">
                </div>
              </div>
          </div>
        </a>
      </div>
      <div class="row result-item">
        <div class="post-header">
          <div class="list-location">졸려.할아버지.잠와</div>
          <div class="report-button">
            <img id="dots" src="../resources/assets/img/dots.png" alt=""  onclick="toggleReportDiv()">
          </div>
          <div id="report-div" style="display: none;">
            <div id="report-text" onclick="reportUser()">신고하기</div>
            <i class="bi bi-exclamation-circle"></i>
          </div>
        </div>
        <div id="profile-img" class="col-sm-12">
          <img src="../resources/assets/img/준표2.png" alt="프로필 이미지" class="profile-image">
        </div>
        <div class="col-md-12">
            <a href="post_moqoo.html" class="post-a">
              <div class="title">게시물 제목</div>
              <div class="content">게시물 내용 ㅇㄴㅇㅇㅇㄴㄹㅇㄹxzdfdfdsfsfdfdss</div>
            </a>
              <div class="row">
                <div class="author col-lg-3 col-md-12">소진소진</div>
                <div class="info col-lg-6 col-md-12">yyyy-mm-dd hh-mm</div>
                <div class="heart-container col-lg-3 col-md-12">
                  <img class="heart" src="../resources/assets/img/heart(full).png" alt="">
                </div>
              </div>
          </div>
      </div>
      <div class="row result-item">
        <div class="post-header">
          <div class="list-location">졸려.할아버지.잠와</div>
          <div class="report-button">
            <img id="dots" src="../resources/assets/img/dots.png" alt=""  onclick="toggleReportDiv()">
          </div>
          <div id="report-div" style="display: none;">
            <div id="report-text" onclick="reportUser()">신고하기</div>
            <i class="bi bi-exclamation-circle"></i>
          </div>
        </div>
        <div id="profile-img" class="col-sm-12">
          <img src="../resources/assets/img/준표2.png" alt="프로필 이미지" class="profile-image">
        </div>
        <div class="col-md-12">
            <div class="title">게시물 제목</div>
            <div class="content">게시물 내용 ㅇㄴㅇㅇㅇㄴㄹㅇㄹxzdfdfdsfsfdfdss</div>
            <div class="row">
              <div class="author col-lg-3 col-md-12">소진소진</div>
              <div class="info col-lg-6 col-md-12">yyyy-mm-dd hh-mm</div>
              <div class="heart-container col-lg-3 col-md-12">
                <img class="heart" src="../resources/assets/img/heart(full).png" alt="">
              </div>
            </div>
        </div>
      </div>
    </div> 

    <!-- 신고 모달 -->
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
            <textarea id="customReason" style="display:none" spellcheck="false"></textarea>
            <div>
              <small>게시물을 신고하신 이유를 제출해주시면 관리자 검토 후 조치하겠습니다.</small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn send-report">보내기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>

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
              <div class="mb-3" style="display: flex;">
                <div>
                  <input type="file" class="custom-file-input" id="thum" name="uploadFile" placeholder="썸네일" required>
                  <label for="thum" class="custom-button">파일 선택</label>
                </div>
                <!-- 파일 정보 표시 영역 -->
                <div id="fileInfo"></div>
              </div>
              <div class="mb-3">
                <textarea id="summernote" name="content" required></textarea>
              </div>
              <div class="mb-3">
                <input type="number" min="2" max="8" class="form-control" id="people" name="people" placeholder="참여인원" required>
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

<script>
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
</script>

</body>

</html>