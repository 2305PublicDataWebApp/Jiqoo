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
import com.jiqoo.user.controller.UserController;
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
		String refresh_Token = "";
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
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

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
		String requestUrl = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

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
	        System.out.println("----------properties"+properties);
	        System.out.println("----------kakao_account"+kakao_account);
	        
			String userId = kakao_account.getAsJsonObject().get("email").getAsString();
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

	        
			userInfo.put("userId", userId);
			userInfo.put("userNickname", userNickname);
	        userInfo.put("userEmail", userEmail);
	        userInfo.put("userGender", userGender);
	        
	        User kakaoUserOne = userStore.selectKakaoUser(sqlSession, userEmail);
	        if(kakaoUserOne == null) {
	        	String userPw = this.generateRandomCode();
	        	userInfo.put("userPw", userPw);
	        	User kakaoUser = new User(userId, userPw, userNickname, userNickname, userEmail, userGender);
	        	int insertResult = userStore.kakaoUserInsert(sqlSession, kakaoUser);
	        	if(insertResult > 0) {
	        		System.out.println("카카오 회원가입 성공");
	        	}
	        }
			/*
			 * String userGender =
			 * kakao_account.getAsJsonObject().get("email").getAsString(); String userBirth
			 * = (String) userInfo.get("birthday");
			 */

		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}

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

}
