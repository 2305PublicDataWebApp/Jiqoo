package com.jiqoo.chat.domain;

import java.sql.Timestamp;

public class ChatUser {

	private int refChatNo;
	private String userId;
	private Timestamp chatLastDate;

	public int getRefChatNo() {
		return refChatNo;
	}

	public void setRefChatNo(int refChatNo) {
		this.refChatNo = refChatNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Timestamp getChatLastDate() {
		return chatLastDate;
	}

	public void setChatLastDate(Timestamp chatLastDate) {
		this.chatLastDate = chatLastDate;
	}

	@Override
	public String toString() {
		return "채팅참여자 [채팅방번호=" + refChatNo + ", 아이디=" + userId + ", 마지막접속시간=" + chatLastDate + "]";
	}

}
