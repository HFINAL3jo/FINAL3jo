package com.aligo.spring.theme.model.vo;

import java.io.Serializable;

public class TFile implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3955303811075266232L;

	public TFile() {
	}

	private String tCodeNumber;
	private String tOriginalFile;
	private String tModifyFile;

	public String gettCodeNumber() {
		return tCodeNumber;
	}

	public void settCodeNumber(String tCodeNumber) {
		this.tCodeNumber = tCodeNumber;
	}

	public String gettOriginalFile() {
		return tOriginalFile;
	}

	public void settOriginalFile(String tOriginalFile) {
		this.tOriginalFile = tOriginalFile;
	}

	public String gettModifyFile() {
		return tModifyFile;
	}

	public void settModifyFile(String tModifyFile) {
		this.tModifyFile = tModifyFile;
	}

	@Override
	public String toString() {
		return "TFile [tCodeNumber=" + tCodeNumber + ", tOriginalFile=" + tOriginalFile + ", tModifyFile=" + tModifyFile
				+ "]";
	}

	public TFile(String tCodeNumber, String tOriginalFile, String tModifyFile) {
		super();
		this.tCodeNumber = tCodeNumber;
		this.tOriginalFile = tOriginalFile;
		this.tModifyFile = tModifyFile;
	}

}
