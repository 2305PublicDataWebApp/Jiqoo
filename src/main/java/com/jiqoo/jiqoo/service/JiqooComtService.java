package com.jiqoo.jiqoo.service;

import com.jiqoo.common.domain.Comment;

public interface JiqooComtService {

	/**
	 * 댓글 등록 Service
	 * @param comment
	 * @return
	 */
	int insertComment(Comment comment);

}
