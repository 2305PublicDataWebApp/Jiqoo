package com.jiqoo.jiqoo.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.service.JiqooService;
import com.jiqoo.jiqoo.store.JiqooStore;

@Service
public class JiqooServiceImpl implements JiqooService{

	@Autowired
	private JiqooStore jiqooStore;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertJiqoo(Jiqoo jiqoo) {
		int result = jiqooStore.insertJiqoo(sqlSession, jiqoo);
		return result;
	}

	@Override
	public List<Category> selectCategoryList() {
		List<Category> categoryList = jiqooStore.selectCategoryList(sqlSession);
		return categoryList;
	}

	@Override
	public Jiqoo selectOneByNo(int jiqooNo) {
		Jiqoo jiqoo = jiqooStore.selectOneByNo(sqlSession, jiqooNo);
		return jiqoo;
	}

	@Override
	public int selectLikeCountByNo(int jiqooNo) {
		int result = jiqooStore.selectLikeCountByNo(sqlSession, jiqooNo);
		return result;
	}

	@Override
	public Category selectCategoryByNo(String jiqooCName) {
		Category category = jiqooStore.selectCategoryByNo(sqlSession, jiqooCName);
		return category;
	}

	@Override
	public List<Jiqoo> selectJiqooAllList() {
		List<Jiqoo> jiqooList = jiqooStore.selectJiqooAllList(sqlSession);
		return jiqooList;
	}

	@Override
	public List<Jiqoo> selectJiqooMyList(String userId) {
		List<Jiqoo> jiqooList = jiqooStore.selectJiqooMyList(sqlSession, userId);
		return jiqooList;
	}

	@Override
	public int deleteJiqoo(int jiqooNo) {
		int result = jiqooStore.deleteJiqoo(sqlSession, jiqooNo);
		return result;
	}

	@Override
	public int updateJiqoo(Jiqoo jiqoo) {
		int result = jiqooStore.updateJiqoo(sqlSession, jiqoo);
		return result;
	}

	@Override
	public int updateJiqooCount(int jiqooNo) {
		return jiqooStore.updateJiqooCount(sqlSession, jiqooNo);
		
	}

	@Override
	public List<Jiqoo> selectJiqooSearchList(Map<String, Object> params) {
		List<Jiqoo> jiqooSearchList = jiqooStore.selectJiqooSearchList(sqlSession, params);
		return jiqooSearchList;
	}

	@Override
	public int selectLikeOrNot(Like like) {
		int result = jiqooStore.selectLikeOrNot(sqlSession, like);
		return result;
	}

	@Override
	public int insertLike(Like like) {
		int result = jiqooStore.insertLike(sqlSession, like);
		return result;
	}

	@Override
	public int deleteLike(Like like) {
		int result = jiqooStore.deleteLike(sqlSession, like);
		return result;
	}

	@Override
	public List<Jiqoo> loadInitialJiqooAllList() {
		List<Jiqoo> list = jiqooStore.loadInitialJiqooAllList(sqlSession);
		return list;
	}

	@Override
	public List<Jiqoo> loadMoreJiqooMyList(Map<String, Object> params) {
		List<Jiqoo> list = jiqooStore.loadMoreJiqooAllList(sqlSession, params);
		return list;
	}

	@Override
	public List<Jiqoo> loadInitialJiqooMyList(String userId) {
		List<Jiqoo> list = jiqooStore.loadInitialJiqooMyList(sqlSession, userId);
		return list;
	}

	@Override
	public List<Jiqoo> loadMoreJiqooAllList(Map<String, Object> params) {
		List<Jiqoo> list = jiqooStore.loadMoreJiqooMyList(sqlSession, params);
		return list;
	}

	@Override
	public List<Jiqoo> loadInitialJiqooSearchList(Map<String, Object> params) {
		List<Jiqoo> list = jiqooStore.loadInitialJiqooSearchList(sqlSession, params);
		return list;
	}

	@Override
	public List<Jiqoo> loadMoreJiqooSearchList(Map<String, Object> params) {
		List<Jiqoo> list = jiqooStore.loadMoreJiqooSearchList(sqlSession, params);
		return list;
	}



}
