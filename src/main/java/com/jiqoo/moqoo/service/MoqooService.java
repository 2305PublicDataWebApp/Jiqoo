package com.jiqoo.moqoo.service;

import java.util.List;

import com.jiqoo.common.domain.Category;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.domain.MoqooUser;
import com.jiqoo.user.domain.User;

public interface MoqooService {

	/**
	 * 모꾸 게시물 작성
	 * @param moqoo
	 * @return
	 */
	int insertMoqoo(Moqoo moqoo);
	
	/**
	 * 모꾸 게시물 수정
	 * @param moqoo
	 * @return
	 */
	int updateMoqoo(Moqoo moqoo);

	/**
	 * 모꾸 게시물 삭제(상태변경처리)
	 * @param moqooNo
	 * @return
	 */
	int deleteMoqoo(int moqooNo);

	/**
	 * 모꾸 페이지로 이동하면서 모꾸 게시물 리스트 조회
	 * @return
	 */
	List<Moqoo> showSelectMoqooList();
	
	/**
	 * 모꾸 게시글 번호에 맞는 내용 가져오기
	 * @param moqooNo
	 * @return
	 */
	Moqoo selectOneByNo(Integer moqooNo);

	/**
	 * 카테고리 리스트
	 * @return
	 */
	List<Category> selectCategoryList();

	/**
	 * 카테고리 이미지 조회
	 * @param moqooCName
	 * @return
	 */
	Category selectCategoryByNo(String moqooCName);

	/**
	 * 모꾸 게시물 좋아요 수
	 * @param moqoo
	 * @return
	 */
	int selectLikeCountByNo(int moqooNo);

	/**
	 * 참여자 보내기
	 * @param moqooUser
	 * @return
	 */
	int insertMoqooPost(MoqooUser moqooUser);

	
	



}
