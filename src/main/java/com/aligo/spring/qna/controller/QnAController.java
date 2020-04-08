package com.aligo.spring.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.qna.model.service.QnAService;

@Controller
public class QnAController {

	@Autowired
	private QnAService qService;
	
	@RequestMapping("contactView.do")
	public ModelAndView boardList(ModelAndView mv) {
		
		return mv;
	}
	
	
	
}
