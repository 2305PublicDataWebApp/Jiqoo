package com.jiqoo.admin.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

public interface AdminStore {

	/**
	 * 회원관리페이지 총게시물수
	 * 
	 * @param sqlSession
	 * @return
	 */
	public Integer getUserListCount(SqlSession sqlSession);

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 * 
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	public List<User> selectAllUser(SqlSession sqlSession, PageInfo pInfo);

	/**
	 * 회원리스트 검색 총 게시물 수
	 * 
	 * @param sqlSession
	 * @param paramMap
	 * @return
	 */
	public Integer getUserSearchListCount(SqlSession sqlSession, Map<String, String> paramMap);

	/**
	 * 회원 검색결과 리스트(+페이징)
	 * 
	 * @param sqlSession
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	public List<User> searchUserByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 회원 상세조회
	 * 
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public User selectUserByUserId(SqlSession sqlSession, String userId);

	/**
	 * 회원 강제탈퇴
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public Integer deleteUserByAdmin(SqlSession sqlSession, String userId);

	public Integer reviveUserByAdmin(SqlSession sqlSession, String userId);

	/**
	 * 회원별 총 지꾸수
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	public Integer getUserJiqooListCount(SqlSession sqlSession, String jiqooWriter);

	/**
	 * 회원별 지꾸 리스트 
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	public List<Jiqoo> showUserJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo, String userId);

	/**
	 * 회원별 모꾸수
	 * @param sqlSession
	 * @param moqooWriter
	 * @return
	 */
	public Integer getUserMoqooListCount(SqlSession sqlSession, String moqooWriter);

	/**
	 * 회원별 모꾸 리스트 
	 * @param sqlSession
	 * @param pInfoMoqoo
	 * @param userId
	 * @return
	 */
	public List<Moqoo> showUserMoqooList(SqlSession sqlSession, PageInfo pInfoMoqoo, String userId);



}
