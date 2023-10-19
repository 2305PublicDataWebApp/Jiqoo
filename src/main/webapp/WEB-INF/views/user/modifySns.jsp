<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <!-- 제이쿼리 -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
                   <form id="updateForm" action="/user/update" method="POST" enctype="multipart/form-data">
                   		<input type="hidden" id="sessionNickname" value="${sessionScope.userNickname}">
                   		<input type="hidden" id="sessionEmail" value="${sessionScope.userEmail}">
		                <input type="hidden" id="hiddenPw" name="userPw" value="${user.userPw }">
                   		<input type="hidden" id="userEmail" value="${user.userEmail }">
                   		<input type="hidden" name="userPhotoName" value="${user.userPhotoName }">
						<input type="hidden" name="userPhotoRename" value="${user.userPhotoRename }">
						<input type="hidden" name="userPhotoPath" value="${user.userPhotoPath }">
						<h1 style="margin-bottom: 60px;">회원정보수정</h1>
						<c:if test="${fn:length(user.userName) < 2}">
							<div class="row">
	                            <div class="col-12 col-sm-3" style="text-align: left;">
	                                <label for="userName">이름</label>
	                            </div>
	                            <div class="col-8 col-sm-7">
	                                <input type="text" class="form-control" id="userName" name="userName" oninput="nameCheck()" value="${user.userName }" placeholder="이름을 입력해주세요">
	                            </div>
	                            <div>
	                            	<p class="checkMessage" id="nameMsg">* 이름은 2글자 이상이어야 합니다. 1회만 변경 가능</p>
	                            </div>
	                        </div>
                        </c:if>
                        <div class="row">
	                        <div class="col-12 col-sm-3" style="text-align: left;">
	                            <label for="userNickname">닉네임</label>
	                        </div>
	                        <div class="col-8 col-sm-7">
	                            <input type="text" class="form-control" id="userNickname" name="userNickname" oninput="nickCheck()" value="${user.userNickname }" >
	                        </div>
	                        <div class="col-4 col-sm-2">
	                            <button class="btn btn-sm regBtn" id="nicknameCheck" type="button" onclick="nickDuplicate()" disabled>중복체크</button>
	                        </div>
	                        <div>
	                        	<p class="checkMessage" id="nicknameMsg"></p>
	                        </div>                               
                        </div>
                        <c:if test="${user.platformType ne 'normal'}">
                        	<div class="row">
		                        <div class="col-12 col-sm-3" style="text-align: left;">
		                            <label for="userEmail">${user.platformType} 로그인</label>
		                        </div>
		                        <div class="col-8 col-sm-7 text-start">
			                        <p id="userEmail" name="userEmail">${user.userEmail }</p>
		                        </div>                           
	                        </div>
                        </c:if>
						<c:if test="${user.userGender eq null}">                      
                        <div class="row">
	                        <div class="col-12 col-sm-3" style="text-align: left;">
	                            <label for="genderM">성별</label>
	                        </div>
	                        <div class="col-12 col-sm-6 text-left">
	                            <label class="radio-label" style="float: left;">
	                                <input type="radio" id="genderM" name="userGender" value="M" style="margin-right: 10px;">남자
	                            </label>
	                            <label class="radio-label">
	                                <input type="radio" id="genderF" name="userGender" value="F" style="margin-right: 10px;">여자
	                            </label>
	                        </div>
	                        <div>
	                        	<p class="checkMessage" id="genderCheckMsg">* 한번 설정한 성별은 변경되지 않습니다.</p>
	                        </div>  
                        </div>
                        </c:if>
                        <c:if test="${user.userBirth eq null}">  
                        <div class="row">
	                        <div class="col-12 col-sm-3" style="text-align: left;">
	                            <label for="userBirth">생년월일</label>
	                        </div>
	                        <div class="col-12 col-sm-6 text-left">
	                            <label class="radio-label" style="float: left;">
	                                <input type="date" id="userBirth" name="userBirth">
	                            </label>
	                        </div>
	                        <div>
	                        	<p class="checkMessage" id="genderCheckMsg">* 한번 설정한 생년월일은 변경되지 않습니다.</p>
	                        </div>  
                        </div>
                        </c:if>
                        <div class="row">
	                        <div class="col-12 col-sm-3" style="text-align: left;">
	                            <label for="userTel">전화번호</label>
	                        </div>
	                        <div class="col-8 col-sm-7">
	                        	<c:if test="${user.userTel eq null }">
	                            	<input type="text" class="form-control" id="userTel" name="userTel" oninput="oninputPhone(this)" maxlength="14" placeholder="숫자만 입력할 수 있습니다">
	                            </c:if>
	                            <c:if test="${user.userTel ne null }">
	                            	<input type="text" class="form-control" id="userTel" name="userTel" value="${user.userTel}" oninput="oninputPhone(this)" maxlength="14" >
	                            </c:if>
	                        </div>
                        </div>                        
                        <div class="row">
	                        <div class="col-12 col-sm-3" style="text-align: left;">
	                            <label for="userPhoto">프로필사진</label>
	                        </div>
	                       	<c:if test="${user.userPhotoRename eq null }">
	                        	<div class="col-8 col-sm-7 text-start">
		                         	<p>등록된 프로필 사진이 없습니다.</p>
		                         	<input type="file" class="form-control form-control-sm" id="userPhoto" name="uploadFile" onclick="photoAlert()" accept="image/gif, image/jpeg, image/png">
	                        	</div>
	                        </c:if>
	                        <c:if test="${user.userPhotoRename ne null }">
	                         <div class="col-8 col-sm-7 text-start">
	                         	<div style="margin-bottom:20px;">
	                         		<img src="${user.userPhotoPath }" class="viewPhoto" style="width:300px;">
	                         	</div>
	                         </div>
	                         <div class="col-4 col-sm-2">
	                             <button type="button" id="changePhotoBtn" class="btn btn-sm regBtn" data-bs-toggle="modal" data-bs-target="#changePhotoModal">변경하기</button>
	                         </div>
	                        </c:if>
	                        <div>
                            	<p class="checkMessage" id="photoMsg"></p>
                            </div>
                        </div>
                        <div class="row">
	                        <div class="col-12 col-sm-3" style="text-align: left;">
	                            <label for="userInfo">자기소개</label>
	                        </div>
	                        <div class="col-8 col-sm-7">
                            	<textarea class="form-control" id="userInfo" name="userInfo" rows="3" cols="20" wrap="hard" maxlength="150" placeholder="자기소개를 입력해주세요. 150자 제한">${user.userInfo }</textarea>
	                        </div>
                       </div>
                       <button class="btn btn-block subBtn" id="submitBtn">수정완료</button>
                       <button class="btn btn-block subBtn" onclick="history.back();" type="button">뒤로가기</button>
                       <c:if test="${user.platformType eq 'kakao'}">
	                       <button type="button" id="delKakaoUserBtn" class="btn btn-block del-User-Btn">
	                           회원탈퇴
	                       </button>
                       </c:if>
	                </form>
                    </div>
                </div>

	            <!-- 비밀번호변경 Modal -->
	            <div class="modal fade" id="changePwModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                <div class="modal-dialog">
	                <div class="modal-content">
	                    <div class="modal-body" style="margin-top: 30px;">
	                        <h1 style="font-family: Black Han Sans; color:Black; padding-left: 10px;">비밀번호 변경</h1>
	                        <div class="form-floating" style="margin-top: 30px;">
	                            <input type="password" class="form-control" id="changeInputPw" name="userPw" oninput="pwCheck()" placeholder="변경비밀번호">
	                            <label for="changeInputPw">변경비밀번호</label>
	                        </div>
                            <div class="form-floating">
	                        	<p class="checkMessage" id="modalPwMsg"></p>
	                        </div>
	                        <div class="form-floating" style="margin-top: 40px;">
	                            <input type="password" class="form-control" id="changePwCheck" oninput="pwReCheck()" placeholder="비밀번호재입력">
	                            <label for="changePwCheck">비밀번호재입력</label>
	                        </div>
	                        <div class="form-floating">
	                        	<p class="checkMessage" id="modalPwCheckMsg"></p>
	                        </div>
	                    </div>
	                    <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;">
	                        <button type="button" class="btn subBtn" id="changedPwSubBtn">비밀번호변경</button>
	                        <button type="button" class="btn subBtn" data-bs-dismiss="modal">닫기</button>
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
                    	<%-- <img src="${pageContext.request.contextPath}/user/photoView" class="profilePhoto"> --%>
			            <input type="file" class="form-control form-control-sm" id="modalUploadFile" name="uploadFile" accept="image/gif, image/png, image/jpeg" style="float:left;">
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
     		// 정규식
        	const pwRegExp = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,20}$/;
        	const nicknameRegExp = /^(?!^\d+$)[a-zA-Z0-9가-힣]{2,10}$/;
        	const nameRegExp = /^[가-힣]{2,4}$/;
        	
			const sessionId = $("#sessionId").val();
			const sessionNickname = $("#sessionNickname").val();
			const validateEmail = $("#validateEmail").val();
			
			// 이름 체크메시지
			function showNameMsg(message, color) {
			    $("#nameMsg").html(message).css('color', color);
			}
			
   			// 사진 알림창
   			function photoAlert(){
   				alert("본인 사진을 업로드하시면 모임 참가 확률이 올라갑니다!")
       			showPhotoMsg("* 본인 사진을 업로드하시면 모임 참가 확률이 올라갑니다!", "rgb(139, 195, 74)");
   			}
   			
			// 사진업로드 체크메시지
			function showPhotoMsg(message, color) {
			    $("#photoMsg").html(message).css('color', color);
			}
			
			// 비밀번호 체크 메시지
			function showPwMsg(message, color) {
			    $("#modalPwMsg").html(message).css('color', color);
			}
			
			// 비밀번호 재입력 체크메시지
			function showPwCheckMsg(message, color) {
			    $("#modalPwCheckMsg").html(message).css('color', color);
			}
			
			// 닉네임 체크메시지
			function showNickMsg(message, color) {
			    $("#nicknameMsg").html(message).css('color', color);
			    if (color === "rgb(139, 195, 74)") {
			        isNicknameChecked = true;
			    } else {
			        isNicknameChecked = false;
			    }
			}
			
			// 이름 유효성체크
			function nameCheck() {
			    let userName = $("#userName").val();
			    if (!nameRegExp.test(userName)) {
			    	showNameMsg("* 올바른 이름을 입력해주세요.", "red");
				} else {
					showNameMsg("* 이름 입력 완료", "rgb(139, 195, 74)");
				}
			}
			
			// 사진변경
			$("#photoChange").on("click", function(){
			    let uploadFile = $("#modalUploadFile")[0].files[0];
			
			    if (uploadFile) {
			        let formData = new FormData();
			        formData.append("uploadFile", uploadFile);
			
			        $.ajax({
			            url: "/user/updatePhoto",
			            type: "POST",
			            data: formData,
			            processData: false,
			            contentType: false,
			            success: function(response) {
			                if (response.success === "success") {
			                    alert("프로필 사진 변경 성공");
			                    $(".modal").modal("hide");
			                    location.reload();
			                } else if (response.checkLogin === "checkLogin") {
			                    alert("로그인 후 이용바랍니다.");
			                    window.location.href = "/user/login";   
			                } else {
			                    alert("프로필 사진이 변경되지 않았습니다. 다시 시도해주세요.");
			                }
			            },
			            error: function(error) {
			                alert("[서버오류] 관리자에게 문의바랍니다.");
			            }
			        });
			    } else {
			        alert("프로필 사진을 선택해주세요.");
			        return;
			    }
			});
			
