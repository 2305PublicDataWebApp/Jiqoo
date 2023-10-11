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



<!-- 서머노트를 위해 추가해야할 부분 -->
<!-- <script src="../resources/assets/vendor/summernote/summernote-lite.js"></script>
    <script src="../resources/assets/vendor/summernote/summernote-ko-KR.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="../resources/assets/vendor/summernote/summernote-lite.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


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
		<section id="tab" class="d-flex flex-column flex-sm-row">
			<div id="my-tab" class="col-6" style="max-width: 400px;">내꾸만 보기</div>
			<div id="other-tab" class="col-6" style="max-width: 400px;">남꾸도보기</div>
		</section>
		<!-- ======= Modal ======= -->
		<div class="modal-body"></div>
		<!-- ======= Map Section ======= -->
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width: 100%; height: 650px;"></div>


		<button type="button" class="btn insert-jiqoo-btn"
			data-bs-toggle="modal" data-bs-target=".modal">지꾸 +</button>
		<!-- ======= Modal ======= -->
		<div class="modal" tabindex="-1">
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
						<form action="/jiqoo/insert.do" method="POST">
							<div class="mb-3 col-lg-5 mx-auto location-container">
								<input type="text" class="form-control" id="location"
									name="location" value="할아버지.집.가고싶다" readonly>
								<button id="open-map-btn">+</button>
							</div>
							<div class="mb-3 row date-tag-container">
								<div class="date-container col-md-3">
									<input type="date" class="form-control" id="date" name="date"
										required>
								</div>
								<div class="col-md-2 c-btn">
									<span>카테고리</span> <i class="bi bi-caret-down-fill"
										onclick="toggleCC()"></i>
								</div>
								<div class="category-container" style="display: none;">
								<c:forEach var="categoryList" items="${categoryList }">
									<div class="form-check"> 
										<input class="form-check-input" type="radio" name="category"
											id="${categoryList.cName }" value="${categoryList.cName }" required> <label
											class="form-check-label" for="${categoryList.cName }"> <img
											class="tag-img" src="${categoryList.cImgPath }"
											alt="${categoryList.cName }">
										</label>
									</div>
								</c:forEach>
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
							<div class="mb-3">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="제목" required>
							</div>
							<div class="mb-3">
								<textarea id="summernote" name="content" required></textarea>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="publicSwitch" checked> <label
									class="form-check-label" for="publicSwitch">공개 여부</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="commentSwitch" checked> <label
									class="form-check-label" for="commentSwitch">댓글 허용</label>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86452fa459f600c914e3aa3a57039abd"></script>


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
  // 초기에는 my-tab이 선택되고 my-map이 보이도록 설정합니다.
  $("#my-tab").addClass("active-tab");
  $("#my-map").show();
  
  // my-tab을 클릭할 때의 동작을 정의합니다.
  $("#my-tab").click(function () {
      // my-tab에 백그라운드 색을 적용하고 other-tab의 백그라운드 색을 제거합니다.
      $("#my-tab").addClass("active-tab");
      $("#other-tab").removeClass("active-tab");
      
      // my-map을 보이게 하고 other-map을 숨깁니다.
      $("#my-map").show();
      $("#other-map").hide();
  });
  
  // other-tab을 클릭할 때의 동작을 정의합니다.
  $("#other-tab").click(function () {
      // other-tab에 백그라운드 색을 적용하고 my-tab의 백그라운드 색을 제거합니다.
      $("#other-tab").addClass("active-tab");
      $("#my-tab").removeClass("active-tab");
      
      // other-map을 보이게 하고 my-map을 숨깁니다.
      $("#other-map").show();
      $("#my-map").hide();
  });
</script>
</body>

</html>