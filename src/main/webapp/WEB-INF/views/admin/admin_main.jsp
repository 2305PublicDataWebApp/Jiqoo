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
    <!-- <link href="../resources/assets/css/admin.css" rel="stylesheet"> -->
    <link href="../resources/assets/css/chart.css" rel="stylesheet">
    <link href="../resources/assets/css/admin_main.css" rel="stylesheet">
    <link href="../resources/assets/css/header.css" rel="stylesheet">
    <link href="../resources/assets/css/footer.css" rel="stylesheet">

    <!--구글차트api-->
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    

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
  <!-- ======= End Hero =======  -->

    <main id="main" class="main">
      <section class="dashboard">
        <div class="row">
          <!-- Left side columns -->
          <div class="col-lg-8">

            <div class="row">
              <!-- 지꾸 Card-->
              <div class="col-xxl-4 col-md-6">
                <div class="card info-card sales-card">
                  <div class="filter">
                    <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                      <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                      </li>
                      <li><a class="dropdown-item" href="#">Today</a></li>
                      <li><a class="dropdown-item" href="#">This Week</a></li>
                      <!-- <li><a class="dropdown-item" href="#">This Year</a></li> -->
                    </ul>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">지꾸 <span>| Today</span></h5>
                    <div class="d-flex align-items-center">
                      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-journal-bookmark-fill"></i>
                      </div>
                      <div class="ps-3">
                        <h6>145</h6>
                        <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End 지꾸 Card -->
  
              <!-- 모꾸 Card -->
              <div class="col-xxl-4 col-md-6">
                <div class="card info-card revenue-card">
                  <div class="filter">
                    <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                      <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                      </li>
                      <li><a class="dropdown-item" href="#">Today</a></li>
                      <li><a class="dropdown-item" href="#">This Week</a></li>
                      <!-- <li><a class="dropdown-item" href="#">This Year</a></li> -->
                    </ul>
                  </div>
  
                  <div class="card-body">
                    <h5 class="card-title">모꾸 <span>| This Week</span></h5>
                    <div class="d-flex align-items-center">
                      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-journal-richtext"></i>
                      </div>
                      <div class="ps-3">
                        <h6>$3,264</h6>
                        <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End 모꾸 Card -->
  
              <!-- 회원  Card -->
              <div class="col-xxl-4 col-xl-12">
                <div class="card info-card customers-card">
                  <div class="filter">
                    <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                      <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                      </li>
                      <li><a class="dropdown-item" href="#">Today</a></li>
                      <li><a class="dropdown-item" href="#">This Week</a></li>
                      <!-- <li><a class="dropdown-item" href="#">This Year</a></li> -->
                    </ul>
                  </div>
  
                  <div class="card-body">
                    <h5 class="card-title">회원 <span>| This Week</span></h5>
                    <div class="d-flex align-items-center">
                      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-people"></i>
                      </div>
                      <div class="ps-3">
                        <h6>1244</h6>
                        <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End 회원  Card -->

              <div class="col-lg-12">
                <!-- 컬럼챠트 -->
                <div class="card" >
                  <div class="card-body">
                    <h5 class="card-title">이름뭐라고할까</h5>
                    <div id="columnchart_material" style="width : 100%; height: 640px; padding: 10px;"></div>
                    <script type="text/javascript">
                      google.charts.load('current', {'packages':['bar']});
                      google.charts.setOnLoadCallback(drawChart);
                
                      function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                          ['', '지꾸', '모꾸', '회원'],
                          ['January', 10, 4, 2],
                          ['February', 17, 4, 2],
                          ['March', 6, 11, 3],
                          ['April', 10, 5, 3],
                          ['May', 18, 54, 3],
                          ['July', 10, 54, 3],
                          ['August', 17, 57, 50],
                          ['September', 10, 54, 3],
                          ['October', 15, 54, 30],
                          ['November', 13, 57, 25],
                          ['December', 18, 54, 35]
                        ]);
                
                        var options = {
                          chart: {
                            width: '100%' // 반응형을 위한 width 값 추가
                          },
                          colors: ['#19A7CE', '#8BC34A', '#ff771d'],
                          vAxis: {
                            viewWindowMode:'explicit',
                            viewWindow: {
                              max: 100
                            }
                          }
                        };

                        //화면 줄였을때 라벨 없애기 (이걸 붙이면 그래프가 바꾼 그래프로 나오는데 안붙이면 예전 그래프로 나옴)
                        var mq = window.matchMedia( "(max-width: 575px)" );
                        if (mq.matches) {
                            var options = {
                              legend: {
                                position: 'none'
                              },
                              hAxis: {textPosition : 'none'}, // 가로축 제거
                            }   
                        }
                        
                        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
                
                        chart.draw(data, google.charts.Bar.convertOptions(options));
                        window.addEventListener('resize',drawChart, false) //반응형으로 줄였을때 그래프 사이즈도 줄이기
                      }
                    </script>
                  </div>
                </div>
              </div>

            </div>
          </div><!-- End Left side columns -->
  
          <!-- Right side columns -->
          <div class="col-lg-4">
            <!-- 지꾸모꾸 Donut Chart -->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">지꾸/모꾸</h5>
                <div id="donutChart1"></div>
                <script>
                  document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#donutChart1"), {
                      series: [44, 55],
                      chart: {
                        height: 200,
                        type: 'donut',
                    
                        toolbar: {
                          show: true
                        }
                      },
                      labels: ['지꾸', '모꾸'],
                      colors: ['#19A7CE', '#8BC34A'],
                      
                    }).render();
                  });
                </script>
              </div>
            </div>

            <!-- 성비 Donut Chart -->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">성비</h5>
                <div id="donutChart2"></div>
                <script>
                  document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#donutChart2"), {
                      series: [48, 55],
                      chart: {
                        height: 200,
                        type: 'donut',
                        toolbar: {
                          show: true
                        }
                      },
                      labels: ['여성', '남성'],
                      colors: ['#FF9B9B', '#82A0D8']
                      
                    }).render();
                  });
                </script>
              </div>
            </div>

            <!-- 나이 Donut Chart -->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">나이</h5>
                <div id="donutChart3"></div>
                <script>
                  document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#donutChart3"), {
                      series: [12,14,33,17,5,9],
                      chart: {
                        height: 200,
                        type: 'donut',
                        toolbar: {
                          show: true
                        }
                      },
                      labels: ['10대', '20대','30대', '40대', '50대', '60대이상'],
                      colors: ['#A8DF8E', '#F3FDE8', '#FFE5E5', '#FFBFBF', '#FFFEC4', '#FFD6A5']
                      
                    }).render();
                  });
                </script>
              </div>
            </div>
            <!-- End Donut Chart -->
          </div>
        </div>
        <!-- End Right side columns -->
      </section>


      <!-- 표 섹션 -->
      <section >
          <div class="row  box-margin">
            <div class="col-lg-12">
            <h1 style="margin:0 15px; color:#012970;">일자별 요약</h1>
            <div class="summary ">
              <table class="table">
                <colgroup>
                  <col scope="col"  width ="20%" >
                  <col scope="col"  width ="20%" >
                  <col scope="col"  width ="20%" >
                  <col scope="col"  width ="20%" >
                  <col scope="col"  width ="20%" >
                </colgroup>
                <thead>
                  <tr>
                    <th>날짜</th>
                    <th>지꾸</th>
                    <th>모꾸</th>
                    <th>가입자</th>
                    <th>신고</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>2010.10.06</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2010.10.06</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2010.10.06</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2010.10.06</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2010.10.06</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                                   
                </tbody>
              </table>
            </div>
          </div>
        </div>

          <div class="row box-margin ">

              <!--지꾸 카드-->
              <div class="col-lg-6 ">
                <h3 style="margin:15px 0 0 15px; color:#19A7CE">오늘의 지꾸</h3>
                <div class="today-jiqoo" >
                  <table class="table">
                    <colgroup>
                      <col scope="col"  width ="15%" >
                      <col scope="col"  width ="30%" >
                      <col scope="col"  width ="35%" >
                      <col scope="col"  width ="10%" >
                      <col scope="col"  width ="10%" >
                    </colgroup>
                    <thead>
                      <tr>
                        <th>아이디</th>
                        <th>W3W</th>
                        <th>내용</th>
                        <th>추천</th>
                        <th>신고</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>khuserkhuser01</td>
                        <td>머리, 어깨, 무릎</td>
                        <td>
                          <a class="modal-link modal-link-jq" data-bs-toggle="modal" href="#jiqooModal" >
                          Look at you (yeah) 넌 못 감당해 날 (uh)
                          You took (umm) off hook (yah)
                          기분은 coke like, brr (brr)
                          Look at my toe 나의 ex 이름 tattoo
                          I got to drink up now 니가 싫다 해도 좋아 (ah)
                          Why are you cranky, boy?
                          뭘 그리 찡그려, 너?
                          Do you want a blond Barbie doll?
                          It's not here, I'm not a doll (like this if you can)
                          </a>
                        </td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>khuser01</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>khuser01</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>khuser01</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>

                    </tbody>
                  </table>
                </div>
              </div>
              
              <!--모꾸 카드-->
              <div class="col-lg-6 ">
                <h3 style="margin:15px 0 0 15px; color:#8BC34A">오늘의 모꾸</h3>
                <div class="today-moqoo">
                  
                  <table class="table">
                    <colgroup>
                      <col scope="col"  width ="15%" >
                      <col scope="col"  width ="30%" >
                      <col scope="col"  width ="35%" >
                      <col scope="col"  width ="10%" >
                      <col scope="col"  width ="10%" >
                    </colgroup>
                    <thead>
                      <tr>
                        <th>아이디</th>
                        <th>W3W</th>
                        <th>내용</th>
                        <th>추천</th>
                        <th>신고</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>khuser01</td>
                        <td>핳핳핳핳, 핳핳핳핳, 핳핳핳핳핳핳핳핳핳핳핳핳</td>
                        <td>
                          <a class="modal-link modal-link-mq" data-bs-toggle="modal" href="#moqooModal" >
                          잔소리는 stop it, 알아서 할 게
                          내가 뭐가 되든 내가 알아서 할 테니까 좀
                          I do what I wanna, 평범하게 살든 말든 내버려 둘래?
                          어차피 내가 살아 내 인생 내 거니까
                          I'm so bad, bad, 차라리 이기적일래
                          눈치 보느라 착한 척 상처받는 것보다 백번 나아
                          I'm just on my way, 간섭은, no, no 해
                          말해버릴지도 몰라 너나 잘하라고
                          Open Modal</a>
                        </td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>khuser01</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>khuser01</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>khuser01</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>

                    </tbody>
                  </table>
                </div>
              </div>
          </div>

        <div class="row box-margin ">
            <!--댓글 카드-->
            <div class="col-lg-6 ">
              <h3 style="margin:15px 0 0 15px; color:#FCD8D4">오늘달린 댓글</h3>
              <div class="today-comment">
                <table class="table">
                  <colgroup>
                    <col scope="col"  width ="15%" >
                    <col scope="col"  width ="15%" >
                    <col scope="col"  width ="50%" >
                    <col scope="col"  width ="10%" >
                    <col scope="col"  width ="10%" >
                  </colgroup>
                  <thead>
                    <tr>
                      <th>게시물</th>
                      <th>아이디</th>
                      <th>내용</th>
                      <th>No.</th>
                      <th>신고</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>지꾸</td>
                      <td>khuser01</td>
                      <td>
                        <a class="modal-link modal-link-cmt" data-bs-toggle="modal" href="#cmtModal" >
                        이러지도 못하는데
                        저러지도 못하네
                        그저 바라보며 ba-ba-ba-baby
                        매일 상상만 해
                        이름과 함께 쓱 말을 놨네 baby
                        아직 우린 모르는 사인데
                        아무거나 걸쳐도 아름다워
                        거울 속 단 둘이서 하는
                        Fashion show, show
                      </a>
                    </td>
                      <td>0</td>
                      <td>0</td>
                    </tr>
                    <tr>
                      <td>모꾸</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                    </tr>
                    <tr>
                      <td>지꾸</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                    </tr>
                    <tr>
                      <td>지꾸</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>

            <!--가입자 카드-->
            <div class="col-lg-6 ">
              <h3 style="margin:15px 0 0 15px; color:#ff771d">오늘 가입했어요!</h3>
              <div class="today-register">
                <table class="table ">
                  <colgroup>
                    <col scope="col"  width ="20%" >
                    <col scope="col"  width ="20%" >
                    <col scope="col"  width ="20%" >
                    <col scope="col"  width ="20%" >
                    <col scope="col"  width ="20%" >
                  </colgroup>
                  
                  <tbody>
                    <tr>
                      <td>
                        <img src="../resources/assets/img/no-profile.png" style="width:50px;">
                      </td>
                      <td>khuser01</td>
                      <td>서태웅</td>
                      <td>M</td>
                      <td>홈페이지</td>
                    </tr>
                    <tr>
                      <td>
                        <img src="../resources/assets/img/no-profile.png" style="width:50px;">
                      </td>
                      <td>khuser02</td>
                      <td>
                        <a class="modal-link modal-link-cmt" data-bs-toggle="modal" href="#reportModal" >
                          강백호
                        </a></td>
                      <td>F</td>
                      <td>카카오</td>
                    </tr>
                    <tr>
                      <td>
                        <img src="../resources/assets/img/no-profile.png" style="width:50px;">
                      </td>
                      <td>khuser03</td>
                      <td>윤대협</td>
                      <td>F</td>
                      <td>네이버</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
        </div>


        <!-- ======= Modal =======  -->
        <!-- 지꾸Modal -->
        <div class="modal fade" id="jiqooModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">지꾸 title</h1>
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


          <!-- 신고 Modal -->
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

          <script>
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
      </section>


    </main>
      





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
  <script src="../resources/assets/js/main.js"></script>
  <script src="../resources/assets/js/chart.js"></script>

</body>

</html>