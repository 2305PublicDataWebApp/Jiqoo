package com.jiqoo.jiqoo.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.store.JiqooComtStore;

@Repository
public class JiqooComtStoreLogic implements JiqooComtStore{

	@Override
	public int insertComment(SqlSession sqlSession, Comment comment) {
		int result = sqlSession.insert("JiqooComtMapper.insertComment", comment);
		return result;
	}

	@Override
	public int delComment(SqlSession sqlSession, Comment comment) {
		int result = sqlSession.insert("JiqooComtMapper.delComment", comment);
		return result;
	}

	@Override
	public int updateComment(SqlSession sqlSession, Comment comment) {
		int result = sqlSession.insert("JiqooComtMapper.updateComment", comment);
		return result;
	}

//	@Override
//	public List<Comment> selectCommentList(SqlSession sqlSession, int jiqooNo) {
//		List<Comment> commentList = sqlSession.selectList("JiqooComtMapper.selectCommentList", jiqooNo);
//		return commentList;
//	}

	@Override
	public int insertReply(SqlSession sqlSession, Comment comment) {
		int result = sqlSession.insert("JiqooComtMapper.insertReply", comment);
		return result;
	}

	@Override
	public List<Comment> loadMoreComments(SqlSession sqlSession, Map<String, Object> params) {
		List<Comment> comments = sqlSession.selectList("JiqooComtMapper.loadMoreComments", params);
		return comments;
	}

	@Override
	public List<Comment> initialComments(SqlSession sqlSession, int jiqooNo) {
		List<Comment> comments = sqlSession.selectList("JiqooComtMapper.initialComments", jiqooNo);
		return comments;
	}

}
