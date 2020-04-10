package com.aligo.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aligo.spring.member.model.service.MemberService2;
import com.aligo.spring.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController2 {
	
	@Autowired
	private MemberService2 memService2;
	
	@RequestMapping(value="login.do")
	public String memberLogin(@ModelAttribute Member m, Model model) {

		Member loginUser = memService2.loginMember(m);

		if(loginUser != null) {
			
			//	로그인 성공 시 세션에 정보를 담아야 되기 때문에 세션이 필요하다.
			model.addAttribute("loginUser", loginUser);
			return "redirect:index.jsp";
		}else {
			
			//	로그인 실패
			model.addAttribute("msg", "로그인 실패!!");
			return "common/errorPage";
		}
	}
	
	
}
