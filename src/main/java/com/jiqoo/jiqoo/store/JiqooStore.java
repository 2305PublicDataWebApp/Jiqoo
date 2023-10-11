package com.jiqoo.jiqoo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Category;
import com.jiqoo.jiqoo.domain.Jiqoo;

public interface JiqooStore {

	/**
	 * 지꾸 게시물 작성 Store
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	int insertJiqoo(SqlSession sqlSession, Jiqoo jiqoo);

	/**
	 * 카테고리 리스트 불러오기 Store
	 * @param sqlSession
	 * @return
	 */
	List<Category> selectCategoryList(SqlSession sqlSession);

}
