package com.jiqoo.chat.domain;

import java.sql.Timestamp;

import com.jiqoo.user.domain.User;

public class ChatMessage {

	private int msgNo;
	private int refChatNo;
	private String msgSenderId;
	private String msgContent;
	private Timestamp msgSendDate;
	private String msgSenderNickname;
	private String msgSenderPhotoPath;
	private User user;

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public int getRefChatNo() {
		return refChatNo;
	}

	public void setRefChatNo(int refChatNo) {
		this.refChatNo = refChatNo;
	}

	public String getMsgSenderId() {
		return msgSenderId;
	}

	public void setMsgSenderId(String msgSenderId) {
		this.msgSenderId = msgSenderId;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Timestamp getMsgSendDate() {
		return msgSendDate;
	}

	public void setMsgSendDate(Timestamp msgSendDate) {
		this.msgSendDate = msgSendDate;
	}

	public String getMsgSenderNickname() {
		return msgSenderNickname;
	}

	public void setMsgSenderNickname(String msgSenderNickname) {
		this.msgSenderNickname = msgSenderNickname;
	}

	public String getMsgSenderPhotoPath() {
		return msgSenderPhotoPath;
	}

	public void setMsgSenderPhotoPath(String msgSenderPhotoPath) {
		this.msgSenderPhotoPath = msgSenderPhotoPath;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "채팅메시지 [메시지 번호=" + msgNo + ", 채팅방번호=" + refChatNo + ", 발신인ID=" + msgSenderId + ", 메시지내용=" + msgContent
				+ ", 발신일자=" + msgSendDate + "]";
	}

}
