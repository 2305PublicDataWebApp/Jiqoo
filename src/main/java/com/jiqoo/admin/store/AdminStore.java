package com.jiqoo.admin.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.User;

public interface AdminStore {

	/**
	 * 회원관리페이지 총게시물수
	 * 
	 * @param sqlSession
	 * @return
	 */
	public Integer getUserListCount(SqlSession sqlSession);

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 * 
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	public List<User> selectAllUser(SqlSession sqlSession, PageInfo pInfo);

	/**
	 * 회원리스트 검색 총 게시물 수
	 * 
	 * @param sqlSession
	 * @param searchUserMap
	 * @return
	 */
	public Integer getUserSearchListCount(SqlSession sqlSession, Map<String, String> searchUserMap);

	/**
	 * 회원 검색결과 리스트(+페이징)
	 * 
	 * @param sqlSession
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	public List<User> searchUserByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> searchUserMap);

	/**
	 * 회원 상세조회
	 * 
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public User selectUserByUserId(SqlSession sqlSession, String userId);

	/**
	 * 회원 강제탈퇴
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public Integer deleteUserByAdmin(SqlSession sqlSession, String userId);

	/**
	 * 강제탈퇴 회원 복원 
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public Integer reviveUserByAdmin(SqlSession sqlSession, String userId);

	/**
	 * 회원별 총 지꾸수
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	public Integer getUserJiqooListCount(SqlSession sqlSession, String jiqooWriter);

	/**
	 * 회원별 지꾸 리스트 
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	public List<Jiqoo> showUserJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo, String jiqooWriter);

	/**
	 * 회원별 모꾸수
	 * @param sqlSession
	 * @param moqooWriter
	 * @return
	 */
	public Integer getUserMoqooListCount(SqlSession sqlSession, String moqooWriter);

	/**
	 * 회원별 모꾸 리스트 
	 * @param sqlSession
	 * @param pInfoMoqoo
	 * @param userId
	 * @return
	 */
	public List<Moqoo> showUserMoqooList(SqlSession sqlSession, PageInfo pInfoMoqoo, String userId);

	/**
	 * 회원별 총 댓글 수
	 * @param sqlSession
	 * @param comtWriter
	 * @return
	 */
	public Integer getusersTotalComtCount(SqlSession sqlSession, String comtWriter);

	/**
	 * 회원별 총 댓글 리스트
	 * @param sqlSession
	 * @param pInfoComt
	 * @param comtWriter
	 * @return
	 */
	public List<Comment> showUserComtList(SqlSession sqlSession, PageInfo pInfoComt, String comtWriter);


	
	/**
	 * 총 지꾸 수 
	 * @param sqlSession
	 * @return
	 */
	public Integer getJiqooListCount(SqlSession sqlSession);

	/**
	 * 총 지꾸 리스트
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	public List<Jiqoo> selectAllJiqoo(SqlSession sqlSession, PageInfo pInfo);

	/**
	 * 지꾸검색 결과수 
	 * @param sqlSession
	 * @param searchJiqooMap
	 * @return
	 */
	public Integer getJiqooSearchListCount(SqlSession sqlSession, Map<String, String> searchJiqooMap);

