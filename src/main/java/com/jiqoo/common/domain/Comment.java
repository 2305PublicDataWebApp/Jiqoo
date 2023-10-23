package com.jiqoo.common.domain;

import java.sql.Timestamp;
import java.util.List;

import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.User;

public class Comment {

	private int comtNo;
	private String comtContent;
	private String comtWriter;
	private Timestamp comtDate;
	private Timestamp cUpdateDate;
	private int refPostNo;  // 해당 게시물 번호
	private int pComtNo;  // 부모댓글 번호(답글을 위한거)
	private char comtStatus;
	private String cBoardType;  // 지꾸 모꾸 중 어디 댓글인지 식별용
	
	private User user;
	
	private List<Report> reportList;
	private int cReportCount;
	
	public int getcReportCount() {
		return cReportCount;
	}
	public void setcReportCount(int cReportCount) {
		this.cReportCount = cReportCount;
	}
	public List<Report> getReportList() {
		return reportList;
	}
	public void setReportList(List<Report> reportList) {
		this.reportList = reportList;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getComtNo() {
		return comtNo;
	}
	public void setComtNo(int comtNo) {
		this.comtNo = comtNo;
	}
	public String getComtContent() {
		return comtContent;
	}
	public void setComtContent(String comtContent) {
		this.comtContent = comtContent;
	}
	public String getComtWriter() {
		return comtWriter;
	}
	public void setComtWriter(String comtWriter) {
		this.comtWriter = comtWriter;
	}
	public Timestamp getComtDate() {
		return comtDate;
	}
	public void setComtDate(Timestamp comtDate) {
		this.comtDate = comtDate;
	}
	public Timestamp getcUpdateDate() {
		return cUpdateDate;
	}
	public void setcUpdateDate(Timestamp cUpdateDate) {
		this.cUpdateDate = cUpdateDate;
	}
	public int getRefPostNo() {
		return refPostNo;
	}
	public void setRefPostNo(int refPostNo) {
		this.refPostNo = refPostNo;
	}
	public int getpComtNo() {
		return pComtNo;
	}
	public void setpComtNo(int pComtNo) {
		this.pComtNo = pComtNo;
	}
	public char getComtStatus() {
		return comtStatus;
	}
	public void setComtStatus(char comtStatus) {
		this.comtStatus = comtStatus;
	}
	public String getcBoardType() {
		return cBoardType;
	}
	public void setcBoardType(String cBoardType) {
		this.cBoardType = cBoardType;
	}
	
	
	@Override
	public String toString() {
		return "댓글 [댓글번호=" + comtNo + ", 댓글내용=" + comtContent + ", 작성자=" + comtWriter
				+ ", 작성일=" + comtDate + ", 수정일=" + cUpdateDate + ", 게시물번호=" + refPostNo + ", 부모댓글번호="
				+ pComtNo + ", 사용여부=" + comtStatus + ", 게시물타입=" + cBoardType + "]";
	}
	
}
