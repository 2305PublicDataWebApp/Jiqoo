<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- 부트스트랩 CSS -->
  
  <!-- 부트스트랩 JavaScript 및 jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/post_moqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">


  <!-- 썸머노트 스타일 및 스크립트 추가 -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@latest/dist/summernote-bs4.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@latest/dist/summernote-bs4.min.js"></script>


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
    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
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
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Modal ======= -->
    <div class="modal-body">
    </div>

    <div id="container" data-aos=fade-in> 

      
    <!-- ======= Post ======= -->
    <div id="post" class="col-md-12 col-xxl-10 mx-auto">
      <div class="post-header">
		  <c:if test="${sessionScope.userId ne moqoo.user.userId }">
			<span id="action_menu_btn"><i class="bi bi-three-dots-vertical"></i></span>
			<div class="action_menu">
			  <ul>
				<li><a href="#"><i class="bi bi-person-vcard"></i> 프로필보기</a></li>
				<li><a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"><i class="bi bi-exclamation-triangle"></i> 신고하기</a></li>
			  </ul>
			</div>
		  </c:if>
		  <div style="text-align: center;">
			<div id="post-category-img-container">
			  <img id="post-category-img" alt="" src="${category.cImgPath}">
			</div>
			<div class="location col-xs-12 col-sm-8 col-md-6">
			  <span id="location-text">${moqoo.moqooW3W}</span>
			</div>
		  </div>
      </div>
      <div id="post-title">${moqoo.moqooTitle }</div>
        <div id="writer-info">
          <div id="post-profile" class="col-sm-12">
          	<c:if test="${moqoo.user.userPhotoPath eq null }">
   			  <img src="../resources/assets/img/no-profile.png" alt="프로필 이미지" id="moqoo-table-img" class="profile-image">
            </c:if>
         	<c:if test="${moqoo.user.userPhotoPath ne null }">
	          <img src="${moqoo.user.userPhotoPath }" alt="프로필 이미지" class="profile-image">
         	</c:if>
          </div>
          <div id="post-nick" class="col-lg-10 col-md-9 col-sm-9">
            <div id="writer-name">${moqoo.user.userNickname }</div>
            <input type="hidden" id="moqoo-writer" name="moqooWriter" value="${sessionScope.userId }">
            <div class="row">
              <div class="info post-date col-lg-6 col-md-12"><fmt:formatDate pattern="yy/MM/dd HH:mm" value="${moqoo.moqooDate }" />
			  </div>
              <div class="info view-count col-lg-3 col-md-12"><span>조회수 </span>${moqoo.mViewCount }</div>
            </div>
          </div>
        </div>
      <hr>
      	<div id="content">${moqoo.moqooContent }</div>
      
	    <!-- 지도 들어갈 자리 -->
	    <div id="map">
	
	    </div>
	    <div>
	      <p>모일 날짜 : <span>${moqoo.moqooDay }</span></p>
	      <p>참여인원 : <span>${joinCount }</span>/${moqoo.moqooJoin }</p>
	    </div>
	
	    <div class="post-footer">
	      <div class="heart-container">
