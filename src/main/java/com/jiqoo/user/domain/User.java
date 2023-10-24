package com.jiqoo.user.domain;

import java.sql.Timestamp;
import java.util.List;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.report.domain.Report;

public class User {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String platformType;
	private String userGender;
	private String userBirth;
	private String userTel;
	private String userInfo;
	private String userPhotoName;
	private String userPhotoRename;
	private String userPhotoPath;
	private Timestamp uCreateDate;
	private Timestamp uDeleteDate;
	private char userStatus;
	private String adminYn;
	
	private int count;
	private String ageGroup;
	private List<Report> reportList;
	private List<Comment> comtList;
	private int uReportCount;

	private int followers; //나를 팔로우한 사람들
	private int followings; //내가 팔로우한 사람들
	private boolean checkIsFollow;
	
	private int comtCount;
	private int jiqooCount;
	private int moqooCount;


	public User() {
		super();
	}
	
	public User(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}

	
	public User(String userId, String userPw, String userName, String userNickname, String userEmail, String userGender) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userEmail = userEmail;
		this.userGender = userGender;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPlatformType() {
		return platformType;
	}
	public void setPlatformType(String platformType) {
		this.platformType = platformType;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	public String getUserPhotoName() {
		return userPhotoName;
	}
	public void setUserPhotoName(String userPhotoName) {
		this.userPhotoName = userPhotoName;
	}
	public String getUserPhotoRename() {
		return userPhotoRename;
	}
	public void setUserPhotoRename(String userPhotoRename) {
		this.userPhotoRename = userPhotoRename;
	}
	public String getUserPhotoPath() {
		return userPhotoPath;
	}
	public void setUserPhotoPath(String userPhotoPath) {
		this.userPhotoPath = userPhotoPath;
	}
	public Timestamp getuCreateDate() {
		return uCreateDate;
	}
	public void setuCreateDate(Timestamp uCreateDate) {
		this.uCreateDate = uCreateDate;
	}
	public Timestamp getuDeleteDate() {
		return uDeleteDate;
	}
	public void setuDeleteDate(Timestamp uDeleteDate) {
		this.uDeleteDate = uDeleteDate;
	}
	public char getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(char userStatus) {
		this.userStatus = userStatus;
	}
	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}
	
	public int getFollowers() {
		return followers;
	}

	public void setFollowers(int followers) {
		this.followers = followers;
	}

	public int getFollowings() {
		return followings;
	}
	

	public void setFollowings(int followings) {
		this.followings = followings;
	}
	
	public boolean getCheckIsFollow() {
		return checkIsFollow;
	}

	public void setCheckIsFollow(boolean checkFollow) {
		this.checkIsFollow = checkFollow;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getAgeGroup() {
		return ageGroup;
	}

	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}

	public int getComtCount() {
		return comtCount;
	}

	public void setComtCount(int comtCount) {
		this.comtCount = comtCount;
	}

	public int getJiqooCount() {
		return jiqooCount;
	}

	public void setJiqooCount(int jiqooCount) {
		this.jiqooCount = jiqooCount;
	}

	public int getMoqooCount() {
		return moqooCount;
	}

	public void setMoqooCount(int moqooCount) {
		this.moqooCount = moqooCount;
	}

	public List<Report> getReportList() {
		return reportList;
	}

	public void setReportList(List<Report> reportList) {
		this.reportList = reportList;
	}

	public List<Comment> getComtList() {
		return comtList;
	}

	public void setComtList(List<Comment> comtList) {
		this.comtList = comtList;
	}

	public int getuReportCount() {
		return uReportCount;
	}

	public void setuReportCount(int uReportCount) {
		this.uReportCount = uReportCount;
	}

	@Override
	public String toString() {
		return "회원 [아이디=" + userId + ", 비밀번호=" + userPw + ", 이름=" + userName + ", 닉네임="
				+ userNickname + ", 이메일=" + userEmail + ", 가입유형=" + platformType + ", 성별="
				+ userGender + ", 생년월일=" + userBirth + ", 전화번호=" + userTel + ", 자기소개=" + userInfo
				+ ", 프로필사진이름=" + userPhotoName + ", 프로필사진리네임=" + userPhotoRename + ", 프로필사진경로="
				+ userPhotoPath + ", 가입일=" + uCreateDate + ", 탈퇴일=" + uDeleteDate + ", 회원여부="
				+ userStatus + ", 관리자여부=" + adminYn + ", count=" + count + ", ageGroup=" + ageGroup + ", reportList="
				+ reportList + ", comtList=" + comtList + ", uReportCount=" + uReportCount + ", 팔로워수=" + followers
				+ ", 팔로잉수=" + followings + ", 팔로우여부=" + checkIsFollow + ", 댓글수=" + comtCount
				+ ", 지꾸게시물수=" + jiqooCount + ", 모꾸게시물수=" + moqooCount + "]";
	}

//	@Override
//	public String toString() {
//		return "회원 [아이디=" + userId + ", 비밀번호=" + userPw + ", 이름=" + userName + ", 닉네임="
//				+ userNickname + ", 이메일=" + userEmail + ", 가입유형=" + platformType + ", 성별="
//				+ userGender + ", 생년월일=" + userBirth + ", 전화번호=" + userTel + ", 자기소개=" + userInfo
//				+ ", 프로필사진이름=" + userPhotoName + ", 프로필사진리네임=" + userPhotoRename + ", 프로필사진경로="
//				+ userPhotoPath + ", 가입일=" + uCreateDate + ", 탈퇴일=" + uDeleteDate + ", 회원여부="
//				+ userStatus + ", 관리자여부=" + adminYn + "]";
//	}

	
	
}
