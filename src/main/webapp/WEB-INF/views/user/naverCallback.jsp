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
		    const userName = naver_id_login.getProfileData('name');
		    const userNickname = naver_id_login.getProfileData('nickname');
		    const userEmail = naver_id_login.getProfileData('email');
		    const userGender = naver_id_login.getProfileData('gender');
		    const birthday = naver_id_login.getProfileData('birthday');
		    const birthyear = naver_id_login.getProfileData('birthyear');
			
		    // JSON 형태로 정보 저장
			const naverUserInfo = {
				accessToken: accessToken,
				userName: userName,
				userNickname: userNickname,
				userEmail: userEmail,
				userGender: userGender,
				birthday: birthday,
				birthyear: birthyear
			};
			
 			$.ajax({
				type: 'POST',
				url: '/user/naver', 
				data: naverUserInfo, // JSON객체 전달
				dataType: 'text',
				success: function(result) {
					if(result == 1) {
						console.log('성공')
						closePopupAndRedirect(); 
					} else  {
						window.close();
					}
				}, 
				error: function(result) {
					window.close();
				} 
			});
		  }
		  
		  	
		  
	</script>
	
</body>
</html>