package com.aligo.spring.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.Pagination;
import com.aligo.spring.member.model.service.MyPageService;
import com.aligo.spring.member.model.vo.Member;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Controller
public class MyPageController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MyPageService mpService;
	
	@RequestMapping("likedList.do")
	public ModelAndView themeList(ModelAndView mv,
								  @RequestParam(value="currentPage",required=false,defaultValue="1")
								  int currentPage) {
		int listCount = mpService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Theme> list = mpService.selectList(pi);
		
		for(Theme t: list) {
			if(t.gettModifyFile().length() <= 18) {
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile());
			}
		}
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("member/likedList");
		
		return mv;
	}
	
	
	@RequestMapping("pagination2.do") 
	public void pagination(HttpServletResponse response,	  
		  				 @RequestParam(value="currentPage",required=false,defaultValue="1")
							 int currentPage)throws IOException {
		
	  response.setContentType("application/json; charset=UTF-8");
	  int listCount = mpService.getListCount();
	  
	  PageInfo pi = Pagination.getPageInfo(currentPage,listCount); ArrayList<Theme>
	  list = mpService.selectList(pi);
	  
	  JSONArray jArr = new JSONArray();
	  
	  for(Theme t: list) { 
		  if(t.gettModifyFile().length() <= 18) {
			  t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile()); 
		  }else {
			  t.settModifyFile(t.gettModifyFile().replace("amp;","")); 
		  }
		  JSONObject jobj = new JSONObject(); jobj.put("tId",t.gettId());
		  jobj.put("tModifyFile",t.gettModifyFile());
		  jobj.put("tTitle",t.gettTitle());
		  jobj.put("tName","#"+t.gettName());
		  
		  jArr.add(jobj); 
	  } 
	  	PrintWriter out = response.getWriter();
	  	
	  	out.print(jArr);
	  	out.flush();
	  	out.close(); 
	}
	  
	  
	/**
	 * 회원 탈퇴
	 * @param status
	 * @param m
	 * @param model
	 * @param email
	 * @param password
	 * @return
	 */
	@RequestMapping("memDelete.do") 
	public String memberDelete(SessionStatus status, Member m, Model model,
								String email, String password) {
		int result = mpService.memberDelete(m);
		
		if(result > 0) {
			status.setComplete();			
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg","회원 탈퇴 오류");
			return "common/errorPage";
		}
	}
	
	/**
	 * 회원 수정
	 * @param m
	 * @param model
	 * @return
	 */
	@RequestMapping("memUpdate.do")
	public String memberUpdate(Member m, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getpassword());
		m.setpassword(encPwd);
		
		int result = mpService.memberUpdate(m);
		
		if(result > 0) {
			model.addAttribute("loginUser",m);
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg","회원 수정 실패");
			return "common/errorPage";			
		}		
	}
	
	  
	  
}
