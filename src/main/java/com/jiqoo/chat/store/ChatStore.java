package com.jiqoo.chat.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
import com.jiqoo.report.domain.ChatReport;
import com.jiqoo.user.domain.User;

public interface ChatStore {

	/**
	 * 아이디로 참여 채팅방 조회 Store
	 * 
	 * @param sqlSession
	 * @param userId
	 * @return List<ChatRoom>
	 */
	List<ChatRoom> selectChatRoomById(SqlSession sqlSession, String userId);

	/**
	 * 채팅방 별 메시지 조회 Store
	 * 
	 * @param sqlSession
	 * @param chatNo
	 * @return List<ChatMessage>
	 */
	List<ChatMessage> selectChatMessageByNo(SqlSession sqlSession, int chatNo);

	/**
	 * 채팅 메시지 등록 Store
	 * 
	 * @param sqlSession
	 * @param chatMessage
	 * @return int
	 */
	int insertChatMessage(SqlSession sqlSession, ChatMessage chatMessage);

	/**
	 * 유저 아이디로 채팅방 초대 Store
	 * 
	 * @param sqlSession
	 * @param chatNo
	 * @param userId
	 * @return int
	 */
	int insertChatUserByChatNo(SqlSession sqlSession, int chatNo, String userId);

	/**
	 * 모꾸 생성시 채팅방 개설 Store
	 * 
	 * @param sqlSession
	 * @param chatRoom
	 * @return int
	 */
	int insertNewChatRoomByMoqoo(SqlSession sqlSession, ChatRoom chatRoom);

	/**
	 * 채팅방 신고 Store
	 * 
	 * @param sqlSession
	 * @param chatReport
	 * @return int
	 */
	int insertChatReport(SqlSession sqlSession, ChatReport chatReport);

	/**
	 * 채팅방 연결 해제시 마지막 접속시간 업데이트 Store
	 * 
	 * @param sqlSession
	 * @param chatUser
	 * @return
	 */
	int updateChatLastDate(SqlSession sqlSession, ChatUser chatUser);

	/**
	 * 채팅방 나가기 Store
	 * 
	 * @param sqlSession
	 * @param chatUser
	 * @return int
	 */
	int deleteChatUserById(SqlSession sqlSession, ChatUser chatUser);

	/**
	 * 읽지 않은 메시지 갯수 조회 Store
	 * 
	 * @param sqlSession
	 * @param userId
	 * @param chatNo
	 * @return
	 */
	int selectCountUnreadMsg(SqlSession sqlSession, String userId, int chatNo);

	/**
	 * 읽지 않은 메시지 갯수 Store
	 * 
	 * @param sqlSession
	 * @param chatUser
	 * @return
	 */
	int selectUnreadMsgCount(SqlSession sqlSession, ChatUser chatUser);

	/**
	 * 메시지 ID로 유저 정보 조회 Store
	 * 
	 * @param sqlSession
	 * @param userId
	 * @return User
	 */
	User selectMsgSenderInfo(SqlSession sqlSession, String userId);

	/**
	 * 채팅방별 전체 참여자 조회 Store
	 * 
	 * @param sqlSession
	 * @param chatNo
	 * @return List<User>
	 */
	List<User> selectAllUserByChatNo(SqlSession sqlSession, int chatNo);

	/**
	 * 초대할 유저 검색 Store
	 * 
	 * @param sqlSession
	 * @param chatNo
	 * @param user
	 * @return List<User>
	 */
	List<User> selectUsersByKeyword(SqlSession sqlSession, int chatNo, String user);

	/**
	 * 채팅방 개설시 유저 검색 Store
	 * 
	 * @param sqlSession
	 * @param userId
	 * @param keyword
	 * @return List<User>
	 */
	List<User> selectJoinUserByKeyword(SqlSession sqlSession, String userId, String keyword);

	/**
	 * 채팅 개설시 유저 닉네임 조회 Store
	 * 
	 * @param sqlSession
	 * @param userId
	 * @return String
	 */
	String getUserNickname(SqlSession sqlSession, String userId);

	/**
	 * 채팅방 개설 Store
	 * 
	 * @param sqlSession
	 * @param chatRoom
	 * @return int
	 */
	int insertNewChatRoom(SqlSession sqlSession, ChatRoom chatRoom);

	/**
	 * 채팅방 개설시 유저 추가 Store
	 * 
	 * @param sqlSession
	 * @param chatRoomNo
	 * @param userId
	 * @return int
	 */
	int insertChatUserById(SqlSession sqlSession, int chatRoomNo, String userId);

	/**
	 * 채팅방 개설시 이미지 추가 Store
	 * 
	 * @param sqlSession
	 * @param userId
	 * @return String
	 */
	String getUserPhotoPath(SqlSession sqlSession, String userId);

	/**
	 * 채팅방 유저 추가시 채팅방 이름 업데이트 Store
	 * 
	 * @param sqlSession
	 * @param str
	 * @param chatNo 
	 */
	void updateChatName(SqlSession sqlSession, String str, int chatNo);

	/**
	 * 채팅방 번호로 조회 Store
	 * 
	 * @param sqlSession
	 * @param chatNo
	 * @return ChatRoom
	 */
	ChatRoom selectChatRoomByNo(SqlSession sqlSession, int chatNo);

	/**
	 * 모꾸 번호로 채팅방 조회 Store
	 * 
	 * @param sqlSession
	 * @param moqooNo
	 * @return ChatRoom
	 */
	ChatRoom selectChatRoomByMoqoo(SqlSession sqlSession, int moqooNo);

	/**
	 * 채팅방 나갈때 채팅방 이름 업데이트 Store
	 * 
	 * @param sqlSession
	 * @param str
	 * @param refChatNo
	 */
	void updateChatNameFromOut(SqlSession sqlSession, String str, int refChatNo);

}
