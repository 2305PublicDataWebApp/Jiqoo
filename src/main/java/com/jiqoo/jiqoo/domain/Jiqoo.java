package com.jiqoo.jiqoo.domain;

import java.sql.Date;
import java.sql.Timestamp;

import com.jiqoo.user.domain.User;

public class Jiqoo {
	private int jiqooNo;
	private String jiqooW3W;
	private Date jiqooDate;
	private String jiqooCtgr;
	private String jiqooTitle;
	private String jiqooContent;
	private String jiqooWriter;
	private String jOpenStatus;
	private String jAllowComt;
	private Timestamp jCreateDate;
	private Timestamp jUpdateDate;
	private int jViewCount;
	private double jiqooLat;
	private double jiqooLng;
	private String jiqooStatus;
	private User user;

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getJiqooNo() {
		return jiqooNo;
	}
	public void setJiqooNo(int jiqooNo) {
		this.jiqooNo = jiqooNo;
	}
	public String getJiqooW3W() {
		return jiqooW3W;
	}
	public void setJiqooW3W(String jiqooW3W) {
		this.jiqooW3W = jiqooW3W;
	}
	public Date getJiqooDate() {
		return jiqooDate;
	}
	public void setJiqooDate(Date jiqooDate) {
		this.jiqooDate = jiqooDate;
	}
	public String getJiqooCtgr() {
		return jiqooCtgr;
	}
	public void setJiqooCtgr(String jiqooCtgr) {
		this.jiqooCtgr = jiqooCtgr;
	}
	public String getJiqooTitle() {
		return jiqooTitle;
	}
	public void setJiqooTitle(String jiqooTitle) {
		this.jiqooTitle = jiqooTitle;
	}
	public String getJiqooContent() {
		return jiqooContent;
	}
	public void setJiqooContent(String jiqooContent) {
		this.jiqooContent = jiqooContent;
	}
	public String getJiqooWriter() {
		return jiqooWriter;
	}
	public void setJiqooWriter(String jiqooWriter) {
		this.jiqooWriter = jiqooWriter;
	}
	public String getjOpenStatus() {
		return jOpenStatus;
	}
	public void setjOpenStatus(String jOpenStatus) {
		this.jOpenStatus = jOpenStatus;
	}
	public String getjAllowComt() {
		return jAllowComt;
	}
	public void setjAllowComt(String jAllowComt) {
		this.jAllowComt = jAllowComt;
	}
	public Timestamp getjCreateDate() {
		return jCreateDate;
	}
	public void setjCreateDate(Timestamp jCreateDate) {
		this.jCreateDate = jCreateDate;
	}
	public Timestamp getjUpdateDate() {
		return jUpdateDate;
	}
	public void setjUpdateDate(Timestamp jUpdateDate) {
		this.jUpdateDate = jUpdateDate;
	}
	public int getjViewCount() {
		return jViewCount;
	}
	public void setjViewCount(int jViewCount) {
		this.jViewCount = jViewCount;
	}
	public double getJiqooLat() {
		return jiqooLat;
	}
	public void setJiqooLat(double jiqooLat) {
		this.jiqooLat = jiqooLat;
	}
	public double getJiqooLng() {
		return jiqooLng;
	}
	public void setJiqooLng(double jiqooLng) {
		this.jiqooLng = jiqooLng;
	}
	public String getJiqooStatus() {
		return jiqooStatus;
	}
	public void setJiqooStatus(String jiqooStatus) {
		this.jiqooStatus = jiqooStatus;
	}
	@Override
	public String toString() {
		return "Jiqoo [jiqooNo=" + jiqooNo + ", jiqooW3W=" + jiqooW3W + ", jiqooDate=" + jiqooDate + ", jiqooCtgr="
				+ jiqooCtgr + ", jiqooTitle=" + jiqooTitle + ", jiqooContent=" + jiqooContent + ", jiqooWriter="
				+ jiqooWriter + ", jOpenStatus=" + jOpenStatus + ", jAllowComt=" + jAllowComt + ", jCreateDate="
				+ jCreateDate + ", jUpdateDate=" + jUpdateDate + ", jViewCount=" + jViewCount + ", jiqooLat=" + jiqooLat
				+ ", jiqooLng=" + jiqooLng + ", jiqooStatus=" + jiqooStatus + "]";
	}
	
}