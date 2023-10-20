package com.jiqoo.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jiqoo.user.domain.User;
import com.jiqoo.user.service.SnsService;
import com.jiqoo.user.store.UserStore;

@Service
public class SnsServiceImpl implements SnsService {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private UserStore userStore;

	@Override
	public String getKakaoAccessToken(String code) throws Exception {
		String access_Token = "";
		/* String refresh_Token = ""; */
		String requestUrl = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(requestUrl);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=4cf9db2344d009b1a0f20e2bb100602a"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:9999/user/kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			Gson gson = new Gson();
			JsonElement element = gson.fromJson(result, JsonElement.class);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			// refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			// System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 사용자 정보 추출
	@Override
	public Map<String, Object> getKakaoInfo(String accessToken) throws Exception {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		Map<String, Object> userInfo = new HashMap<>();
		//HashMap<String, Object> userInfo = new HashMap<>(); ** 추후 Map과 HashMap 사용의 차이 확인하기 **
		String requestUrl = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리를 사용해 JSON 파싱 객체 생성
			Gson gson = new Gson();
			JsonElement element = gson.fromJson(result, JsonElement.class);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
	        //콘솔창 확인 후 필요한 정보 추출
	        System.out.println("kakao_account : "+kakao_account);
	        
			String userEmail = kakao_account.getAsJsonObject().get("email").getAsString();
			String userNickname = properties.getAsJsonObject().get("nickname").getAsString();
			String userGender = "";

	        if (kakao_account != null && kakao_account.getAsJsonObject().has("gender")) {
	            String kakaoUserGender = kakao_account.getAsJsonObject().get("gender").getAsString();
	            if(kakaoUserGender == "female") {
	            	userGender = "F";
	            } else {
	            	userGender = "M";	            	
	            }
	        }

	        
			userInfo.put("userNickname", userNickname);
	        userInfo.put("userEmail", userEmail);
	        userInfo.put("userGender", userGender);
	        
	        Map<String, Object> snsEmailMap = new HashMap<>(); // sns 가입 유저 확인을 위한 map생성
	        snsEmailMap.put("userEmail", userEmail);
	        snsEmailMap.put("platformType", "kakao");
	        
	        User kakaoUserOne = userStore.selectSnsUserByEmail(sqlSession, snsEmailMap);
	        if(kakaoUserOne == null) {
	        	String userId = "kakao";
	        	userId += this.generateRandomCode();
	        	String userPw = this.generateRandomCode();
	        	userInfo.put("userId", userId);
	        	userInfo.put("userPw", userPw);
	        	User kakaoUser = new User(userId, userPw, userNickname, userNickname, userEmail, userGender);
	        	int insertResult = userStore.kakaoUserInsert(sqlSession, kakaoUser);
	        	if(insertResult > 0) {
	        		System.out.println("카카오 회원가입 성공");
	        	}
	        }

		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}
	
	// 랜덤문자열로 비밀번호부여->사용자는 모름
	private String generateRandomCode() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder code = new StringBuilder();
		Random random = new Random();

		for (int i = 0; i < 10; i++) {
			int index = random.nextInt(characters.length());
			char randomChar = characters.charAt(index);
			code.append(randomChar);
		}

		return code.toString();
	}

	// 카카오 회원탈퇴
	public int deleteKakaoUser(String accessToken) {
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    int responseCode = 0;
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        
	        responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode); //200이면 성공
	        
	        if (responseCode == 200) { // 탈퇴 요청 성공
	        	System.out.println("카카오 회원 탈퇴 성공->DB삭제 진행ㄱㄱ");
	        } else { //탈퇴요청실패
	            BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	            String errorLine;
	            StringBuilder errorResponse = new StringBuilder();
	            
	            while ((errorLine = errorReader.readLine()) != null) {
	                errorResponse.append(errorLine);
	            }
	            
	            System.out.println("카카오 회원 탈퇴 실패");
	            System.out.println("에러 응답 본문: " + errorResponse.toString());
	        }
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("카카오 유저 고유ID : " +result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return responseCode;
	}

	// 네이버 회원탈퇴
	public int deleteNaverUser(String accessToken) {
		String clientId = "_oGGF0Z6cE3TyVNrKEhh";
		String clientSecret = "lpL1o57qHI";
		String reqURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=" + clientId 
						+ "&client_secret=" + clientSecret 
						+ "&access_token=" + accessToken 
						+ "&service_provider=NAVER";
	    int responseCode = 0;
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //conn.setRequestProperty("Authorization", "Bearer " + accessToken); 네이버 회원탈퇴시에는 필요없는 코드
	        
	        responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode); //200이면 성공
	        
	        if (responseCode == 200) { // 탈퇴 요청 성공
	        	System.out.println("네이버 회원 탈퇴 성공->DB삭제 진행");
	        } else { //탈퇴요청실패
	            BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	            String errorLine;
	            StringBuilder errorResponse = new StringBuilder();
	            
	            while ((errorLine = errorReader.readLine()) != null) {
	                errorResponse.append(errorLine);
	            }
	            
	            System.out.println("네이버 회원 탈퇴 실패");
	            System.out.println("에러 응답 본문: " + errorResponse.toString());
	        }
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("네이버 탈퇴 처리 : " +result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return responseCode;
	}

}
