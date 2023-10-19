<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
        <!-- 카카오 로그인 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" ></script> -->
        <script>
	        Kakao.init('4cf9db2344d009b1a0f20e2bb100602a'); // 발급키
	    	console.log(Kakao.isInitialized());
        </script>  
 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="/"><img src="../resources/assets/img/jiqooLogo.png"></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link" href="/jiqoo/list">지꾸</a></li>
          <li><a class="nav-link" href="/moqoo/moqoo">모꾸</a></li>
          <li><a class="nav-link" href="#"><i style="font-size:26px;" class="bi bi-bell"></i></a></li>
          <c:if test="${sessionScope.userId eq null}">
	          <li class="dropdown"><a href="/user/login"><i style="font-size:26px;" class="bi bi-person-circle"></i><i class="bi bi-chevron-down"></i></a>
	          </li>
          </c:if>
          <c:if test="${sessionScope.userId ne null && sessionScope.adminYn eq 'N'}">
	          <!-- <li class="dropdown"><a class="nav-link" href="#"><i style="font-size:26px;" class="bi bi-person-circle"></i></a> -->
	          <li class="dropdown"><a class="nav-link" href="#">
		        <c:if test="${sessionScope.userPhotoPath eq null}">
	          		<img src="../resources/assets/img/earth-globe.png" style="width:28px; height:28px; border-radius:50%">
	            </c:if>
		        <c:if test="${sessionScope.userPhotoPath ne null}">
	          		<img src="${sessionScope.userPhotoPath}" style="width:28px; height:28px; border:2px solid rgba(0, 0, 0, 0.712); border-radius:50%">
	            </c:if>
	          </a>
	            <ul>
	            	<li><a href="/user/myPage" style="font-size:1.3em;">마이페이지</a></li>
					<c:if test="${sessionScope.accessToken eq null }">
						<li><a href="/user/modify" style="font-size:1.3em;">회원정보수정</a></li>
					</c:if>
					<c:if test="${sessionScope.accessToken ne null }">
						<li><a href="/user/modifySns" style="font-size:1.3em;">회원정보수정</a></li>
					</c:if>
					<c:if test="${sessionScope.accessToken eq null }">
						<li><a href="/user/logout" style="font-size:1.3em;">로그아웃</a></li>
					</c:if>
					<c:if test="${sessionScope.accessToken ne null }">
						<li><a href="https://kauth.kakao.com/oauth/logout?client_id=18a1ca5fc86fe7e244209cf690a986e4&logout_redirect_uri=http://localhost:9999/user/logout" style="font-size:1.3em;">로그아웃</a></li> 
					</c:if>
	            </ul>
	          </li>
          </c:if>
          <c:if test="${sessionScope.userId ne null && sessionScope.adminYn eq 'Y'}">
	          <li class="dropdown"><a class="nav-link" href="/admin/main"><i style="font-size:26px;" class="bi bi-person-badge"></i></a>
	            <ul>
	              <li><a href="/admin/userlist" style="font-size:1.3em;">회원 관리</a></li>
	              <li><a href="/admin/jiqoolist" style="font-size:1.3em;">지꾸 관리</a></li>
	              <li><a href="/admin/moqoolist" style="font-size:1.3em;">모꾸 관리</a></li>
	              <li><a href="/admin/chatlist" style="font-size:1.3em;">채팅방 관리</a></li>
	              <li><a href="/user/logoutlist" style="font-size:1.3em;">로그아웃</a></li>
	            </ul>
	          </li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->