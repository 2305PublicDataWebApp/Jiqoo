package com.jiqoo.moqoo.domain;

public class MoqooUser {

	private int refMoqooNo;
	private String refUserId;
	
	
	public int getRefMoqooNo() {
		return refMoqooNo;
	}
	public void setRefMoqooNo(int refMoqooNo) {
		this.refMoqooNo = refMoqooNo;
	}
	public String getRefUserId() {
		return refUserId;
	}
	public void setRefUserId(String refUserId) {
		this.refUserId = refUserId;
	}
	
	@Override
	public String toString() {
		return "모임참여자 [모꾸번호=" + refMoqooNo + ", 참여자아이디=" + refUserId + "]";
	}
	
}
