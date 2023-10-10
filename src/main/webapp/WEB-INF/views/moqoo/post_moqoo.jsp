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
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="index.html"><img src="../resources/assets/img/jiqooLogo.png"></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link" href="#">지꾸</a></li>
          <li><a class="nav-link" href="#">모꾸</a></li>
          <li><a class="nav-link" href="#"><i style="font-size:26px;" class="bi bi-bell"></i></a></li>
          <li class="dropdown"><a href="#"><i style="font-size:26px;" class="bi bi-person-circle"></i><i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

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
              <div id="location">어르신.현재.숲속</div>
              <div class="report-button">
                <img class="dots" src="../resources/assets/img/dots.png" alt="" onclick="toggleReportDiv()">
                <div id="report-div" style="display: none;">
                    <div id="report-text" onclick="reportUser()">신고하기</div>
                    <i class="bi bi-exclamation-circle"></i>
                </div>  
              </div>
            </div>
            <div id="post-title">부대찌개 맛집</div>
              <div id="writer-info">
                <div id="post-profile" class="col-lg-2 col-md-3 col-sm-3">
                  <img src="../resources/assets/img/준표2.png" alt="프로필 이미지" class="profile-image">
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
              <p>위치 : <span>종로구 마포갈매기</span></p>
              <p>모일 날짜 : <span>2023/10/26</span></p>
              <p>참여인원 : <span>2</span>/8</p>
            </div>

            <div class="post-footer">
              <div class="heart-container">
                <img class="heart" src="../resources/assets/img/heart(full).png" alt="">
                <span class="heart-count">14</span>
              </div>
              <button class="btn post-btn" id="participate-btn">참여하기</button>
              <div class="button-container">
                <button class="btn postbtn open-modal" data-bs-toggle="modal" data-bs-target=".modal"  id="modify-btn">수정</button>
                <button class="btn postbtn" id="delete-btn">삭제</button>
              </div>
            </div>

            <!-- <div class="participate">
              <button class="btn post-btn" id="participate-btn">참여하기</button>
            </div>
            <div class="button-container">
              <button class="btn postbtn open-modal" data-bs-toggle="modal" data-bs-target=".modal"  id="modify-btn">수정</button>
              <button class="btn postbtn" id="delete-btn">삭제</button>
            </div> -->
          </div>
      </div>

      <!-- ======= Modal ======= -->
        <div class="modal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content" style="background-color: #6DBE45; color: #fff;">
              <div class="modal-header">
                <h5 class="modal-title">게시물 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <!-- 게시물 입력 폼 -->
                <form>
                  <div class="mb-3 col-lg-5 mx-auto">
                    <input type="text" class="form-control" id="list-location" name="location" value="할아버지.집.가고싶다" readonly>
                  </div>
                  <div class="mb-3 row date-tag-container">
                    <div class="date-container col-md-3">
                      <input type="date" class="form-control" id="date" name="date" required>
                    </div>
                    <div class="col-md-7">
                      <div class="category-container">
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
                    <input type="text" class="form-control" id="address" name="address" placeholder="도로명주소" required>
                  </div>
                  <div class="mb-3">
                    <input type="number" min="2" max="8" class="form-control" id="people" name="people" placeholder="참여인원" required>
                  </div>
                  <!-- <div class="mb-3 form-switch">
                    <input type="checkbox" class="form-check-input" id="private" name="private">
                    <label class="form-check-label" for="private">비공개</label>
                  </div>
                  <div class="mb-3 form-switch">
                    <input type="checkbox" class="form-check-input" id="allowComments" name="allowComments">
                    <label class="form-check-label" for="allowComments">댓글 허용</label>
                  </div> -->
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="insert btn btn-primary">게시물 등록</button>
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

        <!-- 댓글 -->
        <div class="col-md-12 col-xxl-10 mx-auto">
            <p>댓글 <span>3</span></p>
        </div>
        <div class="comments col-md-12 col-xxl-10 mx-auto">
            <div class="comment">
              <div class="comment-header">
                <div class="comment-profile">
                    <img src="../resources/assets/img/준표프사.png" alt="프로필 사진">
                </div>
                <div class="comment-info">
                  <span class="comment-author">사용자1</span>
                  <span class="comment-date">2023-10-05</span>
                </div>
                <div class="comment-reply">
                    <a href="javascript:void(0);" class="comt" onclick="replyForm(this);">답글 쓰기</a>
                </div>
                <div class="etc">
                  <img id="report-dots" src="../resources/assets/img/dots.png" alt="">
                  <div class="dropdown-content" id="dropdown">
                    <ul class="report-dropdown">
                      <!-- 드롭다운 메뉴 내용 -->
                      <li><a href="javascript:void(0);" class="comt" onclick="modReply(this);">수정</a></li>
                      <li><a href="javascript:void(0);" class="comt">삭제</a></li>
                      <!-- 본인 댓글엔 신고 안뜸 -->
                      <li><a href="javascript:void(0);" class="comt " data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="comment-text">
                  댓글 내용이 여기에 들어갑니다.
              </div>
            </div>
            <!-- 댓글 수정 폼 -->
            <div class="re-comt-mod-form">
              <textarea class="re-comt-mod-text">value값</textarea>
              <div class="btn-div">
                <button class="btn postbtn" id="submit-btn1">등록</button>
              </div>
            </div>

            <!-- 대댓글 입력 폼 -->
            <div class="re-comment-form">
              <textarea class="recomment-text" placeholder="댓글을 입력하세요"></textarea>
              <div class="btn-div">
                <button class="btn postbtn" id="submit-btn2">등록</button>
              </div>
            </div>

            <!-- 대댓글 -->
            <div class="re-comment">
              <div class="re-comment-header">
                  <div class="comment-profile">
                    └
                    <img src="../resources/assets/img/준표프사.png" alt="프로필 사진">
                  </div>
                  <div class="comment-info">
                    <span class="comment-author">사용자1</span>
                    <span class="comment-date">2023-10-05</span>
                  </div>
                  <div class="etc">
                    <a href="#" class="comt">수정</a>
                    <a href="#" class="comt">삭제</a>
                    <!-- 본인 댓글엔 신고 안뜸 -->
                    <a href="#" class="comt">신고</a>
                  </div>
                  <!-- <div class="comment-reply">
                      <button onclick="re_reply();">답글 쓰기</button>
                  </div> -->
              </div>
              <div class="re-comment-text">
                  댓글 내용이 여기에 들어갑니다.
              </div>
            </div>

            <!-- 대댓글 수정 폼 -->
            <div class="re-comt-mod-form">
              <textarea class="re-comt-mod-text">value값</textarea>
              <div class="btn-div">
                <button class="btn postbtn" id="re-submit-btn">등록</button>
              </div>
            </div>
            
            <!-- 대대댓글 입력 폼 -->
            <!-- <div class="re-comment-form">
              <textarea id="re-comment-text" placeholder="댓글을 입력하세요"></textarea>
              <div id="btn-div">
                <button class="btn postbtn" id="submit-btn">등록</button>
              </div>
            </div> -->
        </div>
        
        <!-- 댓글 입력 폼 -->
        <div class="comment-form col-md-12 col-xxl-10 mx-auto">
            <textarea id="comment-text" placeholder="댓글을 입력하세요"></textarea>
            <div class="btn-div">
              <button class="btn postbtn" id="submit-btn">등록</button>
            </div>
        </div>

        

      </div>
  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-12 col-md-12">
            <div class="footer-info">
              <a href="#"><img src="../resources/assets/img/jiqooLogo.png"></a>
              <br><br>
              <p class="pb-3"><em>No.1 지도 다이어리</em></p>
              <p>
                120, Namdaemun-ro <br>
                Seoul, Korea<br><br>
                <strong>Phone:</strong> 02 2222 3333<br>
                <strong>Email:</strong> info@jiqoo.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              </div>
            </div>
          </div>

          <!-- <div class="col-lg-4 col-md-6 footer-links">
            <h4>지꾸</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">지꾸</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">모꾸</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>지꾸 뉴스레터</h4>
            <p>이메일을 입력해 지꾸의 새로운 정보를 받아보세요!</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div> -->

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>JIQOO</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

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


    // $(document).ready(function() {
    //   $('#summernote').summernote({
    //     placeholder: '당신의 추억을 저장하세요',
    //     height: 300, // 편집기 높이 설정
    //     toolbar: [
    //       ['style', ['bold', 'italic', 'underline', 'clear']],
    //       ['font', ['strikethrough']],
    //       ['para', ['ul', 'ol']],
    //       ['insert', ['link', 'picture']],
    //     ]
    //   });
    // });


    // 이렇게 쓰면 이상하게 이미지가 썸머노트 자체에 안들어가......
    $(document).ready(function(){
      $('#summernote').summernote({
        placeholder: '모임을 만들어보세요',
        height: 300, // 편집기 높이 설정
        // width : 700,
        lang : "ko-KR",
        callbacks:{
          onImageUpload : function(files){
            uploadSummernoteImageFile(files[0],this);
          },
          onPaste: function(e){
            var clipboardData = e.originalEvent.clipboardData;
            if(clipboardData && clipboardData.items && clipboardData.items.length){
              var item = clipboardData.items[0];
              if(item.kind === 'file' && item.type.indexOf('images/') !== -1){
                e.preventDefault();
              }
            }
          },
        }
      });

  // 섬머노트에디터 이미지 업로드 시 동작			
      function uploadSummernoteImageFile(file,editor){
        data = new FormData();
        data.append("file",file);
        $.ajax({
          data:data,
          type:"POST",
          url:"/trip/uploadSummernoteImageFile",
          dataType:"JSON",
          contentType:false,
          processData:false,
          success:function(data){
            $(editor).summernote("insertImage",data.url);
          }
        });
      }
    });

    // JavaScript 코드를 추가합니다.
    const radioButtons = document.querySelectorAll('.form-check-input');
    const imageLabels = document.querySelectorAll('.form-check-label');

    imageLabels.forEach((label, index) => {
        label.addEventListener('click', () => {
            radioButtons[index].checked = true;
        });
    });


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