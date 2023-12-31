package com.jiqoo.moqoo.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Comment;

public interface MoqooComtStore {

//	/**
//	 * 게시물 번호에 맞는 댓글 리스트 조회
//	 * @param sqlSession
//	 * @param refPostNo
//	 * @return
//	 */
//	List<Comment> selectComtList(SqlSession sqlSession, int refPostNo);

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

	/**
	 * 초기 댓글 리스트
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	List<Comment> initialComments(SqlSession sqlSession, int moqooNo);

	/**
	 * 댓글 무한 스크롤
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Comment> loadMoreComments(SqlSession sqlSession, Map<String, Object> params);

	/**
	 * 답글 여부 확인
	 * @param sqlSession
	 * @param comt
	 * @return
	 */
	int countChildComment(SqlSession sqlSession, Comment comt);

	/**
	 * 삭제되었습니다로 변경
	 * @param sqlSession
	 * @param comt
	 * @return
	 */
	int updateDelComment(SqlSession sqlSession, Comment comt);

}
