package com.jiqoo.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.user.domain.User;
import com.jiqoo.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

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

}
