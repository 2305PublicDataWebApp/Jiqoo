package com.jiqoo.admin.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

@Repository
public class AdminStoreLogic implements AdminStore {

	/**
	 * 회원관리페이지 총게시물수
	 */
	@Override
	public Integer getUserListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getUserListCount");
		return result;
	}

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 */
	@Override
	public List<User> selectAllUser(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> userList = sqlSession.selectList("AdminMapper.selectAllUser", null, rowBounds);
		return userList;
	}

	/**
	 * 회원리스트 검색 총 게시물 수
	 */
	@Override
	public Integer getUserSearchListCount(SqlSession sqlSession, Map<String, String> paramMap) {
		Integer result = sqlSession.selectOne("AdminMapper.getUserSearchListCount", paramMap);
		return result;
	}

	/**
	 * 회원 검색결과 리스트(+페이징)
	 */
	@Override
	public List<User> searchUserByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> searchUserList = sqlSession.selectList("AdminMapper.searchUserByKeyword", paramMap, rowBounds);
		return searchUserList;
	}

	/**
	 * 회원 상세조회
	 */
	@Override
	public User selectUserByUserId(SqlSession sqlSession, String userId) {
		User user = sqlSession.selectOne("AdminMapper.selectUserByUserId", userId);
		return user;
	}

	/**
	 * 회원 강제탈퇴
	 */
	@Override
	public Integer deleteUserByAdmin(SqlSession sqlSession, String userId) {
		Integer result = sqlSession.update("AdminMapper.deleteUserByAdmin", userId);
		return result;
	}

	@Override
	public Integer reviveUserByAdmin(SqlSession sqlSession, String userId) {
		Integer result = sqlSession.update("AdminMapper.reviveUserByAdmin", userId);
		return result;
	}

	/**
	 * 회원별 총 지꾸수
	 */
	@Override
	public Integer getUserJiqooListCount(SqlSession sqlSession, String jiqooWriter) {
		Integer result = sqlSession.selectOne("AdminMapper.getUserJiqooListCount", jiqooWriter);
		return result;
	}

	/**
	 * 회원별 지꾸 리스트 
	 */
	@Override
	public List<Jiqoo> showUserJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo, String userId) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Jiqoo> uJiqooList = sqlSession.selectList("AdminMapper.showUserJiqooList", userId, rowBounds);
		return uJiqooList;
	}

	/**
	 * 회원별 모꾸수
	 */
	@Override
	public Integer getUserMoqooListCount(SqlSession sqlSession, String moqooWriter) {
		Integer result = sqlSession.selectOne("AdminMapper.getUserMoqooListCount", moqooWriter);
		return result;
	}

	/**
	 * 회원별 모꾸 리스트 
	 */
	@Override
	public List<Moqoo> showUserMoqooList(SqlSession sqlSession, PageInfo pInfoMoqoo, String userId) {
		int limit = pInfoMoqoo.getRecordCountPerPage();
		int offset = (pInfoMoqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Moqoo> uMoqooList = sqlSession.selectList("AdminMapper.showUserMoqooList", userId, rowBounds);
		return uMoqooList;
	}



}
