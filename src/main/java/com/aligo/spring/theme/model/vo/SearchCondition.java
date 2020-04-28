package com.aligo.spring.theme.model.vo;

import java.io.Serializable;

public class SearchCondition implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4846078499008925175L;
	private String keyword;
	private int searchValue;
	private String searchVal;
	
	public SearchCondition() {}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(int searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public SearchCondition(String keyword, int searchValue, String searchVal) {
		super();
		this.keyword = keyword;
		this.searchValue = searchValue;
		this.searchVal = searchVal;
	}

	@Override
	public String toString() {
		return "SearchCondition [keyword=" + keyword + ", searchValue=" + searchValue + ", searchVal=" + searchVal
				+ "]";
	}
	
}
