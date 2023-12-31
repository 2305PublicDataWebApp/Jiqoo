package com.jiqoo.user.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.User;
import com.jiqoo.user.domain.UserComment;
import com.jiqoo.user.domain.UserJiqooDto;
import com.jiqoo.user.domain.UserLikeDto;
import com.jiqoo.user.domain.UserMoqooDto;
import com.jiqoo.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int insertUser(SqlSession sqlSession, User user) {
		int result = sqlSession.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int updateUser(SqlSession sqlSession, User user) {
		int result = sqlSession.update("UserMapper.updateUser", user);
		return result;
	}

	@Override
	public int updateUserPw(SqlSession sqlSession, User user) {
		int tempPwResult = sqlSession.update("UserMapper.updateUserPw", user);
		return tempPwResult;
	}

	@Override
	public int deleteUser(SqlSession sqlSession, String userId) {
		int result = sqlSession.update("UserMapper.deleteUser", userId);
		return result;
	}

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

	@Override
	public int selectCheckEmail(SqlSession sqlSession, String userEmail) {
		int emailCheck = sqlSession.selectOne("UserMapper.selectCheckEmail", userEmail);
		return emailCheck;
	}

	@Override
	public User selectFindId(SqlSession sqlSession, User user) {
		User uOne = sqlSession.selectOne("UserMapper.selectFindId", user);
		return uOne;
	}

	@Override
	public User selectFindPw(SqlSession sqlSession, User user) {
		User uOne = sqlSession.selectOne("UserMapper.selectFindPw", user);
		return uOne;
	}

	@Override
	public User selectUserOneById(SqlSession sqlSession, String userId) {
		User user = sqlSession.selectOne("UserMapper.selectUserOneById", userId);
		return user;
	}

	@Override
	public int selectFollowersCount(SqlSession sqlSession, String userId) {
		int followersCount = sqlSession.selectOne("FollowMapper.selectFollowersCount", userId);
		return followersCount;
	}

	@Override
	public int selectFollowingCount(SqlSession sqlSession, String userId) {
		int followingCount = sqlSession.selectOne("FollowMapper.selectFollowingCount", userId);
		return followingCount;
	}

	@Override
	public List<User> selectFollowersListById(SqlSession sqlSession, String userId) {
		List<User> followersList = sqlSession.selectList("UserMapper.selectFollowersListById", userId);
		return followersList;
	}

	@Override
	public List<User> selectFollowingsListById(SqlSession sqlSession, String userId) {
		List<User> followingsList = sqlSession.selectList("UserMapper.selectFollowingsListById", userId);
		return followingsList;
	}


	@Override
	public int selectFollowStatus(SqlSession sqlSession, Map<String, Object> followMap) {
		int isFollowing = sqlSession.selectOne("FollowMapper.selectFollowStatus", followMap);
		return isFollowing;
	}


	@Override
	public User selectSnsUserByEmail(SqlSession sqlSession, Map<String, Object> snsEmailMap) {
		User snsUser = sqlSession.selectOne("UserMapper.selectSnsUserByEmail", snsEmailMap);
		return snsUser;
	}

	@Override
	public int kakaoUserInsert(SqlSession sqlSession, User kakaoUser) {
		int result = sqlSession.insert("UserMapper.kakaoUserInsert", kakaoUser);
		return result;
	}

	@Override
	public int deleteSnsUser(SqlSession sqlSession, Map<String, Object> snsIdMap) {
		int result = sqlSession.delete("UserMapper.deleteSnsUser", snsIdMap);
		return result;
	}

	@Override
	public int naverUserInsert(SqlSession sqlSession, User naverUser) {
		int result = sqlSession.insert("UserMapper.naverUserInsert", naverUser);
		return result;
	}

	@Override
	public int selectMyJiqooCount(SqlSession sqlSession, String userId) {
		int myJiqooCount = sqlSession.selectOne("UserMapper.selectMyJiqooCount", userId);
		return myJiqooCount;
	}

	@Override
	public int selectMyMoqooCount(SqlSession sqlSession, String userId) {
		int myMoqooCount = sqlSession.selectOne("UserMapper.selectMyMoqooCount", userId);
		return myMoqooCount;
	}

	@Override
	public int selectMyCommentCount(SqlSession sqlSession, String userId) {
		int myMoqooCount = sqlSession.selectOne("UserMapper.selectMyCommentCount", userId);
		return myMoqooCount;
	}

	@Override
	public List<UserComment> selectMyCommentList(SqlSession sqlSession, Map<String, Object> comtMap) {
		List<UserComment> myCommentList = sqlSession.selectList("UserMapper.selectMyCommentList", comtMap);
		return myCommentList;
	}

	@Override
	public int updateSnsUser(SqlSession sqlSession, User user) {
		int result = sqlSession.update("UserMapper.updateSnsUser", user);
		return result;
	}

	@Override
	public List<UserJiqooDto> selectMyJiqooList(SqlSession sqlSession, Map<String, Object> jiqooMap) {
		List<UserJiqooDto> myJiqooList = sqlSession.selectList("UserMapper.selectMyJiqooList", jiqooMap);
		return myJiqooList;
	}

	@Override
	public List<UserMoqooDto> selectMyMoqooList(SqlSession sqlSession, Map<String, Object> moqooMap) {
		List<UserMoqooDto> myMoqooList = sqlSession.selectList("UserMapper.selectMyMoqooList", moqooMap);
		return myMoqooList;
	}

	@Override
	public List<UserLikeDto> selectMyLikedPostList(SqlSession sqlSession, Map<String, Object> likeMap) {
		List<UserLikeDto> likedList = sqlSession.selectList("UserMapper.selectMyLikedPostList", likeMap);
		return likedList;
	}

	@Override
	public List<UserJiqooDto> selectMyJiqooSearchList(SqlSession sqlSession, Map<String, Object> jiqooMap) {
		List<UserJiqooDto> jiqooSearchList = sqlSession.selectList("UserMapper.selectMyJiqooSearchList", jiqooMap);
		return jiqooSearchList;
	}

	@Override
	public int insertUserReport(SqlSession sqlSession, Report report) {
		int result = sqlSession.insert("UserMapper.insertUserReport", report);
		return result;
	}

	@Override
	public int updateUserPhoto(SqlSession sqlSession, User user) {
		int result = sqlSession.update("UserMapper.updateUserPhoto", user);
		return result;
	}

	@Override
	public int deletePhoto(SqlSession sqlSession, String userId) {
		int result = sqlSession.update("UserMapper.deletePhoto", userId);
		return result;
	}


}
