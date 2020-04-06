package com.aligo.spring.recom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Keyword;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.recom.model.service.RecomService;
import com.aligo.spring.recom.model.vo.RecomKeyword;
import com.aligo.spring.recom.model.vo.Recommend;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class RecomController {

	@Autowired
	private RecomService rService;
	
	@ResponseBody
	@RequestMapping("rSelectQA.do")
	public void recomSelectQA(HttpServletResponse response) throws JsonIOException, IOException {
		
		//	DB에서 질문과 답 리스트 가져오기
		ArrayList<Recommend> rList = rService.selectRecommendQA();
		
		//	가져온 값을 GSON으로 보내기
		new Gson().toJson(rList, response.getWriter());
	}
	
	@RequestMapping("rResultList.do")
	public ModelAndView recomResultList(ModelAndView mv,
									RecomKeyword rk) {
		
		System.out.println("rk2 : " + rk);
		
		
		
		
		return null;
	}
	
	/**
	 * 	session 로그인 유저로 keyword 저장
	 * @param session
	 * @param rk
	 */
	@RequestMapping("rUserUpdate.do")
	public void recomUserUpdate(HttpSession session, RecomKeyword rk) {

		System.out.println("rk1 : " + rk);
		
	}
}




























