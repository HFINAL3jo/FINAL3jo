package com.aligo.spring.blog.model.vo;

public class BName {
	private String bCode;
	private String bName;

	public BName() {}
	
	public String getbCode() {
		return bCode;
	}
	public void setbCode(String bCode) {
		this.bCode = bCode;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public BName(String bCode, String bName) {
		super();
		this.bCode = bCode;
		this.bName = bName;
	}
	@Override
	public String toString() {
		return "BName [bCode=" + bCode + ", bName=" + bName + "]";
	}
	
}
