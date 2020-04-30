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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.common.Pagination;
import com.aligo.spring.member.model.service.MyPageService;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class MyPageController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private MyPageService mpService;

	@RequestMapping("likedList.do")
	public ModelAndView themeList(ModelAndView mv,
								  @RequestParam(value="currentPage",required=false,defaultValue="1")
								  int currentPage,String mId) {
		int listCount = mpService.getListCount(mId);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Theme> list = mpService.selectList(pi,mId);
		
		for(Theme t: list) {
			if(t.gettTitle().length() > 16) {
				t.settTitle(t.gettTitle().substring(0,15));
			}
			
			if(t.gettModifyFile().length() <= 18) {
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile());
			}else if(t.gettModifyFile().contains(",")){
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile().substring(0,t.gettModifyFile().indexOf(",")));
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
							 int currentPage,String mId)throws IOException {
		
	  response.setContentType("application/json; charset=UTF-8");
	  int listCount = mpService.getListCount(mId);
	  
	  PageInfo pi = Pagination.getPageInfo(currentPage,listCount); 
	  ArrayList<Theme> list = mpService.selectList(pi,mId);
	  
	  JSONArray jArr = new JSONArray();
	  
	  for(Theme t: list) {
			
			if(t.gettModifyFile().length() <= 18) {
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile());
			}else if(t.gettModifyFile().contains(",")){
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile().substring(0,t.gettModifyFile().indexOf(",")));
			}else {
				t.settModifyFile(t.gettModifyFile().replace("amp;",""));
			}
			JSONObject jobj = new JSONObject();
			jobj.put("tId",t.gettId());
			jobj.put("tModifyFile",t.gettModifyFile());
			jobj.put("tTitle", t.gettTitle());
			jobj.put("tName","#"+t.gettName());
			
			jArr.add(jobj);
	  }
	  	PrintWriter out = response.getWriter();
	  	
	  	out.print(jArr);
	  	out.flush();
	  	out.close(); 
	}

	@RequestMapping("myReviewList.do")
	@ResponseBody
	public void myReviewList(String bWriter,@RequestParam(value="currentPage",
	defaultValue="1",required=false) int currentPage,HttpServletResponse response) throws JsonIOException, IOException {
		int listCount = mpService.getListCountReview(bWriter);
		
		PageInfo pi = Pagination.getPageInfo4(currentPage, listCount);
		
		ArrayList<Blog> list = mpService.selectReviewList(pi,bWriter);
		
		for(Blog b: list) {
			
			if(b.getbModifyFile() != null) {
				
				if(b.getbModifyFile().length() <= 18) {
					b.setbModifyFile("resources/buploadFiles/" + b.getbModifyFile());
				}else if(b.getbModifyFile().contains(",")){
					b.setbModifyFile("resources/buploadFiles/" + b.getbModifyFile().substring(0,b.getbModifyFile().indexOf(",")));
				}else {
					b.setbModifyFile(b.getbModifyFile().replace("amp;",""));
				}
			}
	}
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	@RequestMapping("myReview.do")
	public String myReview() {
		return "member/myReview"; 
}
}