package com.aligo.spring.theme.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9044755568311632797L;

	private int startPage;
	private int maxPage;
	private int listCount;
	private int pageLimit;
	private int currentPage;
	private int themeLimit;

	public PageInfo() {
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getThemeLimit() {
		return themeLimit;
	}

	public void setThemeLimit(int themeLimit) {
		this.themeLimit = themeLimit;
	}

	public PageInfo(int startPage, int maxPage, int listCount, int pageLimit, int currentPage, int themeLimit) {
		super();
		this.startPage = startPage;
		this.maxPage = maxPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.currentPage = currentPage;
		this.themeLimit = themeLimit;
	}

	@Override
	public String toString() {
		return "PageInfo [startPage=" + startPage + ", maxPage=" + maxPage + ", listCount="
				+ listCount + ", pageLimit=" + pageLimit + ", currentPage=" + currentPage + ", themeLimit=" + themeLimit + "]";
	}

}
