<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <title>지꾸 : 회원정보 수정</title>
        
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
        <link href="../resources/assets/css/style.css" rel="stylesheet">
        <link href="../resources/assets/css/header.css" rel="stylesheet">
        <link href="../resources/assets/css/footer.css" rel="stylesheet">

        <!-- register css-->
        <link href="../resources/assets/css/register.css" rel="stylesheet">
    </head>


    <body class="text-center">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include> 
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
        <main>
            <div class="container">
                <div class="input-form mx-auto">
                    <form>
                        <h1 style="margin-bottom: 30px;">회원정보수정</h1>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPw">비밀번호</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="password" class="form-control" id="userPw" name="userPw" placeholder="영문, 숫자 조합 6~20자 입력" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPwChek">비밀번호확인</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="password" class="form-control" id="userPwChek" name="userPwChek" placeholder="비밀번호 재입력" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userNickname">닉네임</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname }" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn">수정하기</button>
                            </div>    
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userEmail">메일주소</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="email" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail }" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn">메일인증</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3">
                                <label for="userEmailChek"></label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userEmailChek" name="userEmailChek" placeholder="인증번호를 입력해주세요" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn">인증확인</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPhoto">프로필사진</label>
                            </div>
                           	<c:if test="${user.userPhotoRename eq null }">
                            	<div class="col-8 col-sm-7">
	                            	<p>등록된 사진이 없습니다.</p>
	                                <input type="file" class="form-control form-control-sm" id="userPhoto" name="userPhoto">
                            	</div>
                            </c:if>
                            <c:if test="${user.userPhotoRename ne null }">
	                            <div class="col-8 col-sm-7">
	                            	<div style="margin-bottom:20px;">
	                            		<p>현재 프로필 사진</p>
	                            		<img src="../resources/puploadFiles/${user.userPhotoRename }" class="viewPhoto" style="width:300px;">
	                            	</div>
	                            </div>
	                            <div class="col-4 col-sm-2">
	                                <button type="button" id="changePhotoBtn" class="btn btn-sm regBtn" data-bs-toggle="modal" data-bs-target="#changePhotoModal">변경하기</button>
	                            </div>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userInfo">자기소개</label>
                            </div>
                            <div class="col-8 col-sm-7">
                       			<c:if test="${user.userInfo eq null }">
                                	<textarea class="form-control" rows="3" id="userInfo" name="userInfo" placeholder="자기소개를 입력해주세요"></textarea>
                       			</c:if>
	                        	<c:if test="${user.userInfo ne null }">
	                                <textarea class="form-control" rows="3" id="userInfo" name="userInfo" >${user.userInfo }</textarea>
	                        	</c:if>
                            </div>
                        </div>
                        <button class="btn btn-block subBtn" type="submit">수정완료</button>
                        <button class="btn btn-block subBtn" onclick="history.back();" type="button">뒤로가기</button>
                        <button type="button" id="delUserBtn" class="btn btn-block" data-bs-toggle="modal" data-bs-target="#delUserModal">
                            회원탈퇴
                        </button>
	                </form>
                    </div>
                </div>
                <!-- 회원탈퇴 Modal -->
                <div class="modal fade" id="delUserModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 20px;">
                            <h1 style="font-family: Black Han Sans; color:Black; padding-left: 10px;">회원탈퇴</h1>
                                <form action="" method="post">
                                    <div class="form-floating" style="margin-top: 30px;">
                                        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
                                        <label for="userId">아이디</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
                                        <label for="userPw">비밀번호</label>
                                    </div>
                                    <div class="form-floating" style="margin-bottom: 20px;">
                                        <input type="password" class="form-control" id="userPwChek" name="userPwChek" placeholder="비밀번호확인">
                                        <label for="userPwChek">비밀번호확인</label>
                                    </div>
                                </form>
                        </div>
                        <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;">
                            <button type="button" class="btn subBtn">탈퇴완료</button>
                            <button type="button" class="btn subBtn" data-bs-dismiss="modal">탈퇴취소</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 사진변경 Modal -->
            <div class="modal fade" id="changePhotoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                	<div class="modal-header">
				    	<h5 class="modal-title">프로필 사진 변경</h5>
				    	<button type="button" class="btn-close photo-reset" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
                    <div class="modal-body" style="margin-top: 20px;">
			            <input type="file" class="form-control form-control-sm" id="uploadFile" name="uploadFile" accept="image/gif, image/png, image/jpeg" style="float:left;">
                    </div>
                    <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;">
                        <button type="button" class="btn btn-sm regBtn" id="photoChange" >변경</button>
                        <button type="button" class="btn btn-sm regBtn" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
                </div>
            </div>
        </main>
        
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

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
        	$(function(){
            	//처음 이미지 가져오기
	            let photoPath = $('.profile-photo').attr('src');
	            let myPhoto; //회원이 업로드할 이미지 담을 변수
	            $('#uploadFile').change(function(){
	            	myPhoto = this.files[0];
	                if(!myPhoto){
	                    $('.profile-photo').attr('src', photoPath);
	                    return
	                }

	                //이미지 미리보기 처리
	                let reader = new FileReader();
	                reader.readAsDataURL(myPhoto);
	
	                reader.onload = function(){
	                    $('.profile-photo').attr('src', reader.result);
	                };
            });
            
            // textarea 체크
			$('#userInfo').on('input', function() {
   			    let content = $(this).val();

   			    // <br> 대신 \n 사용
   			    content = content.replace(/<br>/g, '\n');

   			    // 글자수 세기
   			    if (content.length == 0 || content == '') {
   			        $('.textCount').text('0자');
   			    } else {
   			        $('.textCount').text(content.length + '자');
   			    }

   			    // 글자수 제한
   			    if (content.length > 150) {
   			        $(this).val(content.substring(0, 150));
   			        alert('글자수는 150자까지 입력 가능합니다.');
   			    }
   			});
        </script>
    </body>
</html>
