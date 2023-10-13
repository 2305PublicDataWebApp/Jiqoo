<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link href="../resources/assets/css/post_moqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">


  <!-- 썸머노트 스타일 및 스크립트 추가 -->
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

    <!-- ======= Modal ======= -->
    <div class="modal-body">
    </div>

    <div id="container" data-aos=fade-in> 

      
    <!-- ======= Post ======= -->
    <div id="post" class="col-md-12 col-xxl-10 mx-auto">
      <div class="post-header">
        <div id="post-location" class="mx-auto">어르신.현재.숲속</div>
        <div class="report-button">
          <img class="dots" src="../../assets/img/etc/dots.png" alt="" onclick="toggleReportDiv(this)">
          <div id="report-div" style="display: none;">
            <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a>
              <i class="bi bi-exclamation-circle"></i>
          </div>  
        </div>
      </div>
      <div id="post-title">부대찌개 맛집</div>
        <div id="writer-info">
          <div id="post-profile" class="col-lg-2 col-md-3 col-sm-3">
            <img src="../../assets/img/profile/준표2.png" alt="프로필 이미지" class="profile-image">
          </div>
          <div id="post-nick" class="col-lg-10 col-md-9 col-sm-9">
            <div id="writer-name">배준표</div>
            <div class="row">
              <div class="info post-date col-lg-6 col-md-12">yyyy-mm-dd hh-mm</div>
              <div class="info view-count col-lg-3 col-md-12">조회 140</div>
            </div>
          </div>
        </div>
      <hr>
      	<div id="content">넘무 맛있다 배부르다</div>
      
	    <!-- 지도 들어갈 자리 -->
	    <div id="map">
	
	    </div>
	    <div>
	      <p>모일 날짜 : <span>${moqooList.moqooDay }</span></p>
	      <p>참여인원 : <span>${moqooList.moqooJoin }</span>/8</p>
	    </div>
	
	    <div class="post-footer">
	      <div class="heart-container">
	        <img class="heart" src="../../assets/img/etc/heart(full).png" alt="">
	        <span class="heart-count">14</span>
	      </div>
	      <div class="button-container">
	        <button class="btn post-btn open-modal" data-bs-toggle="modal" data-bs-target=".modal"  id="modify-btn">수정</button>
	        <button class="btn post-btn" id="delete-btn">삭제</button>
	      </div>
	    </div>
	    <div id="participate">
	      <button class="btn post-btn" id="participate-btn">참여하기</button>
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
                          <img class="tag-img" src="../../assets/img/rice.png" alt="밥">
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category2" value="option2" required>
                        <label class="form-check-label" for="category2">
                          <img class="tag-img" src="../../assets/img/alcohol.png" alt="술">
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category3" value="option3" required>
                        <label class="form-check-label" for="category3">
                          <img class="tag-img" src="../../assets/img/study.png" alt="공부">
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category4" value="option4" required>
                        <label class="form-check-label" for="category4">
                          <img class="tag-img" src="../../assets/img/exercise.png" alt="운동">
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category5" value="option5" required>
                        <label class="form-check-label" for="category5">
                          <img class="tag-img" src="../../assets/img/movie.png" alt="영화">
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="category" id="category6" value="option6" required>
                        <label class="form-check-label" for="category6">
                          <img class="tag-img" src="../../assets/img/pet.png" alt="반려동물">
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

		<!-- 댓글 -->
        <div class="comment-section col-md-12 col-xxl-10 mx-auto">
		  <span>댓글</span><span>3 댓글 갯수</span>
          <ul class="comment-list">
            <li class="comment">
			  <img class="mini-dots" src="../../assets/img/etc/dots.png" alt="" onclick="toggleReportDiv(this)">
			  <div id="report-div" style="display: none;">
			    <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a>
				  <i class="bi bi-exclamation-circle"></i>
			  </div>
			  <div class="user-info">
                <img src="../../assets/img/profile/준표프사.png" alt="User 1">
                <span class="username">준표</span>
                <span class="date">2023-10-07</span>
                <a href="javascript:void(0);" class="comt" onclick="replyForm(this);">답글쓰기</a>
                <a href="javascript:void(0);" class="comt" onclick="modReply(this);">수정</a>
                <a href="#" class="comt">삭제</a>
              </div>
              <!-- ■■■■■ 신고하기 버튼 ■■■■■ -->
              <div id="report-div" style="display: none;">
                <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a>
                <i class="bi bi-exclamation-circle"></i>
              </div>
              <p class="comment-text">첫번째 댓글임~~~~~~~~~~~~~~~~~~~~</p>
              <!-- ■■■■■ 댓글 수정 폼 ■■■■■ -->
              <form action="" method="" class="mod-comment-form col-md-12 col-xxl-10 mx-auto">
                <textarea>value값</textarea>
                <button class="btn postbtn" id="mod-submit-btn">등록</button>
              </form>
              <!-- ■■■■■ 대댓글 입력 폼 ■■■■■ -->
              <form action="" method="" class="mod-comment-form col-md-12 col-xxl-10 mx-auto">
                <textarea>value값</textarea>
                <button class="btn postbtn" id="re-comt-submit-btn">등록</button>
              </form>
            </li>
