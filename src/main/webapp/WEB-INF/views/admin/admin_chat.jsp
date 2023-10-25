<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="../resources/assets/css/admin_chat.css" rel="stylesheet">
    <link href="../resources/assets/css/header.css" rel="stylesheet">
    <link href="../resources/assets/css/footer.css" rel="stylesheet">  
    
    <!-- jQuery cdn -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>  

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
        

          <div class="col-lg-10 group-chat" style="margin:0 auto">
          	<h5 class="card-title" style="color:#222;">채팅방 리스트</h5>
            
            <!-- <h4 class="card-title" style="margin:20px auto">단체채팅방</h4> -->
            <!-- <div id="group-part"> -->
              <!--서치바-->
              <div id="search-bar" class="col-lg-10" >
                <form action="/admin/chatsearch" method="get">
                  <div id="search-wrap" class="d-flex justify-content-center align-items-center">
                    <select name="searchCondition">
                      <option value="participants">아이디</option>
                      <option value="chatName">채팅방이름</option>
                      <option value="cCreateDate">생성일</option>
                      <option value="msgSendDate">마지막채팅</option>
                      <option value="chatNo">번호</option>
                    </select>
                    <input type="text" name="searchKeyword" id="search-content">
                    <button type="submit" id="search-button"><i class="bi bi-search"></i></button>
                  </div>
                </form>
              </div>

              <div class="card" >
              <!-- 테이블 -->
              <table id="chatList">
                <colgroup>
                  <col scope="col" width ="10%" class="col2"> <!--#-->
                  <col scope="col" width ="7%" > <!--채팅방이름-->
                  <col scope="col" width ="10%" class="col1"> <!--프로필.-->
                  <col scope="col" width ="25%" > <!--참여자목록-->
                  <col scope="col" width ="5%" > <!--총인원-->
                  <col scope="col" width ="10%" class="col1"> <!--채팅생성일.-->
                  <col scope="col" width ="15%" class="col1"> <!--마지막채팅전송일자.-->
                  <col scope="col" width ="5%" > <!--신고수-->
                  <col scope="col" width ="15%" class="col3"> <!--삭제버튼-->
                  
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" class="col2">#</th>
                    <th scope="col" onclick="sortTable(0)" class="hover">채팅방명</th>
                    <th scope="col" class="col1">프로필</th>
                    <th scope="col" onclick="sortTable(1)" class="hover">참여자목록</th>
                    <th scope="col" onclick="sortTable(2)" class="hover">인원</th>
                    <th scope="col" onclick="sortTable(3)" class="hover col1">채팅생성일</th>
                    <th scope="col" onclick="sortTable(4)" class="hover col1">마지막채팅</th>
                    <th scope="col" onclick="sortTable(5)" class="hover">신고</th>
                    <th scope="col" class="col3">상세</th>
                  </tr>
                </thead>
                
                <tbody>
	                <c:forEach var="chatRoomAllList" items="${chatRoomAllList}" varStatus="i">
	                  <tr>
	                    <td class="list-no" scope="row">${(pInfo.totalCount - i.index) - ( (pInfo.currentPage - 1)  *  15 ) }</td> <!-- # -->
	                    <td title="${chatRoomAllList.chatName }">${chatRoomAllList.chatName }</td>  <!-- 채팅방이름 -->
	                    <td class="col1">
	                    	<c:if test="${empty chatRoomAllList.cImagePath }">
								<img src="../resources/assets/img/no-profile.png" style="width:50px;">
							</c:if>
							
							<c:if test="${!empty chatRoomAllList.cImagePath }">
								<img src="${chatRoomAllList.cImagePath }" style="width:50px;">
							</c:if>
	                    </td>
	                    <td title="${chatRoomAllList.participants }">${chatRoomAllList.participants }</td> <!-- 참여자목록 -->
	                    <td>${chatRoomAllList.participantCount }</td> <!-- 총인원 -->
	                    <td class="col1"><fmt:formatDate pattern="yy-MM-dd" value="${chatRoomAllList.cCreateDate }"/></td> <!-- 채팅생성일 -->
	                    <td class="col1"><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${chatRoomAllList.msgSendDate }"/></td> <!-- 마지막채팅 -->
	                    <td>${chatRoomAllList.reportCount }</td>
	                    <td class="col3">
	                       <button type="button" class="button show-detail-btn" data-bs-toggle="modal" data-bs-target="#detailChatModal${i.count }">조회</button>
	                    </td>
	                  </tr>
	                  <!--===== 채팅방 상세보기 Modal =====-->
	                  <div class="modal fade" id="detailChatModal${i.count }" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title fs-5" id="exampleModalLabel">
											<h3>
												<i class="bi bi-bookmark-heart"></i> ${chatRoomAllList.chatNo} 번째 채팅방
											</h3>
										</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h4 style="display: inline"><i class="bi bi-stickies"></i> ${chatRoomAllList.chatName} </span>&nbsp; <!-- 채팅방명 -->
										<span><i class="bi bi-calendar-week"></i> 
