package com.jiqoo.jiqoo.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.service.JiqooComtService;
import com.jiqoo.jiqoo.store.JiqooComtStore;

@Service
public class JiqooComtServiceImpl implements JiqooComtService{

	@Autowired
	private JiqooComtStore jiqooComtStore;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertComment(Comment comment) {
		int result = jiqooComtStore.insertComment(sqlSession, comment);
		return result;
	}

	@Override
	public int delComment(Comment comment) {
		int result = jiqooComtStore.delComment(sqlSession, comment);
		return result;
	}

	@Override
	public int updateComment(Comment comment) {
		int result = jiqooComtStore.updateComment(sqlSession, comment);
		return result;
	}

//	@Override
//	public List<Comment> selectCommentList(int jiqooNo) {
//		List<Comment> commentList = jiqooComtStore.selectCommentList(sqlSession, jiqooNo);
//		return commentList;
//	}

	@Override
	public int insertReply(Comment comment) {
		int result = jiqooComtStore.insertReply(sqlSession, comment);
		return result;
	}


	@Override
	public List<Comment> loadMoreComments(Map<String, Object> params) {
		List<Comment> comments = jiqooComtStore.loadMoreComments(sqlSession, params);
        return comments;
	}

	@Override
	public List<Comment> initialComments(int jiqooNo) {
		List<Comment> comments = jiqooComtStore.initialComments(sqlSession, jiqooNo);
		return comments;
	}

	@Override
	public int countChildComment(Comment comment) {
		int result = jiqooComtStore.countChildComment(sqlSession, comment);
		return result;
	}

	@Override
	public int updateDelComment(Comment comment) {
		int result = jiqooComtStore.updateDelComment(sqlSession, comment);
		return result;
	}
}
