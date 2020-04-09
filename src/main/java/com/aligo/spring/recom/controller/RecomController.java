package com.aligo.spring.recom.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
	
	
	/**
	 * 	유저에게 선택한 답에 맞는 THEME LIST 뿌려주는 Controller
	 * @param mv
	 * @param rk
	 * @return
	 */
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

	/**
	 * 	관리자 페이지 recommend 관리 클릭 시 정보 하나 뿌림
	 * @param mv
	 * @return
	 */
	@RequestMapping("recomAdminView.do")
	public ModelAndView recomAdminView(ModelAndView mv) {
		
		//	RQCODE 컬럼에서 가장 빠른 값 불러옴
		Recommend r = rService.selectRecomFirst();
		
		System.out.println(r);
		
		if(r != null) {
			mv.addObject("r", r).setViewName("admin/recomAdminView");
		}else {
			mv.addObject("msg", "추천 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * @param response
	 * @param recomNum
	 * @throws IOException 
	 * @throws JsonIOException 
	 */
	@ResponseBody
	@RequestMapping("rUpdateViewPi.do")
	public void recomUpdateViewPi(HttpServletResponse response, int recomNum) throws JsonIOException, IOException {
		
		//	RQCODE 컬럼에서 recomNum 번째 데이터를 가져옴
		Recommend r = rService.selectRecomNum(recomNum);

		if(r != null) {
			//	가져온 값을 GSON으로 보내기
			new Gson().toJson(r, response.getWriter());
		}
	}
	
	@RequestMapping("rUpdateQA.do")
	public void recomUpdateQA(HttpServletResponse response, Recommend r) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//	r.recomCode에 맞는 R_STATUS를 'N'으로 수정
		int result = rService.deleteRecomQA(r.getRecomCode());
		
		if(result == 1) {
			//	RQCODE 마지막 번호를 SELECT 해서 +1 하기
			String lastRQCode = rService.selectLastCode();

			String name = lastRQCode.substring(0,2);
			int code = Integer.parseInt(lastRQCode.substring(2)) + 1;
			
			String codeStr;
			
			if(code < 10) 
				codeStr = "00" + code;
			else if(code < 100) 
				codeStr = "0" + code;
			else
				codeStr = "" + code;
			
			
			String nextRQCode = name + codeStr;
			r.setRecomCode(nextRQCode);
			
			
			//	r input 하기
			result = rService.insertRecomQA(r);
			
			if(result>0) {
				out.print("RECOMMEND_Q 테이블 데이터 삭제 및 추가 완료");
			}else {
				out.print("RECOMMEND_Q 테이블 데이터 삭제 완료 \n 추가 실패");
			}
		}else {
			out.print("RECOMMEND_Q 테이블 데이터 삭제 및 추가 실패");
		}
		
		out.flush();
		out.close();
	}
	
}




























