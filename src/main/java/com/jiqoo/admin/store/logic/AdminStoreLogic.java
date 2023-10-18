package com.jiqoo.admin.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.common.domain.Comment;
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
	public Integer getUserSearchListCount(SqlSession sqlSession, Map<String, String> searchUserMap) {
		Integer result = sqlSession.selectOne("AdminMapper.getUserSearchListCount", searchUserMap);
		return result;
	}

	/**
	 * 회원 검색결과 리스트(+페이징)
	 */
	@Override
	public List<User> searchUserByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> searchUserMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> searchUserList = sqlSession.selectList("AdminMapper.searchUserByKeyword", searchUserMap, rowBounds);
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
	public List<Jiqoo> showUserJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo, String jiqooWriter) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Jiqoo> uJiqooList = sqlSession.selectList("AdminMapper.showUserJiqooList", jiqooWriter, rowBounds);
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

	/**
	 * 회원별 총 댓글 수
	 */
	@Override
	public Integer getusersTotalComtCount(SqlSession sqlSession, String comtWriter) {
		Integer result = sqlSession.selectOne("AdminMapper.getusersTotalComtCount", comtWriter);
		return result;
	}

	/**
	 * 회원별 총 댓글 리스트
	 */
	@Override
	public List<Comment> showUserComtList(SqlSession sqlSession, PageInfo pInfoComt, String comtWriter) {
		int limit = pInfoComt.getRecordCountPerPage();
		int offset = (pInfoComt.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Comment> uComtList = sqlSession.selectList("AdminMapper.showUserComtList", comtWriter, rowBounds);
		return uComtList;
	}
	
	/**
	 * 회원별_댓글강제삭제
	 */
	@Override
	public Integer deleteComtByAdmin(SqlSession sqlSession, Integer comtNo) {
		Integer result = sqlSession.update("AdminMapper.deleteComtByAdmin", comtNo);
		return result;
	}

	
	/**
	 * 총 지꾸 수 
	 */
	@Override
	public Integer getJiqooListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getJiqooListCount");
		return result;

	}

	/**
	 * 총 지꾸 리스트
	 */
	@Override
	public List<Jiqoo> selectAllJiqoo(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Jiqoo> jiqooList = sqlSession.selectList("AdminMapper.selectAllJiqoo", null, rowBounds);
		return jiqooList;
	}

	/**
	 * 지꾸검색 결과수 
	 */
	@Override
	public Integer getJiqooSearchListCount(SqlSession sqlSession, Map<String, String> searchJiqooMap) {
		Integer result = sqlSession.selectOne("AdminMapper.getJiqooSearchListCount", searchJiqooMap);
		return result;
	}

	/**
	 * 지꾸 검색 리스트(+페이징)
	 */
	@Override
	public List<Jiqoo> searchJiqooByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> searchJiqooMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Jiqoo> searchJiqooList = sqlSession.selectList("AdminMapper.searchJiqooByKeyword", searchJiqooMap, rowBounds);
		return searchJiqooList;
	}

	@Override
	public Integer getMoqooListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getMoqooListCount");
		return result;
	}

	@Override
	public List<Moqoo> selectAllMoqoo(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Moqoo> moqooList = sqlSession.selectList("AdminMapper.selectAllMoqoo", null, rowBounds);
		return moqooList;
	}


	/**
	 * 지꾸 강제 삭제 
	 */
	@Override
	public Integer deleteJiqooByAdmin(SqlSession sqlSession, Integer jiqooNo) {
		Integer result = sqlSession.update("AdminMapper.deleteJiqooByAdmin", jiqooNo);
		return result;
	}

	@Override
	public Jiqoo selectOneJiqoo(SqlSession sqlSession, Jiqoo jiqoo) {
		Jiqoo jiqooOne = sqlSession.selectOne("AdminMapper.selectOneJiqoo", jiqoo);
		return jiqooOne;
	}

	@Override
	public User selectOneUser(SqlSession sqlSession, User user) {
		User userOne = sqlSession.selectOne("AdminMapper.selectOneUser", user);
		return userOne;
	}

	@Override
	public Integer usingJiqooCount(SqlSession sqlSession, Jiqoo jiqoo) {
		Integer jiqooResult = sqlSession.selectOne("AdminMapper.usingJiqooCount", jiqoo);
		return jiqooResult;
	}

	@Override
	public Integer usingMoqooCount(SqlSession sqlSession, Moqoo moqoo) {
		Integer moqooResult = sqlSession.selectOne("AdminMapper.usingMoqooCount", moqoo);
		return moqooResult;
	}

	/**
	 * 가입중인 회원 성비 
	 */
	@Override
	public List<User> userGenderList(SqlSession sqlSession) {
		List<User> userGenderList = sqlSession.selectList("AdminMapper.userGenderList");
		return userGenderList;
	}

	/**
	 *  당일 가입한 회원 수 
	 */
	@Override
	public Integer todayJoinUserCount(SqlSession sqlSession) {
		Integer todayJoinUserCount = sqlSession.selectOne("AdminMapper.todayJoinUserCount");
		return todayJoinUserCount;
	}

	/**
	 * 전일 가입한 회원 수 
	 */
	@Override
	public Integer yesterdayJoinUserCount(SqlSession sqlSession) {
		Integer yesterdayJoinUserCount = sqlSession.selectOne("AdminMapper.yesterdayJoinUserCount");
		return yesterdayJoinUserCount;
	}

	/**
	 * 검색된 총 모꾸 수
	 */
	@Override
	public Integer getMoqooSearchListCount(SqlSession sqlSession, Map<String, String> searchMoqooMap) {
		Integer result = sqlSession.selectOne("AdminMapper.getMoqooSearchListCount", searchMoqooMap);
		return result;
	}

	/**
	 * 검색된 모꾸 리스트(+페이징)
	 */
	@Override
	public List<Moqoo> searchMoqooByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> searchMoqooMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Moqoo> searchMoqooList = sqlSession.selectList("AdminMapper.searchMoqooByKeyword", searchMoqooMap, rowBounds);
		return searchMoqooList;
	}

	/**
	 * 당일 등록된 지꾸 수
	 */
	@Override
	public Integer todayInsertJiqooCount(SqlSession sqlSession) {
		Integer todayInsertJiqooCount = sqlSession.selectOne("AdminMapper.todayInsertJiqooCount");
		return todayInsertJiqooCount;
	}

	/**
	 * 전일 등록된 지꾸 수 
	 */
	@Override
	public Integer yesterdayInsertJiqooCount(SqlSession sqlSession) {
		Integer yesterdayInsertJiqooCount = sqlSession.selectOne("AdminMapper.yesterdayInsertJiqooCount");
		return yesterdayInsertJiqooCount;
	}

	/**
	 * 당일 등록된 모꾸 수 
	 */
	@Override
	public Integer todayInsertMoqooCount(SqlSession sqlSession) {
		Integer todayInsertMoqooCount = sqlSession.selectOne("AdminMapper.todayInsertMoqooCount");
		return todayInsertMoqooCount;
	}

	/**
	 * 전일 등록된 모꾸 수
	 */
	@Override
	public Integer yesterdayInsertMoqooCount(SqlSession sqlSession) {
		Integer yesterdayInsertMoqooCount = sqlSession.selectOne("AdminMapper.yesterdayInsertMoqooCount");
		return yesterdayInsertMoqooCount;
	}
	
	/**
	 * 모꾸 강제삭제
	 */
	@Override
	public Integer deleteMoqooByAdmin(SqlSession sqlSession, Integer moqooNo) {
		Integer result = sqlSession.update("AdminMapper.deleteMoqooByAdmin", moqooNo);
		return result;
	}

	/**
	 * 총 채팅방 수
	 */
	@Override
	public Integer getChatRoomListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getChatRoomListCount");
		return result;
	}

	@Override
	public List<ChatRoom> selectAllChatRoom(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ChatRoom> chatRoomList = sqlSession.selectList("AdminMapper.selectAllChatRoom", null, rowBounds);
		return chatRoomList;
	}

	/**
	 * 당일 가입한 회원 리스트 
	 */
	@Override
	public List<User> todayUserList(SqlSession sqlSession, PageInfo pInfoUser) {
		int limit = pInfoUser.getRecordCountPerPage();
		int offset = (pInfoUser.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> todayUserList = sqlSession.selectList("AdminMapper.todayUserList", null, rowBounds);
		return todayUserList;
	}

	@Override
	public List<Jiqoo> todayJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Jiqoo> todayJiqooList = sqlSession.selectList("AdminMapper.todayJiqooList", null, rowBounds);
		return todayJiqooList;
	}

	@Override
	public List<Moqoo> todayMoqooList(SqlSession sqlSession, PageInfo pInfoJiqoo) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Moqoo> todayMoqooList = sqlSession.selectList("AdminMapper.todayMoqooList", null, rowBounds);
		return todayMoqooList;
	}

	/**
	 * 현재 가입중인 회원 나이대 비율
	 */
	@Override
	public List<User> userAgeList(SqlSession sqlSession) {
		List<User> userAgeList = sqlSession.selectList("AdminMapper.userAgeList");
		return userAgeList;
	}

	@Override
	public List<Comment> todayComtList(SqlSession sqlSession, PageInfo pInfoJiqoo) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Comment> todayComtList = sqlSession.selectList("AdminMapper.todayComtList", null, rowBounds);
		return todayComtList;
	}

	@Override
	public List<Map<String, Object>> userCountList(SqlSession sqlSession, User user) {
		List<Map<String, Object>> userCountList = sqlSession.selectList("AdminMapper.userCountList", user);
		return userCountList;
	}

	@Override
	public List<Map<String, Object>> dayCountList(SqlSession sqlSession, Map<String,Object>statsMap) {
		List<Map<String, Object>> dayCountList = sqlSession.selectList("AdminMapper.dayCountList", statsMap);
		return dayCountList;
	}





	
	



	



}
