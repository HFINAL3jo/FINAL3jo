package com.aligo.spring.theme.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.Pagination;
import com.aligo.spring.theme.model.service.ThemeService;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Controller
public class ThemeController {
	
	@Autowired
	private ThemeService tService;
	
	@RequestMapping("theme.do")
	public ModelAndView themeList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="pageLimit",required=false,defaultValue="1") int pageLimit) {
		
		int listCount = tService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit);
		
		ArrayList<Theme> list = tService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("theme/categoryList");
		
		return mv;
	}
}
