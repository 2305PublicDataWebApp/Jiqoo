package com.jiqoo.chat.domain;

public class ChatRoomWithUnreadCount {

	private ChatRoom chatRoom;
	private int unreadMsgCount;

	public ChatRoomWithUnreadCount() {
	}

	public ChatRoomWithUnreadCount(ChatRoom chatRoom, int unreadMsgCount) {
		super();
		this.chatRoom = chatRoom;
		this.unreadMsgCount = unreadMsgCount;
	}

	public ChatRoom getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(ChatRoom chatRoom) {
		this.chatRoom = chatRoom;
	}

	public int getUnreadMsgCount() {
		return unreadMsgCount;
	}

	public void setUnreadMsgCount(int unreadMsgCount) {
		this.unreadMsgCount = unreadMsgCount;
	}

	@Override
	public String toString() {
		return "채팅방&읽지않은메시지갯수 [채팅방=" + chatRoom + ", 읽지않은메시지갯수=" + unreadMsgCount + "]";
	}

}
