package com.jiqoo.jiqoo.store;

import java.util.List;
import java.util.Map;

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

	/**
	 * 댓글 삭제 Store
	 * @param sqlSession
	 * @param comment
	 * @return
	 */
	int delComment(SqlSession sqlSession, Comment comment);

	/**
	 * 댓글 수정 Store
	 * @param sqlSession
	 * @param comment
	 * @return
	 */
	int updateComment(SqlSession sqlSession, Comment comment);

//	/**
//	 * 댓글 리스트 조회 Store
//	 * @param sqlSession
//	 * @param jiqooNo
//	 * @return
//	 */
//	List<Comment> selectCommentList(SqlSession sqlSession, int jiqooNo);

	/**
	 * 대댓글 등록 Store
	 * @param sqlSession
	 * @param comment
	 * @return
	 */
	int insertReply(SqlSession sqlSession, Comment comment);


	/**
	 * 댓글 무한스크롤 Store
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Comment> loadMoreComments(SqlSession sqlSession, Map<String, Object> params);

	/**
	 * 초기 댓글 Store
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	List<Comment> initialComments(SqlSession sqlSession, int jiqooNo);

}
