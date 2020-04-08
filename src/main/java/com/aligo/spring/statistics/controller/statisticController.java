package com.aligo.spring.statistics.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.statistics.model.service.statisticsService;
import com.aligo.spring.statistics.model.vo.statistics;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class statisticController {
	
	//
	@Autowired
	private statisticsService serviceStatics;
	// gson 테스트로 가라 데이터를 넣어 서 테스트

	// 자바스크립트로 보낼때 기본 값이 GET 으로 되어 있어 method=RequestMethod.GET를 설정 해야 된다.
	@RequestMapping(value="goodStatistic.do", method=RequestMethod.GET)
	public ModelAndView goodStatistic(ModelAndView mav, HttpServletResponse response) {
		
		System.out.println("goodStatistic.do 실행");
		
		ArrayList<statistics> list = serviceStatics.AllGoodStatistic();
		
		// list를 JSonArray로 담는다.
		JSONArray jArr = new JSONArray();
		for(statistics out : list) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("number", out.getNumber());
			jObj.put("tableName", out.getTableName());
			jObj.put("DoughtDate", out.getDoughtDate());
			jObj.put("DoughtColumnName", out.getTableName());
			jObj.put("DoughtColumnNumber", out.getDoughtColumnNumber());
			
			jArr.add(jObj);
		}
		
		mav.addObject("list", list);
		mav.addObject("jArr",  jArr);
		mav.addObject("bindto", "#pie"); // 어떤 차트(인포그램/통계)를 사용 할 것지 표시
		mav.setViewName("admin/statistics");
		return mav;
	}
}
