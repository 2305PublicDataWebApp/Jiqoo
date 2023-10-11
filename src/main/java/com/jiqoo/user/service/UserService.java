package com.jiqoo.user.service;

import com.jiqoo.user.domain.User;

public interface UserService {

	/**
	 * 로그인 service
	 * @param user
	 * @return
	 */
	User selectCheckLogin(User user);

}
