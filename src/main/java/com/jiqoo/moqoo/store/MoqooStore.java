package com.jiqoo.moqoo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

public interface MoqooStore {

	/**
	 * 모꾸 게시물 조회하면서 모꾸로 이동
	 * @param sqlSession
	 * @param moqoo 
	 * @return
	 */
	List<Moqoo> showSelectMoqooList(SqlSession sqlSession);

	/**
	 * 모꾸 게시물 작성
	 * @param sqlSession
	 * @param moqoo
	 * @return
	 */
	int insertMoqoo(SqlSession sqlSession, Moqoo moqoo);

	/**
	 * 모꾸 게시물 번호에 맞는 내용 가져오기
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	Moqoo selectMoqooByNo(SqlSession sqlSession, Integer moqooNo);

}
