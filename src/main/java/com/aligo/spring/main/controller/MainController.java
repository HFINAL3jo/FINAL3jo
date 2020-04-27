package com.aligo.spring.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.main.model.service.MainService;
import com.aligo.spring.theme.model.vo.Theme;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class MainController {
	
	@Autowired
	private MainService mService;
	
	@RequestMapping("topList.do")
	public void themeTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Theme> list = mService.selectTopList();
		System.out.println("mainController : " + list);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
		
	}
	
	@RequestMapping("themeList.do")
	public void themeList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Theme> list = mService.selectThemeList();
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("topListDetail.do")
	public ModelAndView topListDetail(@RequestParam("tId") String tId, ModelAndView mv) {
		
		Theme t = mService.selectTheme(tId);
		
		System.out.println(t);
		System.out.println(tId);
		
		if(t != null) {
			mv.addObject("t",t).setViewName("theme/themeDetailView");
		}else {
			mv.addObject("msg","게시글 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
}
