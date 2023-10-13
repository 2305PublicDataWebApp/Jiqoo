package com.jiqoo.chat.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;

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
	 * 채팅방 연결 해제시 마지막 접속시간 업데이트 Store
	 * 
	 * @param sqlSession
	 * @param chatUser
	 * @return
	 */
	int updateChatLastDate(SqlSession sqlSession, ChatUser chatUser);

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

}
