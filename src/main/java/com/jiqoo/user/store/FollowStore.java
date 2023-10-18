package com.jiqoo.user.store;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.user.domain.Follow;

public interface FollowStore {
	
	/**
	 * 팔로우 store
	 * @param sqlSession
	 * @param follow
	 * @return
	 */
	int insertFollow(SqlSession sqlSession, Follow follow);

	/**
	 * 언팔로우 store
	 * @param sqlSession
	 * @param follow
	 * @return
	 */
	int deleteFollow(SqlSession sqlSession, Follow follow);

}
