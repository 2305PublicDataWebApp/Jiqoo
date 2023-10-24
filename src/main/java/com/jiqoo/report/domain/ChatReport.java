package com.jiqoo.report.domain;

import java.sql.Timestamp;

public class ChatReport {

	private int chatReportNo;
	private String chatReportWriter;
	private String chatReportContent;
	private Timestamp chatReportDate;
	private int reportChatNo;

	public int getChatReportNo() {
		return chatReportNo;
	}

	public void setChatReportNo(int chatReportNo) {
		this.chatReportNo = chatReportNo;
	}

	public String getChatReportWriter() {
		return chatReportWriter;
	}

	public void setChatReportWriter(String chatReportWriter) {
		this.chatReportWriter = chatReportWriter;
	}

	public String getChatReportContent() {
		return chatReportContent;
	}

	public void setChatReportContent(String chatReportContent) {
		this.chatReportContent = chatReportContent;
	}

	public Timestamp getChatReportDate() {
		return chatReportDate;
	}

	public void setChatReportDate(Timestamp chatReportDate) {
		this.chatReportDate = chatReportDate;
	}

	public int getReportChatNo() {
		return reportChatNo;
	}

	public void setReportChatNo(int reportChatNo) {
		this.reportChatNo = reportChatNo;
	}

	@Override
	public String toString() {
		return "채팅신고 [채팅신고번호=" + chatReportNo + ", 신고자=" + chatReportWriter
				+ ", 내용=" + chatReportContent + ", 신고일자=" + chatReportDate + ", 채팅방번호="
				+ reportChatNo + "]";
	}

}
