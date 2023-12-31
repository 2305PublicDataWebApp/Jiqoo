package com.jiqoo.user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.User;
import com.jiqoo.user.domain.UserComment;
import com.jiqoo.user.domain.UserJiqooDto;
import com.jiqoo.user.domain.UserLikeDto;
import com.jiqoo.user.domain.UserMoqooDto;
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
	public int deleteSnsUser(Map<String, Object> snsIdMap) {
		int result = userStore.deleteSnsUser(sqlSession, snsIdMap);
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

	@Override
	public User selectSnsUserByEmail(Map<String, Object> snsEmailMap) {
		User snsUser = userStore.selectSnsUserByEmail(sqlSession, snsEmailMap);
		return snsUser;
	}

	@Override
	public int selectMyJiqooCount(String userId) {
		int myJiqooCount = userStore.selectMyJiqooCount(sqlSession, userId);
		return myJiqooCount;
	}

	@Override
	public int selectMyMoqooCount(String userId) {
		int myMiqooCount = userStore.selectMyMoqooCount(sqlSession, userId);
		return myMiqooCount;
	}

	@Override
	public int selectMyCommentCount(String userId) {
		int myCommentCount = userStore.selectMyCommentCount(sqlSession, userId);
		return myCommentCount;
	}

	@Override
	public List<UserComment> selectMyCommentList(Map<String, Object> comtMap) {
		List<UserComment> myCommentList = userStore.selectMyCommentList(sqlSession, comtMap);
		return myCommentList;
	}

	@Override
	public int updateSnsUser(User user) {
		int result = userStore.updateSnsUser(sqlSession, user);
		return result;
	}

	@Override
	public List<UserJiqooDto> selectMyJiqooList(Map<String, Object> jiqooMap) {
		List<UserJiqooDto> myJiqooList = userStore.selectMyJiqooList(sqlSession, jiqooMap);
		return myJiqooList;
	}

	@Override
	public List<UserMoqooDto> selectMyMoqooList(Map<String, Object> moqooMap) {
		List<UserMoqooDto> myMoqooList = userStore.selectMyMoqooList(sqlSession, moqooMap);
		return myMoqooList;
	}

	@Override
	public List<UserLikeDto> selectMyLikedPostList(Map<String, Object> likeMap) {
		List<UserLikeDto> likedList = userStore.selectMyLikedPostList(sqlSession, likeMap);
		return likedList;
	}

	@Override
	public List<UserJiqooDto> selectMyJiqooSearchList(Map<String, Object> jiqooMap) {
		List<UserJiqooDto> myJiqooSearchList = userStore.selectMyJiqooSearchList(sqlSession, jiqooMap);
		return myJiqooSearchList;
	}

	@Override
	public int insertUserReport(Report report) {
		int result = userStore.insertUserReport(sqlSession, report);
		return result;
	}

	@Override
	public int updateUserPhoto(User user) {
		int result = userStore.updateUserPhoto(sqlSession, user);
		return result;
	}

	@Override
	public int deletePhoto(String userId) {
		int result = userStore.deletePhoto(sqlSession, userId);
		return result;
	}


}
