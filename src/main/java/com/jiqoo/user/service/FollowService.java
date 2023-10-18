package com.jiqoo.user.service;

import com.jiqoo.user.domain.Follow;

public interface FollowService {

	/**
	 * 팔로우 service
	 * @param follow
	 * @return
	 */
	int insertFollow(Follow follow);

	/**
	 * 언팔로우 service
	 * @param follow
	 * @return
	 */
	int deleteFollow(Follow follow);

}
