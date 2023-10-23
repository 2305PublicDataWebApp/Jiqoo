package com.jiqoo.jiqoo.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.store.JiqooStore;
import com.jiqoo.report.domain.Report;
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

	@Override
	public int updateJiqooCount(SqlSession sqlSession, int jiqooNo) {
		return sqlSession.update("JiqooMapper.updateJiqooCount", jiqooNo);
	}

	@Override
	public List<Jiqoo> selectJiqooSearchList(SqlSession sqlSession, Map<String, Object> params) {
		List<Jiqoo> jiqooSearchList = sqlSession.selectList("JiqooMapper.selectJiqooSearchList", params);
		return jiqooSearchList;
	}

	@Override
	public int selectLikeOrNot(SqlSession sqlSession, Like like) {
		int result = sqlSession.selectOne("JiqooMapper.selectLikeOrNot", like);
		return result;
	}

	@Override
	public int insertLike(SqlSession sqlSession, Like like) {
		int result = sqlSession.insert("JiqooMapper.insertLike", like);
		return result;
	}

	@Override
	public int deleteLike(SqlSession sqlSession, Like like) {
		int result = sqlSession.delete("JiqooMapper.deleteLike", like);
		return result;
	}

	@Override
	public List<Jiqoo> loadInitialJiqooAllList(SqlSession sqlSession) {
		List<Jiqoo> list = sqlSession.selectList("JiqooMapper.loadInitialJiqooAllList");
		return list;
	}

	@Override
	public List<Jiqoo> loadMoreJiqooAllList(SqlSession sqlSession, Map<String, Object> params) {
		List<Jiqoo> list = sqlSession.selectList("JiqooMapper.loadMoreJiqooAllList", params);
		return list;
	}

	@Override
	public List<Jiqoo> loadInitialJiqooMyList(SqlSession sqlSession, String userId) {
		List<Jiqoo> list = sqlSession.selectList("JiqooMapper.loadInitialJiqooMyList", userId);
		return list;
	}

	@Override
	public List<Jiqoo> loadMoreJiqooMyList(SqlSession sqlSession, Map<String, Object> params) {
		List<Jiqoo> list = sqlSession.selectList("JiqooMapper.loadMoreJiqooMyList", params);
		return list;
	}

	@Override
	public List<Jiqoo> loadInitialJiqooSearchList(SqlSession sqlSession, Map<String, Object> params) {
		List<Jiqoo> list = sqlSession.selectList("JiqooMapper.loadInitialJiqooSearchList", params);
		return list;
	}

	@Override
	public List<Jiqoo> loadMoreJiqooSearchList(SqlSession sqlSession, Map<String, Object> params) {
		List<Jiqoo> list = sqlSession.selectList("JiqooMapper.loadMoreJiqooSearchList", params);
		return list;
	}

	@Override
	public int insertJiqooReport(SqlSession sqlSession, Report report) {
		int result = sqlSession.insert("JiqooMapper.insertJiqooReport", report);
		return result;
	}

	@Override
	public int insertJiqooComtReport(SqlSession sqlSession, Report report) {
		int result = sqlSession.insert("JiqooMapper.insertJiqooComtReport", report);
		return result;
	}

}
