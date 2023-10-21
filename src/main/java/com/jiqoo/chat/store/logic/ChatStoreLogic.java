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
import com.jiqoo.user.domain.User;

@Repository
public class ChatStoreLogic implements ChatStore {

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
	public int insertChatUserByChatNo(SqlSession sqlSession, int chatNo, String userId) {
		Map<String, Object> userMap = new HashMap<>();
		userMap.put("chatNo", chatNo);
		userMap.put("userId", userId);
		int result = sqlSession.insert("ChatMapper.insertChatUserByChatNo", userMap);
		return result;
	}

	@Override
	public int insertNewChatRoomByMoqoo(SqlSession sqlSession, ChatRoom chatRoom) {
		int moqooChatNo = sqlSession.insert("ChatMapper.insertNewChatRoomByMoqoo", chatRoom);
		return moqooChatNo;
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

	@Override
	public User selectMsgSenderInfo(SqlSession sqlSession, String userId) {
		User user = sqlSession.selectOne("ChatMapper.selectMsgSenderInfo", userId);
		return user;
	}

	@Override
	public List<User> selectAllUserByChatNo(SqlSession sqlSession, int chatNo) {
		List<User> userList = sqlSession.selectList("ChatMapper.selectAllUserByChatNo", chatNo);
		return userList;
	}

	@Override
	public List<User> selectUsersByKeyword(SqlSession sqlSession, int chatNo, String user) {
		Map<String, Object> userMap = new HashMap<>();
		userMap.put("chatNo", chatNo);
		userMap.put("user", user);
		List<User> userList = sqlSession.selectList("ChatMapper.selectUsersByKeyword", userMap);
		return userList;
	}

	@Override
	public int deleteChatUserById(SqlSession sqlSession, ChatUser chatUser) {
		int result = sqlSession.delete("ChatMapper.deleteChatUserById", chatUser);
		return result;
	}

	@Override
	public List<User> selectJoinUserByKeyword(SqlSession sqlSession, String userId, String keyword) {
		Map<String, Object> userMap = new HashMap<>();
		userMap.put("userId", userId);
		userMap.put("keyword", keyword);
		List<User> userList = sqlSession.selectList("ChatMapper.selectJoinUserByKeyword", userMap);
		return userList;
	}

	@Override
	public String getUserNickname(SqlSession sqlSession, String userId) {
		String result = sqlSession.selectOne("ChatMapper.getUserNickname", userId);
		return result;
	}

	@Override
	public int insertNewChatRoom(SqlSession sqlSession, ChatRoom chatRoom) {
		sqlSession.insert("ChatMapper.insertNewChatRoom", chatRoom);
		int chatNo = chatRoom.getChatNo();
		return chatNo;
	}

	@Override
	public int insertChatUserById(SqlSession sqlSession, int chatRoomNo, String userId) {
		Map<String, Object> chatMap = new HashMap<>();
		chatMap.put("chatRoomNo", chatRoomNo);
		chatMap.put("userId", userId);
		int result = sqlSession.insert("ChatMapper.insertChatUserById", chatMap);
		return result;
	}

	@Override
	public String getUserPhotoPath(SqlSession sqlSession, String userId) {
		String result = sqlSession.selectOne("ChatMapper.getUserPhotoPath", userId);
		return result;
	}

	@Override
	public void updateChatName(SqlSession sqlSession, String str, int chatNo) {
		Map<String, Object> chatMap = new HashMap<>();
		chatMap.put("str", str);
		chatMap.put("chatNo", chatNo);
		sqlSession.update("ChatMapper.updateChatName", chatMap);
	}

	@Override
	public ChatRoom selectChatRoomByNo(SqlSession sqlSession, int chatNo) {
		ChatRoom chatRoom = sqlSession.selectOne("ChatMapper.selectChatRoomByNo", chatNo);
		return chatRoom;
	}

	@Override
	public ChatRoom selectChatRoomByMoqoo(SqlSession sqlSession, int moqooNo) {
		ChatRoom chatRoom = sqlSession.selectOne("ChatMapper.selectChatRoomByMoqoo", moqooNo);
		return chatRoom;
	}

}
