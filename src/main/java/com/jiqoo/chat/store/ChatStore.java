package com.jiqoo.chat.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
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

}
