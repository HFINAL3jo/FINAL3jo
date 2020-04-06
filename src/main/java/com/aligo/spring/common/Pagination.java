package com.aligo.spring.common;

import com.aligo.spring.theme.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage,int listCount) {
		
		PageInfo pi = null;
		
		int maxPage;
		int startPage;
		int pageLimit = 1;
		int themeLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount / themeLimit);
		
		startPage = (currentPage - 1)/themeLimit * themeLimit + 1;
		
		pi = new PageInfo(startPage, maxPage, listCount, pageLimit, currentPage, themeLimit);
		
		return pi;
	}
	
}
