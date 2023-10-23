package com.jiqoo.alert.domain;

import java.sql.Timestamp;

public class Alert {
	private int alertNo;  //알람번호
	private String toUserId;  //받는사람id
	private String fromUserId; //보내는사람id
	private int boardNo; //게시판번호 
	private String title;  //글제목
	private String alertType;  //알람타입 
	private Timestamp alertCreateDate;
	
	public Alert() { }
	
	
	
	public Alert(int alertNo, String toUserId, String fromUserId, int boardNo, String title, String alertType,
			Timestamp alertCreateDate) {
		super();
		this.alertNo = alertNo;
		this.toUserId = toUserId;
		this.fromUserId = fromUserId;
		this.boardNo = boardNo;
		this.title = title;
		this.alertType = alertType;
		this.alertCreateDate = alertCreateDate;
	}

	


	public int getAlertNo() {
		return alertNo;
	}
	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}
	public String getToUserId() {
		return toUserId;
	}
	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}
	public String getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAlertType() {
		return alertType;
	}
	public void setAlertType(String alertType) {
		this.alertType = alertType;
	}
	
	public Timestamp getAlertCreateDate() {
		return alertCreateDate;
	}
	public void setAlertCreateDate(Timestamp alertCreateDate) {
		this.alertCreateDate = alertCreateDate;
	}
	
	@Override
	public String toString() {
		return "알람 [알람번호=" + alertNo + ", 받는사람=" + toUserId + ", 보낸사람=" + fromUserId + ", 게시판번호="
				+ boardNo + ", 글제목=" + title + ", 게시판타입=" + alertType + ", 알람생성시간=" + alertCreateDate + "]";
	}
	
	
}
