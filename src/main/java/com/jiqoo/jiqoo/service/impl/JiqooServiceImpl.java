package com.jiqoo.jiqoo.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.Category;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.service.JiqooService;
import com.jiqoo.jiqoo.store.JiqooStore;
import com.jiqoo.user.domain.User;

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

}
