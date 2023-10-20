package com.jiqoo.jiqoo.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.user.domain.User;

public interface JiqooStore {

	/**
	 * 지꾸 게시물 작성 Store
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	int insertJiqoo(SqlSession sqlSession, Jiqoo jiqoo);

	/**
	 * 카테고리 리스트 조회 Store
	 * @param sqlSession
	 * @return
	 */
	List<Category> selectCategoryList(SqlSession sqlSession);

	/**
	 * 지꾸 게시물 상세 조회 Store
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	Jiqoo selectOneByNo(SqlSession sqlSession, int jiqooNo);

	/**
	 * 게시물 좋아요수 Store
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	int selectLikeCountByNo(SqlSession sqlSession, int jiqooNo);

	/**
	 * 카테고리 이미지 조회 Store
	 * @param jiqooCName
	 * @return
	 */
	Category selectCategoryByNo(SqlSession sqlSession, String jiqooCName);

	/**
	 * 게시물 전체 리스트 조회 Store
	 * @param sqlSession
	 * @return
	 */
	List<Jiqoo> selectJiqooAllList(SqlSession sqlSession);

	/**
	 * 지꾸 본인 리스트 조회 Store
	 * @param sqlSession
	 * @param userId 
	 * @return
	 */
	List<Jiqoo> selectJiqooMyList(SqlSession sqlSession, String userId);

	/**
	 * 지꾸 삭제 Store
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	int deleteJiqoo(SqlSession sqlSession, int jiqooNo);

	/**
	 * 지꾸 업데이트 Store
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	int updateJiqoo(SqlSession sqlSession, Jiqoo jiqoo);

	/**
	 * 지꾸 조회수 증가 Store
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	int updateJiqooCount(SqlSession sqlSession, int jiqooNo);

	/**
	 *  지꾸 검색 Store
	 * @param sqlSession
	 * @param params 
	 * @return
	 */
	List<Jiqoo> selectJiqooSearchList(SqlSession sqlSession, Map<String, Object> params);

	/**
	 * 좋아요 여부 판단 Store
	 * @param sqlSession
	 * @param like
	 * @return
	 */
	int selectLikeOrNot(SqlSession sqlSession, Like like);

	/**
	 * 좋아요 Store
	 * @param sqlSession
	 * @param like
	 * @return
	 */
	int insertLike(SqlSession sqlSession, Like like);

	/**
	 * 좋아요 취소 Store
	 * @param sqlSession
	 * @param like
	 * @return
	 */
	int deleteLike(SqlSession sqlSession, Like like);

	/**
	 * 초기 전체 리스트 Store
	 * @param sqlSession
	 * @return
	 */
	List<Jiqoo> loadInitialJiqooAllList(SqlSession sqlSession);

	/**
	 * 전체 리스트 무한스크롤 Store
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Jiqoo> loadMoreJiqooAllList(SqlSession sqlSession, Map<String, Object> params);

	/**
	 * 초기 본인 리스트 Store
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	List<Jiqoo> loadInitialJiqooMyList(SqlSession sqlSession, String userId);

	/**
	 * 본인 리스트 무한스크롤 Store
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Jiqoo> loadMoreJiqooMyList(SqlSession sqlSession, Map<String, Object> params);

	/**
	 * 초기 검색 리스트 Store
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Jiqoo> loadInitialJiqooSearchList(SqlSession sqlSession, Map<String, Object> params);

	/**
	 * 검색 리스트 무한스크롤 Store
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Jiqoo> loadMoreJiqooSearchList(SqlSession sqlSession, Map<String, Object> params);

}
