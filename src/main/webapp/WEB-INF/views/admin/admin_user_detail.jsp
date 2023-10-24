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

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<!-- 카카오맵api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee6032b0d73ff0af6bdd2b029c9dd88d"></script>

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
							<button type="button" class="button resign-btn" onclick="deleteUserByA('${user.userId }');">탈퇴처리</button>
						</c:if>
						<c:if test="${fn:contains(userStatus, 'A')}"> <!-- 강퇴 시킨 회원일때 -->
<%-- 						<c:if test="${fn:indexOf(userStatus, 'N') eq 0 }"> --%>
							<button type="button" class="button revival-btn" onclick="reviveUserByA('${user.userId }');">복원</button>
						</c:if>
				

					</div>
				</div>

				<div class="row">
					<div class="user-info col-xs-12 col-sm-12 col-md-6">
					
						<div class="picture">
							<c:if test="${!empty user.userPhotoRename }">
								<img src="../resources/puploadFiles/${user.userPhotoRename }"
									alt="프로필사진" style="border : 1px double #DCE775;">
							</c:if>
							<c:if test="${empty user.userPhotoRename }">
								<img src="../resources/assets/img/no-profile.png" alt="프로필사진" style="width : 400px; height : 400px;">
							</c:if>
						</div>
						
						<div class="introduce">
							<div class="title">자기소개</div>
							<div class="text intro">
								<c:if test="${user.userInfo eq null}"> - </c:if>
								<c:if test="${user.userInfo ne null}"> ${user.userInfo} </c:if>
							</div>
						</div>
						
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
								<c:if test="${user.userGender eq null}"> - </c:if>
<%-- 								<c:if test="${user.userGender eq ''}"> - </c:if> --%>
								<c:if test="${user.userGender ne null}"> ${user.userGender} </c:if>
							</div>
						</div>
						<div class="d-flex">
							<div class="title">생년월일</div>
							<div class="text">
								<c:if test="${user.userBirth eq null}"> - </c:if>
								<c:if test="${user.userBirth ne null}"> 
									<c:set var="userBirth" value="${user.userBirth}"/>
									${fn:substring(userBirth,0,10) }
								</c:if>
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
							<div class="title">회원여부</div>
							<div class="text">${user.userStatus }</div>
						</div>
						<div class="d-flex">
							<div class="title">신고누적</div>
							<div class="report-count">
								<a class="modal-link modal-link-jq" data-bs-toggle="modal"
									href="#user-report-Modal" style="color: #388E3C"> ${user.uReportCount }회 </a>
							</div>
						</div>
						<div class="btn-wrap">
							<div>
								<small>가입일 : ${user.uCreateDate } </small><br> 
								<small>탈퇴일 : <c:if test="${user.uDeleteDate eq null}"> - </c:if> 
												<c:if test="${user.uDeleteDate ne null}"> ${user.uDeleteDate } </c:if></small><br> 
								<small>복원여부 : 
