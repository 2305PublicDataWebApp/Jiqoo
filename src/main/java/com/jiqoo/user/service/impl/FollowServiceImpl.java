package com.jiqoo.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.service.FollowService;
import com.jiqoo.user.store.FollowStore;

@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private FollowStore followStore;
	
	@Override
	public int insertFollow(Follow follow) {
		int result = followStore.insertFollow(sqlSession, follow);
		return result;
	}

	@Override
	public int deleteFollow(Follow follow) {
		int result = followStore.deleteFollow(sqlSession, follow);
		return result;
	}
	
}
