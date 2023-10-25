package com.jiqoo.moqoo.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.store.MoqooComtStore;

@Repository
public class MoqooComtStoreLogic implements MoqooComtStore{

//	@Override
//	public List<Comment> selectComtList(SqlSession sqlSession, int refPostNo) {
//		List<Comment> comtList = sqlSession.selectList("MoqooComtMapper.selectComtList", refPostNo);
//		return comtList;
//	}

	@Override
	public int insertComt(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.insert("MoqooComtMapper.insertComt", comt);
		return result;
	}

	@Override
	public int deleteComt(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.update("MoqooComtMapper.deleteComt", comt);
		return result;
	}

	@Override
	public int insertReComt(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.insert("MoqooComtMapper.insertReComt", comt);
		return result;
	}

	@Override
	public int updateComment(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.update("MoqooComtMapper.updateComment", comt);
		return result;
	}

	// 초기 댓글 리스트
	@Override
	public List<Comment> initialComments(SqlSession sqlSession, int moqooNo) {
		List<Comment> comts = sqlSession.selectList("MoqooComtMapper.initialComments", moqooNo);
		return comts;
	}

	// 댓글 무한 스크롤
	@Override
	public List<Comment> loadMoreComments(SqlSession sqlSession, Map<String, Object> params) {
		List<Comment> comts = sqlSession.selectList("MoqooComtMapper.loadMoreComments", params);
		return comts;
	}

	@Override
	public int countChildComment(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.selectOne("MoqooComtMapper.countChildComment", comt);
		return result;
	}

	@Override
	public int updateDelComment(SqlSession sqlSession, Comment comt) {
		int result = sqlSession.update("MoqooComtMapper.updateDelComment", comt);
		return result;
	}


}
