package com.jiqoo.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.admin.service.AdminService;
import com.jiqoo.admin.store.AdminStore;
import com.jiqoo.chat.domain.ChatRoom;
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

	@Override
	public Integer getMoqooListCount() {
		Integer result = adminStore.getMoqooListCount(sqlSession);
		return result;
	}

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

	@Override
	public Jiqoo selectOneJiqoo(Jiqoo jiqoo) {
		Jiqoo jiqooOne = adminStore.selectOneJiqoo(sqlSession, jiqoo);
		return jiqooOne;
	}

	@Override
	public User selectOneUser(User user) {
		User userOne = adminStore.selectOneUser(sqlSession, user);
		return userOne;
	}

	@Override
	public Integer usingJiqooCount(Jiqoo jiqoo) {
		Integer jiqooResult = adminStore.usingJiqooCount(sqlSession, jiqoo);
		return jiqooResult;
	}

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
	 * 총 채팅방 리스트
	 */
	@Override
	public List<ChatRoom> selectAllChatRoom(PageInfo pInfo) {
		List<ChatRoom> chatRoomList = adminStore.selectAllChatRoom(sqlSession, pInfo);
		return chatRoomList;
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



}
