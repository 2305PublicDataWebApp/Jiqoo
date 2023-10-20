package com.jiqoo.admin.service;

import java.util.List;
import java.util.Map;


import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

public interface AdminService {
	
	/**
	 * 회원관리페이지 총게시물수
	 * @return
	 */
	public Integer getUserListCount();

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 * @return
	 */
	public List<User> selectAllUser(PageInfo pInfo);
	
	/**
	 * 회원리스트 검색 총 게시물 수 
	 * @param searchUserMap
	 * @return
	 */
	public Integer getUserSearchListCount(Map<String, String> searchUserMap);
	
	/**
	 * 회원 검색결과 리스트(+페이징)
	 * @param pInfo
	 * @param searchUserMap
	 * @return
	 */
	public List<User> searchUserByKeyword(PageInfo pInfo, Map<String, String> searchUserMap);

	/**
	 * 회원 상세조회
	 * @param userId
	 * @return
	 */
	public User selectUserByUserId(String userId);

	/**
	 * 회원 강제탈퇴
	 * @param userId
	 * @return
	 */
	public Integer deleteUserByAdmin(String userId);

	/**
	 * 강퇴회원 부활
	 * @param userId
	 * @return
	 */
	public Integer reviveUserByAdmin(String userId);

	/**
	 * 회원별 총 지꾸수
	 * @return
	 */
	public Integer getUserJiqooListCount(String jiqooWriter);

	/**
	 * 회원별 지꾸 리스트 
	 * @param pInfo
	 * @return
	 */
	public List<Jiqoo> showUserJiqooList(PageInfo pInfoJiqoo, String jiqooWriter);

	/**
	 * 회원별 모꾸수
	 * @param userId
	 * @return
	 */
	public Integer getUserMoqooListCount(String moqooWriter);

	/**
	 * 회원별 모꾸 리스트 
	 * @param pInfoMoqoo
	 * @param userId
	 * @return
	 */
	public List<Moqoo> showUserMoqooList(PageInfo pInfoMoqoo, String userId);

	/**
	 * 회원별 총 댓글 수
	 * @param userId
	 * @return
	 */
	public Integer getusersTotalComtCount(String comtWriter);

	/**
	 * 회원별 총 댓글 리스트
	 * @param pInfoComt
	 * @param comtWriter
	 * @return
	 */
	public List<Comment> showUserComtList(PageInfo pInfoComt, String comtWriter);

	/**
	 * 총 지꾸 수 
	 * @return
	 */
	public Integer getJiqooListCount();

	/**
	 * 총 지꾸 리스트
	 * @param pInfo
	 * @return
	 */
	public List<Jiqoo> selectAllJiqoo(PageInfo pInfo);

	/**
	 * 지꾸검색 결과수 
	 * @param searchJiqooMap
	 * @return
	 */
	public Integer getJiqooSearchListCount(Map<String, String> searchJiqooMap);

	/**
	 * 지꾸 검색 리스트(+페이징)
	 * @param pInfo
	 * @param searchJiqooMap
	 * @return
	 */
	public List<Jiqoo> searchJiqooByKeyword(PageInfo pInfo, Map<String, String> searchJiqooMap);

	/**
	 * 총 모꾸 수 
	 * @return
	 */
	public Integer getMoqooListCount();

	/**
	 * 
	 * @param pInfo
	 * @return
	 */
	public List<Moqoo> selectAllMoqoo(PageInfo pInfo);

	/**
	 * 지꾸관리_강제삭제
	 * @param jiqoo
	 * @return
	 */
	public Integer deleteJiqooByAdmin(Integer jiqooNo);
	
	/**
	 * 모꾸 강제삭제
	 * @param moqooNo
	 * @return
	 */
	public Integer deleteMoqooByAdmin(Integer moqooNo);
	
	/**
	 * 회원상세_댓글 강제삭제 
	 * @param comtNo
	 * @return
	 */
	public Integer deleteComtByAdmin(Integer comtNo);

	public Jiqoo selectOneJiqoo(Jiqoo jiqoo);

	/**
	 * 
	 * @param user
	 * @return
	 */
	public User selectOneUser(User user);

	/**
	 * 유지중인 지꾸 총 개수
	 * @param jiqoo
	 * @return
	 */
	public Integer usingJiqooCount(Jiqoo jiqoo);
	
