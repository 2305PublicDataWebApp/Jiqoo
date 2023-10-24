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
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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

    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex justify-content-center align-items-center">
          <div data-aos="zoom-out">
            <h2 style="margin-bottom: 10px;">No.1 지도 다이어리 </h2>
            <h1 style="font-size:56px;">다꾸? 이젠 <span style="color:#FFF59D;">지꾸!</span></h1>
            <p style="font-size:30px; color:white;">지도 위 모든 공간이 <br>
              당신의 다이어리가 됩니다.</p>
            <div class="text-center text-lg-start">
              <a href="#" class="btn-get-started">Get Started</a>
            </div>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-out" data-aos-delay="300">
          <img src="../resources/assets/img/jiqoomain.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

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

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row content">
          <div class="col-xl-6 col-lg-6 icon-boxes d-flex justify-content-center align-items-stretch" data-aos="fade-right">
            <img src="../resources/assets/img/main1.png">
          </div>
          <div class="col-xl-6 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5" data-aos="fade-left">
            <h3>방문한 장소에 <br>
            <span>추억</span>을 남겨보세요.</h3>
            <p>작년 생일, 지난 크리스마스, 다가올 배낭여행.. <br>
              잊고 싶지 않은 장소와 추억이 있나요? <br>
              장소를 지도에 저장하고 글, 사진, 동영상으로 <br>
              찬란한 순간을 기록해 보세요.</p>
            <button class="btn">지꾸 시작하기 <i class="bi bi-arrow-right"></i></button>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    <section class="about">
      <div class="container">
        <div class="row content">
          <div style="text-align: right;" class="col-xl-6 col-lg-6 icon-boxes d-flex flex-column align-items-end justify-content-center py-5 px-lg-5" data-aos="fade-right">
            <h3>방문할 장소에<br>
            <span>모임</span>을 만들어보세요.</h3>
            <p>새로운 모임을 계획하고 싶나요? <br>
              여행지,  즐거운 모임, 또는 특별한 이벤트를 위한 장소를 찾으세요. <br> 
              그곳에서 더 많은 사람들과 즐거운 순간을 공유해보세요. <br>
              모든 곳이 새로운 이야기와 추억의 시작일 수 있습니다. </p>
            <button class="btn">모꾸 시작하기 <i class="bi bi-arrow-right"></i></button>
          </div>
          <div class="col-xl-6 col-lg-6 icon-boxes d-flex justify-content-center align-items-stretch" data-aos="fade-left">
            <img style="width:90%;" src="../resources/assets/img/main2.png">
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials" style="margin-top:50px;">
      <div class="container">
        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <a href="#">///어르신.현재.숲속</a><br><br>
                <img src="../resources/assets/img/basozan.png" class="testimonial-img" alt="">
                <h3>바소잔</h3>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  부대찌개 맛집
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <a href="#">///어르신.현재.숲속</a><br><br>
                <img src="../resources/assets/img/basozan.png" class="testimonial-img" alt="">
                <h3>바소잔</h3>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  부대찌개 맛집
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <a href="#">///어르신.현재.숲속</a><br><br>
                <img src="../resources/assets/img/basozan.png" class="testimonial-img" alt="">
                <h3>바소잔</h3>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  부대찌개 맛집
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <a href="#">///어르신.현재.숲속</a><br><br>
                <img src="../resources/assets/img/basozan.png" class="testimonial-img" alt="">
                <h3>바소잔</h3>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  부대찌개 맛집
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <a href="#">///어르신.현재.숲속</a><br><br>
                <img src="../resources/assets/img/basozan.png" class="testimonial-img" alt="">
                <h3>바소잔</h3>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  부대찌개 맛집!!  너무 맛있다 배부르다
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

    <!-- ======= F.A.Q Section ======= -->
    <section id="faq" class="faq section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>F.A.Q</h2>
          <p>자주 묻는 질문</p>
        </div>

        <div class="faq-list">
          <ul>
            <li data-aos="fade-up">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" class="collapse" data-bs-target="#faq-list-1">지꾸란 무엇인가요? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-1" class="collapse" data-bs-parent=".faq-list">
                <p>
                  지꾸란 지도 위 모든 공간에 나의 기록물을 남길 수 있는 No.1 다이어리 서비스입니다. 
                  지꾸는 지구 상 모든 공간을 3x3 격자로 나누어 3 단어 주소를 부여한 What 3 Words API를 사용하기 때문에, 주소가 없는 공간에서도 나의 추억을 새길 수 있는 독보적인 서비스입니다.
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="100">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-2" class="collapsed">모꾸란 무엇인가요? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-2" class="collapse" data-bs-parent=".faq-list">
                <p>
                  우리가 다이어리에 자주 적는 모임 계획도 지꾸에서 세울 수 있습니다. 모임을 할 장소를 정했다면 모꾸에 등록해주세요. 참여자를 모집하고 실시간 채팅을 통해 참여자들과 소통할 수 있습니다.
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="200">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-3" class="collapsed">질문고갈? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-3" class="collapse" data-bs-parent=".faq-list">
                <p>
                  Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="300">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-4" class="collapsed">질문고갈? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-4" class="collapse" data-bs-parent=".faq-list">
                <p>
                  Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in.
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="400">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-5" class="collapsed">질문고갈? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-5" class="collapse" data-bs-parent=".faq-list">
                <p>
                  Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque.
                </p>
              </div>
            </li>

          </ul>
        </div>

      </div>
    </section><!-- End F.A.Q Section -->


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