package com.aligo.spring.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.Pagination;
import com.aligo.spring.member.model.service.MyPageService;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Controller
public class MyPageController {
	
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
	 
	
	

}