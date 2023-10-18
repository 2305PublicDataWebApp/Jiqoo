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
import com.jiqoo.user.domain.User;

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
	public int insertChatUserByChatNo(int chatNo, String userId) {
		int result = chatStore.insertChatUserByChatNo(sqlSession, chatNo, userId);
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

	@Override
	public User selectMsgSenderInfo(String userId) {
		User user = chatStore.selectMsgSenderInfo(sqlSession, userId);
		return user;
	}

	@Override
	public List<User> selectAllUserByChatNo(int chatNo) {
		List<User> userList = chatStore.selectAllUserByChatNo(sqlSession, chatNo);
		return userList;
	}

	@Override
	public List<User> selectUsersByKeyword(int chatNo, String user) {
		List<User> userList = chatStore.selectUsersByKeyword(sqlSession, chatNo, user);
		return userList;
	}

	@Override
	public int deleteChatUserById(ChatUser chatUser) {
		int result = chatStore.deleteChatUserById(sqlSession, chatUser);
		return result;
	}

	@Override
	public List<User> selectJoinUserByKeyword(String userId, String keyword) {
		List<User> userList = chatStore.selectJoinUserByKeyword(sqlSession, userId, keyword);
		return userList;
	}

	@Override
	public String getUserNickname(String userId) {
		String result = chatStore.getUserNickname(sqlSession, userId);
		return result;
	}

	@Override
	public int insertNewChatRoom(ChatRoom chatRoom) {
		int chatNo = chatStore.insertNewChatRoom(sqlSession, chatRoom);
		return chatNo;
	}

	@Override
	public int insertChatUserById(int chatRoomNo, String userId) {
		int result = chatStore.insertChatUserById(sqlSession, chatRoomNo, userId);
		return result;
	}

	@Override
	public String getUserPhotoPath(String userId) {
		String result = chatStore.getUserPhotoPath(sqlSession, userId);
		return result;
	}


}
