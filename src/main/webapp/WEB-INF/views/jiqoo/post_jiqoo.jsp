<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link href="../resources/assets/css/post_jiqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">

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



      <div id="container" data-aos=fade-in> 

      
      <!-- ======= Post ======= -->
          <div id="post" class="col-md-12 col-xxl-10 mx-auto">
            <img class="dots" src="../assets/img/dots.png" alt="" onclick="toggleReportDiv()">
            <div id="report-div" style="display: none;">
                <div id="report-text" onclick="reportUser()">신고하기</div>
                <i class="bi bi-exclamation-circle"></i>
            </div>  
            <div class="location col-xs-12 col-sm-8 col-md-6 ">어르신.현재.숲속</div>
            <div id="title">부대찌개 맛집</div>
            <div id="writer-info">
              <div id="profile-img" class="col-sm-12">
                <img src="../assets/img/준표2.png" alt="프로필 이미지" class="profile-image">
            </div>
            <div class="col-md-10">
                <div class="author">배준표</div>
                <div class="row">
                  <div class="info post-date col-lg-6 col-md-12">yyyy-mm-dd hh-mm</div>
                  <div class="info view-count col-lg-3 col-md-12">조회 140</div>
                  
                </div>
            </div>
            </div>
            <div id="content">넘무 맛있다 배부르다</div>
            <div class="post-footer">
              <div class="heart-container">
                <img class="heart" src="../resources/assets/img/heart(full).png" alt="">
                <span class="heart-count">14</span>
              </div>
              <div class="button-container">
                  <button class="btn postbtn" id="modify-btn">수정</button>
                  <button class="btn postbtn" id="delete-btn">삭제</button>
              </div>
            </div>
        </div>
        <!-- 댓글 -->
        <!-- <div class="col-md-12 col-xxl-10 mx-auto">
            <span>댓글</span>
        </div>
        <div class="comments col-md-12 col-xxl-10 mx-auto">
          <div class="comment-header">
            <div class="comment-profile">
              <img src="" alt="">
            </div>
            <div class="comment-info">

            </div>
          </div> -->
        <div class="comment-section col-md-12 col-xxl-10 mx-auto">
          <span>댓글</span>
          <ul class="comment-list">
              <li class="comment">
                  <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                  <div class="user-info">
                      <img src="../resources/assets/img/준표프사.png" alt="User 1">
                      <span class="username">준표</span>
                      <span class="date">2023-10-07</span>
                  </div>
                  <p class="comment-text">첫번째 댓글임~~~~~~~~~~~~~~~~~~~~</p>
              </li>
              <li class="comment">
                  <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                  <div class="user-info">
                      <img src="../resources/assets/img/준표프사.png" alt="User 2">
                      <span class="username">준표</span>
                      <span class="author-type">작성자</span>
                      <span class="date">2023-10-06</span>
                  </div>
                  <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
              </li>
              <li class="comment reply-comment">
                <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                <div class="user-info">
                    <img src="../resources/assets/img/준표프사.png" alt="User 2">
                    <span class="username">지후</span>
                    <span class="date">2023-10-06</span>
                </div>
                <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
            </li>
              <li class="comment">
                <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                <div class="user-info">
                    <img src="../resources/assets/img/준표프사.png" alt="User 2">
                    <span class="username">지후</span>
                    <span class="date">2023-10-06</span>
                </div>
                <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
            </li>
          </ul>
          <div id="reportPopup" class="popup">
            <h2>댓글 신고하기</h2>
            <textarea id="reportReason" placeholder="신고 이유를 입력하세요"></textarea>
            <button onclick="reportComment()">신고</button>
            <button onclick="closeReportPopup()">닫기</button>
        </div>    
      </div>
      <div class="comment-page-container">
        <span class="comment-page">< 1 2 3 4 5 ></span>
      </div>
            <form action="" method="" class="comment-form col-md-12 col-xxl-10 mx-auto">
              <textarea placeholder="댓글을 입력하세요"></textarea>
              <button class="btn postbtn" id="submit-btn">등록</button>
            </form>
          </div>
        </div>->
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
</body>

</html>