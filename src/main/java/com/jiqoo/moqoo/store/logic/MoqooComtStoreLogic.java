package com.jiqoo.moqoo.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.store.MoqooComtStore;

@Repository
public class MoqooComtStoreLogic implements MoqooComtStore{

	@Override
	public List<Comment> selectComtList(SqlSession sqlSession, int refPostNo) {
		List<Comment> comtList = sqlSession.selectList("MoqooComtMapper.selectComtList", refPostNo);
		return comtList;
	}

	@Override
	public int insertComt(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.insert("MoqooComtMapper.insertComt", comt);
		return result;
	}

	@Override
	public int deleteComt(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.update("MoqooComtMapper.deleteComt", comt);
		return result;
	}

	@Override
	public int insertReComt(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.insert("MoqooComtMapper.insertReComt", comt);
		return result;
	}

	@Override
	public int updateComment(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.update("MoqooComtMapper.updateComment", comt);
		return result;
	}


}
