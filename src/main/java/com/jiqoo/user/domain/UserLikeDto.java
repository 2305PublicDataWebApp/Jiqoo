package com.jiqoo.user.domain;

import java.sql.Date;

public class UserLikeDto {
	private int rnum;
	private String boardType;
	private int postNo;
	private String lUserId;
	private String postWriter;
	private String writerPhotoPath;
	private Date postDate;
	private String postW3w;
	private String postTitle;
	private String cImgPath;
	private int viewCount;
	private String postStatus;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getlUserId() {
		return lUserId;
	}
	public void setlUserId(String lUserId) {
		this.lUserId = lUserId;
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public String getWriterPhotoPath() {
		return writerPhotoPath;
	}
	public void setWriterPhotoPath(String writerPhotoPath) {
		this.writerPhotoPath = writerPhotoPath;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getcImgPath() {
		return cImgPath;
	}
	public void setcImgPath(String cImgPath) {
		this.cImgPath = cImgPath;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getPostStatus() {
		return postStatus;
	}
	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}
	
	
	public String getPostW3w() {
		return postW3w;
	}
	public void setPostW3w(String postW3w) {
		this.postW3w = postW3w;
	}
	
	@Override
	public String toString() {
		return "UserLikeDto [rnum=" + rnum + ", boardType=" + boardType + ", postNo=" + postNo + ", lUserId=" + lUserId
				+ ", postWriter=" + postWriter + ", writerPhotoPath=" + writerPhotoPath + ", postDate=" + postDate
				+ ", postW3w=" + postW3w + ", postTitle=" + postTitle + ", cImgPath=" + cImgPath + ", viewCount="
				+ viewCount + ", postStatus=" + postStatus + "]";
	}

	
	
	

}