<%-- 											<fmt:parseDate value='${chatRoomAllList.cCreateDate}' pattern="yyyy.MM.dd HH:mm:ss.SSS" var='cCreateDate' />  --%>
											<fmt:formatDate value="${chatRoomAllList.cCreateDate}" pattern="yy.MM.dd HH:mm" /> <!-- 생성일자 -->
										</span>&nbsp;  
										<br>
										<h5 style="display: inline">
											<i class="bi bi-people"></i> ${chatRoomAllList.participants} ( ${chatRoomAllList.participantCount} ) <!-- 참여인원 -->
										</h5>
										&nbsp;
										<span><i class="bi bi-clock"></i> 
											<fmt:parseDate value='${chatRoomAllList.msgSendDate}' pattern="yyyy-MM-dd HH:mm:ss.SSS" var='msgSendDate' /> 
											<fmt:formatDate value="${msgSendDate}" pattern="yy/MM/dd HH:mm:ss" /> <!-- 생성일자 -->
										</span>&nbsp;&nbsp;
						
										
										<!-- 모임인원 -->
										<div id="report-reason">
											<div id="r-title">신고사유(${chatRoomAllList.reportCount})</div>
											
											<div id="r-reason">
												<c:forEach var="chatReport" items="${chatRoomAllList.reportList}" varStatus="i">
													<script>
														var reportContent = "${chatReport.chatReportContent}";
														var reportCount = "${chatReport.reportCount}";
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
											<button type="button" class="button delete-btn" onclick="deleteChatRoomByA('${chatRoomAllList.chatNo}');">삭제</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End 모꾸 상세보기 Modal -->
					</c:forEach>
		
					
                </tbody>
              </table>
            </div>
            
            <!--  페이지네비 -->
			  <c:if test="${pInfo.totalCount > 0}">
				<div id="pageNavi">
					<c:if test="${pInfo.startNavi != 1}">
						<c:url var="prevUrl" value="/admin/chatlist">
							<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
						</c:url>
						<a href="${prevUrl}"><i class="bi bi-caret-left"></i></a>
					</c:if>
					
					<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}"
						var="p">
						<c:url var="pageUrl" value="/admin/chatlist">
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
						<c:url var="nextUrl" value="/admin/chatlist">
							<c:param name="page" value="${pInfo.endNavi + 1}"></c:param>
						</c:url>
						<a href="${nextUrl}"><i class="bi bi-caret-right"></i></a>
					</c:if>
				</div>
			  </c:if>
			  <!-- End 페이지네비 -->
            
          <!-- </div> -->
              <script>
//                 function sortTable(n) {
//                   var table, rows, switching, o, x, y, shouldSwitch, dir, switchCount = 0;
//                   //dir -> 정렬방향 / shouldSwitch - > 정렬
//                     table = document.querySelector("#chatList");
//                     switching = true;  
//                     dir = "asc"; //현재 정렬을 나타냄 
//                     while (switching) {
//                     switching = false;
//                     rows = table.getElementsByTagName("TR");
  
//                     for (o = 1; o < rows.length -1; o++) {                    
//                       shouldSwitch = false;
//                       x = rows[o].getElementsByTagName("TD")[n];
//                       y = rows[o + 1].getElementsByTagName("TD")[n];
                      
//                       if (dir == "asc") {
//                         if (isNaN(x.innerHTML) && isNaN(y.innerHTML)) {
//                           // x와 y가 모두 문자열일 때
//                           if (x.innerHTML.localeCompare(y.innerHTML) > 0) {
//                             shouldSwitch = true;
//                             break;
//                           }
//                         } else {
//                           // x와 y 중 하나 이상이 숫자일 때
//                           if (
//                             (isNaN(x.innerHTML) ? x.innerHTML : parseFloat(x.innerHTML)) 
//                             > (isNaN(y.innerHTML) ? y.innerHTML : parseFloat(y.innerHTML))
//                           ) {
//                             shouldSwitch = true;
//                             break;
//                           }
//                         }
//                       } else if (dir == "desc") {
//                         if (isNaN(x.innerHTML) && isNaN(y.innerHTML)) {
//                           if (x.innerHTML.localeCompare(y.innerHTML) < 0) {
//                             shouldSwitch = true;
//                             break;
//                           }
//                         } else {
//                           if (
//                             (isNaN(x.innerHTML) ? x.innerHTML : parseFloat(x.innerHTML)) 
//                             < (isNaN(y.innerHTML) ? y.innerHTML : parseFloat(y.innerHTML))
//                           ) {
//                             shouldSwitch = true;
//                             break;
//                           }
//                         }
//                       }
//                     }
  
//                     if (shouldSwitch) {
//                       rows[o].parentNode.insertBefore(rows[o + 1], rows[o]);
//                       switching = true;
//                       switchCount++;
//                     } else {
//                       if(switchCount == 0 && dir == "asc") {
//                         //정렬방향 변경
//                         dir = "desc";
//                         switching = true;
//                       }
//                     }
//                   }
//                 }
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
//   	function goToMyClassList(){
// 		const userId = '${userId}';
// 		location.href = "/admin/userDetail.do?userId="+userId;
// 	}
  	
	//채팅방 강제삭제 
	function deleteChatRoomByA(chatNo){
		if(confirm ("정말 삭제하시겠습니까? 삭제 후엔 복구할 수 없습니다.")){
			location.href = "/admin/deletechatroom?chatNo=" + chatNo;
		}
	}
  </script>

</body>

</html>