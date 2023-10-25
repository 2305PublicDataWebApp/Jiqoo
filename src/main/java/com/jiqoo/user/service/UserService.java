package com.jiqoo.user.service;

import java.util.List;
import java.util.Map;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.domain.User;
import com.jiqoo.user.domain.UserComment;
import com.jiqoo.user.domain.UserJiqooDto;
import com.jiqoo.user.domain.UserLikeDto;
import com.jiqoo.user.domain.UserMoqooDto;

public interface UserService {

	/**
	 * 회원가입 service
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	/**
	 * 회원 정보 수정 service
	 * @param user
	 * @return
	 */
	int updateUser(User user);

	/**
	 * 임시비밀번호로 변경 service
	 * @param user
	 * @return 
	 */
	int updateUserPw(User user);

	/**
	 * 회원탈퇴 service
	 * @param userId
	 * @return
	 */
	int deleteUser(String userId);

	/**
	 * 로그인 service
	 * @param user
	 * @return
	 */
	User selectCheckLogin(User user);

	/**
	 * id 중복체크 service
	 * @param userId
	 * @return
	 */
	int selectCheckId(String userId);

	/**
	 * 닉네임 중복체크 service
	 * @param userNickname
	 * @return
	 */
	int selectCheckNickname(String userNickname);

	/**
	 * 이메일 중복체크 service
	 * @param userEmail
	 * @return
	 */
	int selectCheckEmail(String userEmail);

	/**
	 * 아이디찾기 service
	 * @param user
	 * @return
	 */
	User selectFindId(User user);

	/**
	 * 비밀번호찾기 service
	 * @param user
	 * @return
	 */
	User selectFindPw(User user);

	/**
	 * 마이페이지 조회 service
	 * @param userId
	 * @return
	 */
	User selectUserOneById(String userId);

	/**
	 * 팔로워 수 조회 service
	 * @param userId
	 * @return
	 */
	int selectFollowersCount(String userId);

	/**
	 * 팔로잉 수 조회 service
	 * @param userId
	 * @return
	 */
	int selectFollowingCount(String userId);

	/**
	 * 팔로워 리스트 조회 service
	 * @param userId
	 * @return
	 */
	List<User> selectFollowersListById(String userId);

	/**
	 * 팔로잉 리스트 조회 service
	 * @param userId
	 * @return
	 */
	List<User> selectFollowingsListById(String userId);

	/**
	 * 팔로잉 여부 판단 service
	 * @param followMap
	 * @return
	 */
	int selectFollowStatus(Map<String, Object> followMap);

	/**
	 * sns 회원 탈퇴 service
	 * @param snsEmailMap
	 * @return
	 */
	int deleteSnsUser(Map<String, Object> snsIdMap);

	/**
	 *  sns 회원 조회 service
	 * @param snsEmailMap
	 * @return
	 */
	User selectSnsUserByEmail(Map<String, Object> snsEmailMap);

	/**
	 * 마이페이지 지꾸 게시물수 조회 service
	 * @param userId
	 * @return
	 */
	int selectMyJiqooCount(String userId);

	/**
	 * 마이페이지 모꾸 게시물수 조회 service
	 * @param userId
	 * @return
	 */
	int selectMyMoqooCount(String userId);

	/**
	 * 마이페이지 모꾸 댓글 수 조회 service
	 * @param userId
	 * @return
	 */
	int selectMyCommentCount(String userId);

	/**
	 * 마이페이지 댓글 리스트 조회 service
	 * @param comtMap
	 * @return
	 */
	List<UserComment> selectMyCommentList(Map<String, Object> comtMap);

	/**
	 * sns 회원 정보 수정 service
	 * @param user
	 * @return
	 */
	int updateSnsUser(User user);

	/**
	 * 마이페이지 지꾸 리스트 조회 service
	 * @param jiqooMap
	 * @return
	 */
	List<UserJiqooDto> selectMyJiqooList(Map<String, Object> jiqooMap);

	/**
	 * 마이페이지 모꾸 리스트 조회 service
	 * @param moqooMap
	 * @return
	 */
	List<UserMoqooDto> selectMyMoqooList(Map<String, Object> moqooMap);

	/**
	 * 마이페이지 좋아요 리스트 조회 service
	 * @param likeMap
	 * @return
	 */
	List<UserLikeDto> selectMyLikedPostList(Map<String, Object> likeMap);

	/**
	 * 지꾸 리스트 날짜조회 service
	 * @param jiqooMap
	 * @return
	 */
	List<UserJiqooDto> selectMyJiqooSearchList(Map<String, Object> jiqooMap);

	/**
	 * 회원 신고 service
	 * @param report
	 * @return
	 */
	int insertUserReport(Report report);

	/**
	 * 프로필사진변경 service
	 * @param user
	 * @return
	 */
	int updateUserPhoto(User user);

	/**
	 * 프로필사진삭제 service
	 * @param userId
	 * @return
	 */
	int deletePhoto(String userId);



}
