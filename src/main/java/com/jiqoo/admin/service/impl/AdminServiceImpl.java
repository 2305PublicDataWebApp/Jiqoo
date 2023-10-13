package com.jiqoo.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.admin.service.AdminService;
import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
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

	/**
	 * 회원 강제탈퇴
	 */
	@Override
	public Integer deleteUserByAdmin(String userId) {
		Integer result = adminStore.deleteUserByAdmin(sqlSession, userId);
		return result;
	}

	/**
	 * 강퇴회원 복원
	 */
	@Override
	public Integer reviveUserByAdmin(String userId) {
		Integer result = adminStore.reviveUserByAdmin(sqlSession, userId);
		return result;
	}

	/**
	 * 회원별 총 지꾸수
	 */
	@Override
	public Integer getUserJiqooListCount(String jiqooWriter) {
		Integer result = adminStore.getUserJiqooListCount(sqlSession, jiqooWriter);
		return result;
	}

	/**
	 * 회원별 지꾸 리스트 
	 */
	@Override
	public List<Jiqoo> showUserJiqooList(PageInfo pInfoJiqoo, String userId) {
		List<Jiqoo> uJiqooList = adminStore.showUserJiqooList(sqlSession, pInfoJiqoo, userId);
		return uJiqooList;
	}

	/**
	 * 회원별 모꾸 수 
	 */
	@Override
	public Integer getUserMoqooListCount(String moqooWriter) {
		Integer result = adminStore.getUserMoqooListCount(sqlSession, moqooWriter);
		return result;
	}

	/**
	 * 회원별 모꾸 리스트 
	 */
	@Override
	public List<Moqoo> showUserMoqooList(PageInfo pInfoMoqoo, String userId) {
		List<Moqoo> uMoqooList = adminStore.showUserMoqooList(sqlSession, pInfoMoqoo, userId);
		return uMoqooList;
	}



}
