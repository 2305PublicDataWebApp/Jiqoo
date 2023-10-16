package com.jiqoo.moqoo.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Category;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.domain.MoqooUser;
import com.jiqoo.moqoo.store.MoqooStore;
import com.jiqoo.user.domain.User;

@Repository
public class MoqooStoreLogic implements MoqooStore{

	@Override
	public List<Moqoo> showSelectMoqooList(SqlSession sqlSession) {
		List<Moqoo> moqooList = sqlSession.selectList("MoqooMapper.showSelectMoqooList");
		return moqooList;
	}

	@Override
	public int insertMoqoo(SqlSession sqlSession, Moqoo moqoo) {
		int mOne = sqlSession.insert("MoqooMapper.insertMoqoo", moqoo);
		return mOne;
	}

	@Override
	public Moqoo selectOneByNo(SqlSession sqlSession, Integer moqooNo) {
		Moqoo moqoo = sqlSession.selectOne("MoqooMapper.selectOneByNo", moqooNo);
		return moqoo;
	}

	@Override
	public List<Category> selectCategoryList(SqlSession sqlSession) {
		List<Category> categoryList = sqlSession.selectList("MoqooMapper.selectCategoryList");
		return categoryList;
	}

	@Override
	public Category selectCategoryByNo(SqlSession sqlSession, String moqooCName) {
		Category category = sqlSession.selectOne("MoqooMapper.selectCategoryByNo", moqooCName);
		return category;
	}

	@Override
	public int selectLikeCountByNo(SqlSession sqlSession, int moqooNo) {
		int result = sqlSession.selectOne("MoqooMapper.selectLikeCountByNo", moqooNo);
		return result;
	}

	@Override
	public int updateMoqoo(SqlSession sqlSession, Moqoo moqoo) {
		int result = sqlSession.update("MoqooMapper.updateMoqoo", moqoo);
		return result;
	}

	@Override
	public int deleteMoqoo(SqlSession sqlSession, int moqooNo) {
		int result = sqlSession.update("MoqooMapper.deleteMoqoo", moqooNo);
		return result;
	}

	@Override
	public int insertMoqooPost(SqlSession sqlSession, MoqooUser moqooUser) {
		int result = sqlSession.insert("MoqooUserMapper.insertMoqooPost", moqooUser);
		return result;
	}



}