<!-- 	        <img id="heart" class="heart" src="../resources/assets/img/heart(empty).png" alt="빈 하트" onclick="changeImage()"> -->
<%-- 	        <span class="heart-count">${likeCount }</span> --%>
				<button id="likeButton"  onclick="like(${moqoo.moqooNo})">
				    <c:if test="${likeOrNot == 0 }">
				        <i class="bi bi-heart heart"></i>
				    </c:if>
				    <c:if test="${likeOrNot == 1 }">
				    	<i class="bi bi-heart-fill heart"></i>
				    </c:if>
				</button>
				<span id="like-count">${likeCount }</span>
				<!-- 좋아요 버튼 -->
	      </div>
	      
	      <div class="button-container">
			<c:if test="${moqoo.moqooWriter eq sessionScope.userId }">
			    <c:url var="moqooDelUrl" value="/moqoo/delete">
				  <!-- 내가 쓴 게시글만 지울 수 있게 확인하기 위한 코드 -->
				  <c:param name="moqooNo" value="${moqoo.moqooNo }"></c:param>
				  <c:param name="moqooWriter" value="${moqoo.moqooWriter }"></c:param>
				</c:url>
		          <button class="btn post-btn open-modal" data-bs-toggle="modal" data-bs-target=".mod-modal"  id="modify-btn">수정</button>
		          <button class="btn post-btn" id="delete-btn" onclick="deleteMoqoo('${moqooDelUrl }');">삭제</button>
	      	</c:if>
	      </div>
	    </div>
	    <div id="participate">
	    <c:if test="${moqoo.moqooWriter eq sessionScope.userId }">
	      <button class="btn post-btn" id="joinInfo" data-bs-toggle="modal" data-bs-target=".joinInfo">참여현황</button>
	    </c:if>  
	      <button class="btn post-btn" id="participate-btn">참여하기</button>
	    </div>
	  
	  
	  
	  <!-- 참여현황 모달 -->
        <div class="modal joinInfo" id="joinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-md">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">참여 현황</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <table>
              	  <c:forEach var="moqooUserList" items="${moqooList }">
              	  	<tr>
              	  	<c:if test="${moqooUserList.user.userPhotoPath eq null }">
   			          <td class="moqoo-table"><img src="../resources/assets/img/no-profile.png" alt="프로필 이미지" id="moqoo-table-img" class="profile-image"></td>
              	  	</c:if>
              	  	<c:if test="${moqooUserList.user.userPhotoPath ne null }">
   			          <td class="moqoo-table"><img src="${moqooUserList.user.userPhotoPath }" alt="프로필 이미지" class="profile-image"></td>
              	  	</c:if>
   			    	  <td class="moqoo-table">닉네임 : ${moqooUserList.user.userNickname}</td>
   				      <td class="moqoo-table">나이 :  ${moqooUserList.user.userBirth }</td>
   				      <td class="moqoo-table">성별 : ${moqooUserList.user.userGender }</td>
   				      <td class="moqoo-table">
   				      	<input type="hidden" value="${moqooUserList.attendStatus }">
   				      	<input type="hidden" value="${moqooUserList.refUserId }">
   				      	<input type="hidden" value="${moqooUserList.refMoqooNo }">
   				      	<c:if test="${moqooUserList.attendStatus eq 'N' }">
	   				        <button id="ok" class="table-btn">승인</button>
	   				        <button id="sorry" class="table-btn" onclick="sorry();">거절</button>
   				        </c:if>
   				      </td>
	       		    </tr>
	              </c:forEach>
                </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- ======= Modal ======= -->
      <div class="modal mod-modal" tabindex="-1" id="insert-modal">
		<div class="modal-dialog modal-lg">
		  <div class="modal-content" style="background-color: #6DBE45; color: #fff;">
			<div class="modal-header">
			  <h5 class="modal-title">게시물 입력</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<!-- 게시물 수정 폼 -->
			<form action="/moqoo/update" method="post" id="moqooForm" enctype="multipart/form-data">
				<input type="hidden" name="moqooNo" value="${moqoo.moqooNo }">
				<div class="mb-3 col-lg-5 mx-auto location-container">
					<input type="text" class="form-control" id="location"
						name="moqooW3W" value="${moqoo.moqooW3W }" readonly>
					<button id="open-map-btn">+</button>
				</div>
				<div class="mb-3 row date-tag-container">
					<div class="date-container col-md-3">
						<input type="date" class="form-control" id="date" name="moqooDay" value="${moqoo.moqooDay }" required>
					</div>
					<div class="col-md-2 c-btn">
						<span>카테고리</span> <i class="bi bi-caret-down-fill"
							onclick="toggleCC()"></i>
					</div>
					<div class="category-container" style="display: none;">
						<div class="category-list">
							<c:forEach var="categoryList" items="${categoryList }">
								<div class="form-check category">
									<input class="form-check-input" type="radio" name="category"
										id="${categoryList.cName }" value="${categoryList.cName }" required> 
										<label class="form-check-label"
										for="${categoryList.cName }"> <img class="tag-img"
										src="${categoryList.cImgPath }"
										alt="${categoryList.cName }">
									</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<input type="hidden" id="lat" name="moqooLat" value="${moqoo.moqooLat }">
				<input type="hidden" id="lng" name="moqooLng" value="${moqoo.moqooLng }">
				<input type="hidden" id="moqoo-writer" name="moqooWriter" value="${sessionScope.userId }">
				<div class="mb-3">
					<input type="text" class="form-control" id="title" name="moqooTitle" placeholder="제목" value="${moqoo.moqooTitle }" required>
				</div>
				<div class="mb-3" style="display: flex;">
					<div>
						<input type="file" class="custom-file-input" id="thum"
							name="uploadFile" placeholder="썸네일" required> 
							<label for="thum" class="custom-button">파일 선택</label>
							<!-- 		기존 업로드 파일 체크할 때 사용 --><!-- 파일은 수정 안 할 때 필요함  -->
							<input type="hidden" name="moqooThumName"   value="${moqoo.moqooThumName }">
							<input type="hidden" name="moqooThumRename" value="${moqoo.moqooThumRename }">
							<input type="hidden" name="moqooThumPath"   value="${moqoo.moqooThumPath }">
					</div>
					<!-- 파일 정보 표시 영역 -->
					<div id="fileInfo"></div>
				</div>
				<div class="mb-3">
					<textarea id="summernote" name="moqooContent" required>${moqoo.moqooContent }</textarea>
				</div>
				<div class="mb-3">
					<input type="number" min="2" max="8" class="form-control"
						id="people" name="moqooJoin" placeholder="참여인원" value="${moqoo.moqooJoin }" required>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn reset" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn insert">등록</button>
					</div>
				</form>
			  </div>
		    </div>
	      </div>
        </div>

		<!-- 댓글 -->
        <div class="comment-section col-md-12 col-xxl-10 mx-auto">
	        <!-- 댓글 등록창 -->
	        <div class="comment-form col-md-12 col-xxl-10 mx-auto">
	         <textarea placeholder="댓글을 입력하세요" id="comtContent"></textarea>
	         <button class="btn postbtn" id="submit-btn">등록</button>
	        </div>
		    <span>댓글</span><span>3</span>
		    <div id="comment-container"></div>
			<div id="reportPopup" class="popup">
				<h2>댓글 신고하기</h2>
				<textarea id="reportReason" placeholder="신고 이유를 입력하세요"></textarea>
				<button onclick="reportComment()">신고</button>
				<button onclick="closeReportPopup()">닫기</button>
			</div>
		</div>
		<div class="comment-page-container">
          <span class="comment-page">< 1 2 3 4 5 ></span>
        </div>
        
<!--           <ul class="comment-list"> -->
<%--           <c:forEach var="comt1" items="${comtList }" varStatus="i"> --%>
<%--           	<c:if test=""></c:if> --%>
<!--             <li class="comment"> -->
<!--               <span id="action_menu_btn"><i class="bi bi-three-dots-vertical"></i></span> -->
<!-- 	             <div class="action_menu"> -->
<!-- 	               <ul> -->
<!-- 	                 <li><a href="#"><i class="bi bi-person-vcard"></i> 프로필 보기</a></li> -->
<!-- 	                 <li><a href="#" data-bs-toggle="modal" data-bs-target=".fade"><i -->
<!-- 	                      class="bi bi-exclamation-triangle"></i> 신고하기</a></li> -->
<!-- 	               </ul> -->
<!-- 	             </div> -->


<%-- 			  <input type="hidden" id="comtNo${i.index}" value="${comt1.comtNo }"> --%>
<!-- 			  <img class="mini-dots" src="../../assets/img/etc/dots.png" alt="" onclick="toggleReportDiv(this)"> -->
<!-- 			  <div id="report-div" style="display: none;"> -->
<!-- 			    <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a> -->
<!-- 				  <i class="bi bi-exclamation-circle"></i> -->
<!-- 			  </div> -->


