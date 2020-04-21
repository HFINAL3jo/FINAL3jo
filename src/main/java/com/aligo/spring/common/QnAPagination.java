package com.aligo.spring.common;

import com.aligo.spring.qna.model.vo.QnAPageInfo;

public class QnAPagination {

	public static QnAPageInfo getQnAPageInfo(int currentPage, int listCount) {
		
		QnAPageInfo pi = null;
		
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		int boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage -1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new QnAPageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		return pi;
	}
}
