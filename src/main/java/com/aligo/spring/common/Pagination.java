package com.aligo.spring.common;

import com.aligo.spring.theme.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage,int listCount, int themeLimit) {
		
		PageInfo pi = null;
		
		int maxPage;
		int startPage;
		int endPage;
		int pageLimit = 1;
		
		maxPage = (int)Math.ceil((double)listCount / themeLimit);
		
		startPage = (currentPage - 1)/themeLimit * themeLimit + 1;
		
		endPage = startPage + themeLimit - 1;
		
		if(maxPage < endPage) endPage = maxPage;
		
		pi = new PageInfo(startPage, endPage, maxPage, listCount, pageLimit, currentPage, themeLimit);
		
		return pi;
	}
}
