package com.aligo.spring.statistics.model.vo;

import java.io.Serializable;
//import java.sql.Date;
import java.sql.Date;

public class Statistics implements Serializable{

	private static final long serialVersionUID = 5254634415693885067L;

	// 일단 방법 1을 따른다. 이후에 고치는것 알아서 판단
	
	private int number; 					// TCODE
	//private String tableName = "파이";		 실제 테이블명이 아니라 어느 차트에 쓰는 것지 표시	
	private Date registDate;				// 날짜			
	private String ColumnAddressName; 		// 장소(TADDRESS) DB에서 가져오는 이름 컬럼
	private int ColumnAddressNumber;		// 장소(TADDRESS) DB에서 가져오는 이름에 해당하는 값
	private String ColumnTnameName; 		// 1차분류(TNAME) DB에서 가져오는 이름 컬럼
	private int ColumnTnameNumber;			// 1차분류(TNAME) DB에서 가져오는 이름에 해당하는 값
	private String ColumnTKeywordName; 		// 1차분류의 세부 사항(TKEYWORD) DB에서 가져오는 이름 컬럼
	private int ColumnTKeywordNumber;		// 1차분류의 세부 사항(TKEYWORD) DB에서 가져오는 이름에 해당하는 값
	
	public Statistics() {}

	public Statistics(String columnAddressName, int columnAddressNumber) {
		super();
		ColumnAddressName = columnAddressName;
		ColumnAddressNumber = columnAddressNumber;
	}

	public Statistics(Date registDate, String columnAddressName, int columnAddressNumber) {
		super();
		this.registDate = registDate;
		ColumnAddressName = columnAddressName;
		ColumnAddressNumber = columnAddressNumber;
	}
	
	public Statistics(int number, String columnAddressName, int columnAddressNumber) {
		super();
		this.number = number;
		ColumnAddressName = columnAddressName;
		ColumnAddressNumber = columnAddressNumber;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getColumnAddressName() {
		return ColumnAddressName;
	}

	public void setColumnAddressName(String columnAddressName) {
		ColumnAddressName = columnAddressName;
	}

	public int getColumnAddressNumber() {
		return ColumnAddressNumber;
	}

	public void setColumnAddressNumber(int columnAddressNumber) {
		ColumnAddressNumber = columnAddressNumber;
	}

	public String getColumnTnameName() {
		return ColumnTnameName;
	}

	public void setColumnTnameName(String columnTnameName) {
		ColumnTnameName = columnTnameName;
	}

	public int getColumnTnameNumber() {
		return ColumnTnameNumber;
	}

	public void setColumnTnameNumber(int columnTnameNumber) {
		ColumnTnameNumber = columnTnameNumber;
	}

	public String getColumnTKeywordName() {
		return ColumnTKeywordName;
	}

	public void setColumnTKeywordName(String columnTKeywordName) {
		ColumnTKeywordName = columnTKeywordName;
	}

	public int getColumnTKeywordNumber() {
		return ColumnTKeywordNumber;
	}

	public void setColumnTKeywordNumber(int columnTKeywordNumber) {
		ColumnTKeywordNumber = columnTKeywordNumber;
	}

	@Override
	public String toString() {
		return "Statistics [number=" + number + ", registDate=" + registDate + ", ColumnAddressName="
				+ ColumnAddressName + ", ColumnAddressNumber=" + ColumnAddressNumber + ", ColumnTnameName="
				+ ColumnTnameName + ", ColumnTnameNumber=" + ColumnTnameNumber + ", ColumnTKeywordName="
				+ ColumnTKeywordName + ", ColumnTKeywordNumber=" + ColumnTKeywordNumber + "]";
	}

	
	
}
