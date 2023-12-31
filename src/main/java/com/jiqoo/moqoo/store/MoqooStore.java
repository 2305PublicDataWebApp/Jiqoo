package com.jiqoo.moqoo.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.domain.MoqooUser;
import com.jiqoo.report.domain.Report;
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
	 * 좋아요 클릭
	 * @param sqlSession
	 * @param like
	 * @return
	 */
	int insertLike(SqlSession sqlSession, Like like);

	/**
	 * 좋아요 취소
	 * @param sqlSession
	 * @param like
	 * @return
	 */
	int deleteLike(SqlSession sqlSession, Like like);

	/**
	 * 모꾸 게시물 좋아요 수
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	int selectLikeCountByNo(SqlSession sqlSession, int moqooNo);

	/**
	 * 좋아요 여부 판단
	 * @param sqlSession
	 * @param like
	 * @return
	 */
	int selectLikeOrNot(SqlSession sqlSession, Like like);

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

	/**
	 * 게시물 작성시 작성자도 참여자에 포함하기
	 * @param sqlSession
	 * @param moqooUser
	 */
	void insertMoqooUser(SqlSession sqlSession, MoqooUser moqooUser);

	/**
	 * 모임참여자 조회
	 * @param sqlSession
	 * @param moqooNo 
	 * @return
	 */
	List<MoqooUser> selectMoqooUserList(SqlSession sqlSession, int refMoqooNo);

	/**
	 * 참여신청자 승인
	 * @param sqlSession
	 * @param moqooUser
	 * @return
	 */
	int updateYesAttend(SqlSession sqlSession, MoqooUser moqooUser);

	/**
	 * 참여 신청자 거절
	 * @param sqlSession
	 * @param moqooUser
	 * @return
	 */
	int updateNoAttend(SqlSession sqlSession, MoqooUser moqooUser);

	/**
	 * 현재 참여자 수
	 * @param sqlSession
	 * @param refMoqooNo
	 * @return
	 */
	int selectJoinCount(SqlSession sqlSession, int refMoqooNo);

	/**
	 * 총 참여 인원
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	int selectOneByMoqooJoin(SqlSession sqlSession, int moqooNo);

//	/**
//	 * 좋아요 카운트
//	 * @param sqlSession
//	 * @param refPostNo
//	 * @return
//	 */
//	int moqooLikeCount(SqlSession sqlSession, int refPostNo);

	/**
	 * 모꾸 전체 리스트 조회
	 * @param sqlSession
	 * @return
	 */
	List<Moqoo> selectMoqooAllList(SqlSession sqlSession);

	/**
	 * 모꾸 조회수 증가
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	int updateMoqooCount(SqlSession sqlSession, int moqooNo);

	/**
	 * 모꾸 검색리스트
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Moqoo> selectmoqooSearchList(SqlSession sqlSession, Map<String, Object> params);

	/** 
	 * 모꾸 초기 전체 리스트
	 * @param sqlSession
	 * @return
	 */
	List<Moqoo> loadInitialMoqooAllList(SqlSession sqlSession);

	/**
	 * 모꾸 전체 리스트 무한스크롤
	 * @param sqlSession
	 * @param params
	 * @return
	 */
	List<Moqoo> loadMoreMoqooAllList(SqlSession sqlSession, Map<String, Object> params);

	
//	/**
//	 * 게시글 신고하기
//	 * @param sqlSession
//	 * @param report
//	 * @return
//	 */
//	int insertReport(SqlSession sqlSession, Report report);

	/**
	 * 모꾸 게시글 신고
	 * @param sqlSession
	 * @param report
	 * @return
	 */
	int insertMoqooReport(SqlSession sqlSession, Report report);

	/**
	 * 모꾸 댓글 신고
	 * @param sqlSession
	 * @param report
	 * @return
	 */
	int insertMoqooComtReport(SqlSession sqlSession, Report report);
}
