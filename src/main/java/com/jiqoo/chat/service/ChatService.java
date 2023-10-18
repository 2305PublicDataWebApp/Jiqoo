package com.jiqoo.chat.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
import com.jiqoo.user.domain.User;

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
	 * 유저 아이디로 채팅방 초대 Service
	 * 
	 * @param chatNo
	 * @param userId
	 * @return int
	 */
	int insertChatUserByChatNo(int chatNo, String userId);

	/**
	 * 채팅방 연결 해제시 마지막 접속시간 업데이트 Service
	 * 
	 * @param chatUser
	 * @return int
	 */
	int updateChatLastDate(ChatUser chatUser);

	/**
	 * 채팅방 나가기 Service 
	 * 
	 * @param chatUser
	 * @return int
	 */
	int deleteChatUserById(ChatUser chatUser);

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
	 * @return int
	 */
	int selectUnreadMsgCount(ChatUser chatUser);

	/**
	 * 메시지 ID로 유저 정보 조회 Service
	 * 
	 * @param userId
	 * @return User
	 */
	User selectMsgSenderInfo(String userId);

	/**
	 * 채팅방별 전체 참여자 조회 Service
	 * 
	 * @param chatNo
	 * @return List<User>
	 */
	List<User> selectAllUserByChatNo(int chatNo);

	/**
	 * 초대할 유저 검색 Service
	 * @param chatNo 
	 * 
	 * @param user
	 * @return List<User>
	 */
	List<User> selectUsersByKeyword(int chatNo, String user);

	/**
	 * 채팅방 개설시 유저 검색 Service
	 * 
	 * @param userId
	 * @param keyword 
	 * @return List<User>
	 */
	List<User> selectJoinUserByKeyword(String userId, String keyword);

	/**
	 * 채팅 개설시 유저 닉네임 조회 Service
	 * 
	 * @param userId
	 * @return String
	 */
	String getUserNickname(String userId);

	/**
	 * 채팅방 개설 Service
	 * 
	 * @param chatRoom
	 * @return int
	 */
	int insertNewChatRoom(ChatRoom chatRoom);

	/**
	 * 개설된 채팅방에 유저 추가 Service
	 * 
	 * @param chatRoomNo 
	 * @param userId
	 * @return int
	 */
	int insertChatUserById(int chatRoomNo, String userId);

	/**
	 * 개설된 채팅방에 이미지 추가 Service
	 * 
	 * @param userId
	 * @return String
	 */
	String getUserPhotoPath(String userId);


}
