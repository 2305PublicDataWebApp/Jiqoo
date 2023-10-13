package com.jiqoo.chat.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;

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

	/**
	 * 채팅 메시지 등록 Service
	 * 
	 * @param chatMessage
	 * @return int
	 */
	int insertChatMessage(ChatMessage chatMessage);

	/**
	 * 채팅방 연결 해제시 마지막 접속시간 업데이트 Service
	 * 
	 * @param chatUser
	 * @return int
	 */
	int updateChatLastDate(ChatUser chatUser);

	/**
	 * 읽지 않은 메시지 갯수 조회 Service
	 * 
	 * @param userId
	 * @param chatNo
	 * @return
	 */
	int selectCountUnreadMsg(String userId, int chatNo);

	/**
	 * 읽지 않은 메시지 갯수 Service
	 * 
	 * @param chatUser
	 * @return
	 */
	int selectUnreadMsgCount(ChatUser chatUser);

}
