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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">


    <!-- Vendor CSS Files -->
    <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template CSS File -->
    <!-- <link href="../resources/assets/css/admin.css" rel="stylesheet"> -->
    <link href="../resources/assets/css/admin_user_detail.css" rel="stylesheet">
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
    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
      viewBox="0 24 150 28 " preserveAspectRatio="none">
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
  </section>
  <!-- End Hero -->

  <!-- <div id="main-wrap" class="d-flex justify-content-center" > -->
    <!-- <aside id="sidebar" class="sidebar">
      <ul >
        <li ><a class="nav-link" href="#">회원관리</a></li>
        <li ><a class="nav-link" href="#">지꾸관리</a></li>
        <li ><a class="nav-link" href="#">모꾸관리</a></li>
        <li ><a class="nav-link" href="#">채팅관리</a></li>
      </ul>
    </aside> -->
    <!-- End Sidebar-->

    <main id="main">
      <section>

        <div id="user-main" >

          <div id="user-header-bar">
            <div id="user-id">
              <div id="pointer"></div> <div>khuser01</div> 
            </div>
          
            <div id="btn">
              <button type="button" class="button resign-btn">탈퇴처리</button>
            </div>
          </div>

          <div class="row" >
            <div class="picture d-flex justify-content-center col-xs-12 col-sm-12 col-md-6">
              <img src="../resources/assets/img/no-profile.png">
            </div>

            <div class="content col-xs-12 col-sm-12 col-md-6">
              <div class="d-flex ">
                <div class="title">이름</div> <div class="text">일용자</div>
              </div>
              <div class="d-flex">
                <div class="title">닉네임</div> <div class="text">용자</div>
              </div>
              <div class="d-flex">
                <div class="title">이메일</div> <div class="text">khuser01@gmail.com</div>
              </div>
              <div class="d-flex">
                <div class="title">연락처</div> <div class="text">010-1234-5678</div>
              </div>
              <div class="d-flex">
                <div class="title">성별</div> <div class="text"> F </div>
              </div>
              <div class="d-flex">
                <div class="title">회원여부</div> <div class="text">Y</div>
              </div>
              <div class="d-flex">
                <div class="title">신고누적</div> <div class="report-count">
                  <a class="modal-link modal-link-jq" data-bs-toggle="modal" href="#user-report-Modal" style="color:#388E3C">
                    10회
                  </a>
                </div>
              </div>
              <div class="btn-wrap">
                <div>
                  <small>가입일 : 2023.10.05 </small><br>
                  <small>탈퇴일 : 2023.10.05 </small>
                </div>
                <!-- <button type="button" id="resign-btn" class="button">탈퇴처리</button> -->
              </div>
            </div>
          </div>

        </div>

        <div class="container">

          <div id="list-type" style="border-radius: 15px; border: 1px solid #DAE4ED; display: flex; justify-content: space-evenly; width: 400px; margin: 20px auto;">
            <button id="jiqoo-list" class="btn-get-started scrollto" onclick="toggleButton(1);" style="background-color: #8BC34A; color: #fff;">지꾸</button>
            <button id="moqoo-list" class="btn-get-started scrollto" onclick="toggleButton(2);">모꾸</button>
            <button id="cmt-list" class="btn-get-started scrollto" onclick="toggleButton(3);">댓글</button>
          </div>
              
          <div id="user-active">
            <div id="jiqoo-table">
              <table>
                <colgroup>
                  <col scope="col" class="col1" width ="15%">
                  <col scope="col" width ="40%">
                  <col scope="col" class="col2" width ="10%">
                  <col scope="col" class="col2" width ="10%">
                  <col scope="col" class="col2" width ="10%">
                  <col scope="col" class="col1" width ="15%">
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" class="col1">No.</th>
                    <th scope="col" >내용</th>
                    <th scope="col" class="col2">공개</th>
                    <th scope="col" class="col2">삭제</th>
                    <th scope="col" class="col2">신고</th>
                    <th scope="col" class="col1">상세</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td id="list-no" scope="row" >99</td>
                    <td>Stay in the middle
                      Like you a little
                      Don't want no riddle
                      말해줘 say it back, oh, say it ditto
                      아침은 너무 멀어 so say it ditto 
                      훌쩍 커버렸어
                      함께한 기억처럼
                      널 보는 내 마음은
                      어느새 여름 지나 가을
                      기다렸지 all this time
                      Do you want somebody
                      Like I want somebody?
                      날 보고 웃었지만
                      Do you think about me now? yeah
                      All the time, yeah, all the time</td>
                    <td>Y</td>
                    <td>N</td>
                    <td>10</td>
                    <td>
                      <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#jiqooModal"> 조회</button>
                    </td>
                  </tr>
                  <tr>
                    <td id="list-no" scope="row" >99</td>
                    <td>
                      ...............
                    </td>
                    <td>Y</td>
                    <td>N</td>
                    <td>N</td>
                    <td>
                      <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 조회</button>
                    </td>
                  </tr>
                  <tr>
                    <td id="list-no" scope="row" >99</td>
                    <td>
                      ...............
                    </td>
                    <td>Y</td>
                    <td>N</td>
                    <td>N</td>
                    <td>
                      <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 조회</button>
                    </td>
                  </tr>
                  <tr>
                    <td id="list-no" scope="row" >99</td>
                    <td>
                      ...............
                    </td>
                    <td>Y</td>
                    <td>N</td>
                    <td>N</td>
                    <td>
                      <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 조회</button>
                    </td>
                  </tr>
                  <tr>
                    <td id="list-no" scope="row" >99</td>
                    <td>
                      ...............
                    </td>
                    <td>Y</td>
                    <td>N</td>
                    <td>N</td>
                    <td>
                      <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 조회</button>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div id="pageNavi"> 1 2 3 4 5</div>
            </div>

            <!--  -->
            <div id="moqoo-table" style="display:none"></div>
            <div id="cmt-table" style="display:none"></div>
            <!--  -->

            <script>
              const jiqooListBtn = document.querySelector('#jiqoo-list');
              const moqooListBtn = document.querySelector('#moqoo-list'); 
              const cmtListBtn = document.querySelector('#cmt-list'); 

              const jiqooTable = document.querySelector('#jiqoo-table');
              const moqooTable = document.querySelector('#moqoo-table');
              const cmtTable = document.querySelector('#cmt-table');
        
              moqooListBtn.addEventListener('click', () => {
                moqooTable.style.display = 'block';
                jiqooTable.style.display = 'none';
                cmtTable.style.display = 'none';
                jiqooListBtn.style.backgroundColor = '#fff';
                jiqooListBtn.style.color = '#8BC34A';

              });
      
              cmtListBtn.addEventListener('click', () => {
                cmtTable.style.display = 'block';
                jiqooTable.style.display = 'none';
                moqooTable.style.display = 'none';
                jiqooListBtn.style.backgroundColor = '#fff';
                jiqooListBtn.style.color = '#8BC34A';
              });

              jiqooListBtn.addEventListener('click', () => {
                jiqooTable.style.display = 'block';
                moqooTable.style.display = 'none';
                cmtTable.style.display = 'none';
                jiqooListBtn.style.backgroundColor = '#8BC34A';
                jiqooListBtn.style.color = '#fff';
              });
      
              // 버튼 클릭 이벤트 처리
              function toggleButton(buttonNumber) {
                var buttons = document.querySelectorAll('.btn-get-started');
                for (var i = 0; i < buttons.length; i++) {
                    if (i === buttonNumber - 1) {
                        buttons[i].classList.add('active');
                    } else {
                        buttons[i].classList.remove('active');
                    }
                }
            }
            </script>
          </div>
        </div>

        <!-- ======= Modal =======  -->
        <!-- 회원신고수Modal -->
        <div class="modal fade" id="user-report-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">khuser01</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <h5></h5>
                <span><i class="bi bi-journal-richtext"></i>></i>(작성한 지꾸 수)</span>
                <span><i class="bi bi-file-earmark-x"></i>(작성한 모꾸 수)</span>
                <span><i class="bi bi-file-earmark-x"></i>(작성한 댓글 수)</span>
                <div id="report-reason">
                  <div id="r-title">신고사유()</div>
                  <div></div>
                </div>
                <div id="report-btn">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 지꾸Modal -->
        <div class="modal fade" id="jiqooModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">No.904</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <h5>khuser01</h5><span><i class="bi bi-envelope-open"></i>(공개여부)</span><span><i class="bi bi-file-earmark-x"></i>(삭제여부)</span>
                <div id="map">지도 들어갈 자리</div>
                <div id="report-reason">
                  <div id="r-title">신고사유()</div>
                  <div></div>
                </div>
                <div id="report-btn">
                  <button type="button" class="button delete-btn" >삭제</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- End Modal -->


        <!-- 모꾸Modal -->
        <div class="modal fade" id="moqooModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                ...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>

        <!-- 댓글 Modal -->
        <div class="modal fade" id="cmtModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">댓글내용</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                ...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>
        <!-- ======= End Modal =======  -->

      </section>
    </main>
    <!-- End #main -->

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