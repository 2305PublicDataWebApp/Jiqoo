package com.jiqoo.jiqoo.service;

import java.util.List;

import com.jiqoo.common.domain.Comment;

public interface JiqooComtService {

	/**
	 * 댓글 등록 Service
	 * @param comment
	 * @return
	 */
	int insertComment(Comment comment);

	/**
	 * 댓글 삭제 Service
	 * @param comment
	 * @return
	 */
	int delComment(Comment comment);

	/**
	 * 댓글 수정 Service
	 * @param comment
	 * @return
	 */
	int updateComment(Comment comment);

	/**
	 * 댓글 리스트 조회 Service
	 * @param jiqooNo
	 * @return
	 */
	List<Comment> selectCommentList(int jiqooNo);

}
