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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
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

<!-- Template CSS File -->
<!-- <link href="../resources/assets/css/admin.css" rel="stylesheet"> -->
<link href="../resources/assets/css/admin_search.css" rel="stylesheet">
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

	<!-- <div id="main-wrap" class="d-flex justify-content-center" > -->

	<main id="main">

		<section class="section">
			<div class="row">
				<div class="col-lg-12 ">
					<h5 class="card-title" style="margin: 0 auto">회원 리스트</h5>

					<div id="user-main">

						<!--서치바-->

						<div id="search-bar">
							<form action="/admin/usersearch" method="get">
								<div id="search-wrap"
									class="d-flex justify-content-center align-items-center">
									<select name="searchCondition">
										<option value="userId"
											<c:if test="${searchCondition eq 'userId'}">selected</c:if>>아이디</option>
										<option value="userName"
											<c:if test="${searchCondition eq 'userName'}">selected</c:if>>이름</option>
										<option value="userEmail"
											<c:if test="${searchCondition eq 'userEmail'}">selected</c:if>>이메일</option>
										<option value="userNickname"
											<c:if test="${searchCondition eq 'userNickname'}">selected</c:if>>닉네임</option>
										<option value="userTel"
											<c:if test="${searchCondition eq 'userTel'}">selected</c:if>>연락처</option>
									</select> <input type="search" name="searchKeyword" id="search-content"
										value="${searchKeyword }">
									<button type="submit" id="search-button">
										<i class="bi bi-search"></i>
									</button>
								</div>
							</form>
						</div>


						<!-- 테이블 -->
						<table id="user-table">
							<colgroup>
								<col scope="col" width="10%">
								<!--#-->
								<col scope="col" width="10%">
								<!--아이디-->
								<col scope="col" width="10%" class="col1">
								<!--이름-->
								<col scope="col" width="20%" class="col1">
								<!--이메일-->
								<col scope="col" width="10%" class="col1">
								<!--성별-->
								<col scope="col" width="10%" class="col1">
								<!--가입유형-->
								<col scope="col" width="10%">
								<!--회원-->
								<col scope="col" width="10%">
								<!--신고-->
								<col scope="col" width="10%">
								<!--회원정보-->
							</colgroup>
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col" onclick="sortTable(1)" class="hover">아이디</th>
									<th scope="col" onclick="sortTable(2)" class="col1 hover">이름</th>
									<th scope="col" onclick="sortTable(3)" class="col1 hover">이메일</th>
									<th scope="col" onclick="sortTable(4)" class="col1 hover">성별</th>
									<th scope="col" onclick="sortTable(5)" class="col1 hover">가입유형</th>
									<th scope="col" onclick="sortTable(6)" class="hover">회원</th>
									<th scope="col" onclick="sortTable(7)" class="hover">신고</th>
									<th scope="col">회원정보</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="search" items="${searchUserList }" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${(pInfo.totalCount - i.index) - ( (pInfo.currentPage - 1)  *  15 ) }</td>
										<!-- 순수넘버링 -->
										<td>${search.userId }</td>
										<td class="col1">${search.userName }</td>
										<td class="col1">${search.userEmail }</td>
										<td class="col1">
											<c:if test="${search.userGender eq null}"> - </c:if>
											<c:if test="${search.userGender ne null}"> ${search.userGender} </c:if>
										</td>
										<td class="col1">
											<c:if test="${search.platformType eq 'normal'}"> 홈페이지 </c:if>
											<c:if test="${search.platformType eq 'kakao'}"> 카카오 </c:if>
											<c:if test="${search.platformType eq 'naver'}"> 네이버 </c:if>
										</td>
										<td>${search.userStatus }</td>
										<td>${search.uReportCount }</td>
										<td>
											<button type="button" class="button show-detail-btn"
												onclick="showUserDetail('${search.userId}');">조회</button>
										</td>
									</tr>
								</c:forEach>
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

									for (o = 1; o < rows.length - 1; o++) {
										shouldSwitch = false;
										x = rows[o].getElementsByTagName("TD")[n];
										y = rows[o + 1]
												.getElementsByTagName("TD")[n];

										if (dir == "asc") {
											if (isNaN(x.innerHTML)
													&& isNaN(y.innerHTML)) {
												// x와 y가 모두 문자열일 때
												if (x.innerHTML
														.localeCompare(y.innerHTML) > 0) {
													shouldSwitch = true;
													break;
												}
											} else {
												// x와 y 중 하나 이상이 숫자일 때
												if ((isNaN(x.innerHTML) ? x.innerHTML
														: parseFloat(x.innerHTML)) > (isNaN(y.innerHTML) ? y.innerHTML
														: parseFloat(y.innerHTML))) {
													shouldSwitch = true;
													break;
												}
											}
										} else if (dir == "desc") {
											if (isNaN(x.innerHTML)
													&& isNaN(y.innerHTML)) {
												if (x.innerHTML
														.localeCompare(y.innerHTML) < 0) {
													shouldSwitch = true;
													break;
												}
											} else {
												if ((isNaN(x.innerHTML) ? x.innerHTML
														: parseFloat(x.innerHTML)) < (isNaN(y.innerHTML) ? y.innerHTML
														: parseFloat(y.innerHTML))) {
													shouldSwitch = true;
													break;
												}
											}
										}
									}

									if (shouldSwitch) {
										rows[o].parentNode.insertBefore(
												rows[o + 1], rows[o]);
										switching = true;
										switchCount++;
									} else {
										if (switchCount == 0 && dir == "asc") {
											//정렬방향 변경
											dir = "desc";
											switching = true;
										}
									}
								}
							}
						</script>
						<!-- End Table with stripped rows -->
						<c:if test="${pInfo.totalCount > 0}"> 
						<div id="pageNavi">
							<c:if test="${pInfo.startNavi != 1}">
								<c:url var="prevUrl" value="/admin/usersearch">
									<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
									<c:param name="searchCondition" value="${searchCondition}"></c:param>
									<c:param name="searchKeyword" value="${searchKeyword}"></c:param>
								</c:url>
								<a href="${prevUrl}"><i class="bi bi-caret-left"></i>&nbsp;&nbsp;</a>
							</c:if>
							<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}"
								var="p">
								<c:url var="pageUrl" value="/admin/usersearch">
									<c:param name="page" value="${p}"></c:param>
									<c:param name="searchCondition" value="${searchCondition}"></c:param>
									<c:param name="searchKeyword" value="${searchKeyword}"></c:param>
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
								<c:url var="nextUrl" value="/admin/usersearch">
									<c:param name="page" value="${pInfo.endNavi + 1}"></c:param>
									<c:param name="searchCondition" value="${searchCondition}"></c:param>
									<c:param name="searchKeyword" value="${searchKeyword}"></c:param>
								</c:url>
								<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
							</c:if>
						</div>
						</c:if>
						<c:if test="${pInfo.totalCount < 0}">1</c:if>

					</div>
				</div>

			</div>
		</section>

	</main>
	<!-- End #main -->
	<!-- </div> -->




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

	<script>
		//회원상세보기로 이동
		function showUserDetail(userId) {
			location.href = "/admin/userdetail?userId=" + userId;
		}
		
		//userStatus가 A(강퇴)일 때 열 색을 빨간색으로 변경 
		  document.addEventListener("DOMContentLoaded", function() {
		    var table = document.getElementById("user-table");
		    var rows = table.getElementsByTagName("tr");
		    
		    for (var i = 0; i < rows.length; i++) {
		      var userStatusCell = rows[i].getElementsByTagName("td")[6]; // 6th column (0-based index)
		      if (userStatusCell) {
		        var userStatus = userStatusCell.textContent;
		        if (userStatus.includes('A')) {
		          rows[i].style.color = 'red';
		        }
		      }
		    }
		  });
	</script>

</body>

</html>