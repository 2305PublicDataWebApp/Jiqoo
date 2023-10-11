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
    <link href="../resources/assets/css/admin_user.css" rel="stylesheet">
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

      <!-- <aside id="sidebar" class="sidebar col-lg-3">
        <ul >
          <li ><a class="nav-link" href="#">회원관리</a></li>
          <li ><a class="nav-link" href="#">지꾸관리</a></li>
          <li ><a class="nav-link" href="#">모꾸관리</a></li>
          <li ><a class="nav-link" href="#">채팅관리</a></li>
        </ul>
      </aside> -->
    <!-- End Sidebar-->

    <main id="main">

      <section class="section">
        <div class="row">
          <div class="col-lg-12 ">
            <h5 class="card-title" style="margin:0 auto">회원 목록</h5>

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

              <!-- 테이블 -->
              <table id="user-table">
                <colgroup>
                  <col scope="col" width ="10%" > <!--#-->
                  <col scope="col" width ="10%" > <!--아이디-->
                  <col scope="col" width ="10%" class="col1"> <!--이름-->
                  <col scope="col" width ="20%" class="col1"> <!--이메일-->
                  <col scope="col" width ="10%" class="col1"> <!--성별-->
                  <col scope="col" width ="10%" class="col1"> <!--가입유형-->
                  <col scope="col" width ="10%" > <!--회원-->
                  <col scope="col" width ="10%" > <!--신고-->
                  <col scope="col" width ="10%" > <!--회원정보-->
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" >#</th>
                    <th scope="col" onclick="sortTable(0)" class="hover">아이디</th>
                    <th scope="col" onclick="sortTable(1)" class="col1 hover">이름</th>
                    <th scope="col" onclick="sortTable(2)" class="col1 hover">이메일</th>
                    <th scope="col" onclick="sortTable(3)" class="col1 hover">성별</th>
                    <th scope="col" onclick="sortTable(4)" class="col1 hover">가입유형</th>
                    <th scope="col" onclick="sortTable(5)" class="hover">회원</th>
                    <th scope="col" onclick="sortTable(6)" class="hover">신고</th>
                    <th scope="col" >회원정보</th>
                  </tr>
                </thead>
                
                <tbody>
                  <tr>
                    <th id="list-no" scope="row" >99</th>
                    <td>khuser01</td>
                    <td class="col1">일용자</td>
                    <td class="col1">khuser01@gmail.com</td>
                    <td class="col1">F</td>
                    <td class="col1">홈페이지</td>
                    <td>Y</td>
                    <td>10</td>
                    <td>
                      <button type="button" class="button show-detail-btn" onclick="showUserDetail();">조회</button>
                    </td>
                  </tr>
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser02</td> -->
<!--                     <td class="col1">이용자</td> -->
<!--                     <td class="col1">khuser02@gmail.com</td> -->
<!--                     <td class="col1">M</td> -->
<!--                     <td class="col1">네이버</td> -->
<!--                     <td class="col3">N</td> -->
<!--                     <td class="col3">9</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser03</td> -->
<!--                     <td class="col1">삼용자</td> -->
<!--                     <td class="col1">khuser03@gmail.com</td> -->
<!--                     <td class="col1">M</td> -->
<!--                     <td class="col1">네이버</td> -->
<!--                     <td class="col3">Y</td> -->
<!--                     <td class="col3">1</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser04</td> -->
<!--                     <td class="col1">사용자</td> -->
<!--                     <td class="col1">khuser04@gmail.com</td> -->
<!--                     <td class="col1">F</td> -->
<!--                     <td class="col1">홈페이지</td> -->
<!--                     <td class="col3">N</td> -->
<!--                     <td class="col3">2</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser05</td> -->
<!--                     <td class="col1">오용자</td> -->
<!--                     <td class="col1">khuser05@gmail.com</td> -->
<!--                     <td class="col1">F</td> -->
<!--                     <td class="col1">카카오</td> -->
<!--                     <td class="col3">N</td> -->
<!--                     <td class="col3">0</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser06</td> -->
<!--                     <td class="col1">육용자</td> -->
<!--                     <td class="col1">khuser06@gmail.com</td> -->
<!--                     <td class="col1">F</td> -->
<!--                     <td class="col1">카카오</td> -->
<!--                     <td class="col3">Y</td> -->
<!--                     <td class="col3">4</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser07</td> -->
<!--                     <td class="col1">칠용자</td> -->
<!--                     <td class="col1">khuser07@gmail.com</td> -->
<!--                     <td class="col1">M</td> -->
<!--                     <td class="col1">홈페이지</td> -->
<!--                     <td class="col3">Y</td> -->
<!--                     <td class="col3">3</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser08</td> -->
<!--                     <td class="col1">팔용자</td> -->
<!--                     <td class="col1">khuser08@gmail.com</td> -->
<!--                     <td class="col1">F</td> -->
<!--                     <td class="col1">카카오</td> -->
<!--                     <td class="col3">Y</td> -->
<!--                     <td class="col3">0</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser09</td> -->
<!--                     <td class="col1">구용자</td> -->
<!--                     <td class="col1">khuser09@gmail.com</td> -->
<!--                     <td class="col1">F</td> -->
<!--                     <td class="col1">홈페이지</td> -->
<!--                     <td class="col3">Y</td> -->
<!--                     <td class="col3">7</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <th id="list-no" scope="row" >99</th> -->
<!--                     <td class="col3">khuser10</td> -->
<!--                     <td class="col1">십용자</td> -->
<!--                     <td class="col1">khuser10@gmail.com</td> -->
<!--                     <td class="col1">F</td> -->
<!--                     <td class="col1">네이버</td> -->
<!--                     <td class="col3">Y</td> -->
<!--                     <td class="col3">9</td> -->
<!--                     <td class="col3"> -->
<!--                       <button type="button" class="button show-detail-btn" >조회</button> -->
<!--                     </td> -->
<!--                   </tr> -->
                </tbody>
              </table>

              <script>
                function sortTable(n) {
                  var table, rows, switching, o, x, y, shouldSwitch, dir, switchCount = 0;
                  //dir -> 정렬방향 / shouldSwitch - > 정렬
                    table = document.querySelector("#user-table");
                    switching = true;  
                    dir = "asc"; //현재 정렬을 나타냄 
                    while (switching) {
                    switching = false;
                    rows = table.getElementsByTagName("TR");
  
                    for (o = 1; o < rows.length -1; o++) {                    
                      shouldSwitch = false;
                      x = rows[o].getElementsByTagName("TD")[n];
                      y = rows[o + 1].getElementsByTagName("TD")[n];
                      
                      if (dir == "asc") {
                        if (isNaN(x.innerHTML) && isNaN(y.innerHTML)) {
                          // x와 y가 모두 문자열일 때
                          if (x.innerHTML.localeCompare(y.innerHTML) > 0) {
                            shouldSwitch = true;
                            break;
                          }
                        } else {
                          // x와 y 중 하나 이상이 숫자일 때
                          if (
                            (isNaN(x.innerHTML) ? x.innerHTML : parseFloat(x.innerHTML)) 
                            > (isNaN(y.innerHTML) ? y.innerHTML : parseFloat(y.innerHTML))
                          ) {
                            shouldSwitch = true;
                            break;
                          }
                        }
                      } else if (dir == "desc") {
                        if (isNaN(x.innerHTML) && isNaN(y.innerHTML)) {
                          if (x.innerHTML.localeCompare(y.innerHTML) < 0) {
                            shouldSwitch = true;
                            break;
                          }
                        } else {
                          if (
                            (isNaN(x.innerHTML) ? x.innerHTML : parseFloat(x.innerHTML)) 
                            < (isNaN(y.innerHTML) ? y.innerHTML : parseFloat(y.innerHTML))
                          ) {
                            shouldSwitch = true;
                            break;
                          }
                        }
                      }
                    }
  
                    if (shouldSwitch) {
                      rows[o].parentNode.insertBefore(rows[o + 1], rows[o]);
                      switching = true;
                      switchCount++;
                    } else {
                      if(switchCount == 0 && dir == "asc") {
                        //정렬방향 변경
                        dir = "desc";
                        switching = true;
                      }
                    }
                  }
                }
              </script>
              
              <div id="pageNavi"> 1 2 3 4 5</div>
              <!-- End Table with stripped rows -->
                
            </div>
          </div>
  
        </div>
      </section>

    </main>
    <!-- End #main -->
  <!-- </div> -->




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
  	//회원상세보기로 이동
  	function goToMyClassList(){
		const userId = '${userId}';
		location.href = "/admin/userDetail.do?userId="+userId;
	}
  </script>

</body>

</html>