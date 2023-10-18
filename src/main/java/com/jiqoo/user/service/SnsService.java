package com.jiqoo.user.service;

import java.util.Map;

public interface SnsService {

	/**
	 * 카카오 AccessToken 받기 service
	 * @param code
	 * @return
	 */
	String getKakaoAccessToken(String code) throws Exception;

	/**
	 * 카카오 사용자 정보 가져오기 service
	 * @param accessToken
	 * @return
	 */
	Map<String, Object> getKakaoInfo(String accessToken) throws Exception;

	/**
	 * 카카오 로그아웃 service
	 * @param accessToken
	 */
	int kakaoLogout(String accessToken);

	/**
	 * 카카오 회원탈퇴 service
	 * @param attribute
	 */
	int deleteKakaoUser(String attribute);


}
