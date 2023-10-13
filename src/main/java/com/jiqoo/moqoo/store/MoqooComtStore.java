package com.jiqoo.moqoo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Comment;

public interface MoqooComtStore {

	/**
	 * 게시물 번호에 맞는 댓글 리스트 조회
	 * @param sqlSession
	 * @param refPostNo
	 * @return
	 */
	List<Comment> selectComtList(SqlSession sqlSession, int refPostNo);

}
