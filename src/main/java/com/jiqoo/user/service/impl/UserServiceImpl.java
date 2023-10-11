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

}
