package com.jiqoo.user.service;

import java.util.List;
import java.util.Map;

import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.domain.User;

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



}
