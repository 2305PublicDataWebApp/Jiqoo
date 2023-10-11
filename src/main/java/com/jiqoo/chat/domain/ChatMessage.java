package com.jiqoo.chat.domain;

import java.sql.Timestamp;

public class ChatMessage {

	private int msgNo;
	private int refChatNo;
	private String msgSenderId;
	private String msgContent;
	private Timestamp msgSendDate;

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

	@Override
	public String toString() {
		return "채팅메시지 [메시지 번호=" + msgNo + ", 채팅방번호=" + refChatNo + ", 발신인ID=" + msgSenderId + ", 메시지내용=" + msgContent
				+ ", 발신일자=" + msgSendDate + "]";
	}

}
