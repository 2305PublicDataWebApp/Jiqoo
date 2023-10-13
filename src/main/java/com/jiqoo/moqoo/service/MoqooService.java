package com.jiqoo.moqoo.service;

import java.util.List;

import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

public interface MoqooService {

	/**
	 * 모꾸 게시물 조회하면서 모꾸 페이지로 이동
	 * @return
	 */
	List<Moqoo> showSelectMoqooList();

	/**
	 * 모꾸 게시물 작성
	 * @param moqoo
	 * @return
	 */
	int insertMoqoo(Moqoo moqoo);

	/**
	 * 모꾸 게시글 번호에 맞는 내용 가져오기
	 * @param moqooNo
	 * @return
	 */
	Moqoo selectMoqooByNo(Integer moqooNo);

}
