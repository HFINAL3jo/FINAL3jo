package com.aligo.spring.statistics.model.vo;

import java.io.Serializable;
//import java.sql.Date;

public class statistics implements Serializable{

	private static final long serialVersionUID = 5254634415693885067L;

	// 일단 방법 1을 따른다. 이후에 고치는것 알아서 판단
	
	private int number; 					// 인포그램을 구분 하기 위한 행
	private String tableName = "파이";		// 실제 테이블명이 아니라 어느 차트에 쓰는 것지 표시	
	//private Date DoughtDate;			일단 sql 데이터 쓰지 않으므로 주석 처리
	private String DoughtDate;				// 날짜
	private String DoughtColumnName; 		// Dought 차트에 쓰일 DB에서 가져오는 이름 컬럼 (실제 db컬럼 이름x)
	private int DoughtColumnNumber;			// Dought 차트에 쓰일  DB에서 가져오는 이름에 해당하는 값
	
	public statistics() {}
	
	public statistics(int number, String tableName, String doughtDate, String doughtColumnName, int doughtColumnNumber) {
		super();
		this.number = number;
		this.tableName = tableName;
		DoughtDate = doughtDate;
		DoughtColumnName = doughtColumnName;
		DoughtColumnNumber = doughtColumnNumber;
	}
	
	public statistics(int number, String doughtDate, String doughtColumnName, int doughtColumnNumber) {
		super();
		this.number = number;
		DoughtDate = doughtDate;
		DoughtColumnName = doughtColumnName;
		DoughtColumnNumber = doughtColumnNumber;
	}

	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getDoughtDate() {
		return DoughtDate;
	}
	public void setDoughtDate(String doughtDate) {
		DoughtDate = doughtDate;
	}
	public String getDoughtColumnName() {
		return DoughtColumnName;
	}
	public void setDoughtColumnName(String doughtColumnName) {
		DoughtColumnName = doughtColumnName;
	}
	public int getDoughtColumnNumber() {
		return DoughtColumnNumber;
	}
	public void setDoughtColumnNumber(int doughtColumnNumber) {
		DoughtColumnNumber = doughtColumnNumber;
	}
	
	@Override
	public String toString() {
		return "statistics [number=" + number + ", tableName=" + tableName + ", DoughtDate=" + DoughtDate
				+ ", DoughtColumnName=" + DoughtColumnName + ", DoughtColumnNumber=" + DoughtColumnNumber + "]";
	}
	
	
}
