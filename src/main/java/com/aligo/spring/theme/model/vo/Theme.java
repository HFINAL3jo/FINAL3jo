package com.aligo.spring.theme.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Theme implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9062238090566590849L;

	private int tId;
	private String tWriter;
	private String tTitle;
	private String tContent;
	private String tAddress;
	private Date tCreateDate;
	private Date tModifyDate;
	private int tViews;
	private int tLikes;
	private String tKeyword;
	private String tStatus;
	private String tCode;
	private String tOriginalFile;
	private String tModifyFile;
	private String tName;
	private int tCodeNumber;

	private ArrayList<TFile> tFileList;
	private ArrayList<TName> tNameList;

	public Theme() {
	}

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public String gettWriter() {
		return tWriter;
	}

	public void settWriter(String tWriter) {
		this.tWriter = tWriter;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}

	public String gettAddress() {
		return tAddress;
	}

	public void settAddress(String tAddress) {
		this.tAddress = tAddress;
	}

	public Date gettCreateDate() {
		return tCreateDate;
	}

	public void settCreateDate(Date tCreateDate) {
		this.tCreateDate = tCreateDate;
	}

	public Date gettModifyDate() {
		return tModifyDate;
	}

	public void settModifyDate(Date tModifyDate) {
		this.tModifyDate = tModifyDate;
	}

	public int gettViews() {
		return tViews;
	}

	public void settViews(int tViews) {
		this.tViews = tViews;
	}

	public int gettLikes() {
		return tLikes;
	}

	public void settLikes(int tLikes) {
		this.tLikes = tLikes;
	}

	public String gettKeyword() {
		return tKeyword;
	}

	public void settKeyword(String tKeyword) {
		this.tKeyword = tKeyword;
	}

	public String gettStatus() {
		return tStatus;
	}

	public void settStatus(String tStatus) {
		this.tStatus = tStatus;
	}

	public String gettCode() {
		return tCode;
	}

	public void settCode(String tCode) {
		this.tCode = tCode;
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

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public int gettCodeNumber() {
		return tCodeNumber;
	}

	public void settCodeNumber(int tCodeNumber) {
		this.tCodeNumber = tCodeNumber;
	}

	public ArrayList<TFile> gettFileList() {
		return tFileList;
	}

	public void settFileList(ArrayList<TFile> tFileList) {
		this.tFileList = tFileList;
	}

	public ArrayList<TName> gettNameList() {
		return tNameList;
	}

	public void settNameList(ArrayList<TName> tNameList) {
		this.tNameList = tNameList;
	}

	public Theme(int tId, String tWriter, String tTitle, String tContent, String tAddress, Date tCreateDate,
			Date tModifyDate, int tViews, int tLikes, String tKeyword, String tStatus, String tCode,
			String tOriginalFile, String tModifyFile, String tName, int tCodeNumber, ArrayList<TFile> tFileList,
			ArrayList<TName> tNameList) {
		super();
		this.tId = tId;
		this.tWriter = tWriter;
		this.tTitle = tTitle;
		this.tContent = tContent;
		this.tAddress = tAddress;
		this.tCreateDate = tCreateDate;
		this.tModifyDate = tModifyDate;
		this.tViews = tViews;
		this.tLikes = tLikes;
		this.tKeyword = tKeyword;
		this.tStatus = tStatus;
		this.tCode = tCode;
		this.tOriginalFile = tOriginalFile;
		this.tModifyFile = tModifyFile;
		this.tName = tName;
		this.tCodeNumber = tCodeNumber;
		this.tFileList = tFileList;
		this.tNameList = tNameList;
	}

	@Override
	public String toString() {
		return "Theme [tId=" + tId + ", tWriter=" + tWriter + ", tTitle=" + tTitle + ", tContent=" + tContent
				+ ", tAddress=" + tAddress + ", tCreateDate=" + tCreateDate + ", tModifyDate=" + tModifyDate
				+ ", tViews=" + tViews + ", tLikes=" + tLikes + ", tKeyword=" + tKeyword + ", tStatus=" + tStatus
				+ ", tCode=" + tCode + ", tOriginalFile=" + tOriginalFile + ", tModifyFile=" + tModifyFile + ", tName="
				+ tName + ", tCodeNumber=" + tCodeNumber + ", tFileList=" + tFileList + ", tNameList=" + tNameList
				+ "]";
	}

}