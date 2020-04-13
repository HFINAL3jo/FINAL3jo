package com.aligo.spring.theme.model.vo;

public class TFile{

	/**
	 * 
	 */

	public TFile() {
	}

	protected static int tCodeNumber;
	protected static String tOriginalFile;
	protected static String tModifyFile;

	public int gettCodeNumber() {
		return tCodeNumber;
	}

	public void settCodeNumber(int tCodeNumber) {
		TFile.tCodeNumber = tCodeNumber;
	}

	public String gettOriginalFile() {
		return tOriginalFile;
	}

	public void settOriginalFile(String tOriginalFile) {
		TFile.tOriginalFile = tOriginalFile;
	}

	public String gettModifyFile() {
		return tModifyFile;
	}

	public void settModifyFile(String tModifyFile) {
		TFile.tModifyFile = tModifyFile;
	}

	@Override
	public String toString() {
		return "TFile [tCodeNumber=" + tCodeNumber + ", tOriginalFile=" + tOriginalFile + ", tModifyFile=" + tModifyFile
				+ "]";
	}

	public TFile(int tCodeNumber, String tOriginalFile, String tModifyFile) {
		super();
		TFile.tCodeNumber = tCodeNumber;
		TFile.tOriginalFile = tOriginalFile;
		TFile.tModifyFile = tModifyFile;
	}

}
