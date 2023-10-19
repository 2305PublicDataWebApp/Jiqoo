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
    <link href="../resources/assets/css/admin_chat.css" rel="stylesheet">
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


    <main id="main">

      <section class="section">
        <div class="row">
          <div id="list-type" style="border-radius: 15px; border: 1px solid #DAE4ED; display: flex; justify-content: space-between; width: 400px;  margin: 15px auto;">
            <button id="group-list" class="btn-get-started scrollto" onclick="toggleButton(1);" style="background-color: #8BC34A; color: #fff;">유지중인 채팅방</button>
            <button id="personal-list" class="btn-get-started scrollto" onclick="toggleButton(2);">삭제된 채팅방</button>
          </div>

          <!--=====단체채팅방=====-->
          <div class="col-lg-12 group-chat">
            
            <!-- <h4 class="card-title" style="margin:20px auto">단체채팅방</h4> -->
            <!-- <div id="group-part"> -->
              <!--서치바-->
              <div id="search-bar" >
                <form action="" method="">
                  <div id="search-wrap" class="d-flex justify-content-center align-items-center">
                    <select>
                      <option>아이디</option>
                      <option>이름</option>
                      <option>닉네임</option>
                      <option>이메일</option>
                      <option>연락처</option>
                    </select>
                    <input type="text" name="search-content" id="search-content">
                    <button type="button" id="search-button"><i class="bi bi-search"></i></button>
                  </div>
                </form>
              </div>

              <div class="card" >
              <!-- 테이블 -->
              <table id="group-chat">
                <colgroup>
                  <col scope="col" width ="10%" > <!--#-->
                  <col scope="col" width ="10%" > <!--채팅방이름-->
                  <col scope="col" width ="10%" > <!--프로필-->
                  <col scope="col" width ="30%" > <!--참여자목록-->
                  <col scope="col" width ="5%" > <!--총인원-->
                  <col scope="col" width ="10%" > <!--마지막채팅전송일자-->
                  <col scope="col" width ="10%" > <!--신고수-->
                  <col scope="col" width ="15%" > <!--삭제버튼-->
                  
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" onclick="sortTable(0,'group-')">#</th>
                    <th scope="col" class="hover">채팅방이름</th>
                    <th scope="col" onclick="sortTable(1)" class="hover">프로필</th>
                    <th scope="col" onclick="sortTable(2)" class="hover">참여자목록</th>
                    <th scope="col" class="hover">총인원</th>
                    <th scope="col" class="hover">마지막채팅</th>
                    <th scope="col" onclick="sortTable(3)">신고</th>
                    <th scope="col" >상세</th>
                  </tr>
                </thead>
                
                <tbody>
	                <c:forEach var="chatList" items="${chatRoomList}" varStatus="i">
	                  <tr>
	                    <td class="list-no" scope="row">${(pInfo.totalCount - i.index) - ( (pInfo.currentPage - 1)  *  15 ) }</td> <!-- # -->
	                    <td>${chatList.chatName }</td>  <!-- 채팅방이름 -->
	                    <td>
	                      <img src="../assets/img/no-profile.png" style="width:50px"> <!-- 프로필 -->
	                    </td>
	                    <td title="">참여자목록</td> <!-- 참여자목록 -->
	                    <td>총인원</td>
	                    <td>마지막채팅전송일자</td>
	                    <td>신고수</td>
	                    <td>
	                      <button type="button" class="button show-detail-btn" >조회</button>
	                    </td>
	                  </tr>
					</c:forEach>
                </tbody>
              </table>
              
              <!--  페이지네비 -->
			  <c:if test="${pInfo.totalCount > 0}">
				<div id="pageNavi">
					<c:if test="${pInfo.startNavi != 1}">
						<c:url var="prevUrl" value="/admin/chat">
							<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
						</c:url>
						<a href="${prevUrl}"><i class="bi bi-caret-left"></i></a>
					</c:if>
					
					<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}"
						var="p">
						<c:url var="pageUrl" value="/admin/chat">
							<c:param name="page" value="${p}"></c:param>
						</c:url>
						<c:choose>
							<c:when test="${p == pInfo.currentPage}">
								<p>
									<a href="${pageUrl}" style="color: #8BC34A"> ${p}</a>
								</p>
							</c:when>
							<c:otherwise>
								<p>
									<a href="${pageUrl}"> ${p}</a>
								</p>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${pInfo.endNavi != pInfo.naviTotalCount}">
						<c:url var="nextUrl" value="/admin/chat">
							<c:param name="page" value="${pInfo.endNavi + 1}"></c:param>
						</c:url>
						<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
					</c:if>
				</div>
			  </c:if>
			  <!-- End 페이지네비 -->
            </div>
          <!-- </div> -->
              <script>
                function sortTable(n,sortName) {
                  var table, rows, switching, o, x, y, shouldSwitch, dir, switchCount = 0;
                  //dir -> 정렬방향 / shouldSwitch - > 정렬
                    table = document.querySelector("#"+sortName);
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
              <!-- End Table with stripped rows -->
          </div>

<!--=====********************************개인채팅방********************************=====-->
          <div class="col-lg-12 personal-chat" style="display:none">
            
            <!-- <h5 class="card-title" style="margin:20px auto">개인채팅방</h5> -->
            <!-- <div id="group-part"> -->
              <!--서치바-->
              <div id="search-bar" >
                <form action="" method="">
                  <div id="search-wrap" class="d-flex justify-content-center align-items-center">
                    <select>
                      <option>아이디</option>
                      <option>이름</option>
                      <option>닉네임</option>
                      <option>이메일</option>
                      <option>연락처</option>
                    </select>
                    <input type="text" name="search-content" id="search-content">
                    <button type="button" id="search-button"><i class="bi bi-search"></i></button>
                  </div>
                </form>
              </div>

              <div class="card" >
              <!-- 개인챗방테이블 -->
              <table id="personal-chat">
                <colgroup>
                  <col scope="col" width ="10%" > <!--챗방No.-->
                  <col scope="col" width ="10%" > <!--프로필사진-->
                  <col scope="col" width ="35%" > <!--참여자목록-->
                  <col scope="col" width ="10%" > <!--신고수-->
                  <col scope="col" width ="15%" > <!--삭제버튼-->
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" onclick="sortTable(0)">No.</th>
                    <th scope="col" class="hover">프로필</th>
                    <th scope="col" onclick="sortTable(1)" class="hover">참여자목록</th>
                    <th scope="col" onclick="sortTable(3)">신고</th>
                    <th scope="col" >상세</th>
                  </tr>
                </thead>
                
                <tbody>
                  <tr>
                    <td class="list-no" scope="row" >99</td>
                    <td class="img-container">
                      <div class="img-wrap">
                        <img src="../assets/img/no-profile.png" style="width:50px">
                      </div>
                    </td>
                    <td class="col1">khuser00, khuser02</td>
                    <td>10</td>
                    <td>
                      <button type="button" class="button show-detail-btn" >조회</button>
                    </td>
                  </tr>

                </tbody>
              </table>
              <div id="pageNavi"> 1 2 3 4 5</div>
            </div>
          <!-- </div> -->
              <script>
                function sortTable(n) {
                  var table, rows, switching, o, x, y, shouldSwitch, dir, switchCount = 0;
                  //dir -> 정렬방향 / shouldSwitch - > 정렬
                    table = document.querySelector("#personal-chat");
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

              <script>
                const groupListBtn = document.querySelector('#group-list');
                const personalListBtn = document.querySelector('#personal-list'); 

                const groupChatTable = document.querySelector('.group-chat');
                const personalChatTable = document.querySelector('.personal-chat');

                personalListBtn.addEventListener('click', () => {
                  personalChatTable.style.display = 'block';
                  groupChatTable.style.display = 'none';

                  groupListBtn.style.backgroundColor = '#fff';
                  groupListBtn.style.color = '#8BC34A';

                });

                groupListBtn.addEventListener('click', () => {
                  groupChatTable.style.display = 'block';
                  personalChatTable.style.display = 'none';
                
                  groupListBtn.style.backgroundColor = '#8BC34A';
                  groupListBtn.style.color = '#fff';
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
              
              
              <!-- End Table with stripped rows -->
                
            
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