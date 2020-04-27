package com.aligo.spring.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bcController")
public class BlogController {

	@RequestMapping("blogListView.do")
	public String blogListView() {
		return "blog/blogList";
	}
	
	@RequestMapping("blogInsertView.do")
	public String blogInsertView() {
		return "blog/blogInsertView";
	}
}
