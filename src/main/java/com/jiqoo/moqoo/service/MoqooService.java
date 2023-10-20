package com.jiqoo.moqoo.service;

import java.util.List;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
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
	 * 좋아요 클릭
	 * @param like
	 * @return
	 */
	int insertLike(Like like);

	/**
	 * 좋아요 취소
	 * @param like
	 * @return
	 */
	int deleteLike(Like like);

	/**
	 * 모꾸 게시물 좋아요 수
	 * @param moqoo
	 * @return
	 */
	int selectLikeCountByNo(int moqooNo);

	/**
	 * 좋아요 여부 판단
	 * @param like
	 * @return
	 */
	int selectLikeOrNot(Like like);

	/**
	 * 참여자 보내기
	 * @param moqooUser
	 * @return
	 */
	int insertMoqooPost(MoqooUser moqooUser);

	/**
	 * 게시물 작성시 작성자도 참여자에 포함하기
	 * @param moqooUser
	 * @return 
	 */
	void insertMoqooUser(MoqooUser moqooUser);

	/**
	 * 모임참여자 조회
	 * @param moqooNo 
	 * @return
	 */
	List<MoqooUser> selectMoqooUserList(int refMoqooNo);

	/**
	 * 참여신청자 승인
	 * @param moqooUser
	 * @return
	 */
	int updateYesAttend(MoqooUser moqooUser);

	/**
	 * 현재 참여자 인원
	 * @param refMoqooNo
	 * @return
	 */
	int selectJoinCount(int refMoqooNo);

	/**
	 * 총 참여 인원
	 * @param refMoqooNo
	 * @return
	 */
	int selectOneByMoqooJoin(int moqooNo);

//	/**
//	 * 좋아요 카운트
//	 * @param refPostNo
//	 * @return
//	 */
//	int moqooLikeCount(int refPostNo);



	/**
	 * 모꾸 전체리스트 조회
	 * @return
	 */
	List<Moqoo> selectMoqooAllList();

	/**
	 * 조회수 카운트
	 * @param moqooNo
	 */
	int updateMoqooCount(int moqooNo);

}