<!-- 			  <div class="user-info"> -->
<%--                 <img src="${moqoo.user.userPhotoPath }" alt="User Photo"> --%>
<%--                 <span class="username">${moqoo.user.userNickname }</span> --%>
<%--                 <span class="date"><fmt:formatDate pattern="yy/MM/dd HH:mm" value="${comt1.comtDate }"/></span> --%>
<!--                 <a href="javascript:void(0);" class="comt" onclick="replyForm(this);">답글쓰기</a> -->
<!--                 <a href="javascript:void(0);" class="comt" onclick="modReply(this);">수정</a> -->
<!--                 <a href="#" class="comt">삭제</a> -->
<!--               </div> -->
<%--               <p class="comment-text">${comt1.comtContent }</p> --%>
<!--               ■■■■■ 신고하기 버튼 ■■■■■ -->
<!--               <div id="report-div" style="display: none;"> -->
<!--                 <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a> -->
<!--                 <i class="bi bi-exclamation-circle"></i> -->
<!--               </div> -->
<!--               ■■■■■ 댓글 수정 폼 ■■■■■ -->
<!--               <div class="div-none"> -->
<!-- 	              <form action="" method="" class="mod-comment-form col-md-12 col-xxl-10 mx-auto"> -->
<%-- 	                <textarea>${comt1.comtContent }</textarea> --%>
<!-- 	                <button class="btn postbtn" id="mod-submit-btn">등록</button> -->
<!-- 	              </form> -->
<!--               </div> -->
<!--               ■■■■■ 대댓글 입력 폼 ■■■■■ -->
<!--               <div class="div-none"> -->
<!-- 	              <div class="re-comment-form col-md-12 col-xxl-10 mx-auto"> -->
<!-- 	                <textarea id="reComtContent" placeholder="댓글을 입력하세요"></textarea> -->
<%-- 	                <button class="btn postbtn" id="re-comt-submit-btn" onclick="reComtInsert(${i.index});">등록</button> --%>
<!-- 	              </div> -->
<!--               </div> -->
<!--             </li> -->
<!-- <!--             대댓글 --> 
<%-- 			  <c:forEach var="comt2" items="${comtList }"> --%>
<%-- 				<c:if test="${comt1.comtNo eq comt2.pComtNo } "> --%>
<!-- 	            <li class="comment reply-comment"> -->
<!-- 	              <img class="mini-dots" src="../../assets/img/etc/dots.png" alt="" onclick="toggleReportDiv(this)"> -->
<!-- 	              <div id="report-div" style="display: none;"> -->
<!-- 	                <a href="javascript:void(0);" id="report-text" data-bs-toggle="modal" data-bs-target=".fade"  id="report-btn">신고하기</a> -->
<!-- 	                <i class="bi bi-exclamation-circle"></i> -->
<!-- 	              </div> -->
<!-- 	              <div class="user-info"> -->
<%-- 	                <img src="${moqoo.user.userPhotoPath }" alt="User 2"> --%>
<%-- 	                <span class="username">${moqoo.user.userNickname }</span> --%>
<%-- 	                <span class="date">${comt2.comtDate }</span> --%>
<!-- 	                <a href="javascript:void(0);" class="comt" onclick="replyForm(this);">답글쓰기</a> -->
<!-- 	                <a href="javascript:void(0);" class="comt" onclick="modReply(this);">수정</a> -->
<!-- 	                <a href="#" class="comt">삭제</a> -->
<!-- 	              </div> -->
<%-- 	              <p class="comment-text">${comt2.comtContent }</p> --%>
<!-- 	              대댓글 입력 폼 -->
<!-- 	              <div class="div-none"> -->
<!-- 		            <form action="" method="" class="re-comment-form col-md-12 col-xxl-10 mx-auto"> -->
<!-- 		              <textarea id="re-reComtContent"></textarea> -->
<!-- 		              <button class="btn postbtn" id="re-submit-btn">등록</button> -->
<!-- 		            </form> -->
<!-- 	              </div> -->
<!-- 	              대댓글 수정 폼 -->
<!-- 	              <div class="div-none"> -->
<!-- 		            <form action="" method="" class="re-mod-comment-form col-md-12 col-xxl-10 mx-auto"> -->
<!-- 		              <textarea>대댓글</textarea> -->
<!-- 		              <button class="btn postbtn" id="re-mod-submit-btn">등록</button> -->
<!-- 		            </form> -->
<!-- 	              </div> -->
<!-- 	            </li> -->
<%--           </c:if> --%>
<%-- 	          </c:forEach> --%>
<%--         </c:forEach> --%>
<!-- <!--             // 첫번째 댓글의 답글 --> 
<!--              --크게 forEach하고 답글만 따로 또 forEach하면 되나?----여기까지 반복------------------------ -->
<!--           </ul> -->
        <!-- 페이징처리할 div -->
        
