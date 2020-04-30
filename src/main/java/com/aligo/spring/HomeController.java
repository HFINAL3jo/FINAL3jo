package com.aligo.spring;


import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping("post.do")
	public String post() {
		return "board/post";
	}
	
	@RequestMapping("recommend.do")
	public String recommend() {
		return "recommend/recommendPage";
	}
	
	/*
	 * @RequestMapping("contactView.do") public String contactView() { return
	 * "member/contactView"; }
	 */
	
	@RequestMapping("loginView.do")
	public String loginView() {
		return "member/loginView";
	}
	
	@RequestMapping("myPage.do")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("deleteMember.do")
	public String deleteMember() {
		return "member/deleteAccount";
	}
	
	@RequestMapping("adminView.do")
	public String adminView() {
		return "admin/QnA";
	}
	
	@RequestMapping("qna.do")
	public String qna() {
		return "admin/QnA";
	}
	
	// 신고 페이지 이동 reportlist.do
//	@RequestMapping("reportlist.do")
//	public String reportList() {
//		return "reportlist.do?currentPage=1";
//	}
	
	@RequestMapping("statistics.do")
	public String statistics() {
		// admin/statistics 
		return "admin/redirectStatistics";
	}
	
	@RequestMapping("signUp.do")
	public String signupView() {
		return "member/signUp";
	}
	
	@RequestMapping("blogdetail.do")
	public String postdetail() {
		return "board/blogdetail";
	}
	
	@RequestMapping("themeDetailView.do")
	public String themeDetailView() {
		return "theme/themeDetailView2";
	}
}
