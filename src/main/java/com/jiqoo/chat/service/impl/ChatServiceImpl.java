package com.jiqoo.chat.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
import com.jiqoo.chat.service.ChatService;
import com.jiqoo.chat.store.ChatStore;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatStore chatStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertChatMessage(ChatMessage chatMessage) {
		int result = chatStore.insertChatMessage(sqlSession, chatMessage);
		return result;
	}

	@Override
	public List<ChatRoom> selectChatRoomById(String userId) {
		List<ChatRoom> chatRoomList = chatStore.selectChatRoomById(sqlSession, userId);
		return chatRoomList;
	}

	@Override
	public List<ChatMessage> selectChatMessageByNo(int chatNo) {
		List<ChatMessage> chatMessageList = chatStore.selectChatMessageByNo(sqlSession, chatNo);
		return chatMessageList;
	}

	@Override
	public int updateChatLastDate(ChatUser chatUser) {
		int result = chatStore.updateChatLastDate(sqlSession, chatUser);
		return result;
	}

	@Override
	public int selectCountUnreadMsg(String userId, int chatNo) {
		int result = chatStore.selectCountUnreadMsg(sqlSession, userId, chatNo);
		return result;
	}

	@Override
	public int selectUnreadMsgCount(ChatUser chatUser) {
		int result = chatStore.selectUnreadMsgCount(sqlSession, chatUser);
		return result;
	}

}