<!--         <form action="" method="" class="comment-form col-md-12 col-xxl-10 mx-auto"> -->
<!--         </form> -->
          
          
        <!-- 신고 모달 -->
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
                  <option value="Discrimination">차별적인 내용</option>
                  <option value="pornography">음란물</option>
                  <option value="Personal">민감한 개인정보 노출</option>
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
      </div>
     </div>
    </main><!-- End #main -->
    
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
  	function deleteMoqoo(moqooDelUrl) {
  		if(confirm("정말 삭제하시겠습니까?")){
    		location.href= moqooDelUrl;
    	}
	}
  </script>
  <script>
  $(document).ready(function() {
    //여기 아래 부분
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '내용을 입력하세요.',	//placeholder 설정
            toolbar: [
                    // [groupName, [list of button]]
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    ['color', ['forecolor','color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert',['picture','link','video']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                callbacks:{ 
                    onImageUpload : function(files){ 
                       muploadSummernoteImageFile(files[0],this); 
                   } 
                } 
        });
        function muploadSummernoteImageFile(file,editor){ 
            data = new FormData(); 
            data.append("file",file); 
            $.ajax({ 
        data:data, 
        type:"POST", 
        url:"/muploadSummernoteImageFile", 
        /* dataType:"JSON", */ 
        enctype:'multipart/form-data',
        contentType:false, 
        processData:false
        
    }).done(function(data) {
    	console.log(data)
    	var imgNode = $("<img>");
    	imgNode.attr("src", data);
    	$(".note-editable").append(imgNode);
    }).fail(function(a,b,c){
    	console.log(a);
    	console.log(b);
    	console.log(c);
    });
        }
    });
</script>

<!-- 카카오맵 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee58f1de69883c91d0d43b37d1a713ff&libraries=services,clusterer,drawing"></script>
	<script>
    // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(${moqoo.moqooLat}, ${moqoo.moqooLng}), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    
 	// ■■■■■■■■■■■■■ 지도 위에 마커 생성하기 ■■■■■■■■■■■■■
    var imageSrc = "${category.cImgPath}", // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(${moqoo.moqooLat}, ${moqoo.moqooLng}); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
  </script>
  
  <script>
    // 버튼 클릭 시 팝업 창 열기
    document.getElementById("open-map-btn").onclick = function() {
      // 팝업 창을 열기 위한 윈도우.open 함수 사용
      window.open("popup_map", "Popup", "width=1200,height=800,resizable=no");
    };
  </script>

  <script>
    // 카테고리 열기
    function toggleCC() {
      const categoryContainer = document.querySelector(".category-container");
      categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
    }
  </script>

<script>
  // JavaScript 코드를 추가합니다.
  const radioButtons = document.querySelectorAll('.form-check-input');
  const imageLabels = document.querySelectorAll('.form-check-label');

  imageLabels.forEach((label, index) => {
    label.addEventListener('click', () => {
      radioButtons[index].checked = true;
    });
  });

  
  
  // 이전 날짜 선택 안되게
  $("#moqooForm").submit(function(e) {
      var now = new Date();
      var selectDate = new Date($("#date").val());
		let pmContent = $("#summernote");
		let regContent = pmContent.val().replace(/<[^>]*>/g, '');
      // 종료일이 시작일보다 과거이거나 같은 경우 유효성 체크 메시지 표시
      if (selectDate < now) {
			e.preventDefault();
          alert("과거의 날짜는 선택할 수 없습니다.");
      } else if (regContent === null || regContent.trim().length === 0) {
			e.preventDefault();
			alert("내용을 입력해주세요");
		} else {
			submit(); // submit 함수 호출 (변경된 코드에는 없지만 필요한 경우 추가하세요)
		}
  });

  
  
//   // 이미지 요소를 클릭하면 toggleDropdown 함수를 호출
//   var dotsImage = document.getElementById("report-dots");
//   dotsImage.addEventListener("click", toggleDropdown);
  
// //dropdown
//   function toggleDropdown() {
//     var dropdown = document.getElementById("dropdown");
//     if (dropdown.style.display === "block") {
//         dropdown.style.display = "none";
//     } else {
//         dropdown.style.display = "block";
//     }
//   }




//   // 댓글 수정 & 답글 버튼 누를 때 동작
//   var replyFormVisible = false; // 대댓글 폼 상태 변수
//   var modFormVisible = false; // 수정 폼 상태 변수

//   // 대댓글 폼 화면에 띄우기
//   function replyForm(obj){
//     var replyFormElement = obj.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
//     var modFormElement = obj.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
      
//     if (modFormVisible) {
//       modFormElement.style.display = "none";
//       modFormVisible = false;
//     }
    
//     if (replyFormVisible) {
//       replyFormElement.style.display = "none";
//       replyFormVisible = false;
//     } else {
//       replyFormElement.style.display = "block";
//       replyFormVisible = true;
//     }
//   }

//   // 댓글 수정 폼 띄우기
//   function modReply(obj){
//     var modFormElement = obj.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
//     var replyFormElement = obj.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
    
//     if (replyFormVisible) {
//       replyFormElement.style.display = "none";
//       replyFormVisible = false;
//     }
    
//     if (modFormVisible) {
//       modFormElement.style.display = "none";
//       modFormVisible = false;
//     } else {
//       modFormElement.style.display = "block";
//       modFormVisible = true;
//     }
//   }


  // 신고버튼 등장
  var rePortVisible = false;  // 신고 div 상태 변수

  function toggleReportDiv(obj) {
    var reportDiv = obj.nextElementSibling;

    if(rePortVisible) {
      reportDiv.style.display = "none";
      rePortVisible = false; 
    } else {
      reportDiv.style.display = "block";
      rePortVisible = true; 
    }
  }

  // 신고 모달
  var selectElement = document.getElementById("reportSelect");
  var textareaElement = document.getElementById("customReason");
  selectElement.addEventListener("change", function() {
    if (selectElement.value === "etc") {
      textareaElement.style.display = "block";
    } else {
      textareaElement.style.display = "none";
    }
  });



//■■■■■■■■■■■■■■■■■ 파일 버튼 변경 및 선택된 파일 이름 가져오기 ■■■■■■■■■■■■■■■■■
  // 파일 선택 이벤트 리스너 추가
  document.getElementById('thum').addEventListener('change', function () {
    // 선택된 파일 가져오기
    const selectedFile = this.files[0];

    // 파일 정보 표시
    if (selectedFile) {
        document.getElementById('fileInfo').innerHTML = `파일 이름 : ${selectedFile.name}`;
    } else {
        document.getElementById('fileInfo').innerHTML = '파일을 선택하지 않았습니다.';
    }
  });

</script>

<script>

//전역변수
var moqooNo = "${moqoo.moqooNo}";
var currentUserId = "${sessionScope.userId}"

	// 좋아요
	function like() {
		var moqooNo = ${moqoo.moqooNo };
		var likeCount = ${likeCount };
		if (currentUserId == "") {
	        if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
	            // 사용자가 확인을 누르면 로그인 페이지로 이동
	            window.location.href = "/user/login";
	            return; // 이동 후 함수를 종료
	        }
	    }else {
	    	$.ajax({
	    		url: "/moqoo/like",
	    		type: "get",
	    		data: {
	    			refPostNo : moqooNo
	    		},
	    		success: function(data) {
	    			if (data === "insert") {
	                    $("#likeButton i").removeClass("bi-heart").addClass("bi-heart-fill");
	                    updateLikeCount(1); // 좋아요 숫자를 1 증가
	                    alert("좋아요를 등록하였습니다.");
	                } else if (data === "delete") {
	                    $("#likeButton i").removeClass("bi-heart-fill").addClass("bi-heart");
	                    updateLikeCount(-1); // 좋아요 숫자를 1 감소
	                    alert("좋아요를 취소하였습니다.");
	                } else if (data === "fail") {
	                    alert("좋아요에 실패하였습니다.");
	                }
	    		}, error: function () {
		            alert("관리자에게 문의해주세요");
		        }
	    	});
	    }
	}
	
	function updateLikeCount(change) {
	    var likeCountElement = document.getElementById("like-count");
	    var currentLikeCount = parseInt(likeCountElement.textContent);
	    var newLikeCount = currentLikeCount + change;
	    likeCountElement.textContent = newLikeCount;
	}


