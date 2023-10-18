package com.jiqoo.moqoo.service.impl;

import java.util.List;

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
	
	@Override
	public List<Comment> selectComtList(int refPostNo) {
		List<Comment> comtList = moqooComtStore.selectComtList(sqlSession, refPostNo);
		return comtList;
	}

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

}
