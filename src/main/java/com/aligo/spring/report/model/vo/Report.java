package com.aligo.spring.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	
	private static final long serialVersionUID = 9113340048936118446L;
	private int rCode;
	private String tTitle;
	private int dDcodeNumber;
	private String reporter;
	private String reportContent;
	private String reportContentEnsure;
	private Date reportSdate;
	private Date reportEdate;
	private String rStatus;
	
	public Report(){}

	

	public Report(int rCode, String tTitle, int dDcodeNumber, String reporter, String reportContent,
			String reportContentEnsure, Date reportSdate, Date reportEdate, String rStatus) {
		super();
		this.rCode = rCode;
		this.tTitle = tTitle;
		this.dDcodeNumber = dDcodeNumber;
		this.reporter = reporter;
		this.reportContent = reportContent;
		this.reportContentEnsure = reportContentEnsure;
		this.reportSdate = reportSdate;
		this.reportEdate = reportEdate;
		this.rStatus = rStatus;
	}



	public int getrCode() {
		return rCode;
	}



	public void setrCode(int rCode) {
		this.rCode = rCode;
	}



	public String gettTitle() {
		return tTitle;
	}



	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}



	public int getdDcodeNumber() {
		return dDcodeNumber;
	}



	public void setdDcodeNumber(int dDcodeNumber) {
		this.dDcodeNumber = dDcodeNumber;
	}



	public String getReporter() {
		return reporter;
	}



	public void setReporter(String reporter) {
		this.reporter = reporter;
	}



	public String getReportContent() {
		return reportContent;
	}



	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}



	public String getReportContentEnsure() {
		return reportContentEnsure;
	}



	public void setReportContentEnsure(String reportContentEnsure) {
		this.reportContentEnsure = reportContentEnsure;
	}



	public Date getReportSdate() {
		return reportSdate;
	}



	public void setReportSdate(Date reportSdate) {
		this.reportSdate = reportSdate;
	}



	public Date getReportEdate() {
		return reportEdate;
	}



	public void setReportEdate(Date reportEdate) {
		this.reportEdate = reportEdate;
	}



	public String getrStatus() {
		return rStatus;
	}



	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}



	@Override
	public String toString() {
		return "Report [rCode=" + rCode + ", dDcodeNumber=" + dDcodeNumber + ", reporter=" + reporter
				+ ", reportContent=" + reportContent + ", reportSdate=" + reportSdate + ", reportEdate=" + reportEdate
				+ ", rStatus=" + rStatus + "]";
	}

}
