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
        
        <!-- jQuery cdn -->
<!-- 		<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script> -->
		
		<!-- 소켓js cdn -->
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		
 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="/"><img src="../resources/assets/img/jiqooLogo.png"></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

		<div id="socketAlert" style="display:none;" ></div>
		
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link" href="/jiqoo/mapList">지꾸</a></li>
          <li><a class="nav-link" href="/moqoo/moqoo">모꾸</a></li>
          <!-- 알람아이콘 -->
          <li class="nav-item dropdown alarm">
          	<a class="nav-link nav-icon" href="javascript:void(0)" data-bs-toggle="dropdown" id="alarm-count" >
          	<i style="font-size:26px;" class="bi bi-bell"></i>
<%--           	<c:if test=""><i style="font-size:26px;" class="bi bi-bell"></i><span class="badge bg-primary badge-number" id="alarm-count">0</span></c:if> --%>
          	</a>
          	
          <c:if test="${userId ne null }">  <!-- 로그인 안되어있을때 알람 목록 안보이기 -->
          <!-- 드롭다운 알람목록 -->
          <ul class="dropdown-menu dropdown-menu-arrow notifications">
            <li class="dropdown-header" id="alert-header">
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            
<!--             <li class="notification-item "> -->
<!--               <div class="alarm-list" style="padding:5px;"> -->
              	
