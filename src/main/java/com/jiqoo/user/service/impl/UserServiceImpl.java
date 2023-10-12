package com.jiqoo.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.user.domain.User;
import com.jiqoo.user.service.UserService;
import com.jiqoo.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private UserStore userStore;
	
	@Override
	public User selectCheckLogin(User user) {
		User uOne = userStore.selectCheckLogin(sqlSession, user);
		return uOne;
	}

	@Override
	public int selectCheckId(String userId) {
		int idCheck = userStore.selectCheckId(sqlSession, userId);
		return idCheck;
	}

	@Override
	public int selectCheckNickname(String userNickname) {
		int nicknameCheck = userStore.selectCheckNickname(sqlSession, userNickname);
		return nicknameCheck;
	}

	@Override
	public int selectCheckEmail(String userEmail) {
		int emailCheck = userStore.selectCheckEmail(sqlSession, userEmail);
		return emailCheck;
	}

	@Override
	public int insertUser(User user) {
		int result = userStore.insertUser(sqlSession, user);
		return result;
	}

}
