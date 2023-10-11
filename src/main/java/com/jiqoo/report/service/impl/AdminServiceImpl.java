package com.jiqoo.report.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.report.service.AdminService;
import com.jiqoo.report.store.AdminStore;
import com.jiqoo.user.domain.User;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminStore adminStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Integer getListCount() {
		Integer result = adminStore.getListCount(sqlSession);
		return result;
	}

	@Override
	public List<User> selectAllUser(PageInfo pInfo) {
		List<User>userList = adminStore.selectAllUser(sqlSession, pInfo);
		return userList;
	}

}
