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
                    <form id="regiForm" action="/user/register" method="POST" enctype="multipart/form-data">
                        <h4>필수입력사항</h4>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userId" style="text-align: left;">아이디</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userId" name="userId" oninput="idCheck()" placeholder="영문, 숫자 조합 6~15자 입력">
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn" id="userIdCheck" type="button" onclick="idDuplicate();">중복확인</button>
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
                                <input type="password" class="form-control" id="userPw" name="userPw" oninput="pwCheck()" placeholder="영문, 숫자 조합 6~20자 입력">
                            </div>
                            <div>
                            	<p class="checkMessage" id="pwMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userPwCheck">비밀번호확인</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="password" class="form-control" id="userPwCheck" name="userPwCheck" oninput="pwReCheck()" placeholder="비밀번호 재입력">
                            </div>
                            <div>
                            	<p class="checkMessage" id="pwCheckMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userName">이름</label>
                            </div>
                            <div class="col-8 col-sm-7">
                                <input type="text" class="form-control" id="userName" name="userName" oninput="nameCheck()" placeholder="이름을 입력해주세요">
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
                                <input type="text" class="form-control" id="userNickname" name="userNickname" oninput="nickCheck()" placeholder="한글, 영문, 숫자만 2~10자 입력">
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn" id="nicknameCheck" type="button" onclick="nickDuplicate()">중복체크</button>
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
                                <input type="email" class="form-control" id="userEmail" name="userEmail" oninput="emailCheck()" placeholder="이메일을 입력해주세요">
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn" type="button" onclick="emailDuplicate()">메일인증</button>
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
                                <input type="text" class="form-control" id="userEmailCheck" name="userEmailCheck" placeholder="인증번호를 입력해주세요">
                            </div>
                            <div class="col-4 col-sm-2">
                                <button class="btn btn-sm regBtn" type="button" onclick="codeCheck()">인증확인</button>
                            </div>
                             <div>
                            	<p class="checkMessage" id="mailCheckMsg"></p>
                            </div>
                        </div>
                        <h4>선택입력사항</h4>
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
                            <div>
                                <p class="checkMessage" id="birthError"></p>
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
                                <input type="file" class="form-control form-control-sm" id="userPhoto" name="uploadFile" onclick="photoAlert()" accept="image/gif, image/jpeg, image/png">
                            </div>
                            <div>
                            	<p class="checkMessage" id="photoMsg"></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3" style="text-align: left;">
                                <label for="userInfo">자기소개</label>
                            </div>
                            <div class="col-8 col-sm-7">
                               <textarea class="form-control" id="userInfo" name="userInfo" rows="3" cols="20" wrap="hard" maxlength="150" placeholder="자기소개를 입력해주세요. 150자 제한"></textarea>
                            </div>
                        </div>
                        <div style="justify-content: center;">
                            <button class="btn btn-block subBtn" type="button" onclick="registerBtn();">가입완료</button>
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
   			const pwRegExp = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,20}$/;
   			const nameRegExp = /^[가-힣]{2,4}$/;
   			const nicknameRegExp = /^(?!^\d+$)[a-zA-Z0-9가-힣]{2,10}$/;
   			const emailRegExp = /^[a-zA-Z0-9]{4,20}@[a-z]+\.[a-z]{3}/g;
   			
   			// id 체크 메시지
   			function showIdMsg(message, color) {
			    $("#idMsg").html(message).css('color', color);
			}
			// 비밀번호 체크 메시지
			function showPwMsg(message, color) {
			    $("#pwMsg").html(message).css('color', color);
			}
			// 비밀번호 재입력 체크메시지
			function showPwCheckMsg(message, color) {
			    $("#pwCheckMsg").html(message).css('color', color);
			}
			// 이름 체크메시지
			function showNameMsg(message, color) {
			    $("#nameMsg").html(message).css('color', color);
			}
			// 닉네임 체크메시지
			function showNickMsg(message, color) {
			    $("#nicknameMsg").html(message).css('color', color);
			}
			// 이메일 체크메시지
			function showEmailMsg(message, color) {
			    $("#mailMsg").html(message).css('color', color);
			}
			// 이메일인증 체크메시지
			function showEmailCheckMsg(message, color) {
			    $("#mailCheckMsg").html(message).css('color', color);
			}
			// 사진업로드 체크메시지
			function showPhotoMsg(message, color) {
			    $("#photoMsg").html(message).css('color', color);
			}
			// id 유효성체크
			function idCheck() {
			    let userId = $("#userId").val();
			    if (!idRegExp.test(userId)) {
		            showIdMsg("* 아이디는 영문, 숫자 조합 6 ~ 15자 입력해주세요.", "red");
				} else {
		            showIdMsg("* 아이디 중복검사를 진행해주세요.", "red");
				}
			}
   			// id중복체크
			function idDuplicate() {
				$("#idMsg").text("");
			    const userId = $("#userId").val();
			
			    if (!userId) {
			    	showIdMsg("* 아이디를 입력해주세요.", "red");
			        return;
			    }
			
			    /* if (!idRegExp.test(userId) || userId.length < 6 || userId.length > 15)  */
			    if (!idRegExp.test(userId)) {
			    	showIdMsg("* 아이디는 영문, 숫자 조합 6 ~ 15자 입력해주세요.", "red");
			        $("#userId").focus();
			        return;
			    }
			
			    $.ajax({
			        url: "/user/userIdCheck",
			        data: { userId: userId },
			        type: "GET",
			        success: function (result) {
			            if (result > 0) {
			            	showIdMsg("* 사용할 수 없는 아이디입니다.", "red");
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

			// 비밀번호 유효성체크
			function pwCheck() {
			    let userPw = $("#userPw").val();
			    if (!pwRegExp.test(userPw)) {
			    	showPwMsg("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.", "red");
				} else {
					showPwMsg("* 사용가능한 비밀번호입니다.", "rgb(139, 195, 74)");
				}
			}

			// 비밀번호재입력 유효성체크
			function pwReCheck() {
			    let userPw = $("#userPw").val();
			    let userPwCheck = $("#userPwCheck").val();
			    
	            if(userPw === '' && userPwCheck === '') {
	                window.alert('비밀번호를 입력해주세요.');
			    	showPwMsg("* 비밀번호를 입력해주세요.", "red");
			    	showPwCheckMsg("* 비밀번호를 입력해주세요.", "red");
	                return;
	            }
/* 	            if(userPwCheck === userPw) {
					showPwCheckMsg("* 비밀번호가 일치합니다", "rgb(139, 195, 74)");
	            } else {
				    showPwCheckMsg("* 비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.", "red");
				    return;
	            } */
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
			
			// 이름 유효성체크
			function nameCheck() {
			    let userName = $("#userName").val();
			    if (!nameRegExp.test(userName)) {
			    	showNameMsg("* 올바른 이름을 입력해주세요.", "red");
				} else {
					showNameMsg("* 이름 입력 완료", "rgb(139, 195, 74)");
				}
			}

			// 닉네임 유효성체크
			function nickCheck() {
			    let userNickname = $("#userNickname").val();
			    if (!nicknameRegExp.test(userNickname)) {
			    	showNickMsg("* 닉네임은 한글, 영문, 숫자 2~10자 입력해주세요.<br><p style='text-align: left;'>(숫자만 입력 불가)<p>", "red");
				} else {
					showNickMsg("* 닉네임 중복검사를 진행해주세요.", "red");
				}
			}
			// 이메일 유효성체크
			function emailCheck() {
			    let userEmail = $("#userEmail").val();
			    if (!emailRegExp.test(userEmail)) {
			    	showEmailMsg("* 올바른 메일 형식을 입력해주세요", "red");
				} else {
					showEmailMsg("* 메일인증을 진행해주세요.", "red");
				}
			}
			
   			// 닉네임 중복체크
			function nickDuplicate() {
				$("#nicknameMsg").text("");
				
			    const userNickname = $("#userNickname").val();
			
			    if (!userNickname) {
			    	showNickMsg("* 닉네임을 입력해주세요.", "red");
			        return;
			    }
			    
			    /* if (!nicknameRegExp.test(userNickname) || userId.length < 2 || userId.length > 10) */
			    if (!nicknameRegExp.test(userNickname)) {
			    	showNickMsg("* 닉네임은 한글, 영문, 숫자 2~10자 입력해주세요.<br><p style='text-align: left;'>(숫자만 입력 불가)<p>", "red");
			        $("#userNickname").focus();
			        return;
			    }
			
			    $.ajax({
			        url: "/user/userNicknameCheck",
			        data: { userNickname: userNickname },
			        type: "GET",
			        success: function (result) {
			            if (result > 0) {
			            	showNickMsg("* 사용할 수 없는 닉네임입니다.", "red");
			        		$("#userNickname").focus();
			            } else {
			            	showNickMsg("* 사용가능한 닉네임입니다.", "rgb(139, 195, 74)");
			        		$("#userNickname").focus();
			            }
			        },
			        error: function () {
			            alert("[서버오류] 관리자에게 문의바랍니다.");
			        }
			    });
			}
   			
			let checkCode; // 인증번호 전역변수로 선언
			
   			// 메일 중복 체크 및 인증메일 발송 
        	function emailDuplicate(){
			    showEmailMsg("* 잠시만 기다려주세요.", "red");
			    const userEmail = $("#userEmail").val();
			    if(userEmail != "") {
			    	$.ajax({
			    		url: "/user/emailCheck",
			    		data: {userEmail : userEmail},
			    		type: "POST",
			    		success: function(response){
			                if (response.isDuplicate) {
			                    alert("중복된 이메일입니다.");
			    				showEmailMsg("* 다른 이메일을 입력해주세요.", "red");
			                } else {
			                	checkCode = response.checkCode;
			                	console.log(checkCode);
			                    alert("인증번호를 발송했습니다. 메일을 확인해주세요.");
			    				showEmailMsg("* 메일발송완료. 발송된 인증번호를 입력해주세요.", "red");
			                }
			    		},
			    		error : function(){
				            alert("[서버오류] 관리자에게 문의바랍니다.");
			    		}
			    	})
			    } else {
			    	showEmailMsg("* 올바른 메일 형식을 입력해주세요", "red");
			    }
        	}
   			
   			//인증번호
        	function codeCheck() {
        		const userEmailCheck = $("#userEmailCheck").val();
        		if(checkCode == null) {
        			showEmailMsg("* 이메일인증을 진행해주세요", "red");
        		} else if(userEmailCheck != checkCode) {
        			showEmailCheckMsg("* 인증번호가 일치하지 않습니다.", "red");
        			$("#userEmailCheck").focus();
        		} else if(userEmailCheck == checkCode) {
        			showEmailMsg("* 이메일인증완료", "rgb(139, 195, 74)");
        			showEmailCheckMsg("* 인증번호가 일치합니다.", "rgb(139, 195, 74)");
        		}
        	}
    		
      		// 전화번호정규식
            function oninputPhone(target) {
                target.value = target.value
                    .replace(/[^0-9]/g, '') //숫자를 제외한 모든 문자 제거
                    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
            }
      		
   			// 사진 알림창
   			function photoAlert(){
   				alert("본인 사진을 업로드하시면 모임 참가 확률이 올라갑니다!")
       			showPhotoMsg("* 본인 사진을 업로드하시면 모임 참가 확률이 올라갑니다!", "rgb(139, 195, 74)");
   			}
   			
   			// textarea 입력체크
   			$('#userInfo').on('input', function(event) {
   			    let content = $(this).val();

   			    // 글자수 세기
   			    if (content.length == 0 || content == '') {
   			        $('.textCount').text('0자');
   			    } else {
   			        $('.textCount').text(content.length + '자');
   			    }

   			    // 글자수 제한
   			    if (content.length > 150) {
   			        // 150자를 초과하면 150자까지 자르고 경고 표시
   			        $(this).val(content.substring(0, 150));
   			        alert('글자수는 150자까지 입력 가능합니다.');
   			    }
   			});
   		
   		// 유효성 검사 함수
   			function validateBirth() {
   			    var userBirth = document.getElementById("userBirth").value;
   			    var birthError = document.getElementById("birthError");

   			    if (!userBirth) {
   			        birthError.textContent = ""; // 아무 내용도 입력하지 않았을 때 오류 메시지 표시하지 않음
   			        return true; // 선택 사항이므로 유효한 상태
   			    } else {
   			        var selectedDate = new Date(userBirth);
   			        var currentDate = new Date();

   			        if (selectedDate > currentDate) {
   			            birthError.textContent = "* 유효하지 않은 날짜입니다.";
   			            return false;
   			        } else {
   			            birthError.textContent = "";
   			            return true;
   			        }
   			    }
   			}

   			// 이벤트 핸들러를 등록
   			document.getElementById("userBirth").addEventListener("input", validateBirth);
   			
      		// 회원가입 필수입력정보체크
      		function registerBtn(){
      			event.preventDefault();
      		    
      			//필수입력정보
      		    const userId = $("#userId").val();
      		    const userPw = $("#userPw").val();
      		    const userPwCheck = $("#userPwCheck").val();
      		    const userName = $("#userName").val();
      		    const userNickname = $("#userNickname").val();
      		    const userEmail = $("#userEmail").val();
      		    const userEmailCheck = $("#userEmailCheck").val();
      		    				
			    // 입력 유효성 검사
			    if (userId === "" || userPw === "" || userPwCheck === "" || userName === "" || userNickname === "" || userEmail == "") {
			        alert("필수 입력사항을 모두 입력해주세요.");
			        return;
			    } else {
			        if ($("#idMsg").css('color') !== "rgb(139, 195, 74)") {
			            $("#userId").focus();
			            alert("아이디 중복검사를 완료해주세요.");
			            showIdMsg("* 아이디 중복검사를 진행해주세요.", "red");
			            return;
			        } else if ($("#pwMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("비밀번호는 영문, 숫자 조합 6 ~ 20자 입력해주세요.");
			            $("#userPw").focus();
			            return;
			        } else if ($("#pwCheckMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("비밀번호가 일치하지 않습니다.");
			            $("#userPwCheck").focus();
			            return;
			        } else if ($("#nameMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("올바른 이름을 입력해주세요.");
			            $("#userName").focus();
			            return;
			        } else if ($("#nicknameMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("닉네임 중복검사를 완료해주세요.");
			            $("#userNickname").focus();
			            return;
			        } else if ($("#mailMsg").css('color') !== "rgb(139, 195, 74)" || $("#mailCheckMsg").css('color') !== "rgb(139, 195, 74)") {
			            alert("이메일 인증을 완료해주세요.");
			            $("#userEmail").focus();
			            return;
			        } else if ($("#birthError").text() !== "") {
			            alert("유효하지 않은 날짜입니다.");
			            $("#userBirth").focus();
			            return;
			        } else {
			        	if(confirm("회원가입을 하시겠습니까?")) {
						    $("#regiForm").submit();
			        	}
			        }
			    }
			}
        </script>
    </body>
</html>