// // 좋아요 이미지 변경
// 	function changeImage(){
// 		var image = document.getElementById('heart');
// 		if (image.src.includes("/resources/assets/img/heart(empty).png")) {
// 	        // 첫 번째 이미지를 클릭했을 때 두 번째 이미지로 변경
// 	        image.src = "../resources/assets/img/heart(full).png";
// 	    } else {
// 	        // 두 번째 이미지를 클릭했을 때 다시 첫 번째 이미지로 변경
// 	        image.src = "../resources/assets/img/heart(empty).png";
// 	    }
// 	}
	
// // 좋아요 클릭 정보 보내기
// 	$(document).ready(function(){
		
// 		$("#heart").on("click",function(){
// 			var refMoqooNo = "${moqoo.moqooNo }";
// 			var userId = "${sessionScope.userId }";
// 			$.ajax({
// 				url : "/moqoo/heart",
// 				data : {refPostNo : refMoqooNo, userId : userId, refBoardType : "M" },
// 				type : "POST",
// 				success : function(data){
// 					if(data == "true"){
// 						likeCount();
// 					}
// 					else if(data == "false"){
// 						alert("좋아요 실패");
// 					}
// 					else {
// 						alert("오류! 관리자에게 문의 바랍니다.");
// 					}
// // 					location.reload();  // 새로고침 해주는 애
					
// 				},
// 				error : function(){
// 					alert("관리자에게 문의 바랍니다.");
// 				}
// 			});
// 		});
// 	});

// 	function likeCount(){
// 			var refMoqooNo = "${moqoo.moqooNo }";
// 			$.ajax({
// 				url : "/moqoo/likeCount",
// 				data : {refPostNo : refMoqooNo},
// 				type : "POST",
// 				success : function(data){
// 					$(".heart-count").html("<b>"+ data + "</b>");
// 				},
// 				error : function(){
// 					alert("좋아요 카운팅 실패");
// 				}
// 			})
// 		}

// 참여신청자 정보 보내기
	$(document).ready(function(){
		var joinBtn = $("#participate-btn");
		joinBtn.on("click",function(){
			var refMoqooNo = "${moqoo.moqooNo }";
			var moqooWriter = "${moqoo.moqooWriter }";
			var userId = "${sessionScope.userId}";
			var attendStatus = "${moqoo.moqooUser.attendStatus}";
			if(userId != moqooWriter) {
				$.ajax({
					url : "/moqoo/post",
					data : {refMoqooNo : refMoqooNo, userId : userId, attendStatus : attendStatus },
					type : "POST",
					success : function(data){
						if(data == "true"){
							alert("참여신청이 완료되었습니다.");
						}
						else if(data == "false"){
							alert("참여신청이 완료되지 않았습니다.");
						}
						else if(data == "full") {
							alert("인원이 마감되었습니다.");	
						}else {
							alert("오류! 관리자에게 문의 바랍니다.");
						}
						location.reload();  // 새로고침 해주는 애
						
					},
					error : function(){
						alert("관리자에게 문의 바랍니다.");
					}
				});
			}else{
				alert("이미 참여신청 되었습니다.");
			}
		});
	});



	// 승인 버튼 클릭 이벤트 핸들러
	$('#ok').click(function() {
		console.log(this);
		var refMoqooNo = $(this).prev().val();
		var refUserId = $(this).prev().prev().val();
		var attendStatus = $(this).prev().prev().prev().val();
	    $.ajax({
	        type: 'POST',
	        url: '/moqoo/attendY', // 백엔드에서 승인 로직이 구현된 엔드포인트
	        data : {refMoqooNo : refMoqooNo, refUserId : refUserId, attendStatus : attendStatus },
	        success: function(response) {
	        	if(response == "true"){
					alert("승인 되었습니다.");
				}
				else if(response == "false"){
					alert("승인이 완료되지 않았습니다.");
				}
				else {
					alert("오류! 관리자에게 문의 바랍니다.");
				}
	        	location.reload();
// 	            alert(response); // 서버로부터의 응답 메시지를 표시
	        },
	        error: function(xhr, status, error) {
	            alert('에러가 발생했습니다: ' + error);
	        }
	    });
	});
    

	// 댓글 등록
	$("#submit-btn").on("click", function() {
		const cContent = $("#comtContent").val();
		const refMoqooNo = ${moqoo.moqooNo };
		const sessionUserId = "${sessionScope.userId }";
		
		$.ajax({
			url : "/comt/insert",
			data : {refMoqooNo : refMoqooNo, comtContent : cContent},
			type : "POST",
			success : function(result){
				if(result == "success"){
					alert("댓글 등록 성공!");
// 					location.reload();
					getComtList();  // 새로고침 안해도 되게 댓글 리스트 불러오는 메소드 호출
					$("#comtContent").val("");  // 댓글 창 초기화
				}
				else {
					alert("댓글 등록 실패");
				}
				location.reload();  // 새로고침 해주는 애
			},
			error : function(){
				
			}
		});
	});
	
	// 댓글 수정 폼
	const modifyView = (obj, comtContent, comtNo) => {
		  console.log("comtNo:", comtNo);
		    // 이미 수정 폼이 표시되고 있는지 확인
		    const existingForm = $(obj).closest('.comment').find('.modify-form');

		    if (existingForm.length > 0) {
		        // 폼이 이미 표시 중이면, 폼을 숨깁니다.
		        existingForm.remove();
		    } else {
		        // 폼이 표시 중이 아니면, 폼을 생성하고 추가합니다.
		        const formDiv = $('<div>').addClass('modify-form');
		        const inputField = $("<input>").attr("type", "text").attr("size", "50").attr("value", comtContent);
		        const saveButton = $("<button type='button'>").text("수정 완료").click(function() {
		            const newContent = inputField.val();
		            const refPostNo = "${moqoo.moqooNo}";
		            modifyComment(obj, refPostNo, comtNo, newContent);
		        });

		        formDiv.append(inputField, saveButton);
		        $(obj).closest('.comment').append(formDiv);
		    }
		};

	// 댓글 수정
	const modifyComment = (obj, refPostNo, comtNo, newContent) => {
	    const comment = {
	    	refPostNo: refPostNo,
	        comtNo: comtNo,
	        comtContent: newContent
	    };

	    $.ajax({
	        url: "/moqoo/updateComt",
	        data: {
	        	refPostNo: refPostNo,
		        comtNo: comtNo,
		        comtContent: newContent
	        },
	        type: "GET",
	        success: function (result) {
	            if (result === "success") {
	                alert("댓글 수정 완료");
	                getComtList();
	            } else {
	                alert("댓글 수정 실패");
	            }
	        },
	        error: function () {
	            alert("Ajax 오류~ 관리자에게 문의하삼");
	        }
	    });
	};
	
	
	// 댓글 삭제
	const removeComment = (obj, comtNo) => {
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				url : "/moqoo/delComt",
				data : {comtNo : comtNo},
				type : "GET",
				success : function(result) {
					if(result == "success") {
						alert("댓글 삭제 성공");
						getComtList();
					}else {
						alert("댓글 삭제 실패");
					}
				},
				error : function() {
					alert("Ajax 오류~ 관리자에게 문의하세요");
				}
			})
		}
	}
	
