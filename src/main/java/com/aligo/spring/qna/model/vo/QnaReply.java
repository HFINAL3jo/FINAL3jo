package com.aligo.spring.qna.model.vo;

import java.sql.Date;

public class QnaReply {
	private int rId;
	private String rContent;
	private int refQid;
	private String rWriterNickname;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	
	public QnaReply() {
		
	}

	public QnaReply(int rId, String rContent, int refQid, String rWriterNickname, Date rCreateDate, Date rModifyDate,
			String rStatus) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refQid = refQid;
		this.rWriterNickname = rWriterNickname;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getRefQid() {
		return refQid;
	}

	public void setRefQid(int refQid) {
		this.refQid = refQid;
	}

	public String getrWriterNickname() {
		return rWriterNickname;
	}

	public void setrWriter(String rWriterNickname) {
		this.rWriterNickname = rWriterNickname;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "QnaReply [rId=" + rId + ", rContent=" + rContent + ", refQid=" + refQid + ", rWriterNickname=" + rWriterNickname
				+ ", rCreateDate=" + rCreateDate + ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + "]";
	}
	
	
}
