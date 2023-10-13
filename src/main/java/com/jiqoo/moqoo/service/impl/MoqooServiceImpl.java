package com.jiqoo.moqoo.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.service.MoqooService;
import com.jiqoo.moqoo.store.MoqooStore;
import com.jiqoo.user.domain.User;

@Service
public class MoqooServiceImpl implements MoqooService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MoqooStore moqooStore;
	
	@Override
	public List<Moqoo> showSelectMoqooList() {
		List<Moqoo> moqooList = moqooStore.showSelectMoqooList(sqlSession);
		return moqooList;
	}

	@Override
	public int insertMoqoo(Moqoo moqoo) {
		int mOne = moqooStore.insertMoqoo(sqlSession, moqoo);
		return mOne;
	}

	@Override
	public Moqoo selectMoqooByNo(Integer moqooNo) {
		Moqoo moqoo = moqooStore.selectMoqooByNo(sqlSession, moqooNo);
		return moqoo;
	}

}