<!--               </div> -->
<!--               <hr class="dropdown-divider"> -->
<!--             </li> -->
            
            <li class="dropdown-footer">
              <a href="#">전체 알림 보기</a>
            </li>

          </ul>
          <!-- End 드롭다운 알림목록 -->
          </c:if>
          
          </li>
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
					<c:if test="${sessionScope.accessToken ne null and sessionScope.platformType eq 'kakao'}">
						<li><a href="https://kauth.kakao.com/oauth/logout?client_id=18a1ca5fc86fe7e244209cf690a986e4&logout_redirect_uri=http://localhost:9999/user/logout" style="font-size:1.3em;">로그아웃</a></li> 
					</c:if>
					<c:if test="${sessionScope.accessToken ne null and sessionScope.platformType eq 'naver'}">
						<li><a href="/user/logout" style="font-size:1.3em;">로그아웃</a></li> 
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
	              <li><a href="/user/logout" style="font-size:1.3em;">로그아웃</a></li>
	            </ul>
	          </li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
    
    <script>
	var socket = null;

	$(document).ready(function(){  //웹소켓 연결 
		if(${userId != null}){
			connectWs();  //로그인상태일때 connectWs()함수 호출
		}
	});

	//소켓
	function connectWs(){
		console.log("Open")
		var ws = new SockJS("http://localhost:9999/alert");
		socket = ws;

		//연결성공시
		ws.onopen = function() {
			console.log("연결완료");
		};

		ws.onmessage = function(event) {
			/* 받을 알람이 있을 때 */
			console.log("onmessage"+event.data);

			if(event.data.length>0){
				let $socketAlert = $('div#socketAlert');
				$socketAlert.html(event.data)
				$socketAlert.css('display', 'block');
// 				$socketAlert.css('visibility', 'visible');
				alarmCount();
				
				//5초만 화면에 출력 
				setTimeout(function(){
					$socketAlert.css('display','none');
					$socketAlert.css('transition','background-color 0.3s ease');
				}, 5000);
			}
		};

		//연결끊기
		ws.onclose = function(event) {
		    console.log('close');
		};

	};//소켓끝
	
	
	//알람
	const toUserId = "${sessionScope.userId }";
	
	
	//알람 수
	const alarmCount =()=>{
		console.log("alarmCount")

		$.ajax({
		        url : '/alert/alarmcount',
		        type : 'get',
		        data : {'toUserId' : toUserId },
		        
		        success : function(data){
		        		console.log(data);
			         	console.log("알람수 카운트 성공");
			         	if(data > 0) {
							$("#alarm-count").append("<span class='badge bg-primary badge-number'>"+data+"</span>'");		
							$("#alert-header").text("새로운 알림이 있습니다");
						}else {
							
							$("#alert-header").text("새로운 알림이 없습니다");
							$(".notification-item").remove();
						}
						
		        }, 
		        error : function(){ 
					alert("ajax 오류")
				} 
		    });
		}
	alarmCount();
	

	//알람리스트
	const alarmList=()=>{
		console.log("alarmList")
		 $.ajax({
		        url : '/alert/alarmlist',
		        type : 'get',
		        data : {'toUserId' : toUserId },
		        dataType : "json", 
		        
		        success : function(data){
		         	let alarm='';
		         	let alarmContentLi ="";
		         	let alarmContentDiv ="";
		     		let alarmCloseLi = "";
		     		
		         	 $.each(data, function(key, value){ 
			         	let alertType = value.alertType;
		         		
		         		alarmContentLi = '<li class="notification-item[i]">';
		         		alarmContentDiv = '<div class="alarm-list" style="padding:5px;">';
						if(alertType == "jcomment"){  //지꾸 댓글달림
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showJAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.title+' 에 댓글을 달았습니다</a></span>';
// 							alarm += '<div class="small text-gray-500" style="text-align:right;">'+value.alertCreateDate+'</div>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "jcocomment"){  //지꾸 대댓글달림
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showJAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.title+' 에 대댓글을 달았습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "jlike"){ //지꾸좋아요
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showJAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.title+' 에 좋아요 했습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
							
						}else if(alertType == "mcomment"){  //모꾸 댓글달림
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showMAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.title+' 에 댓글을 달았습니다</a></span>';
// 							alarm += '<div class="small text-gray-500" style="text-align:right;">'+value.alertCreateDate+'</div>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "mcocomment"){  //모꾸 대댓글달림
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showMAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.title+' 에 대댓글을 달았습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "mlike"){ //모꾸좋아요
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showMAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.title+' 에 좋아요 했습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "follow"){  //팔로우
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="deleteAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.toUserId+' 을 팔로우 했습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "chat"){  //채팅 
							alarm += '<span class="font-weight-bold"><a href="/chat/list"  onclick="showChatList('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.toUserId+' 에게 채팅을 보냈습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "moqoook"){  //모임요청승인 
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showMAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.toUserId+' 을 모임 멤버로 승인했습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "moqoono"){  //모임요청거절
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showMAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님은 '+value.toUserId+' 의 모임에 참여할 수 없습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						else if(alertType == "moqooreque"){  //모임신청받음
							alarm += '<span class="font-weight-bold"><a href="#"  onclick="showMAlert('+value.boardNo+',\''+value.fromUserId+'\');">'+value.fromUserId+'님이 '+value.toUserId+' 의 모임에 참가신청을 보냈습니다</a></span>';
							alarm += '<hr class="dropdown-divider">'
						}
						
						alarmCloseLi = '</div></li>';	
		         	 });
		         	$(".notifications>li").eq(1).after(alarmContentLi).append(alarmContentDiv).append(alarmCloseLi);
	         	 	$(".alarm-list").html(alarm);
	         	 	alarmContentLi = "";
	         	 	alarmContentDiv = "";
		         	alarmCloseLi = "";
		         	alarm = "";
		         	
		        }
		    });
		 }
		alarmList();
	//목록끝
	
	//목록삭제
	function showJAlert(boardNo,fromUserId){ //지꾸 댓글, 대댓글달림,  좋아요 -> 알림클릭시 페이지로 이동
		console.log("alarmClick")
		 $.ajax({
		        url : '/alert/deletealarm',
		        type : 'post',
		        data : {'boardNo':boardNo, 'fromUserId' : fromUserId },
		        dataType : "json", 
		        
		        success : function(){
		        }
		    });
		location.href="/jiqoo/detail?jiqooNo="+boardNo;
	}
	
	function showMAlert(boardNo,fromUserId){ //모꾸 댓글, 대댓글달림,  좋아요 -> 알림클릭시 페이지로 이동
		console.log("alarmClick")
		 $.ajax({
		        url : '/alert/deletealarm',
		        type : 'post',
		        data : {'boardNo':boardNo, 'fromUserId' : fromUserId },
		        dataType : "json", 
		        
		        success : function(){
		        }
		    });
		location.href="/moqoo/detail?moqooNo="+boardNo;
	}
	
	function deleteAlert(boardNo,fromUserId){ // 팔로우 (알람삭제만)
		console.log("alarmClick")
		 $.ajax({
		        url : '/alert/deletealarm',
		        type : 'post',
		        data : {'boardNo':boardNo, 'fromUserId' : fromUserId },
		        dataType : "json", 
		        
		        success : function(){
		        }
		    });
	}
	

    </script>
  </header>
  <!-- End Header -->