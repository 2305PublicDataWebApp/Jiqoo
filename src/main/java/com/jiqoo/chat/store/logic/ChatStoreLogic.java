package com.jiqoo.chat.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
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

	@Override
	public int insertChatMessage(SqlSession sqlSession, ChatMessage chatMessage) {
		int result = sqlSession.insert("ChatMapper.insertChatMessage", chatMessage);
		return result;
	}

	@Override
	public int updateChatLastDate(SqlSession sqlSession, ChatUser chatUser) {
		int result = sqlSession.update("ChatMapper.updateChatLastDate", chatUser);
		return result;
	}

	@Override
	public int selectCountUnreadMsg(SqlSession sqlSession, String userId, int chatNo) {
		Map<String, String> infoMap = new HashMap<>();
		infoMap.put("userId", userId);
		infoMap.put("chatNo", String.valueOf(chatNo));
		int result = sqlSession.selectOne("ChatMapper.selectCountUnreadMsg", infoMap);
		return result;
	}

	@Override
	public int selectUnreadMsgCount(SqlSession sqlSession, ChatUser chatUser) {
		int result = sqlSession.selectOne("ChatMapper.selectUnreadMsgCount", chatUser);
		return result;
	}

}
