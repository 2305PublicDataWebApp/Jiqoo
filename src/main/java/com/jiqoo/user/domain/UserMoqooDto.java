package com.jiqoo.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

import com.jiqoo.common.domain.Category;
import com.jiqoo.moqoo.domain.MoqooUser;

public class UserMoqooDto {

	private int moqooNo;
	private String moqooW3W;
	private Date moqooDay;
	private String category;
	private String moqooTitle;
	private String moqooThumName;
	private String moqooThumRename;
	private String moqooThumPath;
	private String moqooContent;
	private int moqooJoin;
	private String moqooWriter;
	private Timestamp moqooDate;
	private  Timestamp mUpdateDate;
	private int mViewCount;
	private double moqooLat;
	private double moqooLng;
	private String moqooStatus;
	private String userPhotoPath;
	private String cImgPath;
	private int rnum;
	
	public int getMoqooNo() {
		return moqooNo;
	}
	public void setMoqooNo(int moqooNo) {
		this.moqooNo = moqooNo;
	}
	public String getMoqooW3W() {
		return moqooW3W;
	}
	public void setMoqooW3W(String moqooW3W) {
		this.moqooW3W = moqooW3W;
	}
	public Date getMoqooDay() {
		return moqooDay;
	}
	public void setMoqooDay(Date moqooDay) {
		this.moqooDay = moqooDay;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMoqooTitle() {
		return moqooTitle;
	}
	public void setMoqooTitle(String moqooTitle) {
		this.moqooTitle = moqooTitle;
	}
	public String getMoqooThumName() {
		return moqooThumName;
	}
	public void setMoqooThumName(String moqooThumName) {
		this.moqooThumName = moqooThumName;
	}
	public String getMoqooThumRename() {
		return moqooThumRename;
	}
	public void setMoqooThumRename(String moqooThumRename) {
		this.moqooThumRename = moqooThumRename;
	}
	public String getMoqooThumPath() {
		return moqooThumPath;
	}
	public void setMoqooThumPath(String moqooThumPath) {
		this.moqooThumPath = moqooThumPath;
	}
	public String getMoqooContent() {
		return moqooContent;
	}
	public void setMoqooContent(String moqooContent) {
		this.moqooContent = moqooContent;
	}
	public int getMoqooJoin() {
		return moqooJoin;
	}
	public void setMoqooJoin(int moqooJoin) {
		this.moqooJoin = moqooJoin;
	}
	public String getMoqooWriter() {
		return moqooWriter;
	}
	public void setMoqooWriter(String moqooWriter) {
		this.moqooWriter = moqooWriter;
	}
	public Timestamp getMoqooDate() {
		return moqooDate;
	}
	public void setMoqooDate(Timestamp moqooDate) {
		this.moqooDate = moqooDate;
	}
	public Timestamp getmUpdateDate() {
		return mUpdateDate;
	}
	public void setmUpdateDate(Timestamp mUpdateDate) {
		this.mUpdateDate = mUpdateDate;
	}
	public int getmViewCount() {
		return mViewCount;
	}
	public void setmViewCount(int mViewCount) {
		this.mViewCount = mViewCount;
	}
	public double getMoqooLat() {
		return moqooLat;
	}
	public void setMoqooLat(double moqooLat) {
		this.moqooLat = moqooLat;
	}
	public double getMoqooLng() {
		return moqooLng;
	}
	public void setMoqooLng(double moqooLng) {
		this.moqooLng = moqooLng;
	}
	public String getMoqooStatus() {
		return moqooStatus;
	}
	public void setMoqooStatus(String moqooStatus) {
		this.moqooStatus = moqooStatus;
	}
	public String getUserPhotoPath() {
		return userPhotoPath;
	}
	public void setUserPhotoPath(String userPhotoPath) {
		this.userPhotoPath = userPhotoPath;
	}
	public String getcImgPath() {
		return cImgPath;
	}
	public void setcImgPath(String cImgPath) {
		this.cImgPath = cImgPath;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
//	@Override
//	public String toString() {
//		return "모꾸 [모임번호=" + moqooNo + ", 모임카테고리=" + category + ", 모임W3W주소=" + moqooW3W + ", 모임제목="
//				+ moqooTitle + ", 모임내용=" + moqooContent + ", 모임작성자=" + moqooWriter + ", 모일날짜="
//				+ moqooDay + ", 참여자=" + moqooJoin + ", 모임작성일=" + moqooDate + ", 모임수정일=" + mUpdateDate
//				+ ", 썸네일=" + moqooThumName + ", 썸네일새이름=" + moqooThumRename + ", 썸네일주소="
//				+ moqooThumPath + ", 조회수=" + mViewCount + ", 위도=" + moqooLat + ", 경도=" + moqooLng
//				+ ", 사용여부=" + moqooStatus + ", 유저컬럼들=" + user + ", 참여자컬럼들=" + moqooUser + "]";
//	}
	@Override
	public String toString() {
		return "UserMoqooDto [moqooNo=" + moqooNo + ", moqooW3W=" + moqooW3W + ", moqooDay=" + moqooDay + ", category="
				+ category + ", moqooTitle=" + moqooTitle + ", moqooThumName=" + moqooThumName + ", moqooThumRename="
				+ moqooThumRename + ", moqooThumPath=" + moqooThumPath + ", moqooContent=" + moqooContent
				+ ", moqooJoin=" + moqooJoin + ", moqooWriter=" + moqooWriter + ", moqooDate=" + moqooDate
				+ ", mUpdateDate=" + mUpdateDate + ", mViewCount=" + mViewCount + ", moqooLat=" + moqooLat
				+ ", moqooLng=" + moqooLng + ", moqooStatus=" + moqooStatus + ", userPhotoPath=" + userPhotoPath
				+ ", cImgPath=" + cImgPath + ", rnum=" + rnum + "]";
	}
	
}