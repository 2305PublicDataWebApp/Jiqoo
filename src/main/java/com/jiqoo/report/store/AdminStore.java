package com.jiqoo.report.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.user.domain.User;

public interface AdminStore {

	public Integer getListCount(SqlSession sqlSession);

	public List<User> selectAllUser(SqlSession sqlSession, PageInfo pInfo);

}
