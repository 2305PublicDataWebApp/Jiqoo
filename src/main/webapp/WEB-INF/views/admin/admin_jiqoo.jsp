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

    <link href="../resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="../resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="../resources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template CSS File -->
    <link href="../resources/assets/css/chart.css" rel="stylesheet">
    <link href="../resources/assets/css/admin_jiqoo.css" rel="stylesheet">
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

  <main id="main">

    <!--차트 섹션-->
    <section >
      <div class="row">

        <div class="col-lg-10" style="margin:0 auto">
          <h5 class="card-title" style="color:#222;">지꾸 목록</h5>
          <div class="card">
            <div class="card-body">
              
                <!-- Line Chart -->
              <canvas id="lineChart" style="max-height: 400px;"></canvas>
              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new Chart(document.querySelector('#lineChart'), {
                    type: 'line',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September','October','November', 'December'],
                      datasets: [{
                        label: '지꾸 등록 현황',
                        data: [65, 59, 80, 81, 56, 55, 40, 45,67,78,45,34],
                        fill: false,
                        borderColor: '#19A7CE',
                        tension: 0.1
                      },{
                        label: '여성',
                        type : 'bar',
                        data: [60, 50, 80, 80, 50, 38, 40, 45,60,70,40,30],
                        fill: false,
                        backgroundColor: '#FF9B9B',
                        tension: 0.1

                      },{
                        label: '남성',
                        type : 'bar',
                        data: [5, 9, 0, 1, 6, 5, 2, 5,7,8,5,4],
                        fill: false,
                        backgroundColor: '#82A0D8',
                        tension: 0.1

                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });
                });
              </script>
              <!-- End Line CHart -->

            </div>
          </div>
        </div>
      </div>
    </section>

    <!--게시글 섹션-->
    <section>
      <div class="row">
        <div class="col-lg-12">
          <div id="user-main">

            <!--서치바-->
            <form action="" method="">
              <div id="search-bar" >
                <select>
                  <option>아이디</option>
                  <option>이름</option>
                  <option>닉네임</option>
                  <option>이메일</option>
                  <option>연락처</option>
                </select>
                <div id="search-wrap" class="d-flex justify-content-center align-items-center">
                  <input type="text" name="search-content" id="search-content">
                  <button type="button" id="search-button"><i class="bi bi-search"></i></button>
                </div>
              </div>
            </form>

            <!-- Table with stripped rows -->
            <table>
              <colgroup>
                <col scope="col" width ="15%"> <!-- No -->
                <col scope="col" width ="10%" class="col1"> <!-- 작성자 -->
                <col scope="col" width ="35%" class="col2"> <!-- 내용 -->
                <col scope="col" width ="10%"> <!-- 신고 -->
                <col scope="col" width ="10%"> <!-- 공개 -->
                <col scope="col" width ="10%"> <!-- 삭제 -->
                <col scope="col" width ="10%" class="col3"> <!-- 상세 -->
              </colgroup>
              <thead>
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col" class="col1">작성자</th>
                  <th scope="col" class="col2">내용</th>
                  <th scope="col">신고</th>
                  <th scope="col">공개</th>
                  <th scope="col">삭제</th>
                  <th scope="col" class="col3">상세</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >
                    잔소리는 stop it, 알아서 할 게
                    내가 뭐가 되든 내가 알아서 할 테니까 좀
                    I do what I wanna, 평범하게 살든 말든 내버려 둘래?
                    어차피 내가 살아 내 인생 내 거니까
                    I'm so bad, bad, 차라리 이기적일래
                    눈치 보느라 착한 척 상처받는 것보다 백번 나아
                    I'm just on my way, 간섭은, no, no 해
                    말해버릴지도 몰라 너나 잘하라고
                  </td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>

                <tr>
                  <td id="list-no" scope="row" >999</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td>10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr>
                  <td id="list-no" scope="row" >99</td>
                  <td >khuser02</td>
                  <td >...................</td>
                  <td >10</td>
                  <td >Y</td>
                  <td >N</td>
                  <td >
                    <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">조회</button>
                  </td>
                </tr>
                <tr style="height:0"></tr>
              </tbody>
            </table>
            <div id="pageNavi" > 1 2 3 4 5</div>
            <!-- End Table with stripped rows -->
            
          </div>
        </div>
      </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

  <script src="../resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../resources/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../resources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../resources/assets/vendor/quill/quill.min.js"></script>
  <script src="../resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../resources/assets/vendor/tinymce/tinymce.min.js"></script>


  <!-- Template Main JS File -->
  <script src="../resources/assets/js/chart.js"></script>
  <script src="../resources/assets/js/main.js"></script>
  


</body>

</html>