/* 			$(function(){
		    //처음 이미지 가져오기
		    let photoPath = $('.profilePhoto').attr('src');
		    let myPhoto; //회원이 업로드할 이미지 담을 변수
		    $('#modalUploadFile').change(function(){
		    	myPhoto = this.files[0];
		        if(!myPhoto){
		            $('.profilePhoto').attr('src', photoPath);
		            return
		        }
		        //이미지 미리보기 처리
		        let reader = new FileReader(); //FileReader 객체 생성
		        reader.readAsDataURL(myPhoto); //readAsDataURL에 Input 태그로 읽은 파일 넘겨주기
		
		        reader.onload = function(){ //파일읽기 로딩 완료시
		            $('.profilePhoto').attr('src', reader.result); //result 꺼내서 src 속성에 담아주기
		        };
		    }); */
		    
			// 비밀번호 유효성체크
			function pwCheck() {
			    let userPw = $("#changeInputPw").val();
			    if (!pwRegExp.test(userPw)) {
			    	showPwMsg("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.", "red");
				} else {
					showPwMsg("* 사용가능한 비밀번호입니다.", "rgb(139, 195, 74)");
				}
			} 


			// 비밀번호재입력 유효성체크
 			function pwReCheck() {
			    let userPw = $("#changeInputPw").val();
			    let userPwCheck = $("#changePwCheck").val();

	            if(userPw === '' && userPwCheck === '') {
	                window.alert('비밀번호를 입력해주세요.');
			    	showPwMsg("* 비밀번호를 입력해주세요.", "red");
			    	showPwCheckMsg("* 비밀번호를 입력해주세요.", "red");
	                return;
	            }
	            if (pwRegExp.test(userPwCheck)) {
		            if(userPwCheck === userPw) {
						showPwCheckMsg("* 비밀번호가 일치합니다", "rgb(139, 195, 74)");
		            }  else {
					    showPwCheckMsg("* 비밀번호가 일치하지 않습니다.", "red");
					    return;
		            }
	            } else {
				    showPwCheckMsg("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.", "red");
				    return;
	            }
			} 
			
			// 닉네임 유효성체크
			function nickCheck() {
			    let userNickname = $("#userNickname").val();
			    console.log(userNickname);
			    console.log(sessionNickname);
			    if (!nicknameRegExp.test(userNickname)) {
			    	showNickMsg("* 닉네임은 한글, 영문, 숫자 2~10자 입력해주세요.<br><p style='text-align: left;'>(숫자만 입력 불가)<p>", "red");
					$("#nicknameCheck").prop("disabled", true);
				} else if (sessionNickname === userNickname) {
			    	showNickMsg("* 현재 닉네임과 동일합니다", "rgb(139, 195, 74)");
					$("#nicknameCheck").prop("disabled", true);
				} else {
					showNickMsg("* 닉네임 중복검사를 진행해주세요.", "red");
			    	$("#nicknameCheck").prop("disabled", false);
				}
			}
			
			// 닉네임 중복체크
			function nickDuplicate() {
				$("#nicknameMsg").text("");
			    const userNickname = $("#userNickname").val();
			    console.log(userNickname);
			    console.log(sessionNickname);
			    if (!userNickname) {
			    	showNickMsg("* 닉네임을 입력해주세요.", "red");
			        return;
			    }
			    if (!nicknameRegExp.test(userNickname)) {
			    	showNickMsg("* 닉네임은 한글, 영문, 숫자 2~10자 입력해주세요.<br><p style='text-align: left;'>(숫자만 입력 불가)<p>", "red");
			        $("#userNickname").focus();
			        return;
			    }
			    if (sessionNickname === userNickname) {
			    	showNickMsg("* 현재 닉네임과 동일합니다", "red");
			    } else {
				    $.ajax({
				        url: "/user/userNicknameCheck",
				        data: { userNickname: userNickname },
				        type: "GET",
				        success: function (response) {
				            if (response) {
				            	showNickMsg("* 사용할 수 없는 닉네임입니다.", "red");
				        		$("#userNickname").focus();
				            } else if (response.equal === "equal") {
						    	showNickMsg("* 현재 닉네임과 동일합니다", "red");
				            } else {
				            	showNickMsg("* 사용가능한 닉네임입니다.", "rgb(139, 195, 74)");
				            }
				        },
				        error: function () {
				            alert("[서버오류] 관리자에게 문의바랍니다.");
				        }
				    });
			    }
			}
			
   			
      		// 전화번호정규식
            function oninputPhone(target) {
      			target.value = target.value
                    .replace(/[^0-9]/g, '') //숫자를 제외한 모든 문자 제거
                    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3"); 
            }


	        
        	// 카카오 회원탈퇴
        	$('#delKakaoUserBtn').on("click", function(){
        		if(confirm("정말 탈퇴하시겠습니까?")) {
        			
			    	$.ajax({
			    		url: "/user/kakaoUnlink",
			    		type: "GET",
			    		success: function(response){
			                if (response === "success") {
			                    alert("SNS 회원탈퇴가 완료되었습니다.");
			                    window.location.href="/";  
			                } else if (response === "checkLogin") {
			                	alert("로그인 후 이용해주세요");
			                    window.location.href="/";  
			                } else {
			                	alert("SNS 회원탈퇴가 완료되지 않았습니다. 다시 시도해주세요.");
			                    window.location.href="/user/modify";  
			                }
			    		},
			    		error : function(){
				            alert("[서버오류] 관리자에게 문의바랍니다.");
			    		}
			    	})
        		}
        	});
        	
        	
            // textarea 체크
			$('#userInfo').on('input', function() {
   			    let content = $(this).val();

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
        	
        	// 비밀번호변경
        	$("#changedPwSubBtn").on("click", function() {
        		let userPw = $("#changeInputPw").val();
			    let userPwCheck = $("#changePwCheck").val();
			    
			    if(!userPw) {
			    	showPwMsg("* 비밀번호를 입력해주세요.", "red");
			    	return;
			    }
			    if(!userPwCheck) {
			    	showPwCheckMsg("* 비밀번호를 다시 입력해주세요.", "red");
			    	return;
			    }
			    
			    
			    if($("#modalPwMsg").css('color') !== "rgb(139, 195, 74)"){
			    	showPwMsg("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.", "red");
			    } else if ($("#modalPwCheckMsg").css('color') !== "rgb(139, 195, 74)") {
			    	if(userPw !== userPwCheck) {
				    	showPwCheckMsg("* 비밀번호가 일치하지 않습니다.", "red");
			    	} else {
				    	showPwCheckMsg("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.", "red");
			    	}
			    } else {
			    	$.ajax({
			    		url: "/user/updatePw",
			    		data: {userPw : userPw},
			    		type: "POST",
			    		success: function(response){
			                if (response.success === "success") {
			                    alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.");
			                    window.location.href="/user/login";  
			                } else if (response.fail === "fail") {
			                	alert("비밀번호가 변경되지 않았습니다. 다시 시도해주세요.");
			                } else {
			                	alert("로그인 후 이용해주세요.");
			                    window.location.href="/user/login";  
			                }
			    		},
			    		error : function(){
				            alert("[서버오류] 관리자에게 문의바랍니다.");
			    		}
			    	})
			    }
        	});
        	
        	
        	// 정보수정
        	$("#submitBtn").on("click", function(event) {
        		/* alert('hi'); */
      			event.preventDefault();
      		    console.log(sessionNickname);
      		    console.log(validateEmail);
      			//필수입력정보
/*       		    const changeUserPw = $("#changeUserPw").val();
      		    const userPwCheck = $("#userPwCheck").val(); */
      		    const userName = $("#userName").val();
      		    const userNickname = $("#userNickname").val();
      		    const userEmail = $("#userEmail").val();
      		    const userEmailCheck = $("#userEmailCheck").val();
	        
        		// 입력 유효성 검사
				if(!userNickname){
        			alert("수정할 닉네임을 입력해주세요");
        			return;
				} else if (!userName) {
					alert("수정할 이름을 입력해주세요");
					return;
				} else if (!userEmail) { 
        			alert("수정할 이메일을 입력해주세요");
        			return;
				} 
				if ($("#nameMsg").css('color') !== "rgb(139, 195, 74)") {
		            alert("올바른 이름을 입력해주세요.");
		            $("#userName").focus();
		            return;
				}
				
			    if($("#nicknameCheck").is(":enabled")) {
					if ($("#nicknameMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("닉네임 중복검사를 완료해주세요.");
			            $("#userNickname").focus();
			            return;
					}
			    }
			    if($("#changeMailBtn").is(":enabled") || $("#checkEmailCodeBtn").is(":enabled")) {
			        if ($("#mailMsg").css('color') !== "rgb(139, 195, 74)" || $("#mailCheckMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("이메일 인증을 완료해주세요.");
			            $("#mailMsg").focus();
			            return;
			        }
			    }
				if(confirm("정보를 수정하시겠습니까?")) {
				    $("#updateForm").submit();					
				}
        	});
        </script>
    </body>
</html>
