package com.jiqoo.chat.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.store.ChatStore;

@Repository
public class ChatStoreLogic implements ChatStore{

	@Override
	public List<ChatRoom> selectChatRoomById(SqlSession sqlSession, String userId) {
		List<ChatRoom> chatRoomList = sqlSession.selectList("ChatMapper.selectChatRoomById", userId);
		return chatRoomList;
	}

	@Override
	public List<ChatMessage> selectChatMessageByNo(SqlSession sqlSession, int chatNo) {
		List<ChatMessage> chatMessageList = sqlSession.selectList("ChatMapper.selectChatMessageByNo", chatNo);
		return chatMessageList;
	}

}
