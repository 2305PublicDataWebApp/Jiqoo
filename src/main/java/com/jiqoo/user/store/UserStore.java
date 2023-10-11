package com.jiqoo.user.store;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.user.domain.User;

public interface UserStore {

	/**
	 * 로그인  Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	User selectCheckLogin(SqlSession sqlSession, User user);

}
