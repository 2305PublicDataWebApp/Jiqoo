package com.jiqoo.jiqoo.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.store.JiqooComtStore;

@Repository
public class JiqooComtStoreLogic implements JiqooComtStore{

	@Override
	public int insertComment(SqlSession sqlSession, Comment comment) {
		int result = sqlSession.insert("JiqooComtMapper.insertComment", comment);
		return result;
	}

}
