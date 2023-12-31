package com.jiqoo.user.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.domain.User;
import com.jiqoo.user.domain.UserComment;
import com.jiqoo.user.domain.UserJiqooDto;
import com.jiqoo.user.domain.UserLikeDto;
import com.jiqoo.user.domain.UserMoqooDto;

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
	 * Sns 회원 탈퇴 Store
	 * @param sqlSession
	 * @param snsIdMap
	 * @return
	 */
	int deleteSnsUser(SqlSession sqlSession, Map<String, Object> snsIdMap);

	/**
	 * 네이버 회원 가입 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int naverUserInsert(SqlSession sqlSession, User naverUser);

	/**
	 * 마이페이지 지꾸 게시물수 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectMyJiqooCount(SqlSession sqlSession, String userId);

	/**
	 * 마이페이지 모꾸 게시물수 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectMyMoqooCount(SqlSession sqlSession, String userId);

	/**
	 * 마이페이지 댓글 수 조회 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int selectMyCommentCount(SqlSession sqlSession, String userId);

	/**
	 * 마이페이지 댓글 리스트 조회 Store
	 * @param sqlSession
	 * @param comtMap
	 * @return
	 */
	List<UserComment> selectMyCommentList(SqlSession sqlSession, Map<String, Object> comtMap);

	/**
	 * sns 회원 정보 수정 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int updateSnsUser(SqlSession sqlSession, User user);

	/**
	 * 마이페이지 지꾸 리스트 조회 Store
	 * @param sqlSession
	 * @param jiqooMap
	 * @return
	 */
	List<UserJiqooDto> selectMyJiqooList(SqlSession sqlSession, Map<String, Object> jiqooMap);

	/**
	 * 마이페이지 모꾸 리스트 조회 Store
	 * @param sqlSession
	 * @param moqooMap
	 * @return
	 */
	List<UserMoqooDto> selectMyMoqooList(SqlSession sqlSession, Map<String, Object> moqooMap);

	/**
	 * 마이페이지 좋아요 리스트 조회 Store
	 * @param sqlSession
	 * @param likeMap
	 * @return
	 */
	List<UserLikeDto> selectMyLikedPostList(SqlSession sqlSession, Map<String, Object> likeMap);

	/**
	 * 마이페이지 날짜 리스트 조회 Store
	 * @param sqlSession
	 * @param jiqooMap
	 * @return
	 */
	List<UserJiqooDto> selectMyJiqooSearchList(SqlSession sqlSession, Map<String, Object> jiqooMap);

	/**
	 * 회원 신고 Store
	 * @param sqlSession
	 * @param report
	 * @return
	 */
	int insertUserReport(SqlSession sqlSession, Report report);

	/**
	 * 프로필 사진 변경 Store
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	int updateUserPhoto(SqlSession sqlSession, User user);

	/**
	 * 프로필 사진 삭제 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	int deletePhoto(SqlSession sqlSession, String userId);

}