<!--             // 첫번째 댓글의 답글 -->
            <li class="comment reply-comment">
              <img class="mini-dots" src="../../assets/img/etc/dots.png" alt="" onclick="toggleReportDiv(this)">
              <div id="report-div" style="display: none;">
                <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a>
                <i class="bi bi-exclamation-circle"></i>
              </div>
              <div class="user-info">
                <img src="../../assets/img/profile/준표프사.png" alt="User 2">
                <span class="username">지후</span>
                <span class="date">2023-10-06</span>
                <a href="javascript:void(0);" class="comt" onclick="replyForm(this);">답글쓰기</a>
                <a href="javascript:void(0);" class="comt" onclick="modReply(this);">수정</a>
                <a href="#" class="comt">삭제</a>
              </div>
              <p class="comment-text">나눈 첫번째 댓글의 답글~~~~~~~~</p>
              <!-- 대댓글 입력 폼 -->
              <form action="" method="" class="re-comment-form col-md-12 col-xxl-10 mx-auto">
                <textarea></textarea>
                <button class="btn postbtn" id="re-submit-btn">등록</button>
              </form>
              <!-- 대댓글 수정 폼 -->
              <form action="" method="" class="re-mod-comment-form col-md-12 col-xxl-10 mx-auto">
                <textarea>value값</textarea>
                <button class="btn postbtn" id="re-mod-submit-btn">등록</button>
              </form>
            </li>
            <!--  --크게 forEach하고 답글만 따로 또 forEach하면 되나?----여기까지 반복------------------------ -->
            
            <li class="comment">
              <img class="mini-dots" src="../../assets/img/etc/dots.png" alt="" onclick="toggleReportDiv(this)">
              <div id="report-div" style="display: none;">
                <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a>
                <i class="bi bi-exclamation-circle"></i>
              </div>
              <div class="user-info">
                <img src="../../assets/img/profile/준표프사.png" alt="User 2">
                <span class="username">지후</span>
                <span class="date">2023-10-06</span>
                <a href="javascript:void(0);" class="comt" onclick="replyForm(this);">답글쓰기</a>
                <a href="javascript:void(0);" class="comt" onclick="modReply(this);">수정</a>
                <a href="#" class="comt">삭제</a>
              </div>
              <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
            </li>
          </ul>
        </div>
        <!-- 페이징처리할 div -->
        <div class="comment-page-container">
          <span class="comment-page">< 1 2 3 4 5 ></span>
        </div>
        <form action="" method="" class="comment-form col-md-12 col-xxl-10 mx-auto">
          <textarea placeholder="댓글을 입력하세요"></textarea>
          <button class="btn postbtn" id="submit-btn">등록</button>
        </form>
          
          
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
  // 카테고리 열기
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

  // dropdown
  function toggleDropdown() {
    var dropdown = document.getElementById("dropdown");
    if (dropdown.style.display === "block") {
        dropdown.style.display = "none";
    } else {
        dropdown.style.display = "block";
    }
  }

  // 이미지 요소를 클릭하면 toggleDropdown 함수를 호출
  var dotsImage = document.getElementById("report-dots");
  dotsImage.addEventListener("click", toggleDropdown);

  // 댓글 수정 & 답글 버튼 누를 때 동작
  var replyFormVisible = false; // 대댓글 폼 상태 변수
  var modFormVisible = false; // 수정 폼 상태 변수

  // 대댓글 폼 화면에 띄우기
  function replyForm(obj){
    var replyFormElement = obj.parentElement.parentElement.parentElement.nextElementSibling.nextElementSibling;
    var modFormElement = obj.parentElement.parentElement.parentElement.nextElementSibling;
      
    if (modFormVisible) {
      modFormElement.style.display = "none";
      modFormVisible = false;
    }
    
    if (replyFormVisible) {
      replyFormElement.style.display = "none";
      replyFormVisible = false;
    } else {
      replyFormElement.style.display = "block";
      replyFormVisible = true;
    }
  }

  // 댓글 수정 폼 띄우기
  function modReply(obj){
    var modFormElement = obj.parentElement.parentElement.parentElement.nextElementSibling;
    var replyFormElement = obj.parentElement.parentElement.parentElement.nextElementSibling.nextElementSibling;
    
    if (replyFormVisible) {
      replyFormElement.style.display = "none";
      replyFormVisible = false;
    }
    
    if (modFormVisible) {
      modFormElement.style.display = "none";
      modFormVisible = false;
    } else {
      modFormElement.style.display = "block";
      modFormVisible = true;
    }
  }

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

  // 신고버튼 등장
  var rePortVisible = false;  // 신고 div 상태 변수

  function toggleReportDiv(obj) {
    var reportDiv = obj.nextElementSibling;

    if(rePortVisible) {
      reportDiv.style.display = "none";
      rePortVisible = false; 
    } else {
      reportDiv.style.display = "block";
      rePortVisible = true; 
    }
  }

  // 신고 모달
  var selectElement = document.getElementById("reportSelect");
  var textareaElement = document.getElementById("customReason");
  selectElement.addEventListener("change", function() {
    if (selectElement.value === "etc") {
      textareaElement.style.display = "block";
    } else {
      textareaElement.style.display = "none";
    }
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


  // 신고 모달
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