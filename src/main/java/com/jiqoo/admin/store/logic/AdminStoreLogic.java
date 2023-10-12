package com.jiqoo.admin.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.common.domain.PageInfo;
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

}
