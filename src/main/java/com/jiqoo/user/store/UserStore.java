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

	/**
	 * id 중복체크 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectCheckId(SqlSession sqlSession, String userId);

	/**
	 * 닉네임 중복체크 Store
	 * @param sqlSession
	 * @param userNickname
	 * @return
	 */
	int selectCheckNickname(SqlSession sqlSession, String userNickname);

	/**
	 * 이메일 중복체크 Store
	 * @param sqlSession
	 * @param userEmail
	 * @return
	 */
	int selectCheckEmail(SqlSession sqlSession, String userEmail);

	/**
	 * 회원가입 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int insertUser(SqlSession sqlSession, User user);

}
