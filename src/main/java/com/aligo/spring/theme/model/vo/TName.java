package com.aligo.spring.theme.model.vo;

import java.io.Serializable;

public class TName implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6804983324148856483L;
	private String tName;
	private String tCode;

	public TName() {}

	@Override
	public String toString() {
		return "TName [tName=" + tName + ", tCode=" + tCode + "]";
	}

	public TName(String tName, String tCode) {
		super();
		this.tName = tName;
		this.tCode = tCode;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String gettCode() {
		return tCode;
	}

	public void settCode(String tCode) {
		this.tCode = tCode;
	}
	
}
