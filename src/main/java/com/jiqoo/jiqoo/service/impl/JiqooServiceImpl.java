package com.jiqoo.jiqoo.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.Category;
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

}
