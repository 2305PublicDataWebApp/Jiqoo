package com.jiqoo.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.store.FollowStore;

@Repository
public class FollowStoreLogic implements FollowStore {

	@Override
	public int insertFollow(SqlSession sqlSession, Follow follow) {
		int result = sqlSession.insert("FollowMapper.insertFollow", follow);
		return result;
	}

	@Override
	public int deleteFollow(SqlSession sqlSession, Follow follow) {
		int result = sqlSession.delete("FollowMapper.deleteFollow", follow);
		return result;
	}

}
