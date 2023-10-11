package com.jiqoo.report.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.report.store.AdminStore;
import com.jiqoo.user.domain.User;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public Integer getListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getListCount");
		return result;
	}

	@Override
	public List<User> selectAllUser(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User>userList = sqlSession.selectList("AdminMapper.selectAllUser",null,rowBounds);
		return userList;
	}

}