<%-- 									<c:set var="userStatus" value="${userList.userStatus}"></c:set> --%>
<%-- 									<c:if test="${fn:contains(userStatus, 'A')}"> - </c:if> --%>
<%-- 									<c:if test="${!fn:contains(userStatus, 'A') && user.uDeleteDate ne null}"> - </c:if> --%>
<%-- 									<c:if test="${fn:contains(userStatus, 'Y')&& user.uDeleteDate ne null}">복원됨</c:if> --%>
								</small>
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
								<c:if test="${jiqooList eq null}">
									<tr>
										<td colspan="7">${noJiqooMsg}</td>
									</tr>
								</c:if>
								
								<c:forEach var="jiqooList" items="${jiqooList}" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${(pInfoJiqoo.totalCount - i.index) - ( (pInfoJiqoo.currentPage - 1)  *  5 ) }</td>
										<td>
											<c:set var="jiqooContent" value="${jiqooList.jiqooContent}"></c:set>
											<c:if test="${fn:contains(jiqooContent, '<img')}"> 
												<i class="bi bi-check"></i> 
											</c:if>
										</td>
										<td>
											<c:out value='${jiqooContent.replaceAll("\\\<.*?\\\>","")}' />  <!-- 내용중 문자열만 출력하기 -->
											
										</td>
										<td>${jiqooList.jOpenStatus}</td>
										<td>${jiqooList.jiqooStatus}</td>
										<td>${jiqooList.jReportCount}</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#detailJiqooModal${i.count }">
												조회</button>
										</td>
									</tr>
									
									<!--=====***** 지꾸Modal *****=====-->
									<div class="modal fade" id="detailJiqooModal${i.count }" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<div class="modal-title fs-5" id="exampleModalLabel" >
														<h3><i class="bi bi-bookmark-heart"></i> ${jiqooList.jiqooNo} 번째 지꾸</h3>
														<span><i class="bi bi-envelope-open" style="margin-left:5px"></i> 
															<c:if test="${jiqooList.jOpenStatus eq 'Y'}">공개중</c:if>
															<c:if test="${jiqooList.jOpenStatus eq 'N'}">비공개</c:if>
														</span> <!-- 공개여부 -->
														<span><i class="bi bi-file-earmark-x"></i> 
															<c:if test="${jiqooList.jiqooStatus eq 'Y'}">삭제전</c:if>
															<c:if test="${jiqooList.jiqooStatus eq 'N'}">삭제됨</c:if>
															<c:if test="${jiqooList.jiqooStatus eq 'A'}">관리자에 의해 삭제</c:if>
														</span> <!-- 삭제여부 (Y:삭제안됨 / N:삭제됨) -->
													</div>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
															aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<h3 style="display:inline" ><i class="bi bi-sticky"></i> ${jiqooList.jiqooTitle}</h3>&nbsp; <!-- 타이틀 -->
													<span><i class="bi bi-pencil"></i> ${jiqooList.jiqooWriter} </span>&nbsp; <!-- 작성자 -->
													<span><i class="bi bi-calendar-week"></i> 
														<fmt:parseDate value='${jiqooList.jCreateDate}' pattern="yyyy-MM-dd HH:mm:ss.SSS" var='jCreateDate'/>
														<fmt:formatDate value="${jCreateDate}" pattern="yy/MM/dd hh:mm"/>
													</span>
													<br>
													<h5 style="display:inline"><i class="bi bi-tag"></i>${jiqooList.jiqooCtgr}</h5>&nbsp;&nbsp; <!-- 카테고리 -->
													<h5 style="display:inline"><i class="bi bi-globe"></i> ${jiqooList.jiqooW3W}</h5>&nbsp; <!-- W3W -->
													
													<div id="jiqooMap${i.count }" class="map" style="width:100%; height:350px;">${jiqooContent }</div>
													
													<div id="report-reason">
														<div id="r-title">신고사유(${jiqooList.jReportCount})</div>
														<div id="r-reason">
															<c:forEach var="jiqooReport" items="${jiqooList.reportList}" varStatus="i">
																<script>
																	var reportContent = "${jiqooReport.reportContent}";
																	var reportCount = "${jiqooReport.reportCount}";
																	var replacedText = "";
																						
																	switch (reportContent) {
																		case "abusive": replacedText = "욕설사용";
																			 break;
																		case "advertising": replacedText = "광고글";
																			 break;
																		case "noSubject": replacedText = "주제와 맞지 않는 글";
																			break;
																		case "violent":replacedText = "폭력적인 내용";
																			break;
																		case "discrimination": replacedText = "차별적인 내용";
																			break;
																		case "pornography": replacedText = "음란물";
																			break;  
																		case "personal": replacedText = "민감한 개인정보 노출";
																			break;
																		case "etc": replacedText = "기타 (직접 작성)";
																			break;
																		default: replacedText = reportContent;
																			break;
																		} 
																	
																	document.write(replacedText+"("+reportCount+")");
																</script>
																
															</c:forEach>
															</div>
													</div>
													<div id="report-btn">
														<c:set var="jiqooStatus" value="${jiqooList.jiqooStatus}"></c:set>
														<c:if test="${jiqooStatus eq 'Y'}">
															<button type="button" class="button delete-btn" onclick="deleteJiqooByA(${jiqooList.jiqooNo}, '${jiqooList.jiqooWriter}');">삭제</button>
														</c:if>
														<c:if test="${jiqooStatus eq 'A'}">	
															<button type="button" class="button revival-btn" onclick="reviveJiqooByA(${jiqooList.jiqooNo }, '${jiqooList.jiqooWriter}');">복원</button>
														</c:if>	
														<!-- 숫자에는 '' 붙이지 않음  -->
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<!-- End Modal -->
									<!-- 지꾸 카카오맵api -->
									<c:forEach var="jiqooList" items="${jiqooList}" varStatus="i">
									<script>
										$("#detailJiqooModal${i.count}").on('shown.bs.modal', function(){
											var jiqooMapContainer = document.getElementById('jiqooMap${i.count }'), // 지도를 표시할 div 
											jiqooMapOption = { 
										        center: new kakao.maps.LatLng(${jiqooList.jiqooLat}, ${jiqooList.jiqooLng}), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };
		
											var jiqooMap = new kakao.maps.Map(jiqooMapContainer, jiqooMapOption);
											// 마커가 표시될 위치입니다 
											var jiqooMarkerPosition  = new kakao.maps.LatLng(${jiqooList.jiqooLat}, ${jiqooList.jiqooLng}); 
			
											// 마커를 생성합니다
											var jiqooMarker = new kakao.maps.Marker({
											    position: jiqooMarkerPosition
											});
			
											// 마커가 지도 위에 표시되도록 설정합니다
											jiqooMarker.setMap(jiqooMap);
			
											var jiqooIwPosition = new kakao.maps.LatLng(${jiqooList.jiqooLat}, ${jiqooList.jiqooLng}); //인포윈도우 표시 위치입니다
			
											// 인포윈도우를 생성합니다
											var jiqooInfowindow = new kakao.maps.InfoWindow({
											    position : jiqooIwPosition,
											    content : '<div class="info-window" >${jiqooList.jiqooContent}</div>'
											    
											});
											  
											// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
											jiqooInfowindow.open(jiqooMap, jiqooMarker); 
											
										});
										</script>
										</c:forEach>
							</tbody>
						</table>
						
						<!-- 지꾸 페이지네비 -->
						<c:if test="${pInfoJiqoo.totalCount > 0}"> <!-- 게시물이없으면 페이지네비 표시 안함 -->
						<div id="pageNavi">
							<c:if test="${pInfoJiqoo.startNavi != 1}">
								<c:url var="prevUrl" value="/admin/userdetail">
									<c:param name="userId" value="${user.userId}"></c:param>
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
									<c:param name="userId" value="${user.userId}"></c:param>
									<c:param name="jiqooPage" value="${pInfoJiqoo.endNavi + 1}"></c:param>
								</c:url>
								<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
							</c:if>
						</div>
						</c:if>
						<!-- End 지꾸페이지네비 -->
					</div>

					<!--=====***** 모꾸테이블 *****=====-->
					<div id="moqoo-table" style="display: none">
						<table id="m-table">
							<colgroup>
								<col scope="col" class="col1" width="15%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" width="40%">
