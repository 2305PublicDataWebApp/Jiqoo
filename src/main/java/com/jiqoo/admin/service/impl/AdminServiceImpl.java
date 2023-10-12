package com.jiqoo.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.admin.service.AdminService;
import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.user.domain.User;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminStore adminStore;
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 회원관리페이지 총게시물수
	 */
	@Override
	public Integer getUserListCount() {
		Integer result = adminStore.getUserListCount(sqlSession);
		return result;
	}

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 */
	@Override
	public List<User> selectAllUser(PageInfo pInfo) {
		List<User> userList = adminStore.selectAllUser(sqlSession, pInfo);
		return userList;
	}

	/**
	 * 회원리스트 검색 총 게시물 수
	 */
	@Override
	public Integer getUserSearchListCount(Map<String, String> paramMap) {
		Integer result = adminStore.getUserSearchListCount(sqlSession, paramMap);
		return result;
	}

	/**
	 * 회원 검색결과 리스트(+페이징)
	 */
	@Override
	public List<User> searchUserByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
		List<User> searchUserList = adminStore.searchUserByKeyword(sqlSession, pInfo, paramMap);
		return searchUserList;
	}

	/**
	 * 회원 상세조회
	 */
	@Override
	public User selectUserByUserId(String userId) {
		User user = adminStore.selectUserByUserId(sqlSession, userId);
		return user;
	}

}
