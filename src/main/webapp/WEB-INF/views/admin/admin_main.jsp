<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
    
    
	<!-- JQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    

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
                      <li><a class="dropdown-item" href="javascript:void(0)" onclick="dailyJiqoo();">Today</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0)" onclick="WeeklyJiqoo();">This Week</a></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title title-jiqoo">지꾸 <span>| Today</span></h5>
                    <div class="d-flex align-items-center">
                      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-journal-bookmark-fill"></i>
                      </div>
                      <div class="ps-3">
                        <h6 class="jiqooCnt">${ todayInsertJiqooCount } 개</h6> <!-- 오늘의 지꾸 수  -->
                        <span class="jiqoo-result text-success small pt-1 fw-bold">
                        	<c:set var="todayInsertJiqooCount" value="${ todayInsertJiqooCount }" />
							<c:set var="yesterdayInsertJiqooCount" value="${yesterdayInsertJiqooCount}" />
							<c:choose> 
							    <c:when test="${yesterdayInsertJiqooCount ne 0}">
							   		<fmt:formatNumber value="${Math.abs(((todayInsertJiqooCount - yesterdayInsertJiqooCount) / yesterdayInsertJiqooCount) * 100)}" maxFractionDigits="0" />%
							    </c:when>
							    <c:otherwise>
							        <c:out value="어제 등록된 지꾸는 0개입니다" />
							    </c:otherwise>
							</c:choose>
						</span> 
                        <span class="jiqoo-indesame text-muted small pt-2 ps-1">
							<span class="text-muted small pt-2 ps-1">
								<c:if test="${todayInsertJiqooCount gt yesterdayInsertJiqooCount }">increase</c:if>
	                        	<c:if test="${todayInsertJiqooCount lt yesterdayInsertJiqooCount}">decrease</c:if>
	                        	<c:if test="${todayInsertJiqooCount eq yesterdayInsertJiqooCount}">same</c:if>
							</span>
						</span>
                        	
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <script>
            	//지꾸카드 오늘 <-> 이번주 교체
            	//지꾸카드 오늘
	              function dailyJiqoo() {
	          	    $.ajax({
	          	    	url: "/admin/dailyjiqoocard", 
	          	        type: "GET",
	          	        dataType : "json",
	          	        success: function(result) {
	          	        	const cardTitle = "지꾸 <span>| Today</span>";
	          	        	const todayjiqooCount = result.resultTodayCnt;
	          	        	const yesterdayJiqooCount = result.resultYesterdayCnt;
	
	          	            // 결과를 원하는 위치에 표시
	          	            $('.title-jiqoo').html(cardTitle);
	                        $('.jiqooCnt').html(todayjiqooCount + ' 개');
	          	            
	                        var contentToDisplay = "";
	          	            // 계산된 값을 표시
	          	            if (yesterdayJiqooCount !== 0) {
	          	            	var percentageChange = ((todayjiqooCount - yesterdayJiqooCount) / yesterdayJiqooCount) * 100;
	 						    var absolutePercentageChange = Math.abs(percentageChange);
	 							var displayText = absolutePercentageChange.toFixed(0) + "%";
	 							$(".jiqoo-result").text(displayText);
		          	        }else {
		          	            contentToDisplay = "어제 등록된 지꾸는 0개입니다";
		          	            $(".jiqoo-result").html(contentToDisplay);
		          	        }
	
	          	        	// 결과를 원하는 위치에 표시
	          	            var changeText = ""; // 기본값
	
	          	            if (todayjiqooCount > yesterdayJiqooCount) {
	          	                changeText = "increase";
	          	            } else if (todayjiqooCount < yesterdayJiqooCount) {
	          	                changeText = "decrease";
	          	            } else {
	          	            	changeText = "same";
	          	            }
	          	            
	          	            $(".jiqoo-indesame").text(changeText);
	          	        	
	          	        },
	          	        error: function() {
	          	      		alert("에러가 발생했습니다 ")
	          	        }
	          	    });
             	}
				
            	//지꾸 이번주
              	function WeeklyJiqoo() {
            	    $.ajax({
            	    	url: "/admin/weeklyjiqoocard", 
            	        type: "GET",
            	        dataType : "json",
            	        success: function(result) {
            	        	const cardTitle = "지꾸 <span>| This Week</span>";
            	        	const thisWeekjiqooCount = result.resultThisWeekCnt;
            	        	const lastWeekJiqooCount = result.resultlastWeekCnt;

            	            // 결과를 원하는 위치에 표시
            	            $('.title-jiqoo').html(cardTitle);
                            $('.jiqooCnt').html(thisWeekjiqooCount + ' 개');
            	            

            	            // 계산된 값을 표시
            	            var percentageChange = ((thisWeekjiqooCount - lastWeekJiqooCount) / lastWeekJiqooCount) * 100;
							var absolutePercentageChange = Math.abs(percentageChange);
							var displayText = absolutePercentageChange.toFixed(0) + "%";
							$(".jiqoo-result").text(displayText);
							
            	            var changeText = ""; // 기본값

            	            if (thisWeekjiqooCount > lastWeekJiqooCount) {
            	                changeText = "increase";
            	            } else if (thisWeekjiqooCount < lastWeekJiqooCount) {
            	                changeText = "decrease";
            	            } else {
            	            	changeText = "same";
            	            }

            	            // 결과를 원하는 위치에 표시
            	            $(".jiqoo-indesame").text(changeText);
            	        	
            	        },
            	        error: function() {
            	      		alert("에러가 발생했습니다 ")
            	        }
            	    });
               	}
              </script>
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
                      <li><a class="dropdown-item" href="javascript:void(0)" onclick="dailyMoqoo();">Today</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0)" onclick="WeeklyMoqoo();">This Week</a></li>
                      <!-- <li><a class="dropdown-item" href="#">This Year</a></li> -->
                    </ul>
                  </div>
  
                  <div class="card-body">
                    <h5 class="card-title title-moqoo">모꾸 <span>| Today</span></h5>
                    <div class="d-flex align-items-center">
                      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-journal-richtext"></i>
                      </div>
                      <div class="ps-3">
                        <h6 class="moqooCnt">${todayInsertMoqooCount } 개</h6>
                        <span class="moqoo-result text-success small pt-1 fw-bold">
							<c:set var="todayInsertMoqooCount" value="${ todayInsertMoqooCount }" />
							<c:set var="yesterdayInsertMoqooCount" value="${yesterdayInsertMoqooCount}" />
							<c:choose>
							    <c:when test="${yesterdayInsertMoqooCount ne 0}">
