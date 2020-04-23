package com.aligo.spring.theme.model.vo;

import java.sql.Date;

public class TReply {

	private int trId;
	private String trContent;
	private int refTid;
	private String trWriter;
	private Date trCreateDate;
	private Date trModifyDate;
	private String trStatus;

	public TReply() {
	}

	public int getTrId() {
		return trId;
	}

	public void setTrId(int trId) {
		this.trId = trId;
	}

	public String getTrContent() {
		return trContent;
	}

	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}

	public int getRefTid() {
		return refTid;
	}

	public void setRefTid(int refTid) {
		this.refTid = refTid;
	}

	public String getTrWriter() {
		return trWriter;
	}

	public void setTrWriter(String trWriter) {
		this.trWriter = trWriter;
	}

	public Date getTrCreateDate() {
		return trCreateDate;
	}

	public void setTrCreateDate(Date trCreateDate) {
		this.trCreateDate = trCreateDate;
	}

	public Date getTrModifyDate() {
		return trModifyDate;
	}

	public void setTrModifyDate(Date trModifyDate) {
		this.trModifyDate = trModifyDate;
	}

	public String getTrStatus() {
		return trStatus;
	}

	public void setTrStatus(String trStatus) {
		this.trStatus = trStatus;
	}

	public TReply(int trId, String trContent, int refTid, String trWriter, Date trCreateDate, Date trModifyDate,
			String trStatus) {
		super();
		this.trId = trId;
		this.trContent = trContent;
		this.refTid = refTid;
		this.trWriter = trWriter;
		this.trCreateDate = trCreateDate;
		this.trModifyDate = trModifyDate;
		this.trStatus = trStatus;
	}

	@Override
	public String toString() {
		return "TReply [trId=" + trId + ", trContent=" + trContent + ", refTid=" + refTid + ", trWriter=" + trWriter
				+ ", trCreateDate=" + trCreateDate + ", trModifyDate=" + trModifyDate + ", trStatus=" + trStatus + "]";
	}

}