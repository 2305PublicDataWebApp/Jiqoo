package com.jiqoo.chat.domain;

import java.sql.Timestamp;

public class ChatRoom {

	private int chatNo;
	private String chatName;
	private int refMoqooNo;
	private Timestamp cCreateDate;
	private ChatMessage chatMessage;
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public int getRefMoqooNo() {
		return refMoqooNo;
	}
	public void setRefMoqooNo(int refMoqooNo) {
		this.refMoqooNo = refMoqooNo;
	}
	public Timestamp getcCreateDate() {
		return cCreateDate;
	}
	public void setcCreateDate(Timestamp cCreateDate) {
		this.cCreateDate = cCreateDate;
	}
	public ChatMessage getChatMessage() {
		return chatMessage;
	}
	public void setChatMessage(ChatMessage chatMessage) {
		this.chatMessage = chatMessage;
	}
	@Override
	public String toString() {
		return "채팅방 [채팅방번호=" + chatNo + ", 채팅방이름=" + chatName + ", 모임번호=" + refMoqooNo + ", 생성일="
				+ cCreateDate + ", 마지막채팅메시지=" + chatMessage + "]";
	}



}
