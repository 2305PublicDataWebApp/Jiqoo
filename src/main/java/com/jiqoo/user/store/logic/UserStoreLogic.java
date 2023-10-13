package com.jiqoo.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.user.domain.User;
import com.jiqoo.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int insertUser(SqlSession sqlSession, User user) {
		int result = sqlSession.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public User selectCheckLogin(SqlSession sqlSession, User user) {
		User uOne = sqlSession.selectOne("UserMapper.selectCheckLogin", user);
		return uOne;
	}

	@Override
	public int selectCheckId(SqlSession sqlSession, String userId) {
		int idCheck = sqlSession.selectOne("UserMapper.selectCheckId", userId);
		return idCheck;
	}

	@Override
	public int selectCheckNickname(SqlSession sqlSession, String userNickname) {
		int nicknameCheck = sqlSession.selectOne("UserMapper.selectCheckNickname", userNickname);
		return nicknameCheck;
	}

	@Override
	public int selectCheckEmail(SqlSession sqlSession, String userEmail) {
		int emailCheck = sqlSession.selectOne("UserMapper.selectCheckEmail", userEmail);
		return emailCheck;
	}

	@Override
	public User selectFindId(SqlSession sqlSession, User user) {
		User uOne = sqlSession.selectOne("UserMapper.selectFindId", user);
		return uOne;
	}

	@Override
	public User selectFindPw(SqlSession sqlSession, User user) {
		User uOne = sqlSession.selectOne("UserMapper.selectFindPw", user);
		return uOne;
	}

	@Override
	public int updateUserPw(SqlSession sqlSession, User user) {
		int tempPwResult = sqlSession.update("UserMapper.updateUserPw", user);
		return tempPwResult;
	}

	@Override
	public User selectUserOneById(SqlSession sqlSession, String userId) {
		User user = sqlSession.selectOne("UserMapper.selectUserOneById", userId);
		return user;
	}

}