<%-- 							        <fmt:formatNumber value="${((todayInsertMoqooCount - yesterdayInsertMoqooCount) / yesterdayInsertMoqooCount) * 100}" maxFractionDigits="0" />% --%>
							   		<fmt:formatNumber value="${Math.abs(((todayInsertMoqooCount - yesterdayInsertMoqooCount) / yesterdayInsertMoqooCount) * 100)}" maxFractionDigits="0" />%
							   
							    </c:when>
							    <c:otherwise>
							        <c:out value="어제 등록된 모꾸는 0개입니다" />
							    </c:otherwise>
							</c:choose>
							
						</span> 
						<span class="moqoo-indesame text-muted small pt-2 ps-1">
							<c:if test="${todayInsertMoqooCount gt yesterdayInsertMoqooCount }">increase</c:if>
                        	<c:if test="${todayInsertMoqooCount lt yesterdayInsertMoqooCount}">decrease</c:if>
                        	<c:if test="${todayInsertMoqooCount eq yesterdayInsertMoqooCount}">same</c:if>
						</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
               <script>
              	//모꾸카드 오늘 <-> 이번주 교체
              	//모꾸카드 오늘
	              function dailyMoqoo() {
	          	    $.ajax({
	          	    	url: "/admin/dailymoqoocard", 
	          	        type: "GET",
	          	        dataType : "json",
	          	        success: function(result) {
	          	        	const cardTitle = "모꾸 <span>| Today</span>";
	          	        	const todayMoqooCount = result.resultTodayCnt;
	          	        	const yesterdayMoqooCount = result.resultYesterdayCnt;
	
	          	            // 결과를 원하는 위치에 표시
	          	            $('.title-moqoo').html(cardTitle);
	                        $('.moqooCnt').html(todayMoqooCount + ' 개');
	          	            
	                        var contentToDisplay = "";
	          	            // 계산된 값을 표시
	          	            if (yesterdayMoqooCount !== 0) {
	          	            	var percentageChange = ((todayMoqooCount - yesterdayMoqooCount) / yesterdayMoqooCount) * 100;
	 						    var absolutePercentageChange = Math.abs(percentageChange);
	 							var displayText = absolutePercentageChange.toFixed(0) + "%";
	 							$(".moqoo-result").text(displayText);
		          	        }else {
		          	            contentToDisplay = "어제 등록된 모꾸는 0개입니다";
		          	            $(".moqoo-result").html(contentToDisplay);
		          	        }
	
	          	        	// 결과를 원하는 위치에 표시
	          	            var changeText = ""; // 기본값
	
	          	            if (todayMoqooCount > yesterdayMoqooCount) {
	          	                changeText = "increase";
	          	            } else if (todayMoqooCount < yesterdayMoqooCount) {
	          	                changeText = "decrease";
	          	            } else {
	          	            	changeText = "same";
	          	            }
	          	            
	          	            $(".moqoo-indesame").text(changeText);
	          	        	
	          	        },
	          	        error: function() {
	          	      		alert("에러가 발생했습니다 ")
	          	        }
	          	    });
             	}
	            //모꾸카드 이번주
              	function WeeklyMoqoo() {
            	    $.ajax({
            	    	url: "/admin/weeklymoqoocard", 
            	        type: "GET",
            	        dataType : "json",
            	        success: function(result) {
            	        	const cardTitle = "모꾸 <span>| This Week</span>";
            	        	const thisWeekMoqooCount = result.resultThisWeekCnt;
            	        	const lastWeekMoqooCount = result.resultlastWeekCnt;

            	            // 결과를 원하는 위치에 표시
            	            $('.title-moqoo').html(cardTitle);
                            $('.moqooCnt').html(thisWeekMoqooCount + ' 개');
            	            

            	            // 계산된 값을 표시
//             	            var percentageChange = ((thisWeekMoqooCount - lastWeekMoqooCount) / lastWeekMoqooCount) * 100;
// 							var absolutePercentageChange = Math.abs(percentageChange);
// 							var displayText = absolutePercentageChange.toFixed(0) + "%";
// 							$(".moqoo-result").text(displayText);

							var contentToDisplay = "";
	          	            // 계산된 값을 표시
	          	            if (lastWeekMoqooCount !== 0) {
	          	            	var percentageChange = ((thisWeekMoqooCount - lastWeekMoqooCount) / lastWeekMoqooCount) * 100;
	 						    var absolutePercentageChange = Math.abs(percentageChange);
	 							var displayText = absolutePercentageChange.toFixed(0) + "%";
	 							$(".moqoo-result").text(displayText);
		          	        }else {
		          	            contentToDisplay = "지난주 등록된 모꾸는 0개입니다";
		          	            $(".moqoo-result").html(contentToDisplay);
		          	        }
							
            	            var changeText = ""; 

            	            if (thisWeekMoqooCount > lastWeekMoqooCount) {
            	                changeText = "increase";
            	            } else if (thisWeekMoqooCount < lastWeekMoqooCount) {
            	                changeText = "decrease";
            	            } else {
            	            	changeText = "same";
            	            }

            	            // 결과를 원하는 위치에 표시
            	            $(".moqoo-indesame").text(changeText);
            	        	
            	        },
            	        error: function() {
            	      		alert("에러가 발생했습니다 ")
            	        }
            	    });
               	}
              </script>
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
                      <li><a class="dropdown-item" href="javascript:void(0)" onclick="dailyUser();">Today</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0)" onclick="WeeklyUser();">This Week</a></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title title-user">회원 <span>| Today</span></h5>
                    <div class="d-flex align-items-center">
                      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-people"></i>
                      </div>
                      <div class="ps-3">
                        <h6 class="userCnt">${ todayJoinUserCount } 명</h6>
                        <span class="user-result text-danger small pt-1 fw-bold">
							<c:set var="todayJoinUserCount" value="${ todayJoinUserCount }" />
							<c:set var="yesterdayJoinUserCount" value="${yesterdayJoinUserCount}" />
