<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

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

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/post_jiqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">
  
   <!-- 서머노트를 위해 추가해야할 부분 -->
  <!-- <script src="../resources/assets/vendor/summernote/summernote-lite.js"></script>
  <script src="../resources/assets/vendor/summernote/summernote-ko-KR.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="../resources/assets/vendor/summernote/summernote-lite.css"> -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
      <!-- ======= Search Section ======= -->
      <div class="search-container">
        <form action="" method="" class="search-form">
            <input type="text" placeholder="search"/>
            <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
        </form>
      </div>



      <div id="container" data-aos=fade-in> 

      
      <!-- ======= Post ======= -->
          <div id="post" class="col-md-12 col-xxl-10 mx-auto">
          <div class="post-header">
	          <c:if test="${sessionScope.userId ne jiqoo.user.userId }">
	            <img class="dots" src="../assets/img/dots.png" alt="" onclick="toggleReportDiv()">
	            <div id="report-div" style="display: none;">
	                <div id="report-text" onclick="reportUser()">신고하기</div>
	                <i class="bi bi-exclamation-circle"></i>
	            </div>
	          </c:if>
				<div style="text-align: center;">
				    <div  id="post-category-img-container">
				        <img id="post-category-img" alt="" src="${category.cImgPath}">
				    </div>
				    <div class="location col-xs-12 col-sm-8 col-md-6"><span id="location-text">${jiqoo.jiqooW3W}</span></div>
				</div>
	            <div id="title">${jiqoo.jiqooTitle }</div>
	            <div id="writer-info">
	              <div id="profile-img" class="col-sm-12">
	                <img src="${jiqoo.user.userPhotoPath }" alt="프로필 이미지" class="profile-image">
	            </div>
	            <div class="col-md-10">
	                <div class="author">${jiqoo.user.userNickname }</div>
	                <div class="row">
	                  <div class="info post-date col-lg-6 col-md-12"><fmt:formatDate pattern="yy/MM/dd HH:mm" value="${jiqoo.jCreateDate }"/> </div>
	                  <div class="info view-count col-lg-3 col-md-12">${jiqoo.jViewCount }</div>
	                </div>
	            </div>
	            </div>
          </div>
          <hr>
            <div id="content">${jiqoo.jiqooContent }</div>
            <div class="post-footer">
              <div class="heart-container">
                <img class="heart" src="../resources/assets/img/heart(full).png" alt="">
                <span class="heart-count">${likeCount }</span>
              </div>
              <c:if test="${not empty sessionScope.userId && sessionScope.userId eq jiqoo.user.userId}">
	              <div class="button-container">
	                  <button class="btn postbtn" id="modify-btn" data-bs-toggle="modal" data-bs-target=".modal">수정</button>
	                  <button class="btn postbtn" id="delete-btn" onclick="deleteJiqoo()">삭제</button>
	              </div>
              </c:if>
            </div>
        </div>
        <!-- ======= Modal ======= -->
        <div class="modal" tabindex="-1" id="insert-modal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content"
					style="background-color: #6DBE45; color: #fff;">
					<div class="modal-header">
						<h5 class="modal-title">게시물 입력</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 게시물 입력 폼 -->
						<form action="/jiqoo/insert" method="POST">
							<div class="mb-3 col-lg-5 mx-auto location-container">
								<input type="text" class="form-control" id="location"
									name="jiqooW3W" value="${jiqoo.jiqooW3W }" readonly>
								<button id="open-map-btn">+</button>
							</div>
							<div class="mb-3 row date-tag-container">
								<div class="date-container col-md-3">
									<input type="date" class="form-control" id="date" name="jiqooDate" value="${jiqoo.jiqooDate }" required>
								</div>
								<div class="col-md-2 c-btn">
									<span>카테고리</span> <i class="bi bi-caret-down-fill"
										onclick="toggleCC()"></i>
								</div>
								<div class="category-container" style="display: none;">
									<div class="category-list">
										<c:forEach var="categoryList" items="${categoryList }">
											<div class="form-check category"> 
												<input class="form-check-input" type="radio" name="jiqooCtgr"
													 <c:if test="${jiqoo.jiqooCtgr eq categoryList.cName }">checked</c:if> required> <label
													class="form-check-label" for="${categoryList.cName }"> <img
													class="tag-img" src="${categoryList.cImgPath }"
													alt="${categoryList.cName }">
												</label>
											</div>
										</c:forEach>
									</div>
