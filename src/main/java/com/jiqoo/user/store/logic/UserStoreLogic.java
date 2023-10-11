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

}
