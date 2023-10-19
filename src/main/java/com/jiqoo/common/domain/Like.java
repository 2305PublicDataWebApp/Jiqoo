package com.jiqoo.common.domain;

public class Like {

	private int refPostNo;
	private String refBoardType;
	private String lUserId;

	public Like() {
		super();
	}
	
	public Like(int refPostNo, String refBoardType, String lUserId) {
		super();
		this.refPostNo = refPostNo;
		this.refBoardType = refBoardType;
		this.lUserId = lUserId;
	}
	
	public Like(int refPostNo, String lUserId) {
		super();
		this.refPostNo = refPostNo;
		this.lUserId = lUserId;
	}

	public Like(int refPostNo) {
		super();
		this.refPostNo = refPostNo;
	}

	public int getRefPostNo() {
		return refPostNo;
	}
	public void setRefPostNo(int refPostNo) {
		this.refPostNo = refPostNo;
	}
	public String getRefBoardType() {
		return refBoardType;
	}
	public void setRefBoardType(String refBoardType) {
		this.refBoardType = refBoardType;
	}
	public String getlUserId() {
		return lUserId;
	}
	public void setlUserId(String lUserId) {
		this.lUserId = lUserId;
	}
	
	
	@Override
	public String toString() {
		return "좋아요 [게시물 번호=" + refPostNo + ", 게시판 타입=" + refBoardType + ", 좋아요누른 아이디=" + lUserId + "]";
	}
	
	
	
	
}
