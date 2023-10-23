package com.jiqoo.moqoo.service;

import java.util.List;
import java.util.Map;

import com.jiqoo.common.domain.Comment;

public interface MoqooComtService {

//	/**
//	 * 게시글 번호에 맞는 댓글 리스트 조회
//	 * @param moqooNo
//	 * @return
//	 */
//	List<Comment> selectComtList(int refPostNo);

	/**
	 * 댓글 등록
	 * @param comment
	 * @return
	 */
	int insertComt(Comment comt);

	/**
	 * 댓글 삭제
	 * @param comt
	 * @return int
	 */
	int deleteComt(Comment comt);

	/**
	 * 댓글 수정
	 * @param comment
	 * @return
	 */
	int updateComment(Comment comment);

	/**
	 * 답글 등록
	 * @param comt
	 * @return
	 */
	int insertReComt(Comment comt);

	/**
	 * 초기 댓글 리스트
	 * @param moqooNo
	 * @return
	 */
	List<Comment> initialComments(int moqooNo);

	/**
	 * 댓글 무한 스크롤
	 * @param params
	 * @return
	 */
	List<Comment> loadMoreComments(Map<String, Object> params);

	/**
	 * 답글 여부 확인
	 * @param comt
	 * @return
	 */
	int countChildComment(Comment comt);

	/**
	 * 삭제되었습니다로 변경
	 * @param comt
	 * @return
	 */
	int updateDelComment(Comment comt);

}
