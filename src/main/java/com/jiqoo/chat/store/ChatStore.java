package com.jiqoo.chat.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;

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

}
