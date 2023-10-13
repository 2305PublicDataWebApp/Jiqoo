<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link href="../resources/assets/css/admin_user_detail.css"
	rel="stylesheet">
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
		<section>

			<div id="user-main">

				<div id="user-header-bar">
					<div id="user-id">
						<div id="pointer"></div>
						<div>${user.userId }</div>
					</div>

					<div id="btn">
						<c:set var="userStatus" value="${user.userStatus}"></c:set>
<%-- 						<c:if test="${fn:indexOf(userStatus, 'Y') eq 0 }"> --%>
						<c:if test="${fn:contains(userStatus, 'Y')}">
							<button type="button" class="button resign-btn" onclick="deleteUser('${user.userId }');">탈퇴처리</button>
						</c:if>
						<c:if test="${fn:contains(userStatus, 'N')}">
<%-- 						<c:if test="${fn:indexOf(userStatus, 'N') eq 0 }"> --%>
							<button type="button" class="button revival-btn" onclick="reviveUser('${user.userId }');">복원</button>
						</c:if>
				

					</div>
				</div>

				<div class="row">
					<div
						class="picture d-flex justify-content-center col-xs-12 col-sm-12 col-md-6">
						<c:if test="${!empty user.userPhotoRename }">
							<img src="../resources/uuploadFiles/${user.userPhotoRename}"
								alt="프로필사진">
						</c:if>
						<c:if test="${empty user.userPhotoRename }">
							<img src="../resources/assets/img/no-profile.png" alt="프로필사진">
						</c:if>
					</div>

					<div class="content col-xs-12 col-sm-12 col-md-6">
						<div class="d-flex ">
							<div class="title">이름</div>
							<div class="text">${user.userName }</div>
						</div>
						<div class="d-flex">
							<div class="title">닉네임</div>
							<div class="text">${user.userNickname }</div>
						</div>
						<div class="d-flex">
							<div class="title">이메일</div>
							<div class="text">${user.userEmail }</div>
						</div>
						<div class="d-flex">
							<div class="title">성별</div>
							<div class="text">
								<c:if test="${user.userGender eq ''}"> - </c:if>
								<c:if test="${user.userGender ne null}"> ${user.userGender} </c:if>
							</div>
						</div>
						<div class="d-flex">
							<div class="title">생년월일</div>
							<div class="text">
								<c:if test="${user.userBirth eq null}"> - </c:if>
								<c:if test="${user.userBirth ne null}"> ${user.userBirth} </c:if>
							</div>
						</div>
						<div class="d-flex">
							<div class="title">연락처</div>
							<div class="text">
								<c:if test="${user.userTel eq null}"> - </c:if>
								<c:if test="${user.userTel ne null}"> ${user.userTel} </c:if>
							</div>
						</div>
						<div class="d-flex">
							<div class="title">자기소개</div>
							<div class="text">
								<c:if test="${user.userInfo eq null}"> - </c:if>
								<c:if test="${user.userInfo ne null}"> ${user.userInfo} </c:if>
							</div>
						</div>
						<div class="d-flex">
							<div class="title">회원여부</div>
							<div class="text">${user.userStatus }</div>
						</div>
						<div class="d-flex">
							<div class="title">신고누적</div>
							<div class="report-count">
								<a class="modal-link modal-link-jq" data-bs-toggle="modal"
									href="#user-report-Modal" style="color: #388E3C"> 10회 </a>
							</div>
						</div>
						<div class="btn-wrap">
							<div>
								<small>가입일 : ${user.uCreateDate } </small><br> 
								<small>탈퇴일 : <c:if test="${user.uDeleteDate eq null}"> - </c:if> 
												<c:if test="${user.uDeleteDate ne null}"> ${user.uDeleteDate } </c:if></small>
							</div>
							<!-- <button type="button" id="resign-btn" class="button">탈퇴처리</button> -->
						</div>
					</div>
				</div>

			</div>

			<div class="container">

				<div id="list-type"
					style="border-radius: 15px; border: 1px solid #DAE4ED; display: flex; justify-content: space-evenly; width: 400px; margin: 20px auto;">
					<button id="jiqoo-list" class="btn-get-started"
							style="background: #8BC34A; color: #fff;" 
							onclick="toggleButton(1)">지꾸</button>
					<button id="moqoo-list" class="btn-get-started"
							onclick="toggleButton(2);">모꾸</button>
					<button id="cmt-list" class="btn-get-started"
							onclick="toggleButton(3);">댓글</button>
				</div>

				<div id="user-active">
					<!--=====***** 지꾸테이블 *****=====-->
					<div id="jiqoo-table">
						<table>
							<colgroup>
								<col scope="col" class="col1" width="15%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" width="30%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col1" width="15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="col1">#</th>
									<th scope="col"><i class="bi bi-paperclip"></i></th>
									<th scope="col">내용</th>
									<th scope="col" class="col2">공개</th>
									<th scope="col" class="col2">상태</th>
									<th scope="col" class="col2">신고</th>
									<th scope="col" class="col1">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${uJiqooList eq null}">
									<tr>
										<td colspan="7">${noJiqooMsg}</td>
									</tr>
								</c:if>
								
								<c:forEach var="jiqooList" items="${uJiqooList}" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${(pInfoJiqoo.totalCount - i.index) - ( (pInfoJiqoo.currentPage - 1)  *  5 ) }</td>
										<td>
											<c:set var="jiqooContent" value="${jiqooList.jiqooContent}"></c:set>
											<c:if test="${fn:contains(jiqooContent, '<img')}"> 
												<i class="bi bi-check"></i> 
											</c:if>
										</td>
										<td>
											<c:out value='${jiqooList.jiqooContent.replaceAll("\\\<.*?\\\>","")}' />  <!-- 내용중 문자열만 출력하기 -->
										</td>
										<td>${jiqooList.jOpenStatus}</td>
										<td>${jiqooList.jiqooStatus}</td>
										<td>0</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#jiqooModal${i.count }">
												조회</button>
										</td>
									</tr>
									<!-- 지꾸Modal -->
									<div class="modal fade" id="jiqooModal${i.count }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">No.${jiqooList.jiqooNo}</h1>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<h5>${user.userId}</h5>
													<span><i class="bi bi-envelope-open"></i> ${jiqooList.jOpenStatus}</span>&nbsp;
													<span><i class="bi bi-file-earmark-x"></i> ${jiqooList.jiqooStatus}</span>
													<div id="map">지도 들어갈 자리</div>
													<div id="report-reason">
														<div id="r-title">신고사유()</div>
														<div></div>
													</div>
													<div id="report-btn">
														<button type="button" class="button delete-btn">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- End Modal -->
								</c:forEach>
							</tbody>
						</table>
						
						<!-- 지꾸 페이지네비 -->
						<div id="pageNavi">
							<c:if test="${pInfoJiqoo.startNavi != 1}">
								<c:url var="prevUrl" value="/admin/userdetail">
									<c:param name="jiqooPage" value="${pInfoJiqoo.startNavi -1 }"></c:param>
								</c:url>
								<a href="${prevUrl}"><i class="bi bi-caret-left"></i></a>
							</c:if>
							
							<c:forEach begin="${pInfoJiqoo.startNavi}" end="${pInfoJiqoo.endNavi}"
								var="p">
								<c:url var="pageUrl" value="/admin/userdetail">
									<c:param name="userId" value="${user.userId}"></c:param>
									<c:param name="jiqooPage" value="${p}"></c:param>
								</c:url>
								<c:choose>
									<c:when test="${p == pInfoJiqoo.currentPage}">
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
							
							<c:if test="${pInfoJiqoo.endNavi != pInfoJiqoo.naviTotalCount}">
								<c:url var="nextUrl" value="/admin/userdetail">
									<c:param name="jiqooPage" value="${pInfoJiqoo.endNavi + 1}"></c:param>
								</c:url>
								<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
							</c:if>
						</div>
						<!-- End 지꾸페이지네비 -->
					</div>

					<!--=====***** 모꾸테이블 *****=====-->
					<div id="moqoo-table" style="display: none">
						<table>
							<colgroup>
								<col scope="col" class="col1" width="15%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" width="30%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col1" width="15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="col1">#</th>
									<th scope="col"><i class="bi bi-paperclip"></i></th>
									<th scope="col">내용</th>
									<th scope="col" class="col2">공개</th>
									<th scope="col" class="col2">상태</th>
									<th scope="col" class="col2">신고</th>
									<th scope="col" class="col1">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${uMoqooList eq null}">
									<tr>
										<td colspan="7">${noMoqooMsg}</td>
									</tr>
								</c:if>
								
								<c:forEach var="moqooList" items="${uMoqooList}" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${(pInfoMoqoo.totalCount - i.index) - ( (pInfoMoqoo.currentPage - 1)  *  5 ) }</td>
										<td>
											<c:set var="moqooContent" value="${moqooList.moqooContent}"></c:set>
											<c:if test="${fn:contains(moqooContent, '<img')}"> 
												<i class="bi bi-check"></i> 
											</c:if>
										</td>
										<td>
											<c:out value='${moqooList.moqooContent.replaceAll("\\\<.*?\\\>","")}' />  <!-- 내용중 문자열만 출력하기 -->
										</td>
										<td></td>
										<td>${moqooList.moqooStatus}</td>
										<td>0</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#moqooModal${i.count }">
												조회</button>
										</td>
									</tr>
									<!-- 모꾸Modal -->
									<div class="modal fade" id="moqooModal${i.count }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">No. ${moqooList.moqooNo}</h1>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<h5>${user.userId}</h5>
													<span><i class="bi bi-file-earmark-x"></i> ${moqooList.moqooStatus}</span>
													<div id="map">지도 들어갈 자리</div>
													<div id="report-reason">
														<div id="r-title">신고사유()</div>
														<div></div>
													</div>
													<div id="report-btn">
														<button type="button" class="button delete-btn">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- End Modal -->
								</c:forEach>
							</tbody>
						</table>
						
						<!-- 모꾸 페이지네비 -->
						<div id="pageNavi">
							<c:if test="${pInfoMoqoo.startNavi != 1}">
								<c:url var="prevUrl" value="/admin/userdetail">
									<c:param name="moqooPage" value="${pInfoMoqoo.startNavi -1 }"></c:param>
								</c:url>
								<a href="${prevUrl}"><i class="bi bi-caret-left"></i></a>
							</c:if>
							
							<c:forEach begin="${pInfoMoqoo.startNavi}" end="${pInfoMoqoo.endNavi}"
								var="p">
								<c:url var="pageUrl" value="/admin/userdetail">
									<c:param name="userId" value="${user.userId}"></c:param>
									<c:param name="moqooPage" value="${p}"></c:param>
								</c:url>
								<c:choose>
									<c:when test="${p == pInfoMoqoo.currentPage}">
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
							
							<c:if test="${pInfoMoqoo.endNavi != pInfoMoqoo.naviTotalCount}">
								<c:url var="nextUrl" value="/admin/userdetail">
									<c:param name="moqooPage" value="${pInfoMoqoo.endNavi + 1}"></c:param>
								</c:url>
								<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
							</c:if>
						</div>
						<!-- End 모꾸페이지네비 -->
					</div>
					
					<!--=====***** 댓글테이블 *****=====-->
					<div id="cmt-table" style="display: none">
						<table>
							<colgroup>
								<col scope="col" class="col1" width="15%">
								<col scope="col" width="40%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col1" width="15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="col1">No.</th>
									<th scope="col">내용</th>
									<th scope="col" class="col2">공개</th>
									<th scope="col" class="col2">삭제</th>
									<th scope="col" class="col2">신고</th>
									<th scope="col" class="col1">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="jiqooList" items="${uJiqooList}" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${jiqooList.jiqooNo}</td>
										<td>${jiqooList.jiqooContent}</td>
										<td>${jiqooList.jOpenStatus}</td>
										<td>${jiqooList.jiqooStatus}</td>
										<td>0</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#jiqooModal">
												조회</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!-- 페이지네비 -->
					</div>
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
			<div class="modal fade" id="user-report-Modal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">${user.userId}</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<h5></h5>
							<span><i class="bi bi-journal-richtext"></i></i> ${usersTotalJiqooCount }</span> <span><i
								class="bi bi-file-earmark-x"></i> (작성한 모꾸 수)</span> <span><i
								class="bi bi-file-earmark-x"></i> (작성한 댓글 수)</span>
							<div id="report-reason">
								<div id="r-title">신고사유()</div>
								<div></div>
							</div>
							<div id="report-btn">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			


			<!-- 모꾸Modal -->
			<div class="modal fade" id="moqooModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
								title</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글 Modal -->
			<div class="modal fade" id="cmtModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">댓글내용</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- ======= End Modal =======  -->

		</section>
	</main>
	<!-- End #main -->

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
		function deleteUser(userId){
			if(confirm ("정말 탈퇴시키겠습니까?")){
				location.href = "/admin/userdelete?userId=" + userId;
			}
		}
		
		function reviveUser(userId){
			if(confirm ("정말 복원시키겠습니까?")){
				location.href = "/admin/userrevival?userId=" + userId;
			}
		}
		
	</script>
</body>

</html>