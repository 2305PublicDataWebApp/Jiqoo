package com.jiqoo.report.domain;

import java.sql.Timestamp;

public class Report {
	private int reportNo;
	private String reportWriter;
	private String reportContent;
	private Timestamp reportDate;
	private String reportUserId;
	private int reportPostNo;
	private int reportComtNo;
	private String reportType;
	private int reportCount;
	
	
	
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportWriter() {
		return reportWriter;
	}
	public void setReportWriter(String reportWriter) {
		this.reportWriter = reportWriter;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportUserId() {
		return reportUserId;
	}
	public void setReportUserId(String reportUserId) {
		this.reportUserId = reportUserId;
	}
	public int getReportPostNo() {
		return reportPostNo;
	}
	public void setReportPostNo(int reportPostNo) {
		this.reportPostNo = reportPostNo;
	}
	public int getReportComtNo() {
		return reportComtNo;
	}
	public void setReportComtNo(int reportComtNo) {
		this.reportComtNo = reportComtNo;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	@Override
	public String toString() {
		return "신고 [신고번호=" + reportNo + ", 신고자=" + reportWriter + ", 신고사유=" + reportContent
				+ ", 신고날짜=" + reportDate + ", 신고당한회원=" + reportUserId + ", 신고당한글번호=" + reportPostNo
				+ ", 신고당한댓글번호=" + reportComtNo + ", 신고당한게시판타입=" + reportType + "]";
	}
	
	
	
	

}
