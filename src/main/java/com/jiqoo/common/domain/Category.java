package com.jiqoo.common.domain;

public class Category {
	private String cName;
	private String cImgPath;
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcImgPath() {
		return cImgPath;
	}
	public void setcImgPath(String cImgPath) {
		this.cImgPath = cImgPath;
	}
	@Override
	public String toString() {
		return "Category [cName=" + cName + ", cImgPath=" + cImgPath + "]";
	}
	
	
}
