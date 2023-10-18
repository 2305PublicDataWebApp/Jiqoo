package com.jiqoo.moqoo.domain;

import com.jiqoo.user.domain.User;

public class MoqooUser {

	private int refMoqooNo;
	private String refUserId;
	private String attendStatus;
	private User user;
	
	public MoqooUser() {}
	
	public MoqooUser(int refMoqooNo, String refUserId, String attendStatus) {
		super();
		this.refMoqooNo = refMoqooNo;
		this.refUserId = refUserId;
		this.attendStatus = attendStatus;
	}



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



	public String getAttendStatus() {
		return attendStatus;
	}



	public void setAttendStatus(String attendStatus) {
		this.attendStatus = attendStatus;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "모임참여신청자 [모꾸번호=" + refMoqooNo + ", 신청자아이디=" + refUserId + ", 승인여부=" + attendStatus
				+ ", 유저=" + user + "]";
	}

	
	
	
}