package com.jiqoo.jiqoo.service.impl;

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

}
