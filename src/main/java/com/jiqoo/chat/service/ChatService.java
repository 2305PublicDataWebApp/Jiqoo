package com.jiqoo.chat.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;

public interface ChatService {

	/**
	 * 아이디로 참여 채팅방 조회 Service
	 * 
	 * @param userId
	 * @return List<ChatRoom>s
	 */
	List<ChatRoom> selectChatRoomById(String userId);

	/**
	 * 채팅방 별 메시지 조회 Service
	 * 
	 * @param chatNo
	 * @return List<ChatMessage>
	 */
	List<ChatMessage> selectChatMessageByNo(int chatNo);

}
