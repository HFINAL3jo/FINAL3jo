package com.aligo.spring.blog.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BlogVo {
	private int bId;
	private String bWriter;
	private String bTitle;
	private String bContent;
	private String bAddress;
	private Date bCreateDate;
	private Date bModifyDate;
	private int bViews;
	private int bLikes;
	private int bCount;
	private String bTag;
	private String bStatus;
	private String bTel;
	private String bHours;
	private String bTrans;
	private String bOriginalFile;
	private String bModifyFile;
//	private ArrayList<BFile> bFileList;

	public BlogVo() {
	}

	public BlogVo(int bId, String bWriter, String bTitle, String bContent, String bAddress, Date bCreateDate,
			Date bModifyDate, int bCount, int bLiked, String bTag, String bStatus) {
		this.bId = bId;
		this.bWriter = bWriter;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bAddress = bAddress;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bCount = bCount;
		this.bTag = bTag;
		this.bStatus = bStatus;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
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

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbTag() {
		return bTag;
	}

	public void setbTag(String bTag) {
		this.bTag = bTag;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	@Override
	public String toString() {
		return "BlogVo [bId=" + bId + ", bWriter=" + bWriter + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bAddress=" + bAddress + ", bCreateDate=" + bCreateDate + ", bModifyDate=" + bModifyDate
				+ ", bCount=" + bCount + ", bLiked=" + ", bTag=" + bTag + ", bStatus=" + bStatus + "]";
	}

}
