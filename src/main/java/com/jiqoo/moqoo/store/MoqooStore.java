package com.jiqoo.moqoo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Category;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.domain.MoqooUser;
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
	Moqoo selectOneByNo(SqlSession sqlSession, Integer moqooNo);

	/**
	 * 카테고리 리스트 조회
	 * @param sqlSession
	 * @return
	 */
	List<Category> selectCategoryList(SqlSession sqlSession);


	/**
	 * 카테고리 이미지 조회
	 * @param sqlSession
	 * @param moqooCName
	 * @return
	 */
	Category selectCategoryByNo(SqlSession sqlSession, String moqooCName);

	/**
	 * 모꾸 게시물 좋아요 수
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	int selectLikeCountByNo(SqlSession sqlSession, int moqooNo);

	/**
	 * 모꾸 게시물 수정
	 * @param sqlSession
	 * @param moqoo
	 * @return
	 */
	int updateMoqoo(SqlSession sqlSession, Moqoo moqoo);

	/**
	 * 모꾸 게시물 삭제
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	int deleteMoqoo(SqlSession sqlSession, int moqooNo);

	/**
	 * 참여자 보내기
	 * @param sqlSession
	 * @param moqooUser
	 * @return
	 */
	int insertMoqooPost(SqlSession sqlSession, MoqooUser moqooUser);


}
