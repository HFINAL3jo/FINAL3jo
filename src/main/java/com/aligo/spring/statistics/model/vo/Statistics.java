package com.aligo.spring.statistics.model.vo;

import java.io.Serializable;
//import java.sql.Date;
import java.sql.Date;

public class Statistics implements Serializable{

	private static final long serialVersionUID = 5254634415693885067L;

	// 일단 방법 1을 따른다. 이후에 고치는것 알아서 판단
	
	private String number; 					// TCODE
	//private String tableName = "파이";		 실제 테이블명이 아니라 어느 차트에 쓰는 것지 표시	
	private Date registDate;				// 날짜
	
	private String columnAddressName; 		// 2차분류(TADDRESS) DB에서 가져오는 이름 컬럼
	private int columnAddressNumber;		// 2차분류(TADDRESS) DB에서 가져오는 이름에 해당하는 값
	
	private String columnTnameName; 		// 2차분류(TNAME) DB에서 가져오는 이름 컬럼
	private int columnTnameNumber;			// 2차분류(TNAME) DB에서 가져오는 이름에 해당하는 값
	
	private String columnTKeywordName; 		// 1차분류의 세부 사항(TKEYWORD) DB에서 가져오는 이름 컬럼
	private int columnTKeywordNumber;		// 1차분류의 세부 사항(TKEYWORD) DB에서 가져오는 이름에 해당하는 값
	
	private String columnTlikeName; 		// 1차분류의 세부 사항(T_LIKES) DB에서 가져오는 이름 컬럼
	private String columnTlikeValue;		// 1차분류의 세부 사항(T_LIKES) DB에서 가져오는 이름에 해당하는 값
	
	private String columnTviewsName; 		// 1차분류의 세부 사항(T_VIEWS) DB에서 가져오는 이름 컬럼
	private String columnTviewsValue;		// 1차분류의 세부 사항(T_VIEWS) DB에서 가져오는 이름에 해당하는 값
	
	//
	
	public Statistics() {}

	public Statistics(String columnAddressName, int columnAddressNumber) {
		super();
		this.columnAddressName = columnAddressName;
		this.columnAddressNumber = columnAddressNumber;
	}

	public Statistics(Date registDate, String columnAddressName, int columnAddressNumber) {
		super();
		this.registDate = registDate;
		this.columnAddressName = columnAddressName;
		this.columnAddressNumber = columnAddressNumber;
	}
	
	public Statistics(String number, String columnAddressName, int columnAddressNumber) {
		super();
		this.number = number;
		this.columnAddressName = columnAddressName;
		this.columnAddressNumber = columnAddressNumber;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getColumnAddressName() {
		return columnAddressName;
	}

	public void setColumnAddressName(String columnAddressName) {
		this.columnAddressName = columnAddressName;
	}

	public int getColumnAddressNumber() {
		return columnAddressNumber;
	}

	public void setColumnAddressNumber(int columnAddressNumber) {
		this.columnAddressNumber = columnAddressNumber;
	}

	public String getColumnTnameName() {
		return columnTnameName;
	}

	public void setColumnTnameName(String columnTnameName) {
		this.columnTnameName = columnTnameName;
	}

	public int getColumnTnameNumber() {
		return columnTnameNumber;
	}

	public void setColumnTnameNumber(int columnTnameNumber) {
		this.columnTnameNumber = columnTnameNumber;
	}

	public String getColumnTKeywordName() {
		return columnTKeywordName;
	}

	public void setColumnTKeywordName(String columnTKeywordName) {
		this.columnTKeywordName = columnTKeywordName;
	}

	public int getColumnTKeywordNumber() {
		return columnTKeywordNumber;
	}

	public void setColumnTKeywordNumber(int columnTKeywordNumber) {
		this.columnTKeywordNumber = columnTKeywordNumber;
	}

	public String getColumnTlikeName() {
		return columnTlikeName;
	}

	public void setColumnTlikeName(String columnTlikeName) {
		this.columnTlikeName = columnTlikeName;
	}

	public String getColumnTlikeValue() {
		return columnTlikeValue;
	}

	public void setColumnTlikeValue(String columnTlikeValue) {
		this.columnTlikeValue = columnTlikeValue;
	}

	public String getColumnTviewsName() {
		return columnTviewsName;
	}

	public void setColumnTviewsName(String columnTviewsName) {
		this.columnTviewsName = columnTviewsName;
	}

	public String getColumnTviewsValue() {
		return columnTviewsValue;
	}

	public void setColumnTviewsValue(String columnTviewsValue) {
		this.columnTviewsValue = columnTviewsValue;
	}

	@Override
	public String toString() {
		return "Statistics [number=" + number + ", registDate=" + registDate + ", columnAddressName="
				+ columnAddressName + ", columnAddressNumber=" + columnAddressNumber + ", columnTnameName="
				+ columnTnameName + ", columnTnameNumber=" + columnTnameNumber + ", columnTKeywordName="
				+ columnTKeywordName + ", columnTKeywordNumber=" + columnTKeywordNumber + ", columnTlikeName="
				+ columnTlikeName + ", columnTlikeValue=" + columnTlikeValue + ", columnTviewsName=" + columnTviewsName
				+ ", columnTviewsValue=" + columnTviewsValue + "]";
	}

	
}