// 	// 댓글 리스트를 불러오는 ajax Function
// 	const getComtList = () => {
// 		const moqooNo = ${moqoo.moqooNo};
// 		const currentUserId = "${sessionScope.userId }";
		
// 		$.ajax({
// 			url : "/moqoo/listComt",
// 			data : { moqooNo : moqooNo },
// 			type : "GET",
// 			success : function(data) {
// 				/* console.log(result); */
// 				const commentContainer = $("#comment-container");
// 				commentContainer.children().remove(); // 기존 댓글을 비웁니다.
				
// 				if (data.length > 0) {
// 	                // 하나의 ul 요소를 추가합니다.
// 	                const commentList = $("<ul>").addClass("comment-list");
	                
// 	                for (let i in data) {
// 	                	const comment = data[i];
// 	                	const li = $("<li>").addClass("comment");
	                	
// 	                	// 댓글 작성자의 ID와 현재 로그인한 사용자의 ID를 비교하여 신고하기 링크를 표시할지 결정합니다.
// 	                    const isCurrentUser = comment.user.userId === currentUserId;
// 	                    const showReportLink = !isCurrentUser;
	                    
// 	                    const actionMenuBtn = $("<span>").attr("id", "action_menu_btn").html("<i class='bi bi-three-dots-vertical'></i>");
// 	                    const actionMenu = $("<div>").addClass("action_menu");
// 	                    const actionMenuList = $("<ul>");
// 	                    const profileMenuItem = $("<li>").html("<a href='#'><i class='bi bi-person-vcard'></i> 프로필 보기</a>");
// 	                    const reportMenuItem = $("<li>").html(`<a href='#' data-bs-toggle='modal' data-bs-target='.fade'><i class='bi bi-exclamation-triangle'></i> 신고하기</a>`);
// 	                    const action = $("<div>").addClass("action");
	                    
// 	                    if(isCurrentUser) {
// 	                    	// 현재 사용자가 댓글 작성자인 경우
// 	                        const modifyLink = $("<a>").attr("href", 'javascript:void(0)').html('<i class="bi bi-pencil"></i>').data("comtNo", comment.comtNo).data("comtContent", comment.comtContent); // 데이터 속성에 comtNo와 comtContent 추가;
// 	                        const removeLink = $("<a>").attr("href", 'javascript:void(0)').html('<i class="bi bi-x"></i>').data("comtNo", comment.comtNo);
	                        
// 	                        // 수정하기와 삭제하기 링크에 이벤트 핸들러 설정
// 	                        modifyLink.on("click", function() {
// 	                        	var comtNo = $(this).data("comtNo");
// 	                            var comtContent = $(this).data("comtContent");
// 	                            modifyView(this, comtContent, comtNo);
// 	                        });
	                        
	                        
// 	                        removeLink.on("click", function() {
// 	                        	var comtNo = $(this).data("comtNo");
// 	                            removeComment(this, comtNo);
// 	                        });
	                        
// 	                        action.append(modifyLink);
// 	                        action.append(removeLink);
// 	                    }
	                    
// 	                 	// 답글쓰기 링크
// 	                    const replyLink = $("<a>").attr("href", 'javascript:void(0)').data("pComtNo", comment.comtNo).text("답글쓰기");
// 	                    replyLink.on("click", function() {
// 	                    	var pComtNo = $(this).data("pComtNo");
// 	                    	showReplyForm(this, pComtNo);
// 	                    });
// 	                    action.append(replyLink);
	                    
