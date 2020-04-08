package com.aligo.spring.theme.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int listCount = tService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Theme> list = tService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("theme/categoryList");
		return mv;
	}
	
	@RequestMapping("pagination.do")
	public void pagination(HttpServletResponse response,
		@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage)throws IOException {
			
		response.setContentType("application/json; charset=UTF-8");
	  
		int listCount = tService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
	
		ArrayList<Theme> list = tService.selectList(pi);
		JSONArray jArr = new JSONArray();
		
		for(Theme t: list) {
			JSONObject jobj = new JSONObject();
			jobj.put("tModifyFile","resources/tuploadFiles/"+t.gettModifyFile());
			jobj.put("tTitle", t.gettTitle());
			jobj.put("tName","#"+t.gettName());
			
			jArr.add(jobj);
		}
		
		PrintWriter out = response.getWriter();
		
		out.print(jArr);
		out.flush();
		out.close();
	}
	
	@RequestMapping("themeInsert.do")
	public String insertTheme(Theme t,HttpServletRequest request,
			@RequestParam(name="uploadFile",required=false) MultipartFile file) {
		
		
		if(file.getOriginalFilename().equals("")) {
			
			String renameFilename = saveFile(request, file);
			
			if(renameFilename != null) {
				t.settOriginalFile(file.getOriginalFilename());
				t.settModifyFile(renameFilename);
			}
		}
		
		int result = tService.insertTheme(t);
		
		if(result >0) return "redirect:theme.do"; else return "";
	}
	
	public String saveFile(HttpServletRequest request, MultipartFile file) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\tuploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		String originFilename = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFilename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
		+ originFilename.substring(originFilename.lastIndexOf(".")+1);

		String renamePath = folder + "\\" + renameFilename;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return renameFilename;
	}
}
