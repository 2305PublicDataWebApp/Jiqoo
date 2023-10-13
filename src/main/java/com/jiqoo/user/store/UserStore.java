package com.jiqoo.user.store;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.user.domain.User;

public interface UserStore {

	/**
	 * 회원가입 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int insertUser(SqlSession sqlSession, User user);

	/**
	 * 임시비밀번호로 변경 service
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int updateUserPw(SqlSession sqlSession, User user);

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
	 * 아이디찾기 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	User selectFindId(SqlSession sqlSession, User user);

	/**
	 * 비밀번호찾기 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	User selectFindPw(SqlSession sqlSession, User user);

	/**
	 * 마이페이지 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	User selectUserOneById(SqlSession sqlSession, String userId);

}
