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

<link href="../resources/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template CSS File -->
<link href="../resources/assets/css/chart.css" rel="stylesheet">
<link href="../resources/assets/css/admin_jiqoo.css" rel="stylesheet">
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

	<main id="main">

		<!--차트 섹션-->
		<section>
			<div class="row">

				<div class="col-lg-10" style="margin: 0 auto">
					<h5 class="card-title" style="color: #222;">지꾸 리스트</h5>
					<div class="card">
						<div class="card-body">

							<!-- Line Chart chart.js -->
							<canvas id="lineChart" style="max-height: 400px;"></canvas>
							<script>
						
							$(document).ready(function(){
								getGraph();

							});
							
							function getGraph(){
								let timeList=[];
								let postList=[];
								let reportList=[];
								
								$.ajax({
									url: "/admin/jiqooLineChart",
									type: "get",
									dataType: "json",
									success: function(data) {
										console.log(data);
										for (let i = 0; i <data.length; i++){
											timeList.push(data[i].THEDATE);
											postList.push(data[i].JIQOOCOUNT);
											reportList.push(data[i].JREPORTCOUNT);
										}
										 new Chart(document.querySelector('#lineChart'), {
											    type: 'line',
											    data: {
											      labels: timeList,
											      datasets: [
											    	{
											        label: '지꾸 등록 현황',
											        data: postList,
											        fill: false,
											        borderColor: '#19A7CE',
											        tension: 0.1 //곡률넣어줌
											      }
											      ,{
											          label: '신고수',
											          type : 'line',
											          data: reportList,
											          fill: false,
											          borderColor: '#FF9B9B',

											        }]
											    },
											    options: {
											      scales: {
											        y: {
											          beginAtZero: true //y축시작점이 0에서 시작
											        }
											      }
											    }
											  });
									}
										
								});
							};
								
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

						<!--===== 서치바 =====-->
						<div id="search-bar">
							<form action="/admin/jiqoosearch" method="get">
								<div id="search-wrap"
									class="d-flex justify-content-center align-items-center">
									<select name="searchCondition">
										<option value="jiqooWriter">아이디</option>
										<option value="jiqooTitle">제목</option>
										<option value="jiqooContent">내용</option>
										<option value="jiqooCtgr">카테고리</option>
										<option value="jiqooW3W">W3W</option>
										<option value="jiqooNo">번호</option>
									</select> 
									<input type="search" name="searchKeyword" id="search-content" >
									<button type="submit" id="search-button">
										<i class="bi bi-search"></i>
									</button>
								</div>
							</form>
						</div>

						<!-- 테이블 -->
						<table id="jiqoo-table">
						
							<colgroup>
								<col scope="col" width="6%">
								<!-- # -->
								<col scope="col" width="10%" class="col1">
								<!-- 작성자 -->
								<col scope="col" width="4%" class="col4">
								<!-- 첨부파일 -->
								<col scope="col" width="37%" class="col2">
								<!-- 내용 -->
<%-- 								<col scope="col" width="8%" class="col2"> --%>
								<!-- 작성일 -->
								<col scope="col" width="10%">
								<!-- 공개 -->
								<col scope="col" width="10%">
								<!-- 삭제 -->
								<col scope="col" width="10%">
								<!-- 신고 -->
								<col scope="col" width="10%">
								<!-- 상세 -->
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="hover">#</th>
									<th scope="col" onclick="sortTable(1)" class="col1 hover">작성자</th>
									<th scope="col" class="col4"><i class="bi bi-paperclip"></i></th> <!-- 첨부파일 -->
									<th scope="col" onclick="sortTable(2)" class="col2 hover">내용</th>
<!-- 									<th scope="col" onclick="sortTable(2)" class="hover">작성일</th> -->
									<th scope="col" onclick="sortTable(3)" class="hover">공개</th>
									<th scope="col" onclick="sortTable(4)" class="hover">유지</th>
									<th scope="col" onclick="sortTable(5)" class="hover">신고</th>
									<th scope="col" class="col3">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="jiqooList" items="${jiqooList}" varStatus="i">
									<tr>
										<td class="list-no" scope="row">${(pInfo.totalCount - i.index) - ( (pInfo.currentPage - 1)  *  10 ) }</td>
										<td>${jiqooList.jiqooWriter}</td>
										<td class="col4">
											<c:set var="jiqooContent" value="${jiqooList.jiqooContent}"></c:set>
											<c:if test="${fn:contains(jiqooContent, '<img')}"> 
												<i class="bi bi-check"></i> 
											</c:if>
										</td>
										<td>
											<c:out value='${jiqooList.jiqooContent.replaceAll("\\\<.*?\\\>","")}' />  <!-- 내용중 문자열만 출력하기 -->
										</td>
