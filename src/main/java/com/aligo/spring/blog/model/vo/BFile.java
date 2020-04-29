package com.aligo.spring.blog.model.vo;

public class BFile {
	protected static int bCodeNumber;
	protected static String bOriginalFile;
	protected static String bModifyFile;
	
	public BFile() {}

	public static int getbCodeNumber() {
		return bCodeNumber;
	}

	public static void setbCodeNumber(int bCodeNumber) {
		BFile.bCodeNumber = bCodeNumber;
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

	@Override
	public String toString() {
		return "BFile [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
