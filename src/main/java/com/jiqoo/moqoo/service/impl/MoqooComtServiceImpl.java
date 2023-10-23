package com.jiqoo.moqoo.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.service.MoqooComtService;
import com.jiqoo.moqoo.store.MoqooComtStore;

@Service
public class MoqooComtServiceImpl implements MoqooComtService{

	@Autowired
	private MoqooComtStore moqooComtStore;
	
	@Autowired
	private SqlSession sqlSession;
	
//	@Override
//	public List<Comment> selectComtList(int refPostNo) {
//		List<Comment> comtList = moqooComtStore.selectComtList(sqlSession, refPostNo);
//		return comtList;
//	}

	@Override
	public int insertComt(Comment comt) {
		int result = moqooComtStore.insertComt(sqlSession, comt);
		return result;
	}

	@Override
	public int deleteComt(Comment comt) {
		int result = moqooComtStore.deleteComt(sqlSession, comt);
		return result;
	}

	@Override
	public int insertReComt(Comment comt) {
		int result = moqooComtStore.insertReComt(sqlSession, comt);
		return result;
	}

	@Override
	public int updateComment(Comment comt) {
		int result = moqooComtStore.updateComment(sqlSession, comt);
		return result;
	}

	// 초기 댓글 리스트
	@Override
	public List<Comment> initialComments(int moqooNo) {
		List<Comment> comts = moqooComtStore.initialComments(sqlSession, moqooNo);
		return comts;
	}

	// 댓글 무한 스크롤
	@Override
	public List<Comment> loadMoreComments(Map<String, Object> params) {
		List<Comment> comts = moqooComtStore.loadMoreComments(sqlSession, params);
		return comts;
	}

	@Override
	public int countChildComment(Comment comt) {
		int result = moqooComtStore.countChildComment(sqlSession, comt);
		return result;
	}

	@Override
	public int updateDelComment(Comment comt) {
		int result = moqooComtStore.updateDelComment(sqlSession, comt);
		return result;
	}

}
