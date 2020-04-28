package com.aligo.spring.common;

import com.aligo.spring.theme.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage,int listCount) {
		
		PageInfo pi = null;
		
		int maxPage;
		int startPage;
		int pageLimit = 1;
		int themeLimit = 4;
		
		maxPage = (int)Math.ceil((double)listCount / themeLimit);
		
		startPage = (currentPage - 1)/themeLimit * themeLimit + 1;
		
		pi = new PageInfo(startPage, maxPage, listCount, pageLimit, currentPage, themeLimit);
		
		return pi;
	}
	
	/**
	 * 	recom 에서 사용
	 * @param currentPage
	 * @param listCount
	 * @return
	 */
	public static PageInfo getPageInfo2(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int maxPage;
		int startPage;
		int pageLimit = 1;
		int themeLimit = 12;
		
		maxPage = (int)Math.ceil((double)listCount / themeLimit);
		
		startPage = (currentPage - 1)/themeLimit * themeLimit + 1;
		
		pi = new PageInfo(startPage, maxPage, listCount, pageLimit, currentPage, themeLimit);
		
		return pi;
	}
	
/**
 *  Report 에서 사용
 * @param currentPage
 * @param listCount
 * @return
 */
public static PageInfo getPageInfo3(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int maxPage;
		int startPage;
		int endPage;				// 현재 페이지에서 보여질 페이징 버튼의 끝 페이지
		int pageLimit = 10;			// 한 페이지에서 보여질 페이징 수
		int Limit = 12;
		
		// maxPage - 총 페이지 수
		maxPage = (int)Math.ceil((double)listCount / Limit);
		
		// startPage - 현재 페이지에 보여질 시작 페이지 수
		startPage = (currentPage - 1)/Limit * Limit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
				
		pi = new PageInfo(startPage, maxPage, listCount, pageLimit, currentPage, Limit, endPage);
		
		return pi;
	}
}
