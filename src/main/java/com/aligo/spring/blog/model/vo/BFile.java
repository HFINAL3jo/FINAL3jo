package com.aligo.spring.blog.model.vo;

public class BFile {
	protected static int tCodeNumber;
	protected static String bOriginalFile;
	protected static String bModifyFile;
	
	public BFile() {}

	public static int gettCodeNumber() {
		return tCodeNumber;
	}

	public static void settCodeNumber(int tCodeNumber) {
		BFile.tCodeNumber = tCodeNumber;
	}

	public static String getbOriginalFile() {
		return bOriginalFile;
	}

	public static void setbOriginalFile(String bOriginalFile) {
		BFile.bOriginalFile = bOriginalFile;
	}

	public static String getbModifyFile() {
		return bModifyFile;
	}

	public static void setbModifyFile(String bModifyFile) {
		BFile.bModifyFile = bModifyFile;
	}
	
	
}