<%-- 							<c:set var="percent" value="" /> --%>
							<c:choose>
							    <c:when test="${yesterdayJoinUserCount ne 0}">
							    	<fmt:formatNumber value="${Math.abs(((todayJoinUserCount - yesterdayJoinUserCount) / yesterdayJoinUserCount) * 100)}" maxFractionDigits="0" />%
							    </c:when>
							    <c:otherwise>
							        <c:out value="어제 가입자수는 0명입니다" />
							    </c:otherwise>
							</c:choose>
							<fmt:formatNumber value="${percent}" type="number" groupingUsed="false" />
							
						</span> 
						<span class="user-indesame text-muted small pt-2 ps-1">
							<c:if test="${todayJoinUserCount gt yesterdayJoinUserCount }">increase</c:if>
                        	<c:if test="${todayJoinUserCount lt yesterdayJoinUserCount}">decrease</c:if>
                        	<c:if test="${todayJoinUserCount eq yesterdayJoinUserCount}">same</c:if>
						</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <script>
            	//회원카드 오늘 <-> 이번주 교체
            	//회원카드 오늘
	              function dailyUser() {
	          	    $.ajax({
	          	    	url: "/admin/dailyusercard", 
	          	        type: "GET",
	          	        dataType : "json",
	          	        success: function(result) {
	          	        	const cardTitle = "회원 <span>| Today</span>";
	          	        	const todayUserCount = result.resultTodayCnt;
	          	        	const yesterdayUserCount = result.resultYesterdayCnt;
	
	          	            // 결과를 원하는 위치에 표시
	          	            $('.title-user').html(cardTitle);
	                        $('.userCnt').html(todayUserCount + ' 명');
	          	            
	                        var contentToDisplay = "";
	          	            // 계산된 값을 표시
	          	            if (yesterdayUserCount !== 0) {
	          	            	var percentageChange = ((todayUserCount - yesterdayUserCount) / yesterdayUserCount) * 100;
	 						    var absolutePercentageChange = Math.abs(percentageChange);
	 							var displayText = absolutePercentageChange.toFixed(0) + "%";
	 							$(".user-result").text(displayText);
		          	        }else {
		          	            contentToDisplay = "어제 가입한 회원은 0명입니다";
		          	            $(".user-result").html(contentToDisplay);
		          	        }
	
	          	        	// 결과를 원하는 위치에 표시
	          	            var changeText = ""; // 기본값
	
	          	            if (todayUserCount > yesterdayUserCount) {
	          	                changeText = "increase";
	          	            } else if (todayUserCount < yesterdayUserCount) {
	          	                changeText = "decrease";
	          	            } else {
	          	            	changeText = "same";
	          	            }
	          	            
	          	            $(".user-indesame").text(changeText);
	          	        	
	          	        },
	          	        error: function() {
	          	      		alert("에러가 발생했습니다 ")
	          	        }
	          	    });
             	}
				
            	//회원 이번주
              	function WeeklyUser() {
            	    $.ajax({
            	    	url: "/admin/weeklyusercard", 
            	        type: "GET",
            	        dataType : "json",
            	        success: function(result) {
            	        	const cardTitle = "회원 <span>| This Week</span>";
            	        	const thisWeekUserCount = result.resultThisWeekCnt;
            	        	const lastWeekUserCount = result.resultlastWeekCnt;

            	            // 결과를 원하는 위치에 표시
            	            $('.title-user').html(cardTitle);
                            $('.userCnt').html(thisWeekUserCount + ' 명');
            	            

                            var contentToDisplay = "";
	          	            // 계산된 값을 표시
	          	            if (lastWeekUserCount !== 0) {
	          	            	var percentageChange = ((thisWeekUserCount - lastWeekUserCount) / lastWeekUserCount) * 100;
	 						    var absolutePercentageChange = Math.abs(percentageChange);
	 							var displayText = absolutePercentageChange.toFixed(0) + "%";
	 							$(".user-result").text(displayText);
		          	        }else {
		          	            contentToDisplay = "지난주 가입한 회원은 0명입니다";
		          	            $(".user-result").html(contentToDisplay);
		          	        }
							
            	            var changeText = ""; // 기본값

            	            if (thisWeekUserCount > lastWeekUserCount) {
            	                changeText = "increase";
            	            } else if (thisWeekUserCount < lastWeekUserCount) {
            	                changeText = "decrease";
            	            } else {
            	            	changeText = "same";
            	            }

            	            // 결과를 원하는 위치에 표시
            	            $(".user-indesame").text(changeText);
            	        	
            	        },
            	        error: function() {
            	      		alert("에러가 발생했습니다 ")
            	        }
            	    });
               	}
              </script>
              <!-- End 회원  Card -->

              <div class="col-lg-12">
                <!-- 컬럼챠트 -->
                <div class="card" >
                  <div class="card-body">
                    <h5 class="card-title">지꾸/모꾸/회원 일자별 카운트</h5>
					<!-- 차트 들어가는 곳 -->
                    <div id="columnchart_material" style="width : 100%; height: 625px; padding: 10px;"></div>

                       	<script type="text/javascript">
					 		google.charts.load('current', {'packages':['bar']});
							google.charts.setOnLoadCallback(drawChart);
							function drawChart() {
								$.ajax({
									url : "/admin/statschart",
									type : "GET",
									dataType: "json",
									success : function(result){
										var data = new google.visualization.DataTable();
										data.addColumn('datetime', '');	
										data.addColumn('number', '지꾸');	
										data.addColumn('number', '모꾸');	
										data.addColumn('number', '회원');	
										//  ['', '지꾸', '모꾸', '회원'],
										//  ['07', 10, 4, 2],
										//  ['08', 17, 4, 2],
										//  ['09', 6, 11, 3],...
					
					                  
					              //console.log(result);
					         			var arr = new Array();
					                for (var i = 0; i < result.length; i++) {
					                   
					// 		                                 	arr[0] = new Date(2023, 09, result[i].THEDATE);
					// 		                                    arr[1] = result[i].JIQOOCOUNT;
					// 		                                    arr[2] = result[i].MOQOOCOUNT;
					// 		                                    arr[3] = result[i].USERCOUNT;
									arr = [new Date(result[i].THEDATE), result[i].JIQOOCOUNT, result[i].MOQOOCOUNT, result[i].USERCOUNT];
					
					                  data.addRow(arr);  
					              }
					
					
					             	var options = {
					             		chart: {
					                        width: '100%' // 반응형을 위한 width 값 추가
					                      },
					                   	colors: ['#19A7CE', '#8BC34A', '#ff771d']
					             	};
					             	
					             	var mq = window.matchMedia( "(max-width: 575px)" );
					             	if (mq.matches) {
					             		var options = {
					             			legend: {
					                            position: 'none'
					                          },
					                          hAxis: {textPosition : 'none'}, // 가로축 제거
					                          colors: ['#19A7CE', '#8BC34A', '#ff771d']
					             		}
					            	 
					             	};
					              var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
					            chart.draw(data, google.charts.Bar.convertOptions(options));
					            
					          //반응형으로 줄였을때 그래프 사이즈도 줄이기
					            window.addEventListener('resize',drawChart, false) 
								
							}, error : function(){ 
								alert("ajax 오류")
							}
						})
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
              <div class="card-body donut">
                <h5 class="card-title">지꾸/모꾸</h5>
                <div id="donutChart1"></div>
	                <script>
	                  document.addEventListener("DOMContentLoaded", () => {
	                    new ApexCharts(document.querySelector("#donutChart1"), {
	                      series: [${usingJiqooCount}, ${usingMoqooCount}],
	                      chart: {
	                        height: 200,
	                        type: 'donut',
	                    
	                        toolbar: {
	                          show: false
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
              <div class="card-body donut">
                <h5 class="card-title">성비</h5>
                <div id="donutChart2"></div>
                <script>
                
	                var GenderData = ${userGendergroup}
	                var genderObject = JSON.stringify(GenderData);
	                var gData = JSON.parse(genderObject);
	                
	                var genderLabelList = new Array();  //userGender
	                var genderValueList = new Array();  //count

	                for(var i = 0; i < gData.length; i++) {
	                	var GenderData = gData[i];
	                    // data.userGender가 null이거나 빈 문자열("")인 경우 "불명"으로 대체
	                     if (GenderData.userGender === 'M') {
	                    	 genderLabelList.push("남자");
					    } else if(GenderData.userGender === 'F') {
					    	genderLabelList.push("여자");
					    } else {
					    	genderLabelList.push("불명");
					    }
					    console.log(GenderData.userGender); // data.userGender 값 확인
	                	
					    genderValueList.push(GenderData.count);
	                }
	                
					//차트 그리기 
	                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#donutChart2"), {
                      series: genderValueList,
                      chart: {
                        height: 200,
                        type: 'donut',
                        toolbar: {
                          show: false
                        }
                      },
                      labels: genderLabelList,
                      colors: ['#FBF0B2', '#82A0D8','#FF9B9B', '#A8DF8E']
                      
                    }).render();
                  });
                </script>
              </div>
            </div>

            <!--===== 나이 Donut Chart =====-->
            <div class="card">
              <div class="card-body donut1">
                <h5 class="card-title ">나이</h5>
                <div id="donutChart3"></div>
                <script>
	                
	                var ageData = ${userBirthGroup}
	                var ageObject = JSON.stringify(ageData);
	                var aData = JSON.parse(ageObject);
	                
	                var ageLabelList = new Array(); //ageGroup
	                var ageValueList = new Array();  //count
	
	                for(var i = 0; i < aData.length; i++) {
	                	var ageData = aData[i];
	                	if(ageData.ageGroup === '0-9') {
							ageLabelList.push("10대미만");
						}else if(ageData.ageGroup === '10-19') {
	                		ageLabelList.push("10대");
	                	}else if(ageData.ageGroup === '20-29') {
	                    	 ageLabelList.push("20대");
					    }else if(ageData.ageGroup === '30-39') {
	                    	 ageLabelList.push("30대");
					    }else if(ageData.ageGroup === '40-100') {
	                    	 ageLabelList.push("40대 이상");
					    }
					    else {
					    	ageLabelList.push("불명");
					    }
						console.log(ageData.ageGroup);
						
                	
						ageValueList.push(ageData.count);
// 	                	ageLabelList.push(ageData.ageGroup);
	                	
	                }
                  document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#donutChart3"), {
                      series: ageValueList,
                      chart: {
                        height: 200,
                        type: 'donut',
                        toolbar: {
                          show: false
                        }
                      },
                      labels: ageLabelList,
                      colors: ['#FBF0B2', '#82A0D8','#FF9B9B', '#A8DF8E']
                      
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
<!--           <div class="row  box-margin"> -->
<!--             <div class="col-lg-12"> -->
<!--             <h1 style="margin:0 15px; color:#012970;">일자별 요약</h1> -->
<!--             <div class="summary "> -->
<!--               <table class="table"> -->
<%--                 <colgroup> --%>
<%--                   <col scope="col"  width ="20%" > --%>
<%--                   <col scope="col"  width ="20%" > --%>
<%--                   <col scope="col"  width ="20%" > --%>
<%--                   <col scope="col"  width ="20%" > --%>
<%--                   <col scope="col"  width ="20%" > --%>
<%--                 </colgroup> --%>
<!--                 <thead> -->
<!--                   <tr> -->
<!--                     <th>날짜</th> -->
<!--                     <th>지꾸</th> -->
<!--                     <th>모꾸</th> -->
<!--                     <th>가입자</th> -->
<!--                     <th>신고</th> -->
<!--                   </tr> -->
<!--                 </thead> -->
<!--                 <tbody> -->
<%--                 	<c:forEach var="dayCountList" items="${dayCountList}" varStatus="i"> --%>
<!-- 	                  <tr> -->
<!-- 	                    <td> -->
<%-- 							${dayCountList.thedate } --%>
<!-- 						</td> -->
<%-- 	                    <td>${dayCountList.jiqoocount }</td> --%>
<%-- 	                    <td>${dayCountList.moqoocount }</td> --%>
<%-- 	                    <td>${dayCountList.usercount }</td> --%>
<!-- 	                    <td>0</td> -->
<!-- 	                  </tr> -->
<%--                   </c:forEach> --%>
<!--                 </tbody> -->
<!--               </table> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

          <div class="row box-margin ">

              <!--지꾸 테이블-->
              <div class="col-lg-6 ">
                <h3 style="margin:15px 0 0 15px; color:#19A7CE">오늘의 지꾸</h3>
                <div class="today-jiqoo " >
            
                  <table class="table today-list ">
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
                    <c:if test="${todayJiqooList.size() eq 0 }">
						<tr>
							<td colspan="5">오늘 등록된 지꾸가 없습니다.</td>
						</tr>
					</c:if>
                    <c:forEach var="todayJiqoo" items="${todayJiqooList}" varStatus="i">
                      <tr>
                        <td>${todayJiqoo.jiqooWriter}</td> <!-- todayJiqoo.user.userId -->
                        <td>${todayJiqoo.jiqooW3W}</td>
                        <td>
                          <a class="modal-link modal-link-jq" data-bs-toggle="modal" href="#jiqooModal" >
                          	<c:out value='${todayJiqoo.jiqooContent.replaceAll("\\\<.*?\\\>","")}' />  <!-- 내용중 문자열만 출력하기 -->
                          </a>
                        </td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                
           
              </div>
            </div>
              
              <!--모꾸 테이블-->
              <div class="col-lg-6 ">
                <h3 style="margin:15px 0 0 15px; color:#8BC34A">오늘의 모꾸</h3>
                <div class="today-moqoo">
                  
                  <table class="table today-list" >
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
	                    <c:if test="${todayMoqooList.size() eq 0 }">
							<tr>
								<td colspan="5">오늘 등록된 모꾸가 없습니다.</td>
							</tr>
						</c:if>
	                    <c:forEach var="todayMoqoo" items="${todayMoqooList}" varStatus="i">
	                      <tr>
	                        <td>${todayMoqoo.moqooWriter}</td>
	                        <td>${todayMoqoo.moqooW3W}</td>
	                        <td>
	                          	<a class="modal-link modal-link-mq" data-bs-toggle="modal" href="#moqooModal" >
	                          		<c:out value='${todayMoqoo.moqooContent.replaceAll("\\\<.*?\\\>","")}' />  <!-- 내용중 문자열만 출력하기 -->
								</a>
	                        </td>
	                        <td>0</td>
	                        <td>0</td>
	                      </tr>
                      </c:forEach>

                    </tbody>
                  </table>
                  
                </div>
                
              </div>
          </div>


      
        <div class="row box-margin ">
            <!--댓글 테이블-->
            <div class="col-lg-6 ">
              <h3 style="margin:15px 0 0 15px; color:#FCD8D4">오늘달린 댓글</h3>
              <div class="today-comment">
                <table class="table today-list">
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
                  	<c:if test="${todayComtList.size() eq 0 }">
						<tr>
							<td colspan="5">오늘 등록된 댓글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="todayComment" items="${todayComtList}" varStatus="i">
	                    <tr>
	                      <td>
							<c:if test="${todayComment.cBoardType eq 'J' }">지꾸</c:if>
							<c:if test="${todayComment.cBoardType eq 'M' }">모꾸</c:if>
						  </td>
	                      <td>${todayComment.comtWriter }</td>
	                      <td>
	                        <a class="modal-link modal-link-cmt" data-bs-toggle="modal" href="#cmtModal" >
	                        ${todayComment.comtContent }
	                      </a>
	                    </td>
	                      <td>0</td>
	                      <td>0</td>
	                    </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>
              </div>
            </div>

            <!--가입자 테이블-->
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
	                  <c:if test="${todayUserList.size() eq 0 }">
							<tr>
								<td colspan="5">오늘 가입한 회원이 없습니다.</td>
							</tr>
						</c:if>
	                  <c:forEach var="todayUser" items="${todayUserList}" varStatus="i">
	                    <tr>
	                      <td>
	                      	<c:if test="${!empty todayUser.userPhotoRename }">
								<img src="${todayUser.userPhotoPath }" style="width:50px;">
								
							</c:if>
							<c:if test="${empty todayUser.userPhotoRename }">
								<img src="../resources/assets/img/no-profile.png" style="width:50px;">
							</c:if>
	                      </td>
	                      <td>${todayUser.userId }</td>
	                      <td>${todayUser.userName }</td>
	                      <td>
	                      	${todayUser.userGender}
	                      	<c:if test="${todayUser.userGender eq null}"> 불명 </c:if>
	                      </td>
	                      <td>
							<c:if test="${todayUser.platformType eq 'normal'}"> 홈페이지 </c:if>
							<c:if test="${todayUser.platformType eq 'kakao'}"> 카카오 </c:if>
							<c:if test="${todayUser.platformType eq 'naver'}"> 네이버 </c:if>
						  </td>
	                    </tr>
                   	</c:forEach>
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
                    <option value="discrimination">차별적인 내용</option>
                    <option value="pornography">음란물</option>
                    <option value="personal">민감한 개인정보 노출</option>
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
<!--   <script src="../resources/assets/js/chart.js"></script> -->

</body>

</html>