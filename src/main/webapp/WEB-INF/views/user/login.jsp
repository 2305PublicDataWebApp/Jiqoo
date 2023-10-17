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
        <title>지꾸 로그인</title>
        
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

        <!-- login css -->
        <link href="../resources/assets/css/login.css" rel="stylesheet">
        
        <!-- 제이쿼리 -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        
        <!-- 카카오 로그인 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" ></script> -->
        <script>
	        Kakao.init('4cf9db2344d009b1a0f20e2bb100602a'); // 발급키
	    	console.log(Kakao.isInitialized());
        </script> 
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
        <main class="form-signin">
            <form action="/user/login" method="post">
                <h1 style="margin-bottom: 30px;">로그인</h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
                    <label for="userId">아이디</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
                    <label for="userPw">비밀번호</label>
                </div>
                <div>
                	<p id="checkMessage" style="margin:0; color:#f7396e;"></p>
                </div>
                <button class="w-100 btn btn-lg" type="submit" id="loginBtn">로그인</button>
            </form>
            <div style="margin-top:10px;">
                <!-- <button class="w-100 btn btn-lg" type="submit" id="kakaoBtn">카카오로그인</button> -->
                <!-- <button class="w-100 btn btn-lg" id="kakaoLoginBtn">
                    <img src="../resources/assets/img/user/kakao_login.png" alt="카카오 로그인 버튼"/>
                </button> -->
                <a id="kakao-login-btn" href="javascript:loginWithKakao()">
					<img src="../resources/assets/img/user/kakao_login.png" alt="카카오 로그인 버튼" />
				</a>
				<p id="token-result"></p>
            </div>
            <div id="findInfo" style="margin-top: 20px;">
                <ul>
                    <li><a data-bs-toggle="modal" href="#findIdModal">아이디찾기</a></li>
                    <li><a data-bs-toggle="modal" href="#findPwModal">비밀번호찾기</a></li>
                    <li><a href="/user/register">회원가입</a></li>
                </ul>
            </div>
            
            <!-- 아이디찾기 Modal -->
            <div class="modal fade" id="findIdModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body" style="margin-top: 20px;">
                        <img class="mb-4" src="../resources/assets/img/jiqooLogo.png" alt="" width="60px">
                        <h1 style="font-family: Black Han Sans; color:Black; padding-left: 10px;">아이디 찾기</h1>
                        <div class="form-floating" style="margin-top: 20px;">
                            <input type="text" class="form-control" id="findIdName" name="userName" placeholder="이름">
                            <label for="userName">이름</label>
                        </div>
                        <div class="form-floating" style="margin-bottom: 20px;">
                            <input type="text" class="form-control" id="findIdEmail" name="userEmail" placeholder="이메일">
                            <label for="userEmail">이메일</label>
                        </div>
                        <div class="form-floating">
                        	<p class="checkMessage" id="findIdMsg"></p>
                        </div>
                    </div>
                    <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;">
                        <button type="button" id="findId" class="btn" onclick="findId()">아이디 찾기</button>
                        <button type="button" class="btn" data-bs-dismiss="modal">창닫기</button>
                    </div>
                </div>
                </div>
            </div>

            <!-- 비밀번호찾기 Modal -->
            <div class="modal fade" id="findPwModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body" style="margin-top: 20px;">
                        <img class="mb-4" src="../resources/assets/img/jiqooLogo.png" alt="" width="60px">
                        <h1 style="font-family: Black Han Sans; color:Black; padding-left: 10px;">비밀번호 찾기</h1>
                        <div class="form-floating" style="margin-top: 20px;">
                            <input type="text" class="form-control" id="findPwId" name="userId" placeholder="아이디">
                            <label for="userId">아이디</label>
                        </div>
                        <div class="form-floating" style="margin-bottom: 20px;">
                            <input type="text" class="form-control" id="findPwEmail" name="userEmail" placeholder="이메일">
                            <label for="userEmail">이메일</label>
                        </div>
                        <div class="form-floating">
                        	<p class="checkMessage" id="findPwMsg"></p>
                        </div>
                    </div>
                    <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;">
                        <button type="button" id="findPw" class="btn" onclick="findPw()">비밀번호 찾기</button>
                        <button type="button" class="btn" data-bs-dismiss="modal">창닫기</button>
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
			// id 찾기 결과 메시지
			function showFindIdMsg(message, color) {
			    $("#findIdMsg").html(message).css('color', color);
			}
			
			// pw 찾기 결과 메시지
			function showFindPwMsg(message, color){
			    $("#findPwMsg").html(message).css('color', color);
			}
			
			// pw찾기
			function findPw() {
        		const userId = $("#findPwId").val();
				const userEmail = $("#findPwEmail").val();
        		if(userId === "") {
        			showFindPwMsg("아이디를 입력해주세요.", "#f7396e");
        			return;
        		}
        		if(userEmail === "") {
        			showFindPwMsg("이메일을 입력해주세요.", "#f7396e");
        			return;
        		}
        		showFindPwMsg("정보를 확인하고 있습니다.", "#f7396e");
        		$.ajax({
        			url : "/user/findPw",
        			data: {
        				"userId" : userId, 
        				"userEmail" : userEmail
        			},
        			type: "POST",
        			success: function(result){
        				if(result === "fail") {
        					showFindPwMsg("일치하는 정보가 없습니다.", "#f7396e");
        				} else {
        					showFindPwMsg(result, "rgb(139, 195, 74)");
        				}
        			},
        			error: function(){
        				alert("[서버오류] 관리자에게 문의바랍니다.");
       					showFindPwMsg("[서버오류] 새로고침 후 다시 인증바랍니다.", "#f7396e");
        			}
        		})
			}
			
			// id찾기
			function findId() {
        		const userName = $("#findIdName").val();
				const userEmail = $("#findIdEmail").val();
        		if(userName === "") {
     				showFindIdMsg("이름을 입력해주세요.", "#f7396e");
        			return;
        		}
        		if(userEmail === "") {
     				showFindIdMsg("이메일을 입력해주세요.", "#f7396e");
        			return;
        		}
        		$.ajax({
        			url : "/user/findId",
        			data: {
        				"userName" : userName, 
        				"userEmail" : userEmail
        			},
        			type: "POST",
        			success: function(result){
        				if(result === "fail") {
        					showFindIdMsg("일치하는 정보가 없습니다.", "#f7396e");
        				} else {
        					const findId = result;
        					showFindIdMsg("아이디 조회 결과 : " + findId, "rgb(139, 195, 74)");
        				}
        			},
        			error: function(){
        				alert("[서버오류] 관리자에게 문의바랍니다.");
        			}
        		})
			}        
        
        
        	$("#loginBtn").on("click", function(){
        		event.preventDefault();
        		const userId = $("#userId").val();
        		const userPw = $("#userPw").val();
        		let checkMessage = $("#checkMessage")
        		if(userId === "") {
        			checkMessage.text("아이디를 입력해주세요");
        			return;
        		}
        		if(userPw === "") {
        			checkMessage.text("비밀번호를 입력해주세요");
        			return;
        		}
        		$.ajax({
        			url : "/user/login",
        			data: {
        				"userId" : userId, 
        				"userPw" : userPw
        			},
        			type: "POST",
        			success: function(data){
        				if(data === "true") {
	        				window.location.href="/";   					
        				} else {
        					checkMessage.text("아이디와 비밀번호를 다시 확인해주세요.");
        				}
        			},
        			error: function(){
        				alert("[서버오류] 관리자에게 문의바랍니다.");
        			}
        		})
        	})
        	
        	
        	//kakao로그인
			function loginWithKakao() {
			  Kakao.Auth.authorize({
			    redirectUri: 'http://localhost:9999/user/kakao',
			    scope: 'account_email, profile_nickname, gender',
	 		    success: function(success) {
			        console.log("카카오 인증 성공", authObj);
			        // 로그인 또는 인증 성공 시 처리
			    },
			    fail: function(err) {
			        console.log("카카오 인증 실패", err);
			        // 로그인 또는 인증 실패 시 처리
			    },
			  });
			}
        	
        	// 사용자 정보 받아옴
 /*            function requestUserInfo() {
                Kakao.API.request({
                  url: "/v2/user/me",
                  success: function (res) {
                    console.log(res);
                    var id = res.id;
                    var profile_nickname = res.kakao_account.profile.nickname;
                    localStorage.setItem("nickname", profile_nickname);
                    localStorage.setItem("id", id);
                    console.log(profile_nickname);
                    console.log(id);
                  },
                  fail: function (error) {
                    alert("카카오 로그인 실패" + JSON.stringify(error));
                  },
                });
              } */
