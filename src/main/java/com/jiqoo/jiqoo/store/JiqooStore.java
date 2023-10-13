package com.jiqoo.jiqoo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Category;
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

}
