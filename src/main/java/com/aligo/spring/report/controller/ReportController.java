package com.aligo.spring.report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.Pagination;
import com.aligo.spring.report.model.service.ReportService;
import com.aligo.spring.report.model.vo.Report;
import com.aligo.spring.theme.model.vo.PageInfo;

@Controller
public class ReportController {
	
	@Autowired
	public ReportService Rservice;
	
	@RequestMapping(value="reportlist.do", method=RequestMethod.GET)
	public ModelAndView reportlist(HttpServletRequest request, ModelAndView mav) {
		//Report
		Map<String, String> map = new HashMap();
		//checkSearch
		System.out.println(request.getParameterValues("checkSearch"));
		if(request.getParameterValues("checkSearch") == null) {
			map.put("checkValue1", "ALL");
			map.put("checkValue2", "NOT");
		}else {
			for(int i = 1; i<=request.getParameterValues("checkSearch").length; i++) {
				map.put("checkValue"+i, request.getParameterValues("checkSearch")[i-1]);
			}
		}
		
		//System.out.println(request.getParameter("currentPage"));
		
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int currentPage;
		
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int count = Rservice.selectTotalInt(map);

		PageInfo pi = Pagination.getPageInfo3(currentPage, count);

		ArrayList<Report> list = Rservice.selectTotalList(map, pi);

		mav.addObject("list", list)
			.addObject("pi", pi)
			.addObject("checkValue1", map.get("checkValue1"))
			.addObject("checkValue2", map.get("checkValue2"))
			.addObject("checkValue3", map.get("checkValue3"))
			.setViewName("admin/reportlist");
		
		return mav;
	}
	
	@RequestMapping(value="reportDetail.do", method=RequestMethod.POST)
	public ModelAndView reportDetail(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("num");	// 시고 테이블의 번호
		
		Report b = Rservice.reportDetail(str);
		
		mav.addObject("b", b)
			.setViewName("admin/reportDetail");
		return mav;
	}
	
	@RequestMapping(value="reportContentEnsure.do", method=RequestMethod.POST) 
	public ModelAndView reportContentEnsure(HttpServletRequest request, ModelAndView mav) {
		String[] str =  request.getParameterValues("value");
		
		Map<String, String> map = new HashMap();
		
		map.put("number", str[0]);	// 신고 게시판 테이블 번호
		map.put("ensure", str[1]);	// 삽입할 답변 글
		
		Report b = Rservice.reportContentEnsure(map);
		
		if(b != null) {	// 데이터가 정확하게 들어오면 이동
			mav.addObject("b", b)
			.setViewName("admin/reportDetail");
		}else {			// 실패시에 에러 페이지로 이동
			mav.setViewName("common/errorPage");
		}
		
		return mav;
	}
	
}