/*         	$("#kakaoLoginBtn").on("click", function(){
        	    Kakao.Auth.login({
        	        success: function (auth) {
        	          Kakao.API.request({
        	            url: '/v2/user/me',
        	            success: function (response) {
        	          	  console.log(response)
        	            },
        	            fail: function (error) {
        	              console.log(error)
        	            },
        	          })
        	        },
        	        fail: function (error) {
        	          console.log(error)
        	        },
        	      })
        	}) */
	       	 /*  function loginWithKakao() {
	       	    Kakao.Auth.authorize({
	       	      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
	       	    });
	       	  } */
	       	  
	       	/* Kakao.Auth.login({
	            success: function(authObj) {
	              //alert(JSON.stringify(authObj))
	              Kakao.API.request({
	                  url: '/v2/user/me',
	                  success: function(response) {
	                      let id = "kakao_" + response.id;
	                      let email = (response.kakao_account.email != undefined ? response.kakao_account.email : '');
	                      
	                      let properties = response.properties;
	                      let name = properties.nickname;
	                      let profile_image = properties.profile_image;
	                      
	                      let member = {
	                          id : id,
	                          password : id,
	                          email : email,
	                          name : name,
	                          profile : profile_image,
	                          snsyn : 'Y'
	                      }
	                      kakaoLogin(member).then(res => {
	                          if(res.status == 200){
	                              getLoginInfo().then(result => {
	                                  if(result.status == 200){
	                                      setLoginInfo(result.data);
	                                      closeLoginPop();
	                                  }
	                              })
	                          }
	                      })

	                  },
	                  fail: function(error) {
	                      console.log(error);
	                  }
	              });
	            },
	            fail: function(err) {
	              alert(JSON.stringify(err))
	            },
	          }) */
        </script>
    </body>
</html>
