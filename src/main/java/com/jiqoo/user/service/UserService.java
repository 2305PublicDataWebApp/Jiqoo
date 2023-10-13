package com.jiqoo.user.service;

import com.jiqoo.user.domain.User;

public interface UserService {

	/**
	 * 회원가입 service
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	/**
	 * 임시비밀번호로 변경 service
	 * @param user
	 * @return 
	 */
	int updateUserPw(User user);

	/**
	 * 로그인 service
	 * @param user
	 * @return
	 */
	User selectCheckLogin(User user);

	/**
	 * id 중복체크 service
	 * @param userId
	 * @return
	 */
	int selectCheckId(String userId);

	/**
	 * 닉네임 중복체크 service
	 * @param userNickname
	 * @return
	 */
	int selectCheckNickname(String userNickname);

	/**
	 * 이메일 중복체크 service
	 * @param userEmail
	 * @return
	 */
	int selectCheckEmail(String userEmail);

	/**
	 * 아이디찾기 service
	 * @param user
	 * @return
	 */
	User selectFindId(User user);

	/**
	 * 비밀번호찾기 service
	 * @param user
	 * @return
	 */
	User selectFindPw(User user);

	/**
	 * 마이페이지 조회 service
	 * @param userId
	 * @return
	 */
	User selectUserOneById(String userId);

}