<%-- 								<col scope="col" class="col2" width="10%"> --%>
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col2" width="10%">
								<col scope="col" class="col1" width="15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="col1">#</th>
									<th scope="col"><i class="bi bi-paperclip"></i></th>
									<th scope="col">내용</th>
<!-- 									<th scope="col" class="col2">모임날짜</th> -->
									<th scope="col" class="col2">상태</th>
									<th scope="col" class="col2">신고</th>
									<th scope="col" class="col1">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${moqooList eq null}">
									<tr>
										<td colspan="7">${noMoqooMsg}</td>
									</tr>
								</c:if>
								
								<c:forEach var="moqooList" items="${moqooList}" varStatus="i">
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
<!-- 										<td></td> -->
										<td>${moqooList.moqooStatus}</td>
										<td>${moqooList.mReportCount}</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#detailMoqooModal${i.count }">
												조회</button>
										</td>
									</tr>
									
								</c:forEach>
								
								<!-- 모꾸 상세보기 모달 + 카카오맵 -->
								<jsp:include page="/WEB-INF/views/admin/modal_adminMoqoo.jsp"></jsp:include> 
								
							</tbody>
						</table>
						
						<!-- 모꾸 페이지 네비 -->
						<c:if test="${pInfoMoqoo.totalCount > 0}"> 
							<div id="pageNavi">
								<c:if test="${pInfoMoqoo.startNavi != 1}">
									<c:url var="prevUrl" value="/admin/userdetail">
										<c:param name="userId" value="${user.userId}"></c:param>
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
										<c:param name="userId" value="${user.userId}"></c:param>
										<c:param name="moqooPage" value="${pInfoMoqoo.endNavi + 1}"></c:param>
									</c:url>
									<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
								</c:if>
							</div>
						</c:if>
						
					</div>
									
					
					
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
									<th scope="col" class="col2">보드</th>
									<th scope="col" class="col2">상태</th>
									<th scope="col" class="col2">신고</th>
									<th scope="col" class="col1">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${uComtList eq null}">
									<tr>
										<td colspan="7">${noComtMsg}</td>
									</tr>
								</c:if>
								
								<c:forEach var="comtList" items="${uComtList}" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${(pInfoComt.totalCount - i.index) - ( (pInfoComt.currentPage - 1)  *  5 ) }</td>
										<td>${comtList.comtContent}</td>
										<td>${comtList.cBoardType}</td>
										<td>${comtList.comtStatus}</td>
										<td>0</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#cmtModal${i.count }">
												조회</button>
										</td>
									</tr>
								</c:forEach>
								<jsp:include page="/WEB-INF/views/admin/modal_adminComt.jsp"></jsp:include> 
							</tbody>
						</table>
						
						<!-- 댓글 페이지네비 -->
						<c:if test="${pInfoComt.totalCount > 0}"> 
							<div id="pageNavi">
								<c:if test="${pInfoComt.startNavi != 1}">
									<c:url var="prevUrl" value="/admin/userdetail">
										<c:param name="userId" value="${user.userId}"></c:param>
										<c:param name="comtPage" value="${pInfoComt.startNavi -1 }"></c:param>
									</c:url>
									<a href="${prevUrl}"><i class="bi bi-caret-left"></i></a>
								</c:if>
								
								<c:forEach begin="${pInfoComt.startNavi}" end="${pInfoComt.endNavi}"
									var="p">
									<c:url var="pageUrl" value="/admin/userdetail">
										<c:param name="userId" value="${user.userId}"></c:param>
										<c:param name="comtPage" value="${p}"></c:param>
									</c:url>
									<c:choose>
										<c:when test="${p == pInfoComt.currentPage}">
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
								
								<c:if test="${pInfoComt.endNavi != pInfoComt.naviTotalCount}">
									<c:url var="nextUrl" value="/admin/userdetail">
										<c:param name="userId" value="${user.userId}"></c:param>
										<c:param name="comtPage" value="${pInfoComt.endNavi + 1}"></c:param>
									</c:url>
									<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
								</c:if>
							</div>
						</c:if>
						<!-- End 댓글페이지네비 -->
					</div>
					
					
					

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


			<!-- 회원신고수Modal -->
			<jsp:include page="/WEB-INF/views/admin/modal_adminUser.jsp"></jsp:include>
			


			

			

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
		//회원 강제탈퇴
		function deleteUserByA(userId){
			if(confirm ("정말 탈퇴시키겠습니까?")){
				location.href = "/admin/userdelete?userId=" + userId;
			}
		}
		
		//강제탈퇴회원 복원 
		function reviveUserByA(userId){
			if(confirm ("정말 복원시키겠습니까?")){
				location.href = "/admin/userrevival?userId=" + userId;
			}
		}
		
		
		//회원별 지꾸 강제삭제
		function deleteJiqooByA(jiqooNo, userId){
			if(confirm ("정말 삭제하시겠습니까?")){
				location.href = "/admin/deletejiqoo?jiqooNo=" + jiqooNo + "&userId=" + userId;
			}
		}
		
		//회원별 강제삭제 지꾸 복원 
		function reviveJiqooByA(jiqooNo,userId){
			if(confirm ("정말 복원시키겠습니까?")){
				location.href = "/admin/jiqoorevival?jiqooNo=" + jiqooNo + "&userId=" + userId;;
			}
		}
		
		
		//회원별 모꾸 강제삭제
		function deleteMoqooByA(moqooNo,userId){
			if(confirm ("정말 삭제하시겠습니까?")){
				location.href = "/admin/deletemoqoo?moqooNo=" + moqooNo +"&userId=" + userId;
			}
		}
		
		//회원별 강제삭제 모꾸 복원 
		function reviveMoqooByA(moqooNo,userId){
			if(confirm ("정말 복원시키겠습니까?")){
				location.href = "/admin/moqoorevival?moqooNo=" + moqooNo+"&userId=" + userId;;
			}
		}
		
		
		//회원별 댓글 강제삭제
		function deleteComtByA(comtNo, userId){
			if(confirm ("정말 삭제하시겠습니까?")){
				location.href = "/admin/deletecomt?comtNo=" + comtNo + "&userId=" + userId;
			}
		}
		
		
		//회원별 강제삭제 댓글 복원 
		function reviveComtByA(comtNo,userId){
			if(confirm ("정말 복원시키겠습니까?")){
				location.href = "/admin/comtrevival?comtNo=" + comtNo + "&userId=" + userId;
			}
		}
		
		
		
		//신고 리셋
		function resetReportByA(userId, moqooNo){
			if(confirm ("정말 리셋하시겠습니까?")){
				location.href = "/admin/deleteComt?comtNo=" + comtNo +"&userId=" + userId;
			}
		}
// 		var userReport = document.querySelector("#r-reason").innerHTML;						
// 		var compressedResult = compressString(userReport);
// 		function compressString(userReport) {
// 			let compressedString = '';
// 			let count = 1;

// 			for (let i = 0; i < userReport.length; i++) {
// 				if (userReport[i] === userReport[i + 1] || (userReport[i] === '\n' && userReport[i + 1] === '\n')) {
// 					count++;
// 				} else {
// 					compressedString += userReport[i];
// 					if (count > 1) {
// 						compressedString += `(${count})`;
// 					}
// 					count = 1;
// 				}
// 			}
// 			return compressedString;
// 		}
		
		
	</script>
</body>

</html>