package com.aligo.spring.blog.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Blog {

	public Blog() {
	}

	private int bId;
	private String bWriter;
	private String bTitle;
	private String bContent;
	private String bAddress;
	private String bAddressH;
	private Date bCreateDate;
	private Date bModifyDate;
	private int bViews;
	private int bLikes;
	private String bStatus;
	private String bTel;
	private String bHours;
	private String bFee;
	private int bCodeNumber;
	private String bTrans;
	private String bOriginalFile;
	private String bModifyFile;
	private ArrayList<BFile> bFileList;
	private String bCode;
	private String category;
	private String bFileStatus;
	
	public int getbId() {
		return bId;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

	public String getbAddressH() {
		return bAddressH;
	}

	public void setbAddressH(String bAddressH) {
		this.bAddressH = bAddressH;
	}

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public int getbViews() {
		return bViews;
	}

	public void setbViews(int bViews) {
		this.bViews = bViews;
	}

	public int getbLikes() {
		return bLikes;
	}

	public void setbLikes(int bLikes) {
		this.bLikes = bLikes;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbTel() {
		return bTel;
	}

	public void setbTel(String bTel) {
		this.bTel = bTel;
	}

	public String getbHours() {
		return bHours;
	}

	public void setbHours(String bHours) {
		this.bHours = bHours;
	}

	public String getbFee() {
		return bFee;
	}

	public void setbFee(String bFee) {
		this.bFee = bFee;
	}

	public int getbCodeNumber() {
		return bCodeNumber;
	}

	public void setbCodeNumber(int bCodeNumber) {
		this.bCodeNumber = bCodeNumber;
	}

	public String getbTrans() {
		return bTrans;
	}

	public void setbTrans(String bTrans) {
		this.bTrans = bTrans;
	}

	public String getbOriginalFile() {
		return bOriginalFile;
	}

	public void setbOriginalFile(String bOriginalFile) {
		this.bOriginalFile = bOriginalFile;
	}

	public String getbModifyFile() {
		return bModifyFile;
	}

	public void setbModifyFile(String bModifyFile) {
		this.bModifyFile = bModifyFile;
	}

	public ArrayList<BFile> getbFileList() {
		return bFileList;
	}

	public void setbFileList(ArrayList<BFile> bFileList) {
		this.bFileList = bFileList;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getbFileStatus() {
		return bFileStatus;
	}

	public void setbFileStatus(String bFileStatus) {
		this.bFileStatus = bFileStatus;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public Blog(int bId, String bWriter, String bTitle, String bContent, String bAddress, String bAddressH,
			Date bCreateDate, Date bModifyDate, int bViews, int bLikes, String bStatus, String bTel, String bHours,
			String bFee, int bCodeNumber, String bTrans, String bOriginalFile, String bModifyFile,
			ArrayList<BFile> bFileList, String bCode, String category, String bFileStatus) {
		super();
		this.bId = bId;
		this.bWriter = bWriter;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bAddress = bAddress;
		this.bAddressH = bAddressH;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bViews = bViews;
		this.bLikes = bLikes;
		this.bStatus = bStatus;
		this.bTel = bTel;
		this.bHours = bHours;
		this.bFee = bFee;
		this.bCodeNumber = bCodeNumber;
		this.bTrans = bTrans;
		this.bOriginalFile = bOriginalFile;
		this.bModifyFile = bModifyFile;
		this.bFileList = bFileList;
		this.bCode = bCode;
		this.category = category;
		this.bFileStatus = bFileStatus;
	}

	@Override
	public String toString() {
		return "Blog [bId=" + bId + ", bWriter=" + bWriter + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bAddress=" + bAddress + ", bAddressH=" + bAddressH + ", bCreateDate=" + bCreateDate
				+ ", bModifyDate=" + bModifyDate + ", bViews=" + bViews + ", bLikes=" + bLikes + ", bStatus=" + bStatus
				+ ", bTel=" + bTel + ", bHours=" + bHours + ", bFee=" + bFee + ", bCodeNumber=" + bCodeNumber
				+ ", bTrans=" + bTrans + ", bOriginalFile=" + bOriginalFile + ", bModifyFile=" + bModifyFile
				+ ", bFileList=" + bFileList + ", bCode=" + bCode + ", category=" + category + ", bFileStatus="
				+ bFileStatus + "]";
	}
	
}