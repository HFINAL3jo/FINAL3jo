package com.aligo.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aligo.spring.member.model.service.MemberService;
import com.aligo.spring.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	
	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String insertMember(Member m) {
		
		int result = memService.insertMember(m);
		return "main";
		
		/*
		 * if(result > 0) { return "redirect:main.jsp"; } else {
		 * model.addAttribute("msg","회원 가입에 실패하셨습니다."); return "common/errorPage.jsp"; }
		 */
		
		
	}
	

}