// 	                    actionMenuList.append(profileMenuItem);
	                    
// 	                    if (showReportLink) {
// 	                        actionMenuList.append(reportMenuItem);
// 	                    }
	                    
// 	                    actionMenu.append(actionMenuList);
	                    
// 	                    const userInfo = $("<div>").addClass("user-info");
// 	                    const userImage = $("<img>").attr("src", comment.user.userPhotoPath).attr("alt", "UserPhoto");
// 	                    const username = $("<span>").addClass("username").text(comment.user.userNickname);
// 	                    const date = $("<span>").addClass("date").text(comment.comtDate);
// 	                    const commentText = $("<p>").addClass("comment-text").text(comment.comtContent);
	                    
// 	                    userInfo.append(userImage);
// 	                    userInfo.append(username);
// 	                    userInfo.append(date);
// 	                    userInfo.append(action);

// 	                    li.append(actionMenuBtn);
// 	                    li.append(actionMenu);
// 	                    li.append(userInfo);
// 	                    li.append(commentText);
	                    
// 	                	// comtNo를 input hidden 요소로 추가
// 	                    var comtNoInput = $("<input>").attr("type", "hidden").val(comment.comtNo);
// 	                    li.append(comtNoInput);
	                    
// 	                 	// li 요소를 commentList에 추가
// 	                    commentList.append(li);
// 	                }
	                
// 	             	// commentList를 commentContainer에 추가
// 	                commentContainer.append(commentList);
// 	            }
// 			},
// 	        error: function () {
// 	            alert("Ajax 오류!! 관리자에게 문의하십시오.");
// 	        }
// 		});
// 	}
	
	
	// 대댓글 폼, 대댓글 작성
	function showReplyForm(obj, pComtNo) {
		console.log(currentUserId);
	 	if (currentUserId == "") {
	        if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
	            // 사용자가 확인을 누르면 로그인 페이지로 이동
	            window.location.href = "/user/login";
	            return; // 이동 후 함수를 종료
	        }
	    }
	 	else {
			const targetComment = $(obj).closest('.comment'); // 'comment' 클래스를 가진 요소를 찾음
		    // 'comment-text' 클래스를 가진 요소를 찾아 그 뒤에 replyForm 추가
		    const replyForm = $("<div>").addClass("reply-form");
		    const replyTextarea = $("<textarea>").attr("placeholder", "답글을 작성하세요");
		    const replyButton = $("<button>").addClass("reply-btn").text("작성");
	
		    if($(".reply-form").length != 1){
			    replyForm.append(replyTextarea);
			    replyForm.append(replyButton);
			 // 'comment-text' 뒤에 추가
			    targetComment.find('.comment-text').after(replyForm);
			}else {
				$(".reply-form").remove();
			}
		    
		    replyButton.on("click", function() {
			    const comtContent = replyTextarea.val();
			    if (comtContent.trim() !== "") {
			    	$.ajax({
			    	    url: "/moqoo/insertReply",
			    	    type: "GET",
			    	    data: {
			    	    	refPostNo : moqooNo,
			    	        pComtNo: pComtNo,
			    	        comtContent: comtContent
			    	    },
			    	    success: function(data) {
			    	        if (data === "success") {
								alert("답글등록에 성공하였습니다.");
			    	            replyForm.remove(); // 답글 작성 폼 제거
			    	        	getComtList();
			    	        } else {
			    	            // 서버에서 success가 false인 경우, errorMessage를 표시
			    	            alert("서버에서 오류가 발생했습니다: " + data.errorMessage);
			    	        }
			    	    },
			    	    error: function(xhr, status, error) {
			    	        // AJAX 요청이 실패했을 때 실행되는 코드
			    	        alert("서버 오류로 인해 답글을 작성하지 못했습니다. 관리자에게 문의하세요.");
			    	        console.log("에러 상태:", status);
			    	        console.log("에러 내용:", error);
			    	    }
			    	});
			    }
		    });
		}
	 	
	 	var loading = false; // 중복 로드 방지용 플래그
		var currentOffset = 0; // 현재 offset 값
		
		// 초기 댓글을 로드하는 함수
		function loadInitialComments() {
			var moqooNo = "${moqoo.moqooNo}";
		    // 페이지 로딩 중 메시지를 표시
		    const loadingMessage = $("<div>").addClass("loading-message").text("로딩 중...");
		    const commentContainer = $("#comment-container");
		    
		    commentContainer.append(loadingMessage);

		    $.ajax({
		        url: "/moqoo/loadInitialComments", // 서버로 요청 보낼 URL
		        type: "get",
		        data: {
		        	moqooNo : moqooNo
		        },
		        success: function (data) {
		            // 로딩 메시지를 제거
		            loadingMessage.remove();

		            const commentContainer = $("#comment-container");

		            if (data.length > 0) {
		                const commentList = $("<ul>").addClass("comment-list");

		                data.forEach(comment => {
		                    const commentItem = createCommentItem(comment);
		                    commentList.append(commentItem);
		                });

		                commentContainer.append(commentList);

		                // 현재 offset 값을 업데이트
		                currentOffset += 10;
		            }
		        },
		        error: function () {
		            // 서버 통신 오류 시 오류 메시지를 표시
		            const errorContainer = $("#error-container");
		            errorContainer.text("댓글을 불러오는 중 오류가 발생했습니다.");

		            // 로딩 메시지를 제거
		            loadingMessage.remove();
		        }
		    });
		}
		
		// 페이지가 로드될 때 초기 댓글을 로드
		$(document).ready(function () {
		    loadInitialComments();
		});
		
		
		
		function createLink(iconClass, text, clickHandler) {
		    const link = $("<a>").attr("href", 'javascript:void(0)').html(`<i class='${iconClass}'></i> ${text}`);
		    if (clickHandler) {
		        link.on("click", clickHandler);
		    }
		    return link;
		}

		function createImage(src, alt) {
		    return $("<img>").attr("src", src).attr("alt", alt);
		}

		function createSpan(className, text) {
		    return $("<span>").addClass(className).text(text);
		}

		function createParagraph(className, text) {
		    return $("<p>").addClass(className).text(text);
		}

		function createIcon(iconClass) {
		    return $("<i>").addClass(iconClass);
		}

		function createHiddenInput(value) {
		    return $("<input>").attr("type", "hidden").val(value);
		}
		
		function createCommentItem(comment, currentUserId) {
		    const isCurrentUser = comment.user.userId === currentUserId;
		    const showReportLink = !isCurrentUser;

		    const commentItem = $("<li>").addClass("comment");

		    const actionMenuBtn = $("<span>").attr("id", "action_menu_btn").html("<i class='bi bi-three-dots-vertical'></i>");
		    const actionMenu = $("<div>").addClass("action_menu");
		    const actionMenuList = $("<ul>");
		    const profileMenuItem = $("<li>").html("<a href='#'><i class='bi bi-person-vcard'></i> 프로필 보기</a>");
		    
		    const reportMenuItem = showReportLink ? $("<li>").html(`<a href='#' data-bs-toggle='modal' data-bs-target='#reportModal'><i class='bi bi-exclamation-triangle'></i> 신고하기</a`) : null;
		    const action = $("<div>").addClass("action");

		    if (isCurrentUser) {
		        const modifyLink = createLink("bi bi-pencil", "수정하기", () => modifyView(comment));
		        const removeLink = createLink("bi bi-x", "삭제하기", () => removeComment(comment));

		        action.append(modifyLink);
		        action.append(removeLink);
		    }

		    if (comment.pComtNo === 0) {
		        const replyLink = createLink("bi bi-chat-right-text", "답글쓰기", () => showReplyForm(comment));
		        action.append(replyLink);
		    }

		    actionMenuList.append(profileMenuItem);
		    if (reportMenuItem) {
		        actionMenuList.append(reportMenuItem);
		    }

		    actionMenu.append(actionMenuList);

		    const userInfo = $("<div>").addClass("user-info");
		    const userImage = createImage(comment.user.userPhotoPath, "UserPhoto");
		    const username = createSpan("username", comment.user.userNickname);
		    const date = createSpan("date", comment.comtDate);
		    const commentText = createParagraph("comment-text", comment.comtContent);

		    userInfo.append(userImage);
		    userInfo.append(username);
		    userInfo.append(date);
		    userInfo.append(action);

		    commentItem.append(actionMenuBtn);
		    commentItem.append(actionMenu);
		    commentItem.append(userInfo);
		    commentItem.append(commentText);
		    commentItem.append(createHiddenInput(comment.comtNo));

		    if (comment.pComtNo !== 0) {
		        commentItem.addClass("has-parent-comment");
		        const replyIcon = createIcon("bi bi-arrow-return-right");
		        userInfo.prepend(replyIcon);
		    }

		    return commentItem;
		}
	
