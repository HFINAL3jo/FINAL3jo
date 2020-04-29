package com.aligo.spring.report.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.aligo.spring.report.model.vo.Report;
import com.aligo.spring.theme.model.vo.PageInfo;

public interface ReportService {

	int selectTotalInt(Map<String, String> map);

	ArrayList<Report> selectTotalList(Map<String, String> map, PageInfo pi);

	/**
	 * 신고 게시판 1개 가져온다.
	 * @param str : 신고 게시판 구분
	 * @return
	 */
	Report reportDetail(String str);

	/**
	 * 신고 게시판 답변 글 등록
	 * @param map : update 할 때 사용하는 매개변수 값을 map으로 전달
	 * @return
	 */
	Report reportContentEnsure(Map<String, String> map);

}
