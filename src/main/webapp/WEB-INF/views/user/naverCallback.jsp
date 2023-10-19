<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<script type="text/javascript">
			var naver_id_login = new naver_id_login("_oGGF0Z6cE3TyVNrKEhh", "http://localhost:9999/user/naverCallback");
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			console.log('콜백실행')  
		  
		  
		 function naverSignInCallback() {
		    const accessToken = naver_id_login.oauthParams.access_token;
		    const id = naver_id_login.getProfileData('id');
		    const userName = naver_id_login.getProfileData('name');
		    const userNickname = naver_id_login.getProfileData('nickname');
		    const userEmail = naver_id_login.getProfileData('email');
		    const userGender = naver_id_login.getProfileData('gender');
		    const birthday = naver_id_login.getProfileData('birthday');
		    const birthyear = naver_id_login.getProfileData('birthyear');
			
		    // JSON 형태로 정보 저장
			const naverUserInfo = {
				accessToken: accessToken,
				id: id,
				userName: userName,
				userNickname: userNickname,
				userEmail: userEmail,
				userGender: userGender,
				birthday: birthday,
				birthyear: birthyear
			};
			console.log(naverUserInfo);
 			$.ajax({
				type: 'POST',
				url: '/user/naver', 
				data: JSON.stringify(naverUserInfo), // JSON객체 전달
				contentType: 'application/json',
				success: function(result) {
					if(result === 'insert') {
						alert("네이버 회원가입 성공! 로그인 후 이용해주세요");
						window.location.href="/";   
					} else if(result === 'success'){
						alert("지꾸에 오신 것을 환영합니다!");
						window.location.href="/";   
					} else {
						alert("[서버오류] 관리자 문의바랍니다.");
					}
				}, 
				error: function(error) {
					console.log("[서버오류] 관리자 문의바랍니다.");
					console.log(error);
					window.location.href="/user/login";   
					 
				} 
			});
		  }
		  
		  	
		  
	</script>
	
</body>
</html>