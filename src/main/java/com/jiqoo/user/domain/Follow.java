package com.jiqoo.user.domain;

import java.sql.Timestamp;

public class Follow {
	private String fromUserId;
	private String toUserId;
	private Timestamp followDate;
	
	private boolean isFollowing;
	
	public Follow() {
		super();
	}
	
	public Follow(String fromUserId, String toUserId) {
		super();
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
	}
	
	public String getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}
	public String getToUserId() {
		return toUserId;
	}
	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}
	public Timestamp getFollowDate() {
		return followDate;
	}
	public void setFollowDate(Timestamp followDate) {
		this.followDate = followDate;
	}
	
	
	public boolean isFollowing() {
		return isFollowing;
	}

	public void setFollowing(boolean isFollowing) {
		this.isFollowing = isFollowing;
	}

	@Override
	public String toString() {
		return "팔로우 [팔로우하는아이디=" + fromUserId + ", 팔로우받는아이디=" + toUserId + ", 팔로우날짜=" + followDate + "]";
	}
	
	
}
