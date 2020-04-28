
package com.aligo.spring.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.blog.model.vo.BlogVo;
import com.aligo.spring.common.Pagination;
import com.aligo.spring.theme.model.service.ThemeService;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;

@Controller
public class BlogController {

//  @Autowired private BlogService bService;

	@Autowired
	private ThemeService tService;

	/*
	 * @RequestMapping("blogListView.do") public ModelAndView blogList(ModelAndView
	 * mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int
	 * currentPage, SearchCondition sc) { return "blog/blogList"; }
	 */
	
	@RequestMapping("blogListView.do")
	public String blogList() {
		return "blog/blogList";
	}

	@RequestMapping("blogInsertView.do")
	public String blogInsertView() {
		return "blog/blogInsertView";
	}
}