	/**
	 * 유지중인 모꾸 총 개수
	 * @param moqoo
	 * @return
	 */
	public Integer usingMoqooCount(Moqoo moqoo);

	/**
	 * 가입중인 회원 성비
	 * @return
	 */
	public List<User> userGenderList();

	/**
	 * 당일 가입한 회원 수 
	 * @return
	 */
	public Integer todayJoinUserCount();

	/**
	 * 전일 가입한 회원 수
	 * @return
	 */
	public Integer yesterdayJoinUserCount();

	/**
	 * 검색된 총 모꾸 수
	 * @param searchMoqooMap
	 * @return
	 */
	public Integer getMoqooSearchListCount(Map<String, String> searchMoqooMap);

	/**
	 * 검색된 모꾸 리스트 
	 * @param pInfo
	 * @param searchMoqooMap
	 * @return
	 */
	public List<Moqoo> searchMoqooByKeyword(PageInfo pInfo, Map<String, String> searchMoqooMap);

	/**
	 * 당일 등록된 지꾸 수 
	 * @return
	 */
	public Integer todayInsertJiqooCount();

	/**
	 * 전일 등록된 지꾸 수
	 * @return
	 */
	public Integer yesterdayInsertJiqooCount();

	/**
	 * 당일 등록된 모꾸 수  
	 * @return
	 */
	public Integer todayInsertMoqooCount();

	/**
	 * 전일 등록된 모꾸 수
	 * @return
	 */
	public Integer yesterdayInsertMoqooCount();



	/**
	 * 총 채팅방 수
	 * @return
	 */
	public Integer getChatRoomListCount();

	/**
	 * 총 채팅방 리스트
	 * @param pInfo
	 * @return
	 */
	public List<ChatRoom> selectAllChatRoom(PageInfo pInfo);

	/**
	 * 당일 가입한 회원 리스트
	 * @param pInfoUser
	 * @return
	 */
	public List<User> todayUserList(PageInfo pInfoUser);

	/**
	 * 당일 등록된 지꾸 리스트
	 * @param pInfoJiqoo
	 * @return
	 */
	public List<Jiqoo> todayJiqooList(PageInfo pInfoJiqoo);

	/**
	 * 당일 등록된 모꾸 리스트
	 * @param pInfoJiqoo
	 * @return
	 */
	public List<Moqoo> todayMoqooList(PageInfo pInfoJiqoo);

	/**
	 * 당일 등록된 댓글 리스트
	 * @param pInfoJiqoo
	 * @return
	 */
	public List<Comment> todayComtList(PageInfo pInfoJiqoo);
	
	
	/**
	 * 현재 가입중인 회원 나이대 비율
	 * @return
	 */
	public List<User> userAgeList();

	public List<Map<String, Object>> userCountList(User user);

	/**
	 * 통합차트_날짜별 지꾸모꾸회원 등록수 리스트
	 * @param statsMap
	 * @return
	 */
	public List<Map<String, Object>> dayCountList(Map<String,Object>statsMap);

	public List<Map<String, Object>> selectAllChatRoom(PageInfo pInfo, Map<String, Object> chatMap);

	public List<Map<String, Object>> jiqooChartList(Jiqoo jiqoo);

	/**
	 * 이번주 등록된 지꾸 수
	 * @return
	 */
	public Integer thisWeekInsertJiqooCount();

	/**
	 * 지난주 등록된 지꾸 수
	 * @return
	 */
	public Integer lastWeekInsertJiqooCount();

	/**
	 * 이번주 등록된 모꾸 수
	 * @return
	 */
	public Integer thisWeekInsertMoqooCount();

	/**
	 * 지난주 등록된 모꾸 수
	 * @return
	 */
	public Integer lastWeekInsertMoqooCount();

	/**
	 * 이번주 가입한 회원수
	 * @return
	 */
	public Integer thisWeekJoinUserCount();

	/**
	 * 지난주 가입한 회원 수
	 * @return
	 */
	public Integer lastWeekJoinUserCount();

	/**
	 * 강제삭제 모꾸 복원
	 * @param moqooNo
	 * @return
	 */
	public Integer reviveMoqooByAdmin(String moqooNo);

	/**
	 * 강제삭제 지꾸 복원
	 * @param jiqooNo
	 * @return
	 */
	public Integer reviveJiqooByAdmin(String jiqooNo);





	
	





	

}
