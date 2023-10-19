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

	/**
	 * 댓글 등록
	 * @param sqlSession 
	 * @param comt
	 * @return
	 */
	int insertComt(SqlSession sqlSession, Comment comt);

	/**
	 * 댓글 삭제
	 * @param sqlSession
	 * @param comt
	 * @return int
	 */
	int deleteComt(SqlSession sqlSession, Comment comt);

	/**
	 * 답글 등록
	 * @param sqlSession
	 * @param comt
	 * @return
	 */
	int insertReComt(SqlSession sqlSession, Comment comt);

	/**
	 * 댓글 수정
	 * @param sqlSession
	 * @param comt
	 * @return
	 */
	int updateComment(SqlSession sqlSession, Comment comt);

}
