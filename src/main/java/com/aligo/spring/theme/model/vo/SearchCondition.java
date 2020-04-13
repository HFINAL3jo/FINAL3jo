package com.aligo.spring.theme.model.vo;

public class SearchCondition {
	private String keyword;
	private int searchValue;
	
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

	@Override
	public String toString() {
		return "SearchCondition [keyword=" + keyword + ", searchValue=" + searchValue + "]";
	}

	public SearchCondition(String keyword, int searchValue) {
		super();
		this.keyword = keyword;
		this.searchValue = searchValue;
	}
	
}
