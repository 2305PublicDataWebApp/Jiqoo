package com.jiqoo.admin.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.PageInfo;
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

}
