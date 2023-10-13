package com.jiqoo.moqoo.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.store.MoqooStore;
import com.jiqoo.user.domain.User;

@Repository
public class MoqooStoreLogic implements MoqooStore{

	@Override
	public List<Moqoo> showSelectMoqooList(SqlSession sqlSession) {
		List<Moqoo> moqooList = sqlSession.selectList("MoqooMapper.showSelectMoqooList");
		return moqooList;
	}

	@Override
	public int insertMoqoo(SqlSession sqlSession, Moqoo moqoo) {
		int mOne = sqlSession.insert("MoqooMapper.insertMoqoo", moqoo);
		return mOne;
	}

	@Override
	public Moqoo selectMoqooByNo(SqlSession sqlSession, Integer moqooNo) {
		Moqoo moqoo = sqlSession.selectOne("MoqooMapper.selectMoqooByNo", moqooNo);
		return moqoo;
	}

}
