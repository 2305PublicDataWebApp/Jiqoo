package com.jiqoo.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.admin.service.AdminService;
import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.report.domain.Report;
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
	public Integer getUserSearchListCount(Map<String, String> searchUserMap) {
		Integer result = adminStore.getUserSearchListCount(sqlSession, searchUserMap);
		return result;
	}

	/**
	 * 회원 검색결과 리스트(+페이징)
	 */
	@Override
	public List<User> searchUserByKeyword(PageInfo pInfo, Map<String, String> searchUserMap) {
		List<User> searchUserList = adminStore.searchUserByKeyword(sqlSession, pInfo, searchUserMap);
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
	public List<Jiqoo> showUserJiqooList(PageInfo pInfoJiqoo, String jiqooWriter) {
		List<Jiqoo> jiqooList = adminStore.showUserJiqooList(sqlSession, pInfoJiqoo, jiqooWriter);
		return jiqooList;
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
		List<Moqoo> moqooList = adminStore.showUserMoqooList(sqlSession, pInfoMoqoo, userId);
		return moqooList;
	}

	/**
	 * 회원별 총 댓글 수
	 */
	@Override
	public Integer getusersTotalComtCount(String comtWriter) {
		Integer result = adminStore.getusersTotalComtCount(sqlSession, comtWriter);
		return result;
	}

	/**
	 * 회원별 총 댓글 리스트
	 */
	@Override
	public List<Comment> showUserComtList(PageInfo pInfoComt, String comtWriter) {
		List<Comment> comtList = adminStore.showUserComtList(sqlSession, pInfoComt, comtWriter);
		return comtList;
	}
	
	
	/**
	 * 총 지꾸 수 
	 */
	@Override
	public Integer getJiqooListCount() {
		Integer result = adminStore.getJiqooListCount(sqlSession);
		return result;
	}

	/**
	 * 총 지꾸 리스트
	 */
	@Override
	public List<Jiqoo> selectAllJiqoo(PageInfo pInfo) {
		List<Jiqoo> jiqooList = adminStore.selectAllJiqoo(sqlSession, pInfo);
		return jiqooList;
	}

	/**
	 * 지꾸검색 결과수 
	 */
	@Override
	public Integer getJiqooSearchListCount(Map<String, String> searchJiqooMap) {
		Integer result = adminStore.getJiqooSearchListCount(sqlSession, searchJiqooMap);
		return result;
	}

	/**
	 * 지꾸 검색 리스트(+페이징)
	 */
	@Override
	public List<Jiqoo> searchJiqooByKeyword(PageInfo pInfo, Map<String, String> searchJiqooMap) {
		List<Jiqoo> searchJiqooList = adminStore.searchJiqooByKeyword(sqlSession, pInfo, searchJiqooMap);
		return searchJiqooList;
	}

	/**
	 * 모꾸관리페이지 총 모꾸수
	 */
	@Override
	public Integer getMoqooListCount() {
		Integer result = adminStore.getMoqooListCount(sqlSession);
		return result;
	}

	/**
	 * 모꾸관리페이지 총 모꾸 리스트
	 */
	@Override
	public List<Moqoo> selectAllMoqoo(PageInfo pInfo) {
		List<Moqoo> moqooList = adminStore.selectAllMoqoo(sqlSession, pInfo);
		return moqooList;
	}

	/**
	 * 지꾸 강제 삭제
	 */
	@Override
	public Integer deleteJiqooByAdmin(Integer jiqooNo) {
		Integer result = adminStore.deleteJiqooByAdmin(sqlSession, jiqooNo);
		return result;
	}

	/**
	 * 유지중인 지꾸 총 개수  
	 */
	@Override
	public Integer usingJiqooCount(Jiqoo jiqoo) {
		Integer jiqooResult = adminStore.usingJiqooCount(sqlSession, jiqoo);
		return jiqooResult;
	}

	/**
	 * 유지중인 모꾸 총 개수
	 */
	@Override
	public Integer usingMoqooCount(Moqoo moqoo) {
		Integer moqooResult = adminStore.usingMoqooCount(sqlSession, moqoo);
		return moqooResult;
	}

	/**
	 * 가입중인 회원 성비 
	 */
	@Override
	public List<User> userGenderList() {
		List<User> userGenderList = adminStore.userGenderList(sqlSession);
		return userGenderList;
	}

	/**
	 *  당일 가입한 회원 수 
	 */
	@Override
	public Integer todayJoinUserCount() {
		Integer todayJoinUserCount = adminStore.todayJoinUserCount(sqlSession);
		return todayJoinUserCount;
	}

	/**
	 * 전일 가입한 회원 수 
	 */
	@Override
	public Integer yesterdayJoinUserCount() {
		Integer yesterdayJoinUserCount = adminStore.yesterdayJoinUserCount(sqlSession);
		return yesterdayJoinUserCount;
	}

	/**
	 * 검색된 총 모꾸 수
	 */
	@Override
	public Integer getMoqooSearchListCount(Map<String, String> searchMoqooMap) {
		Integer result = adminStore.getMoqooSearchListCount(sqlSession, searchMoqooMap);
		return result;
	}

	/**
	 * 검색된 모꾸 리스트 (+페이징)
	 */
	@Override
	public List<Moqoo> searchMoqooByKeyword(PageInfo pInfo, Map<String, String> searchMoqooMap) {
		List<Moqoo> searchMoqooList = adminStore.searchMoqooByKeyword(sqlSession, pInfo, searchMoqooMap);
		return searchMoqooList;
	}

	/**
	 * 당일 등록된 지꾸 수 
	 */
	@Override
	public Integer todayInsertJiqooCount() {
		Integer todayInsertJiqooCount = adminStore.todayInsertJiqooCount(sqlSession);
		return todayInsertJiqooCount;
	}
	
	/**
	 * 전일 등록된 지꾸 수 
	 */
	@Override
	public Integer yesterdayInsertJiqooCount() {
		Integer yesterdayInsertJiqooCount = adminStore.yesterdayInsertJiqooCount(sqlSession);
		return yesterdayInsertJiqooCount;
	}

	/**
	 * 당일 등록된 모꾸 수 
	 */
	@Override
	public Integer todayInsertMoqooCount() {
		Integer todayInsertMoqooCount = adminStore.todayInsertMoqooCount(sqlSession);
		return todayInsertMoqooCount;
	}

	/**
	 * 전일 등록된 모꾸 수
	 */
	@Override
	public Integer yesterdayInsertMoqooCount() {
		Integer yesterdayInsertMoqooCount = adminStore.yesterdayInsertMoqooCount(sqlSession);
		return yesterdayInsertMoqooCount;
	}

	/**
	 * 모꾸 강제삭제
	 */
	@Override
	public Integer deleteMoqooByAdmin(Integer moqooNo) {
		Integer result = adminStore.deleteMoqooByAdmin(sqlSession, moqooNo);
		return result;
	}

	/**
	 * 총 채팅방 수
	 */
	@Override
	public Integer getChatRoomListCount() {
		Integer result = adminStore.getChatRoomListCount(sqlSession);
		return result;
	}



		
	/**
	 * 당일 가입한 회원 리스트
	 */
	@Override
	public List<User> todayUserList(PageInfo pInfoUser) {
		List<User> todayUserList = adminStore.todayUserList(sqlSession, pInfoUser);
		return todayUserList;
	}

	/**
	 * 당일 등록된 지꾸 리스트
	 */
	@Override
	public List<Jiqoo> todayJiqooList(PageInfo pInfoJiqoo) {
		List<Jiqoo> todayJiqooList = adminStore.todayJiqooList(sqlSession, pInfoJiqoo);
		return todayJiqooList;
	}

	/**
	 * 당일 등록된 모꾸 리스트
	 */
	@Override
	public List<Moqoo> todayMoqooList(PageInfo pInfoJiqoo) {
		List<Moqoo> todayMoqooList = adminStore.todayMoqooList(sqlSession, pInfoJiqoo);
		return todayMoqooList;
	}

	/**
	 * 현재 가입중인 회원 나이대 비율
	 */
	@Override
	public List<User> userAgeList() {
		List<User> userAgeList = adminStore.userAgeList(sqlSession);
		return userAgeList;
	}


	/**
	 * 댓글 강제삭제 
	 */
	@Override
	public Integer deleteComtByAdmin(Integer comtNo) {
		Integer result = adminStore.deleteComtByAdmin(sqlSession, comtNo);
		return result;
	}


	/**
	 * 당일 등록된 댓글 리스트
	 */
	@Override
	public List<Comment> todayComtList(PageInfo pInfoJiqoo) {
		List<Comment> todayComtList = adminStore.todayComtList(sqlSession, pInfoJiqoo);
		return todayComtList;
	}


	/**
	 * 통합차트_날짜별 지꾸모꾸회원 등록수 리스트
	 */
	@Override
	public List<Map<String, Object>> dayCountList(Map<String,Object>statsMap) {
		List<Map<String, Object>> dayCountList = adminStore.dayCountList(sqlSession, statsMap);
		return dayCountList;
	}

	/**
	 * 지꾸 페이지 차트
	 */
	@Override
	public List<Map<String, Object>> jiqooChartList(Jiqoo jiqoo) {
		List<Map<String, Object>> jiqooChartList = adminStore.jiqooChartList(sqlSession, jiqoo);
		return jiqooChartList;
	}

	/**
	 * 이번주 등록된 지꾸 수
	 */
	@Override
	public Integer thisWeekInsertJiqooCount() {
		Integer resultThisWeek = adminStore.thisWeekInsertJiqooCount(sqlSession);
		return resultThisWeek;
	}

	/**
	 * 지난주 등록된 지꾸 수
	 */
	@Override
	public Integer lastWeekInsertJiqooCount() {
		Integer resultlastWeek = adminStore.lastWeekInsertJiqooCount(sqlSession);
		return resultlastWeek;
	}

	/**
	 * 이번주 등록된 모꾸 수
	 */
	@Override
	public Integer thisWeekInsertMoqooCount() {
		Integer resultThisWeek = adminStore.thisWeekInsertMoqooCount(sqlSession);
		return resultThisWeek;
	}

	/**
	 * 지난주 등록된 모꾸 수
	 */
	@Override
	public Integer lastWeekInsertMoqooCount() {
		Integer resultlastWeek = adminStore.lastWeekInsertMoqooCount(sqlSession);
		return resultlastWeek;
	}

	/**
	 * 이번주 가입한 회원수
	 */
	@Override
	public Integer thisWeekJoinUserCount() {
		Integer resultThisWeek = adminStore.thisWeekJoinUserCount(sqlSession);
		return resultThisWeek;
	}

	/**
	 * 지난주 가입한 회원 수
	 */
	@Override
	public Integer lastWeekJoinUserCount() {
		Integer resultlastWeek = adminStore.lastWeekJoinUserCount(sqlSession);
		return resultlastWeek;
	}

	/**
	 * 강제삭제 지꾸 복원
	 */
	@Override
	public Integer reviveJiqooByAdmin(String jiqooNo) {
		Integer result = adminStore.reviveJiqooByAdmin(sqlSession, jiqooNo);
		return result;
	}
	
	/**
	 * 강제삭제 모꾸 복원
	 */
	@Override
	public Integer reviveMoqooByAdmin(String moqooNo) {
		Integer result = adminStore.reviveMoqooByAdmin(sqlSession, moqooNo);
		return result;
	}



	/**
	 * 강제삭제 댓글 복원
	 */
	@Override
	public Integer reviveCommentByAdmin(String comtNo) {
		Integer result = adminStore.reviveCommentByAdmin(sqlSession, comtNo);
		return result;
	}

	/**
	 * 챗방 강제삭제
	 */
	@Override
	public Integer deleteChatByAdmin(Integer chatNo) {
		Integer result = adminStore.deleteChatByAdmin(sqlSession, chatNo);
		return result;
	}



	/**
	 * 마지막 채팅시간있는 챗방리스트
	 */
//	@Override
//	public List<ChatMessage> selectlastMsgByChatNo() {
//		List<ChatMessage> sendMsgList = adminStore.selectlastMsgByChatNo(sqlSession);
//		return sendMsgList;
//	}

	/**
	 * 채팅방리스트
	 */
//	@Override
//	public List<ChatRoom> selectChatRoomList() {
//		List<ChatRoom> chatRoomList = adminStore.selectChatRoomList(sqlSession);
//		return chatRoomList;
//	}

	/**
	 * 다있는 채팅방 리스트
	 */
//	@Override
//	public List<Map<String, Object>> selectChatRoomAllList(PageInfo pInfo, Map<String, Object> chatMap) {
//		List<Map<String, Object>> chatRoomAllList = adminStore.selectChatRoomAllList(sqlSession, pInfo, chatMap);
//		return chatRoomAllList;
//	}







	
	/**
	 * 회원 날짜별 가입수 리스트
	 */
	@Override
	public List<Map<String, Object>> userCountList(User user) {
		List<Map<String, Object>> userCountList = adminStore.userCountList(sqlSession, user);
		return userCountList;
	}



}
