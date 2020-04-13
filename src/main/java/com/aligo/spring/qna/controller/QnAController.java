package com.aligo.spring.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.QnAPagination;
import com.aligo.spring.qna.model.service.QnAService;
import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;

@Controller
public class QnAController {

	@Autowired
	private QnAService qService;
	
	@RequestMapping("contactView.do")
	public ModelAndView boardList(HttpServletResponse response, ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) {
		
		response.setContentType("application/json; charset=utf-8");
		
		int listCount = qService.getListCount();
		
		QnAPageInfo pi = QnAPagination.getQnAPageInfo(currentPage, listCount);
		
		ArrayList<QnA> list = qService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("member/contactView");
		
		return mv;
	}
	
	
}
