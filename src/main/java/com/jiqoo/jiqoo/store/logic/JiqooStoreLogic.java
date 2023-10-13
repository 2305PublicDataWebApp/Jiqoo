package com.jiqoo.jiqoo.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Category;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.store.JiqooStore;
import com.jiqoo.user.domain.User;

@Repository
public class JiqooStoreLogic implements JiqooStore {

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

	@Override
	public Jiqoo selectOneByNo(SqlSession sqlSession, int jiqooNo) {
		Jiqoo jiqoo = sqlSession.selectOne("JiqooMapper.selectOneByNo", jiqooNo);
		return jiqoo;
	}

	@Override
	public int selectLikeCountByNo(SqlSession sqlSession, int jiqooNo) {
		int result = sqlSession.selectOne("JiqooMapper.selectLikeCountByNo", jiqooNo);
		return result;
	}

	@Override
	public Category selectCategoryByNo(SqlSession sqlSession, String jiqooCName) {
		Category category = sqlSession.selectOne("JiqooMapper.selectCategoryByNo", jiqooCName);
		return category;
	}

	@Override
	public List<Jiqoo> selectJiqooAllList(SqlSession sqlSession) {
		List<Jiqoo> jiqooList = sqlSession.selectList("JiqooMapper.selectJiqooAllList");
		return jiqooList;
	}

	@Override
	public List<Jiqoo> selectJiqooMyList(SqlSession sqlSession, String userId) {
		List<Jiqoo> jiqooList = sqlSession.selectList("JiqooMapper.selectJiqooMyList", userId);
		return jiqooList;
	}

	@Override
	public int deleteJiqoo(SqlSession sqlSession, int jiqooNo) {
		int result = sqlSession.update("JiqooMapper.deleteJiqoo", jiqooNo);
		return result;
	}

	@Override
	public int updateJiqoo(SqlSession sqlSession, Jiqoo jiqoo) {
		int result = sqlSession.update("JiqooMapper.updateJiqoo", jiqoo);
		return result;
	}

}
