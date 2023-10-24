package com.jiqoo.admin.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.admin.domain.AdminChat;
import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.chat.domain.ChatMessage;
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
	 * 회원 상세조회
	 */
	@Override
	public User selectUserByUserId(SqlSession sqlSession, String userId) {
		User user = sqlSession.selectOne("AdminMapper.selectUserByUserId", userId);
		return user;
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
	 * 회원 강제탈퇴
	 */
	@Override
	public Integer deleteUserByAdmin(SqlSession sqlSession, String userId) {
		Integer result = sqlSession.update("AdminMapper.deleteUserByAdmin", userId);
		return result;
	}

	
	/**
	 * 강제탈퇴 회원 복원 
	 */
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
		List<Jiqoo> jiqooList = sqlSession.selectList("AdminMapper.showUserJiqooList", jiqooWriter, rowBounds);
		return jiqooList;
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
		List<Moqoo> moqooList = sqlSession.selectList("AdminMapper.showUserMoqooList", userId, rowBounds);
		return moqooList;
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
		List<Comment> comtList = sqlSession.selectList("AdminMapper.showUserComtList", comtWriter, rowBounds);
		return comtList;
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
	 * 강제삭제 댓글 복원
	 */
	@Override
	public Integer reviveCommentByAdmin(SqlSession sqlSession, String comtNo) {
		Integer result = sqlSession.update("AdminMapper.reviveCommentByAdmin", comtNo);
		return result;
	}
// ============================지꾸============================ 
	
	/**
	 * 지꾸관리페이지_지꾸차트
	 */
	@Override
	public List<Map<String, Object>> jiqooChartList(SqlSession sqlSession, Jiqoo jiqoo) {
		List<Map<String, Object>> jiqooChartList = sqlSession.selectList("AdminMapper.jiqooChartList", jiqoo);
		return jiqooChartList;
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
	
	
	/**
	 * 지꾸 강제 삭제 + 회원별 지꾸 강제삭제 
	 */
	@Override
	public Integer deleteJiqooByAdmin(SqlSession sqlSession, Integer jiqooNo) {
		Integer result = sqlSession.update("AdminMapper.deleteJiqooByAdmin", jiqooNo);
		return result;
	}

	/**
	 * 강제삭제 지꾸 복원
	 */
	@Override
	public Integer reviveJiqooByAdmin(SqlSession sqlSession, String jiqooNo) {
		Integer result = sqlSession.update("AdminMapper.reviveJiqooByAdmin", jiqooNo);
		return result;
	}
	
// ============================모꾸============================ 

	/**
	 * 모꾸관리페이지 총 모꾸수 
	 */
	@Override
	public Integer getMoqooListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getMoqooListCount");
		return result;
	}

	/**
	 * 모꾸관리페이지 총 모꾸 리스트
	 */
	@Override
	public List<Moqoo> selectAllMoqoo(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Moqoo> moqooList = sqlSession.selectList("AdminMapper.selectAllMoqoo", null, rowBounds);
		return moqooList;
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
	 * 모꾸 강제삭제 + 회원별 모꾸 강제삭제 
	 */
	@Override
	public Integer deleteMoqooByAdmin(SqlSession sqlSession, Integer moqooNo) {
		Integer result = sqlSession.update("AdminMapper.deleteMoqooByAdmin", moqooNo);
		return result;
	}

	/**
	 * 강제삭제 모꾸 복원
	 */
	@Override
	public Integer reviveMoqooByAdmin(SqlSession sqlSession, String moqooNo) {
		Integer result = sqlSession.update("AdminMapper.reviveMoqooByAdmin", moqooNo);
		return result;
	}
	
	
// ============================메인차트============================ 
	
	/**
	 * 유지중인 지꾸 총 개수
	 */
	@Override
	public Integer usingJiqooCount(SqlSession sqlSession, Jiqoo jiqoo) {
		Integer jiqooResult = sqlSession.selectOne("AdminMapper.usingJiqooCount", jiqoo);
		return jiqooResult;
	}

	/**
	 * 유지중인 모꾸 총 개수
	 */
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
	 * 현재 가입중인 회원 나이대 비율
	 */
	@Override
	public List<User> userAgeList(SqlSession sqlSession) {
		List<User> userAgeList = sqlSession.selectList("AdminMapper.userAgeList");
		return userAgeList;
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
	 * 이번주 등록된 지꾸 수
	 */
	@Override
	public Integer thisWeekInsertJiqooCount(SqlSession sqlSession) {
		Integer resultThisWeek = sqlSession.selectOne("AdminMapper.thisWeekInsertJiqooCount");
		return resultThisWeek;
	}

	/**
	 * 지난주 등록된 지꾸 수
	 */
	@Override
	public Integer lastWeekInsertJiqooCount(SqlSession sqlSession) {
		Integer resultlastWeek = sqlSession.selectOne("AdminMapper.lastWeekInsertJiqooCount");
		return resultlastWeek;
	}

	/**
	 * 이번주 등록된 모꾸 수
	 */
	@Override
	public Integer thisWeekInsertMoqooCount(SqlSession sqlSession) {
		Integer resultThisWeek = sqlSession.selectOne("AdminMapper.thisWeekInsertMoqooCount");
		return resultThisWeek;
	}

	/**
	 * 지난주 등록된 모꾸 수
	 */
	@Override
	public Integer lastWeekInsertMoqooCount(SqlSession sqlSession) {
		Integer resultlastWeek = sqlSession.selectOne("AdminMapper.lastWeekInsertMoqooCount");
		return resultlastWeek;
	}

	/**
	 * 이번주 가입한 회원수
	 */
	@Override
	public Integer thisWeekJoinUserCount(SqlSession sqlSession) {
		Integer resultThisWeek = sqlSession.selectOne("AdminMapper.thisWeekJoinUserCount");
		return resultThisWeek;
	}

	/**
	 * 지난주 가입한 회원 수
	 */
	@Override
	public Integer lastWeekJoinUserCount(SqlSession sqlSession) {
		Integer resultlastWeek = sqlSession.selectOne("AdminMapper.lastWeekJoinUserCount");
		return resultlastWeek;
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

	/**
	 * 당일 등록된 지꾸리스트
	 */
	@Override
	public List<Jiqoo> todayJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Jiqoo> todayJiqooList = sqlSession.selectList("AdminMapper.todayJiqooList", null, rowBounds);
		return todayJiqooList;
	}

	/**
	 * 당일 등록된 모꾸 리스트 
	 */
	@Override
	public List<Moqoo> todayMoqooList(SqlSession sqlSession, PageInfo pInfoJiqoo) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Moqoo> todayMoqooList = sqlSession.selectList("AdminMapper.todayMoqooList", null, rowBounds);
		return todayMoqooList;
	}

	/**
	 * 당일 등록된 댓글 리스트
	 */
	@Override
	public List<Comment> todayComtList(SqlSession sqlSession, PageInfo pInfoJiqoo) {
		int limit = pInfoJiqoo.getRecordCountPerPage();
		int offset = (pInfoJiqoo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Comment> todayComtList = sqlSession.selectList("AdminMapper.todayComtList", null, rowBounds);
		return todayComtList;
	}

	/**
	 * 통합차트_날짜별 지꾸모꾸회원 등록수 리스트
	 */
	@Override
	public List<Map<String, Object>> dayCountList(SqlSession sqlSession, Map<String,Object>statsMap) {
		List<Map<String, Object>> dayCountList = sqlSession.selectList("AdminMapper.dayCountList", statsMap);
		return dayCountList;
	}

	


	

// ============================채팅============================

	/**
	 * 총 채팅방 수
	 */
	@Override
	public Integer getChatRoomListCount(SqlSession sqlSession) {
		Integer result = sqlSession.selectOne("AdminMapper.getChatRoomListCount");
		return result;
	}


	/**
	 * 다있는 채팅방 리스트
	 */
	@Override
	public List<AdminChat> selectChatRoomAllList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdminChat> chatRoomAllList = sqlSession.selectList("AdminMapper.selectChatRoomAllList",null, rowBounds);
		return chatRoomAllList;
	}

	/**
	 * 챗방 강제삭제
	 */
	@Override
	public Integer deleteChatByAdmin(SqlSession sqlSession, Integer chatNo) {
		Integer result = sqlSession.delete("AdminMapper.deleteChatByAdmin", chatNo);
		return result;
	}

	

	/**
	 * 회원 날짜별 가입수 리스트
	 */
	@Override
	public List<Map<String, Object>> userCountList(SqlSession sqlSession, User user) {
		List<Map<String, Object>> userCountList = sqlSession.selectList("AdminMapper.userCountList", user);
		return userCountList;
	}

	@Override
	public List<Map<String, Object>> jiqooCountList(SqlSession sqlSession, Jiqoo jiqoo) {
		List<Map<String, Object>> jiqooCountList = sqlSession.selectList("AdminMapper.jiqooCountList", jiqoo);
		return jiqooCountList;
	}

	@Override
	public List<Map<String, Object>> moqooCountList(SqlSession sqlSession) {
		List<Map<String, Object>> moqooCountList = sqlSession.selectList("AdminMapper.moqooCountList");
		return moqooCountList;
	}





	



}
