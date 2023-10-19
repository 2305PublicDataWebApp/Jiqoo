package com.jiqoo.jiqoo.service;

import java.util.List;
import java.util.Map;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.user.domain.User;

public interface JiqooService {

	/**
	 * 지꾸게시물 작성 Service
	 * @param jiqoo
	 * @return
	 */
	int insertJiqoo(Jiqoo jiqoo);

	/**
	 * 카테고리 리스트 Service
	 * @return
	 */
	List<Category> selectCategoryList();

	/**
	 * 지꾸 게시물 상세조회 Service
	 * @param jiqooNo
	 * @return
	 */
	Jiqoo selectOneByNo(int jiqooNo);

	/**
	 * 지꾸 게시물 좋아요수 Service
	 * @param jiqooNo
	 * @return
	 */
	int selectLikeCountByNo(int jiqooNo);

	/**
	 * 지꾸 카테고리 이미지 조회 Service
	 * @param jiqooCName
	 * @return
	 */
	Category selectCategoryByNo(String jiqooCName);

	/**
	 * 지꾸 전체 리스트 조회 Service
	 * @return
	 */
	List<Jiqoo> selectJiqooAllList();

	/**
	 * 지꾸 본인 리스트 조회 Service
	 * @param userId 
	 * @return
	 */
	List<Jiqoo> selectJiqooMyList(String userId);

	/**
	 * 지꾸 삭제 Service
	 * @param jiqooNo
	 * @return
	 */
	int deleteJiqoo(int jiqooNo);

	/**
	 * 지꾸 업데이트 Service
	 * @param jiqoo
	 * @return
	 */
	int updateJiqoo(Jiqoo jiqoo);

	/**
	 * 조회수 증가 Service
	 * @param jiqooNo
	 * @return
	 */
	int updateJiqooCount(int jiqooNo);

	/**
	 * 지꾸 검색 Service
	 * @param params 
	 * @return
	 */
	List<Jiqoo> selectJiqooSearchList(Map<String, Object> params);

	/**
	 * 좋아요 여부 판단 Service
	 * @param like
	 * @return
	 */
	int selectLikeOrNot(Like like);

	/**
	 * 좋아요 Service
	 * @param like
	 * @return
	 */
	int insertLike(Like like);

	/**
	 * 좋아요 취소 Service
	 * @param like
	 * @return
	 */
	int deleteLike(Like like);

}
