package com.jiqoo.jiqoo.store;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Comment;

public interface JiqooComtStore {

	/**
	 * 댓글 등록 Store
	 * @param sqlSession
	 * @param comment
	 * @return
	 */
	int insertComment(SqlSession sqlSession, Comment comment);

}
