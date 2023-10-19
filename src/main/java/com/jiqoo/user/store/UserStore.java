package com.jiqoo.user.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.domain.User;

public interface UserStore {

	/**
	 * 회원가입 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int insertUser(SqlSession sqlSession, User user);

	/**
	 * 회원 정보 수정 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int updateUser(SqlSession sqlSession, User user);

	/**
	 * 임시비밀번호로 변경 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int updateUserPw(SqlSession sqlSession, User user);

	/**
	 * 회원탈퇴 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int deleteUser(SqlSession sqlSession, String userId);

	/**
	 * 로그인  Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	User selectCheckLogin(SqlSession sqlSession, User user);

	/**
	 * id 중복체크 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectCheckId(SqlSession sqlSession, String userId);

	/**
	 * 닉네임 중복체크 Store
	 * @param sqlSession
	 * @param userNickname
	 * @return
	 */
	int selectCheckNickname(SqlSession sqlSession, String userNickname);

	/**
	 * 이메일 중복체크 Store
	 * @param sqlSession
	 * @param userEmail
	 * @return
	 */
	int selectCheckEmail(SqlSession sqlSession, String userEmail);

	/**
	 * 아이디찾기 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	User selectFindId(SqlSession sqlSession, User user);

	/**
	 * 비밀번호찾기 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	User selectFindPw(SqlSession sqlSession, User user);

	/**
	 * 마이페이지 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	User selectUserOneById(SqlSession sqlSession, String userId);

	/**
	 * 팔로워 수 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectFollowersCount(SqlSession sqlSession, String userId);

	/**
	 * 팔로잉 수 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectFollowingCount(SqlSession sqlSession, String userId);

	/**
	 * 팔로워 리스트 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	List<User> selectFollowersListById(SqlSession sqlSession, String userId);

	/**
	 * 팔로잉 리스트 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	List<User> selectFollowingsListById(SqlSession sqlSession, String userId);

	/**
	 * 팔로잉 여부 판단 Store
	 * @param sqlSession
	 * @param followMap
	 * @return
	 */
	int selectFollowStatus(SqlSession sqlSession, Map<String, Object> followMap);

	/**
	 * sns 회원 조회 Store
	 * @param sqlSession 
	 * @param snsEmailMap
	 * @return
	 */
	User selectSnsUserByEmail(SqlSession sqlSession, Map<String, Object> snsEmailMap);

	/**
	 * 카카오 회원 가입 Store
	 * @param sqlSession 
	 * @param kakaoUser
	 * @return
	 */
	public int kakaoUserInsert(SqlSession sqlSession, User kakaoUser);

	/**
	 * 카카오 회원 탈퇴 Store
	 * @param sqlSession
	 * @param snsEmailMap
	 * @return
	 */
	int deleteKakaoUser(SqlSession sqlSession, Map<String, Object> snsEmailMap);

	/**
	 * 네이버 회원 가입 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int naverUserInsert(SqlSession sqlSession, User naverUser);

}
