package com.jiqoo.jiqoo.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Category;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.store.JiqooStore;

@Repository
public class JiqooStoreLogic implements JiqooStore{

	@Override
	public int insertJiqoo(SqlSession sqlSession, Jiqoo jiqoo) {
		int result = sqlSession.insert("JiqooMapper.insertJiqoo", jiqoo);
		return result;
	}

	@Override
	public List<Category> selectCategoryList(SqlSession sqlSession) {
		List<Category> categoryList = sqlSession.selectList("JiqooMapper.selectCategoryList");
		return categoryList;
	}

}
