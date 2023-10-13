package com.jiqoo.moqoo.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.store.MoqooComtStore;

@Repository
public class MoqooComtStoreLogic implements MoqooComtStore{

	@Override
	public List<Comment> selectComtList(SqlSession sqlSession, int refPostNo) {
		List<Comment> comtList = sqlSession.selectList("MoqooComtMapper.selectComtList", refPostNo);
		return comtList;
	}

}
