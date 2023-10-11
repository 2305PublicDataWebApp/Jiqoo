<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="/"><img src="../resources/assets//img/jiqooLogo.png"></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link" href="#">지꾸</a></li>
          <li><a class="nav-link" href="#">모꾸</a></li>
          <li><a class="nav-link" href="#"><i style="font-size:26px;" class="bi bi-bell"></i></a></li>
          <c:if test="${sessionScope.userId eq null}">
	          <li class="dropdown"><a href="/user/login.do"><i style="font-size:26px;" class="bi bi-person-circle"></i><i class="bi bi-chevron-down"></i></a>
	          </li>
          </c:if>
          <c:if test="${sessionScope.userId ne null && sessionScope.adminYn eq 'N'}">
	          <li class="dropdown"><a class="nav-link" href="#"><i style="font-size:26px;" class="bi bi-person-circle"></i></a>
	            <ul>
	              <li><a href="/user/myPage.do" style="font-size:1.3em;">마이페이지</a></li>
	              <li><a href="/user/modify.do" style="font-size:1.3em;">회원정보수정</a></li>
	              <li><a href="/user/logout.do" style="font-size:1.3em;">로그아웃</a></li>
	            </ul>
	          </li>
          </c:if>
          <c:if test="${sessionScope.userId ne null && sessionScope.adminYn eq 'Y'}">
	          <li class="dropdown"><a class="nav-link" href="#"><i style="font-size:26px;" class="bi bi-person-badge"></i></a>
	            <ul>
	              <li><a href="/admin/user.do" style="font-size:1.3em;">회원 관리</a></li>
	              <li><a href="/admin/jiqoo.do" style="font-size:1.3em;">지꾸 관리</a></li>
	              <li><a href="/admin/moqoo.do" style="font-size:1.3em;">모꾸 관리</a></li>
	              <li><a href="/admin/chat.do" style="font-size:1.3em;">채팅방 관리</a></li>
	              <li><a href="/user/logout.do" style="font-size:1.3em;">로그아웃</a></li>
	            </ul>
	          </li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->