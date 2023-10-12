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
        <title>지꾸 회원가입</title>
        
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
                    <h1 style="margin-bottom: 30px;">회원가입</h1>
                    <form>
                        <h4>필수입력사항</h4>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userId" style="text-align: left;">아이디</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userId" name="userId" placeholder="영문, 숫자 조합 6~15자 입력" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn" id="userIdCheck" onclick="idCheck();">중복확인</button>
                            </div>
                            <div>
                            	<p class="checkMessage" id="idMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPw">비밀번호</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="password" class="form-control" id="userPw" name="userPw" placeholder="영문, 숫자 조합 6~20자 입력" required>
                            </div>
                            <div>
                            	<p class="checkMessage" id="pwErrorMessage"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPwCheck">비밀번호확인</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="password" class="form-control" id="userPwCheck" name="userPwChek" placeholder="비밀번호 재입력" required>
                            </div>
                            <div>
                            	<p class="checkMessage" id="pwChekErrorMessage"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userName">이름</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요" required>
                            </div>
                            <div>
                            	<p class="checkMessage" id="nameMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userNickname">닉네임</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="한글, 영문, 숫자만 2~10자 입력" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn" id="nicknameCheck" onclick="nicknameCheck">중복확인</button>
                            </div>    
                             <div>
                            	<p class="checkMessage" id="nicknameMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userEmail">메일주소</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn">메일인증</button>
                            </div>
                            <div>
                            	<p class="checkMessage" id="mailMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3">
                               <!--  <label for="userEmailChek"></label> -->
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userEmailChek" name="userEmailChek" placeholder="인증번호를 입력해주세요" required>
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn">인증확인</button>
                            </div>
                             <div>
                            	<p class="checkMessage" id="mailChekErrorMsg"></p>
                            </div>
                        </div>
                        <h4>선택입력사항</h4>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userGender">성별</label>
                            </div>
                            <div class="col-12 col-sm-6 text-left">
                                <label class="radio-label" style="float: left;">
                                    <input type="radio" id="genderM" name="userGender" value="M" style="margin-right: 10px;">남자
                                </label>
                                <label class="radio-label">
                                    <input type="radio" id="genderF" name="userGender" value="F" style="margin-right: 10px;">여자
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userBirth">생년월일</label>
                            </div>
                            <div class="col-12 col-sm-6 text-left">
                                <label class="radio-label" style="float: left;">
                                    <input type="date" id="userBirth" name="userBirth">
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userTel">전화번호</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userTel" name="userTel" oninput="oninputPhone(this)" maxlength="14" placeholder="숫자만 입력할 수 있습니다">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPhoto">프로필사진</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="file" class="form-control form-control-sm" id="userPhoto" name="userPhoto">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userInfo">자기소개</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <textarea class="form-control" rows="3" id="userInfo" name="userInfo" placeholder="자기소개를 입력해주세요. 150자 제한"></textarea>
                            </div>
                        </div>
                        <div style="justify-content: center;">
                            <button class="btn btn-block subBtn" type="submit" onclick="registerBtn();">가입 완료</button>
                            <button class="btn btn-block subBtn" onclick="history.back();" type="button">뒤로가기</button>
                        </div>
                    </form>
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
   			// 정규식
   			const idRegExp = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{6,15}$/; //(?=.*[a-z])(?=.*\d) : 소문자, 숫자는 하나 이상 들어가야 함
   			const pwRegExp = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{6,20}$/;
   			const nameRegExp = /^[가-힣]{2,4}$/g;
   			const nicknameRegExp = /^(?!^\d+$)[a-zA-Z0-9가-힣]{2,10}$/;
   			const emailRegExp = /^[a-zA-Z0-9]{4,20}@[a-z]+\.[a-z]{3}/g;
   			
   			// id 체크 메시지
   			function showIdMsg(message, color) {
			    $("#idMsg").text(message).css('color', color);
			}
   			
   			// id중복체크
			function idCheck() {
			    const userId = $("#userId").val();
			
			    if (!userId) {
			    	showIdMsg("* 아이디를 입력해주세요.", "#f7396e");
			        return;
			    }
			
			    if (!idRegExp.test(userId) || userId.length < 6 || userId.length > 15) {
			    	showIdMsg("* 아이디는 영문, 숫자 조합 6 ~ 15자 입력해주세요.", "#f7396e");
			        $("#userId").focus();
			        return;
			    }
			
			    $.ajax({
			        url: "/user/userIdCheck",
			        data: { userId: userId },
			        type: "GET",
			        success: function (result) {
			            if (result > 0) {
			            	showIdMsg("* 사용할 수 없는 아이디입니다.", "#f7396e");
			        		$("#userId").focus();
			            } else {
			            	showIdMsg("* 사용가능한 아이디입니다.", "rgb(139, 195, 74)");
			            }
			        },
			        error: function () {
			            alert("[서버오류] 관리자에게 문의바랍니다.");
			        }
			    });
			}
			
			// 닉네임 체크 메시지
			function showNickMsg(message, color) {
			    $("#nicknameMsg").text(message).css('color', color);
			}

   			// 닉네임 중복체크
			function nicknameCheck() {
			    const userNickname = $("#userNickname").val();
			
			    if (!userNickname) {
			    	showNickMsg("* 닉네임을 입력해주세요.", "#f7396e");
			        return;
			    }
			
			    if (!nicknameRegExp.test(userNickname) || userId.length < 2 || userId.length > 10) {
			    	showNickMsg("* 닉네임은 한글, 영문, 숫자 2~10자 입력해주세요.<br><p style='text-align: left;'>(숫자만 입력 불가)<p>", "#f7396e");
			        $("#userNickname").focus();
			        return;
			    }
			
			    $.ajax({
			        url: "/user/userNicknameCheck",
			        data: { userNickname: userNickname },
			        type: "GET",
			        success: function (result) {
			            if (result > 0) {
			            	showNickMsg("* 사용할 수 없는 닉네임입니다.", "#f7396e");
			        		$("#userNickname").focus();
			            } else {
			            	showNickMsg("* 사용가능한 닉네임입니다.", "rgb(139, 195, 74)");
			            }
			        },
			        error: function () {
			            alert("[서버오류] 관리자에게 문의바랍니다.");
			        }
			    });
			}

        
      		// 회원가입 필수입력정보체크
      		function registerBtn(){
      			event.preventDefault();
      			
				const userId = $("#userId").val();
				const userPw = $("#userPw").val();
				const userPwCheck = $("#userPwCheck").val();
				const userName = $("#userName").val();
				const userNickname = $("#userNickname").val();
				const userEmail = $("#userEmail").val();
				const userEmailChek = $("#userEmailChek").val();
				
      			
	      		if (userId === "" || !idRegExp.test(userId)){
	      			showIdMsg("* 아이디는 필수입력사항입니다.", "#f7396e");
	      			$("#userId").focus();
	      			return;
	      		} else if ($("#idMsg").css('color') !== "rgb(139, 195, 74)"){
	      			alert("아이디 중복검사를 진행해주세요.");
	      			$("#userId").focus();
	      			return;
	      		} 
	      		
	      		if(userPw === "" || !pwRegExp.test(userPw)){
	      			$("#pwErrorMessage").text("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.");
	      			$("#userPw").focus();
	      			return;
	      		} else {
	      			$("#pwErrorMessage").text("");	      			
	      		}
	      		
	      		if(userPwCheck == "" || userPwCheck !== userPw){
	      			$("#pwChekErrorMessage").text("* 비밀번호를 재입력해주세요.");
	      			$("#userPwCheck").focus();
	      			return;
	      		} else {
	      			$("#pwChekErrorMessage").text("");	      			
	      		}
	      		
	      		if(userName == "" || !nameRegExp.test(userName)){
	      			$("#nameMsg").text("* 올바른 이름을 입력해주세요.");
	      			$("#userName").focus();
	      			return;
	      		} else {
	      			$("#nameMsg").text("");	      			
	      		}
	      		
	      		if(userNickname == "" || !nicknameRegExp.test(userNickname)){
	      			showNickMsg("*  닉네임은 한글, 영문, 숫자 2~10자 입력해주세요.<br><p style='text-align: left;'>(숫자만 입력 불가)<p>", "#f7396e");
	      			$("#userNickname").focus();
	      			return;
	      		} else if ($("#nicknameMsg").css('color') !== "rgb(139, 195, 74)"){
	      			alert("닉네임 중복검사를 진행해주세요.");
	      			$("#userNickname").focus();
	      			return;
	      		} 
	      		
	      		if(userEmail == "" || !emailRegExp.test(userEmail)){
	      			$("#mailMsg").text("* 올바른 메일주소를 입력해주세요.");
	      			$("#userEmail").focus();
	      			return;
	      		} else {
	      			$("#mailMsg").text("");	      			
	      		} 
	      		
	      		if($("#userEmailChek").val() == ""){
	      			$("#mailChekErrorMsg").text("* 받으신 메일의 인증번호를 입력해주세요.");
	      			$("#userEmailChek").focus();
	      			return;
	      		} else {
	      			$("#mailChekErrorMsg").text("");	      			
	      		}
      		}
      		
      		
      		// 전화번호정규식
            function oninputPhone(target) {
                target.value = target.value
                    .replace(/[^0-9]/g, '') //숫자를 제외한 모든 문자 제거
                    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
            }
      		
        </script>
    </body>
</html>
