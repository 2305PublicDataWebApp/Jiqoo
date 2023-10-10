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

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/search_moqoo.css" rel="stylesheet">


  
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
      <div id="search">
        <form action="" method="">
          <div id="search-div">
            <input type="text" placeholder="search"/>
            <button id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
          </div>
        </form>
      </div>

    <div id="container" data-aos=fade-in>

    <!-- 결과 목록 아이템 -->
    <div class="row result-item">
      <div class="post-header">
        <div class="list-location">졸려.할아버지.잠와</div>
        <div class="report-button">
          <img id="dots" src="../resources/assets/img/dots.png" alt="">
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
    <div class="row result-item">
      <div class="post-header">
        <div class="list-location">졸려.할아버지.잠와</div>
        <div class="report-button">
          <img id="dots" src="../resources/assets/img/dots.png" alt="">
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
    <div class="row result-item">
      <div class="post-header">
        <div class="list-location">졸려.할아버지.잠와</div>
        <div class="report-button">
          <img id="dots" src="../resources/assets/img/dots.png" alt="">
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
</body>

</html>