<%-- 										<td><fmt:formatDate pattern="yy-MM-dd" value="${jiqooList.jCreateDate}"/></td> 작성일--%>
										<td>${jiqooList.jOpenStatus}</td>
										<td>${jiqooList.jiqooStatus}</td>
										<td>${jiqooList.jReportCount}</td>
										<td>
											<button type="button" class="button show-detail-btn"
												data-bs-toggle="modal" data-bs-target="#detailJiqooModal${i.count }">조회</button>
										</td>
									</tr>
									
								</c:forEach>
								<jsp:include page="/WEB-INF/views/admin/modal_adminJiqoo.jsp"></jsp:include>
								
							</tbody>
						</table>
						

						<script>
              function sortTable(n) {
                var table, rows, switching, o, x, y, shouldSwitch, dir, switchCount = 0;
                //dir -> 정렬방향 / shouldSwitch - > 정렬
                  table = document.querySelector("#jiqoo-table");
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

						<!-- 지꾸 페이지네비 -->
						<div id="pageNavi">
							<c:if test="${pInfo.startNavi != 1}">
								<c:url var="prevUrl" value="/admin/jiqoolist">
									<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
								</c:url>
								<a href="${prevUrl}"><i class="bi bi-caret-left"></i></a>
							</c:if>
							
							<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}"
								var="p">
								<c:url var="pageUrl" value="/admin/jiqoolist">
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
								<c:url var="nextUrl" value="/admin/jiqoolist">
									<c:param name="page" value="${pInfo.endNavi + 1}"></c:param>
								</c:url>
								<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
							</c:if>
						</div>
						<!-- End 지꾸페이지네비 -->

					</div>
				</div>
			</div>

			
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

	<script src="../resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="../resources/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="../resources/assets/vendor/echarts/echarts.min.js"></script>
	<script src="../resources/assets/vendor/quill/quill.min.js"></script>
	<script
		src="../resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="../resources/assets/vendor/tinymce/tinymce.min.js"></script>


	<!-- Template Main JS File -->
	<script src="../resources/assets/js/chart.js"></script>
	<script src="../resources/assets/js/main.js"></script>
	
	

	<script>
		<!-- 지꾸삭제 ajax -->
// 		function deleteJiqooByA(jiqooNo) {
// 			console.log(jiqooNo);
// 			$.ajax({
// 				url : '/admin/deletejiqoo',
// 				type : 'get',
// 				data : { "jiqooNo" : jiqooNo },
// 				success : function (response) {
// 					/admin/jiqoo
// 				}
					
// 				}
// 				error : function (e){
// 					alert('오류 발생: ' + e);
// 				}
// 			})
// 		} 
	
		//지꾸 강제삭제
		function deleteJiqooByA(jiqooNo){
			if(confirm ("정말 삭제하시겠습니까?")){
				location.href = "/admin/deletejiqoo?jiqooNo=" + jiqooNo;
			}
		}
		
		//강제삭제 지꾸 복원 
		function reviveJiqooByA(jiqooNo){
			if(confirm ("정말 복원시키겠습니까?")){
				location.href = "/admin/jiqoorevival?jiqooNo=" + jiqooNo;
			}
		}

		//jiqooStatus가 A(강제삭제)일 때 열 색을 빨간색으로 변경 
		document.addEventListener("DOMContentLoaded", function() {
		  var table = document.getElementById("jiqoo-table");
		  var rows = table.getElementsByTagName("tr");
		  
		  for (var i = 0; i < rows.length; i++) {
		    var jiqooStatusCell = rows[i].getElementsByTagName("td")[5]; // 5th column (0-based index)
		    if (jiqooStatusCell) {
		      var jiqooStatus = jiqooStatusCell.textContent;
		      if (jiqooStatus.includes('A')) {
		        rows[i].style.color = 'red';
		      }
		    }
		  }
		});
		

		
		
// 		$(".delete-btn").on("click", function() { // .delete-btn 버튼을 누를 때 동작 

// 		    // 클릭한 삭제 버튼의 부모 요소에 해당하는 댓글 내용을 찾습니다.
// 		    const commentText = $(this).closest(".comment").find(".comment-text");

// 		    // 댓글 쓴 사람이 관리자가 아니고, 관리자 권한이 없을 때
// 		    if (comtList.comtWriter !== 'admin' && adminYn !== 'Y') {
// 		        // 댓글 내용을 "관리자에 의해 비공개된 댓글입니다"로 변경
// 		        commentText.text("관리자에 의해 비공개된 댓글입니다");

// 		        // 삭제된 댓글입니다라는 텍스트가 포함되어 있다면 텍스트 색상을 빨간색으로 변경
// 		        if (commentText.text().includes('관리자에 의해 비공개된 댓글입니다')) {
// 		            commentText.css({ color: 'red' });
// 		        }

// 		        // 추가 작업 (예를 들어, 서버로 삭제 요청을 보내거나 다른 동작을 수행)을 할 수 있음

// 		    } else {
// 		        // 관리자가 아닐 때, 또는 관리자 권한이 없을 때 경고 메시지 표시
// 		        alert("관리자만 삭제할 수 있습니다");
// 		    }
// 		});
	</script>
	

	
	


</body>

</html>