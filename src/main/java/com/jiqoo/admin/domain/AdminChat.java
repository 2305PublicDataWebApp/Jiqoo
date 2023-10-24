package com.jiqoo.admin.domain;

import java.sql.Timestamp;
import java.util.List;

import com.jiqoo.report.domain.ChatReport;

public class AdminChat {
	
	private int chatNo;
	private String chatName;
	private Timestamp cCreateDate ;
	private String cImagePath ;
	private Timestamp msgSendDate;
	private String participants;
	private int participantCount;
	private int reportCount;
	private List<ChatReport> reportList;
	
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
	public Timestamp getcCreateDate() {
		return cCreateDate;
	}
	public void setcCreateDate(Timestamp cCreateDate) {
		this.cCreateDate = cCreateDate;
	}
	public String getcImagePath() {
		return cImagePath;
	}
	public void setcMmagePath(String cMmagePath) {
		this.cImagePath = cMmagePath;
	}
	public Timestamp getMsgSendDate() {
		return msgSendDate;
	}
	public void setMsgSendDate(Timestamp msgSendDate) {
		this.msgSendDate = msgSendDate;
	}
	public String getParticipants() {
		return participants;
	}
	public void setParticipants(String participants) {
		this.participants = participants;
	}
	public int getParticipantCount() {
		return participantCount;
	}
	public void setParticipant_count(int participantCount) {
		this.participantCount = participantCount;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReport_count(int reportCount) {
		this.reportCount = reportCount;
	}
	public List<ChatReport> getReportList() {
		return reportList;
	}
	public void setReportList(List<ChatReport> reportList) {
		this.reportList = reportList;
	}
	@Override
	public String toString() {
		return "어드민챗 [채팅방번호=" + chatNo + ", 채팅방이름=" + chatName + ", 채팅생성일=" + cCreateDate
				+ ", 채팅방사진=" + cImagePath + ", 마지막전송일자=" + msgSendDate + ", 참여자=" + participants
				+ ", 참여자수=" + participantCount + ", 신고수=" + reportCount + ", 신고리스트="
				+ reportList + "]";
	}
	
	
	
	

}
