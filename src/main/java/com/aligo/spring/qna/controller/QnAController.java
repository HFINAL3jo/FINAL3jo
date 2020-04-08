package com.aligo.spring.qna.controller;

import java.util.ArrayList;

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
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) {
		
		System.out.println(currentPage);
		
		int listCount = qService.getListCount();
		
		System.out.println("listCount : " +listCount);
		
		QnAPageInfo pi = QnAPagination.getQnAPageInfo(currentPage, listCount);
		
		ArrayList<QnA> list = qService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("member/contactView");
		
		return mv;
	}
	/*
	 * @RequestMapping("contactView.do") public ModelAndView boardList(ModelAndView
	 * mv) {
	 * 
	 * return mv; }
	 */
>>>>>>> branch 'master' of https://github.com/HFINAL3jo/FINAL3jo.git
	
	
	
}