<!-- 									<div class="form-check"> -->
<!-- 										<input class="form-check-input" type="radio" name="category" -->
<!-- 											id="category1" value="option1" required> <label -->
<!-- 											class="form-check-label" for="category1"> <img -->
<!-- 											class="tag-img" src="../resources/assets/img/rice.png" -->
<!-- 											alt="밥"> -->
<!-- 										</label> -->
<!-- 									</div> -->
								</div>
							</div>
							<input type="hidden" id="lat" name="jiqooLat" value="${jiqoo.jiqooLat }">
							<input type="hidden" id="lng" name="jiqooLng" value="${jiqoo.jiqooLng }">
							<input type="hidden" id="jiqoo-writer" name="jiqooWriter" value="${sessionScope.userId }">
							<div class="mb-3">
								<input type="text" class="form-control" id="modify-title" name="jiqooTitle" placeholder="제목" value="${jiqoo.jiqooTitle }" required>
							</div>
					           <div class="mb-3">
				                <textarea id="summernote" name="jiqooContent" value="${jiqoo.jiqooContent }" required></textarea>
				              </div>
							 <div class="mb-3 form-switch">
				                <input type="checkbox" class="form-check-input" id="private" name="jOpenStatus" <c:if test="${jiqoo.jOpenStatus eq 'Y' }">checked</c:if>>
				                <label class="form-check-label" for="private">비공개</label>
				              </div>
				              <div class="mb-3 form-switch">
				                <input type="checkbox" class="form-check-input" id="allowComments" name="jAllowComt" <c:if test="${jiqoo.jAllowComt eq 'Y' }">checked</c:if>>
				                <label class="form-check-label" for="allowComments">댓글 허용</label>
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
        <!-- <div class="col-md-12 col-xxl-10 mx-auto">
            <span>댓글</span>
        </div>
        <div class="comments col-md-12 col-xxl-10 mx-auto">
          <div class="comment-header">
            <div class="comment-profile">
              <img src="" alt="">
            </div>
            <div class="comment-info">

            </div>
          </div> -->
        <div class="comment-section col-md-12 col-xxl-10 mx-auto">
          <span>댓글</span>
          <ul class="comment-list">
              <li class="comment">
                  <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                  <div class="user-info">
                      <img src="../resources/assets/img/준표프사.png" alt="User 1">
                      <span class="username">준표</span>
                      <span class="date">2023-10-07</span>
                  </div>
                  <p class="comment-text">첫번째 댓글임~~~~~~~~~~~~~~~~~~~~</p>
              </li>
              <li class="comment">
                  <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                  <div class="user-info">
                      <img src="../resources/assets/img/준표프사.png" alt="User 2">
                      <span class="username">준표</span>
                      <span class="author-type">작성자</span>
                      <span class="date">2023-10-06</span>
                  </div>
                  <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
              </li>
              <li class="comment reply-comment">
                <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                <div class="user-info">
                    <img src="../resources/assets/img/준표프사.png" alt="User 2">
                    <span class="username">지후</span>
                    <span class="date">2023-10-06</span>
                </div>
                <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
            </li>
              <li class="comment">
                <img class="mini-dots" src="../resources/assets/img/dots.png" alt="">
                <div class="user-info">
                    <img src="../resources/assets/img/준표프사.png" alt="User 2">
                    <span class="username">지후</span>
                    <span class="date">2023-10-06</span>
                </div>
                <p class="comment-text">나눈 두번째 댓글~~~~~~~~~~~~</p>
            </li>
          </ul>
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
            <div class="comment-form col-md-12 col-xxl-10 mx-auto">
			  <textarea id="comtContent" placeholder="댓글을 입력하세요"></textarea>
			  <button class="btn postbtn" id="c-submit" onclick="insertComment()">등록</button>
			</div>
          </div>
        </div>
<!--               <button class="btn postbtn" id="submit-btn">등록</button> -->
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
  
  <!-- 썸머노트 -->
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
                       uploadSummernoteImageFile(files[0],this); 
                   } 
                } 
        });
        function uploadSummernoteImageFile(file,editor){ 
            data = new FormData(); 
            data.append("file",file); 
            $.ajax({ 
        data:data, 
        type:"POST", 
        url:"/uploadSummernoteImageFile", 
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
  
  <script>
    function toggleReportDiv() {
        const reportDiv = document.getElementById("report-div");
        reportDiv.style.display = reportDiv.style.display === "none" ? "block" : "none";
    }
    function deleteJiqoo() {
    	if(confirm("정말 삭제하시겠습니까?")){
    		location.href= "/jiqoo/delete?jiqooNo=${jiqoo.jiqooNo}";
    	}
    }
     
  </script>
  
  
	<script>
  function toggleCC() {
    const categoryContainer = document.querySelector(".category-container");
    categoryContainer.style.display = categoryContainer.style.display === "none" ? "block" : "none";
  }
  
  // 댓글 등록
  $("#cSubmit").on("click", function() {
		const comtContent = $("#comtContent").val();
		const refPostNo = ${jiqoo.jiqoono};
// 		const tableBody = $("#replyTable tbody");
		$.ajax({
			url : "/jiqoo/insertComt",
			data : {comtContent : comtContent, refPostNo : refPostNo}, // modelattribute 썼으므로 키값을 vo랑 맞춰줘야함
			type : "POST",
			success : function(result) {
				if(result == "success") {
					alert("댓글 등록 성공!!");
					getReplyList(); // 새로고침 안해도 되게 댓글 리스트 불러오는 메소드 호출
					$("#comtContent").val(""); // 댓글창 초기화
				}else {
					alert("댓글 등록 실패!!");
				}
			},
			error : function() {}
		});
	});
  
  // 댓글 삭제
  const removeReply = (comtNo) => {
		$.ajax({
			url : "/jiqoo/delComt",
			data : {comtNo : comtNo},
			type : "GET",
			success : function(result) {
				if(result == "success") {
					alert("댓글 삭제 성공");
					getReplyList();
				}else {
					alert("댓글 삭제 실패");
				}
			},
			error : function() {
				alert("Ajax 오류~ 관리자에게 문의하삼");
			}
		})
	}
  </script>

</script>
</body>

</html>