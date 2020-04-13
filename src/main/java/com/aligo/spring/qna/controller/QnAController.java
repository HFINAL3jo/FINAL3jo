package com.aligo.spring.qna.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.QnAPagination;
import com.aligo.spring.qna.model.service.QnAService;
import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class QnAController {

	@Autowired
	private QnAService qService;
	
	@RequestMapping("contactView.do")
	public void boardList(HttpServletResponse response,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		
		int listCount = qService.getListCount();
		
		QnAPageInfo pi = QnAPagination.getQnAPageInfo(currentPage, listCount);
		
		ArrayList<QnA> list = qService.selectList(pi);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("pi",pi);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map,response.getWriter());
	}
	
	
}
