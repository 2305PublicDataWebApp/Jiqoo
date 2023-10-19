package com.jiqoo.user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.user.domain.Follow;
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
	public int insertUser(User user) {
		int result = userStore.naverUserInsert(sqlSession, user);
		return result;
	}

	@Override
	public int updateUser(User user) {
		int result = userStore.updateUser(sqlSession, user);
		return result;
	}

	@Override
	public int updateUserPw(User user) {
		int tempPwResult = userStore.updateUserPw(sqlSession, user);
		return tempPwResult;
	}

	@Override
	public int deleteUser(String userId) {
		int result = userStore.deleteUser(sqlSession, userId);
		return result;
	}

	@Override
	public int deleteKakaoUser(String userId) {
		int result = userStore.deleteKakaoUser(sqlSession, userId);
		return result;
	}

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
	public User selectFindId(User user) {
		User uOne = userStore.selectFindId(sqlSession, user);
		return uOne;
	}

	@Override
	public User selectFindPw(User user) {
		User uOne = userStore.selectFindPw(sqlSession, user);
		return uOne;
	}

	@Override
	public User selectUserOneById(String userId) {
		User user = userStore.selectUserOneById(sqlSession, userId);
		return user;
	}

	@Override
	public int selectFollowersCount(String userId) {
		int followersCount = userStore.selectFollowersCount(sqlSession, userId);
		return followersCount;
	}

	@Override
	public int selectFollowingCount(String userId) {
		int followingCount = userStore.selectFollowingCount(sqlSession, userId);
		return followingCount;
	}

	@Override
	public List<User> selectFollowersListById(String userId) {
		List<User> followersList = userStore.selectFollowersListById(sqlSession, userId);
		return followersList;
	}

	@Override
	public List<User> selectFollowingsListById(String userId) {
		List<User> followingsList = userStore.selectFollowingsListById(sqlSession, userId);
		return followingsList;
	}

	@Override
	public int selectFollowStatus(Map<String, Object> followMap) {
		int isFollowing = userStore.selectFollowStatus(sqlSession, followMap);
		return isFollowing;
	}


}
