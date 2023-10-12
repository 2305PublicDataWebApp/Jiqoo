package com.jiqoo.user.service;

import com.jiqoo.user.domain.User;

public interface UserService {

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

}