	/**
	 * 지꾸 검색 리스트(+페이징)
	 * @param sqlSession
	 * @param pInfo
	 * @param searchJiqooMap
	 * @return
	 */
	public List<Jiqoo> searchJiqooByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> searchJiqooMap);

	/**
	 * 모꾸관리페이지 총 모꾸수
	 * @param sqlSession
	 * @return
	 */
	public Integer getMoqooListCount(SqlSession sqlSession);

	/**
	 * 모꾸관리페이지 총 모꾸 리스트
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	public List<Moqoo> selectAllMoqoo(SqlSession sqlSession, PageInfo pInfo);

	/**
	 * 지꾸 강제삭제 
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	public Integer deleteJiqooByAdmin(SqlSession sqlSession, Integer jiqooNo);

	/**
	 * 유지중인 지꾸 총 개수 
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	public Integer usingJiqooCount(SqlSession sqlSession, Jiqoo jiqoo);

	/**
	 * 유지중인 모꾸 총 개수 
	 * @param sqlSession
	 * @param moqoo
	 * @return
	 */
	public Integer usingMoqooCount(SqlSession sqlSession, Moqoo moqoo);

	/**
	 * 가입중인 회원 성비 
	 * @param sqlSession
	 * @return
	 */
	public List<User> userGenderList(SqlSession sqlSession);

	/**
	 *  당일 가입한 회원 수 
	 * @param sqlSession
	 * @return
	 */
	public Integer todayJoinUserCount(SqlSession sqlSession);

	/**
	 * 전일 가입한 회원 수 
	 * @param sqlSession
	 * @return
	 */
	public Integer yesterdayJoinUserCount(SqlSession sqlSession);

	/**
	 * 검색된 총 모꾸 수
	 * @param sqlSession
	 * @param searchMoqooMap
	 * @return
	 */
	public Integer getMoqooSearchListCount(SqlSession sqlSession, Map<String, String> searchMoqooMap);

	/**
	 * 검색된 모꾸 리스트 (+페이징)
	 * @param sqlSession
	 * @param pInfo
	 * @param searchMoqooMap
	 * @return
	 */
	public List<Moqoo> searchMoqooByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> searchMoqooMap);

	/**
	 * 당일 등록된 지꾸 수
	 * @param sqlSession
	 * @return
	 */
	public Integer todayInsertJiqooCount(SqlSession sqlSession);

	/**
	 * 전일 등록된 지꾸 수 
	 * @param sqlSession
	 * @return
	 */
	public Integer yesterdayInsertJiqooCount(SqlSession sqlSession);

	/**
	 * 당일 등록된 모꾸 수 
	 * @param sqlSession
	 * @return
	 */
	public Integer todayInsertMoqooCount(SqlSession sqlSession);

	/**
	 * 전일 등록된 모꾸 수
	 * @param sqlSession
	 * @return
	 */
	public Integer yesterdayInsertMoqooCount(SqlSession sqlSession);

	/**
	 * 모꾸 강제삭제
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	public Integer deleteMoqooByAdmin(SqlSession sqlSession, Integer moqooNo);

	/**
	 * 총 채팅방 수
	 * @param sqlSession
	 * @return
	 */
	public Integer getChatRoomListCount(SqlSession sqlSession);


	/**
	 * 당일 가입한 회원 리스트
	 * @param sqlSession
	 * @param pInfoUser
	 * @return
	 */
	public List<User> todayUserList(SqlSession sqlSession, PageInfo pInfoUser);

	/**
	 * 당일 등록된 지꾸 리스트 
	 * @param sqlSession
	 * @param pInfoJiqoo
	 * @return
	 */
	public List<Jiqoo> todayJiqooList(SqlSession sqlSession, PageInfo pInfoJiqoo);

	/**
	 * 당일 등록된 모꾸 리스트 
	 * @param sqlSession
	 * @param pInfoJiqoo
	 * @return
	 */
	public List<Moqoo> todayMoqooList(SqlSession sqlSession, PageInfo pInfoJiqoo);

	/**
	 * 현재 가입중인 회원 나이대 비율
	 * @param sqlSession
	 * @return
	 */
	public List<User> userAgeList (SqlSession sqlSession);

	/**
	 * 댓글 강제삭제 
	 * @param sqlSession
	 * @param comtNo
	 * @return
	 */
	public Integer deleteComtByAdmin(SqlSession sqlSession, Integer comtNo);

	/**
	 * 당일 등록된 댓글 리스트
	 * @param sqlSession
	 * @param pInfoJiqoo
	 * @return
	 */
	public List<Comment> todayComtList(SqlSession sqlSession, PageInfo pInfoJiqoo);

	

	/**
	 * 통합차트_날짜별 지꾸모꾸회원 등록수 리스트
	 * @param sqlSession
	 * @param statsMap
	 * @return
	 */
	public List<Map<String, Object>> dayCountList(SqlSession sqlSession, Map<String,Object>statsMap);

	/**
	 * 지꾸페이지 차트 
	 * @param sqlSession
	 * @param jiqoo
	 * @return
	 */
	public List<Map<String, Object>> jiqooChartList(SqlSession sqlSession, Jiqoo jiqoo);

	/**
	 * 이번주 등록된 지꾸 수
	 * @param sqlSession
	 * @return
	 */
	public Integer thisWeekInsertJiqooCount(SqlSession sqlSession);

	/**
	 * 지난주 등록된 지꾸 수
	 * @param sqlSession
	 * @return
	 */
	public Integer lastWeekInsertJiqooCount(SqlSession sqlSession);

	/**
	 * 이번주 등록된 모꾸 수
	 * @param sqlSession
	 * @return
	 */
	public Integer thisWeekInsertMoqooCount(SqlSession sqlSession);

	/**
	 * 지난주 등록된 모꾸 수
	 * @param sqlSession
	 * @return
	 */
	public Integer lastWeekInsertMoqooCount(SqlSession sqlSession);

	/**
	 * 이번주 가입한 회원수
	 * @param sqlSession
	 * @return
	 */
	public Integer thisWeekJoinUserCount(SqlSession sqlSession);

	/**
	 * 지난주 가입한 회원 수
	 * @param sqlSession
	 * @return
	 */
	public Integer lastWeekJoinUserCount(SqlSession sqlSession);

	/**
	 * 강제삭제 지꾸 복원
	 * @param sqlSession
	 * @param jiqooNo
	 * @return
	 */
	public Integer reviveJiqooByAdmin(SqlSession sqlSession, String jiqooNo);
	
	/**
	 * 강제삭제 모꾸 복원
	 * @param sqlSession
	 * @param moqooNo
	 * @return
	 */
	public Integer reviveMoqooByAdmin(SqlSession sqlSession, String moqooNo);

	/**
	 * 강제삭제 댓글 복원
	 * @param sqlSession
	 * @param comtNo
	 * @return
	 */
	public Integer reviveCommentByAdmin(SqlSession sqlSession, String comtNo);

	/**
	 * 챗방 강제삭제
	 * @param sqlSession
	 * @param chatNo
	 * @return
	 */
	public Integer deleteChatByAdmin(SqlSession sqlSession, Integer chatNo);

	/**
	 * 마지막 채팅시간있는 챗방리스트
	 * @param sqlSession
	 * @return
	 */
//	public List<ChatMessage> selectlastMsgByChatNo(SqlSession sqlSession);
//
	/**
	 * 채팅방리스트
	 * @param sqlSession
	 * @return
	 */
//	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession);

	/**
	 * 다있는 채팅방 리스트
	 * @param sqlSession
	 * @param pInfo
	 * @param chatMap
	 * @return
	 */
	public List<Map<String, Object>> selectChatRoomAllList(SqlSession sqlSession, PageInfo pInfo, Map<String, Object> chatMap);

	/**
	 * 회원 날짜별 가입수 리스트
	 * @param sqlSession
	 * @param user
	 * @return
	 */
	public List<Map<String, Object>> userCountList(SqlSession sqlSession, User user);

	public List<Map<String, Object>> jiqooCountList(SqlSession sqlSession, Jiqoo jiqoo);




}