// 	// 답글을 목록에 추가하는 함수
// 	function addReplyToList(newReply) {
// 	    // 여기에서 새 답글을 생성하고 목록에 추가하는 로직을 작성
// 	    const newReplyItem = $("<li>").addClass("comment");
// 	    newReplyItem.data("comtNo", newReply.comtNo); // 답글의 번호를 저장

// 	    // 댓글 작성자 정보, 날짜, 텍스트 등을 newReplyItem에 추가
// 	    const userImage = $("<img>").attr("src", newReply.user.userPhotoPath).attr("alt", "UserPhoto");
// 	    const username = $("<span>").addClass("username").text(newReply.user.userNickname);
// 	    const date = $("<span>").addClass("date").text(newReply.comtDate);
// 	    const commentText = $("<p>").addClass("comment-text").text(newReply.comtContent);

// 	    newReplyItem.append(userImage);
// 	    newReplyItem.append(username);
// 	    newReplyItem.append(date);
// 	    newReplyItem.append(commentText);

// 	    // 목록에 새 답글을 추가
// 	    const commentContainer = $("#comment-container");
// 	    const commentList = commentContainer.find(".comment-list");
// 	    commentList.append(newReplyItem);
// 	}
	
// 	function addLike() {
// 		if(${sessionScope.userId eq null}){
// 			  alert("로그인이 필요한 서비스입니다.");
// 		  }
		  
// 		let refPostNo = '${moqoo.moqooNo}';
// 		let lUserId = '${sessionScope.userNo}';

// 		$.ajax({
// 			url : "/moqoo/like",
// 			type : "POST",
// 			data : {
// 				refPostNo : refPostNo,
// 				lUserId : lUserId
// 			},
// 			success : function(result) {
// 				if (result === "success") {
// 					$("#like").load(location.href + " #like");
// 				} else if(result === "fail"){
// 					alert("좋아요 추가 실패!");
// 				}
// 			}
			
// 		});
// 	}
			
	
	

	
// 	// 답글 등록
// 	const reComtInsert = (comtNoId) => {
		
	
// // 	$("#re-comt-submit-btn").on("click", function() {
// 		const reContent = $("#reComtContent").val();
// 		const moqooNo = ${moqoo.moqooNo };
// 		const pComtNo = $("#comtNo" + comtNoId).val();
// 		console.log(pComtNo);
// 		$.ajax({
// 			url : "/comt/reComtInsert",
// 			data : {refMoqooNo : moqooNo, comtContent : reContent, pComtNo : pComtNo},
// 			type : "POST",
// 			success : function(result){
// 				if(result == "success"){
// 					alert("댓글 등록 성공!");
// // 					location.reload();
// 					getComtList();  // 새로고침 안해도 되게 댓글 리스트 불러오는 메소드 호출
// 					$("#reComtContent").val("");  // 댓글 창 초기화
// 				}
// 				else {
// 					alert("댓글 등록 실패");
// 				}
// 				location.reload();  // 새로고침 해주는 애
// 			},
// 			error : function(){
				
// 			}
// 		});
// 	};
</script>
</body>

</html>