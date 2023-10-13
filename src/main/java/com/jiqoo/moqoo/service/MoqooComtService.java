package com.jiqoo.moqoo.service;

import java.util.List;

import com.jiqoo.common.domain.Comment;

public interface MoqooComtService {

	/**
	 * 게시글 번호에 맞는 댓글 리스트 조회
	 * @param moqooNo
	 * @return
	 */
	List<Comment> selectComtList(int refPostNo);

}
