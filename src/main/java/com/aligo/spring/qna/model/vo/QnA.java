package com.aligo.spring.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnA implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3273850703847794953L;
	private int qId;
	private String qTitle;
	private String qContent;
	private String qWriter;
	private Date qCreateDate;
	private Date qAnswerDate;
	private String qStatus;
	
	public QnA() {
	}
	
	public QnA(int qId, String qTitle, String qContent, String qWriter, Date qCreateDate, Date qAnswerDate, String qStatus) {
		super();
		this.qId = qId;
		this.qTitle = qTitle;
		this.qWriter = qWriter;
		this.qCreateDate = qCreateDate;
		this.qAnswerDate = qAnswerDate;
		this.qStatus = qStatus;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqWriter() {
		return qWriter;
	}

	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}

	public Date getqCreateDate() {
		return qCreateDate;
	}

	public void setqCreateDate(Date qCreateDate) {
		this.qCreateDate = qCreateDate;
	}

	public Date getqAnswerDate() {
		return qAnswerDate;
	}

	public void setqAnswerDate(Date qAnswerDate) {
		this.qAnswerDate = qAnswerDate;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	@Override
	public String toString() {
		return "QnA [qId=" + qId + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qWriter=" + qWriter
				+ ", qCreateDate=" + qCreateDate + ", qAnswerDate=" + qAnswerDate + ", qStatus=" + qStatus + "]";
	}
	
	
}
