package com.aligo.spring.theme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.theme.model.service.ThemeService;

@Controller
public class ThemeController {
	
	@Autowired
	private ThemeService tService;
	
	@RequestMapping("theme.do")
	public ModelAndView getListCount(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int listCount = tService.getListCount();
		
		if(listCount > 0) {
			
		}
		
		mv.setViewName("theme/categoryList");
		
		return mv;
	}
}
