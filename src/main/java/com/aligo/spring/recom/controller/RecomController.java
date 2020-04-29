package com.aligo.spring.recom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.Pagination;
import com.aligo.spring.member.model.vo.Member;
import com.aligo.spring.recom.model.service.RecomService;
import com.aligo.spring.recom.model.vo.RecomKeyword;
import com.aligo.spring.recom.model.vo.Recommend;
import com.aligo.spring.recom.model.vo.ThemeVo;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class RecomController {

	@Autowired
	private RecomService rService;
	
	@ResponseBody
	@RequestMapping("/rSelectQA.do")
	public void recomSelectQA(HttpServletResponse response) throws JsonIOException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
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
		
		ThemeVo tv = new ThemeVo();
		tv.setKeywords(rk);
		
		Map<Integer, ArrayList<ThemeVo>> map = new HashMap<Integer, ArrayList<ThemeVo>>();
		
		for(int i = 1; i < 8; i++) {
			
			String code = "T" + i;
			
			tv.setTcode(code);
			
			ArrayList<ThemeVo> list = rService.selectList(tv);

			for(int j = 0 ; j < list.size(); j++) {
				
				list.get(j).setKeywords(rk);
			}
			
			for(ThemeVo t: list) {
				
				if(t.getTfile().length() <= 18) {
					t.setTfile("resources/tuploadFiles/" + t.getTfile());
				}else if(t.getTfile().contains(",")){
					t.setTfile("resources/tuploadFiles/" + t.getTfile().substring(0,t.getTfile().indexOf(",")));
				}
			}
			
			map.put(i-1, list);
		}
		
		mv.addObject("map", map);
		mv.setViewName("recommend/recomResultList");
		return mv;
	}
	
	
	/**
	 * 	tcode와 rk를 가지고 THEME 리스트를 전송함
	 * @param session
	 * @param response
	 * @param tid
	 * @param rk
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("rResultMoreList.do")
	public void rResultMoreList(HttpSession session, HttpServletResponse response, String tcode, String rkStr) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		ThemeVo tv = new ThemeVo();
		tv.setTcode(tcode);
		
		String[] keywords = new String[5];
		
		String[] strArr1 = rkStr.split("=");
		for(int i = 1; i < strArr1.length; i++) {

			if(i != strArr1.length-1) {
				
				String str = strArr1[i].split(", ")[0];
				keywords[i-1] = str;
			}else {
				
				String str = strArr1[i].substring(0, strArr1[i].length()-1);
				keywords[i-1] = str;
			}
		}
		
		RecomKeyword rk = new RecomKeyword(keywords[0], keywords[1], keywords[2], keywords[3], keywords[4]);
		tv.setKeywords(rk);
		
		int listCount = rService.getListCount(tv);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo2(1, listCount);
		
		ArrayList<ThemeVo> list = rService.rResultMoreList(pi, tv);
		
		
		if(list == null || list.size() == 0) {
			
			//	넘길 값이 없음
			PrintWriter out = response.getWriter();
			out.print(false);
		}else {
			
			for(ThemeVo t: list) {
				
				if(t.getTfile().contains("amp;")) {
					
					t.setTfile(t.getTfile().replace("amp;", ""));
				}
			}
			new Gson().toJson(list, response.getWriter());
		}
	}
	
	/**
	 * 	rResultList 페이지네이션
	 * @param session
	 * @param response
	 * @param tcode
	 * @param rkStr
	 * @param currentPage
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("rPagination.do")
	public void rpagination(HttpSession session, HttpServletResponse response, String tcode, String rkStr,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		ThemeVo tv = new ThemeVo();
		tv.setTcode(tcode);
		
		String[] keywords = new String[5];
		
		String[] strArr1 = rkStr.split("=");
		for(int i = 1; i < strArr1.length; i++) {

			if(i != strArr1.length-1) {
				
				String str = strArr1[i].split(", ")[0];
				keywords[i-1] = str;
			}else {
				
				String str = strArr1[i].substring(0, strArr1[i].length()-1);
				keywords[i-1] = str;
			}
		}
		
		RecomKeyword rk = new RecomKeyword(keywords[0], keywords[1], keywords[2], keywords[3], keywords[4]);
		tv.setKeywords(rk);
		
		int listCount = rService.getListCount(tv);
		System.out.println("여기 : " + listCount);
		System.out.println("여기 : " + currentPage);
		
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		
		ArrayList<ThemeVo> list = rService.rResultMoreList(pi, tv);
		
		
		if(list == null || list.size() == 0) {
			
			//	넘길 값이 없음
			PrintWriter out = response.getWriter();
			out.print(false);
		}else {
			
			for(ThemeVo t: list) {
				
				if(t.getTfile().contains("amp;")) {
					
					t.setTfile(t.getTfile().replace("amp;", ""));
				}
			}
			
			new Gson().toJson(list, response.getWriter());
		}
	}
	
	
	/**
	 * 	session 로그인 유저로 keyword 저장
	 * @param session
	 * @param rk
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("rUserUpdate.do")
	public void recomUserUpdate(HttpSession session, HttpServletResponse response, RecomKeyword rk) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Member m = (Member)session.getAttribute("loginUser");

		String recomStr = rk.getKeyword1() + ", " + rk.getKeyword2() + ", "
						+ rk.getKeyword3() + ", " + rk.getKeyword4() + ", " + rk.getKeyword5();
		
		m.setrecommend(recomStr);
		
		int result = rService.rUserUpdate(m);
		
		if( result == 1 ) 
			out.print(true);		//	성공
		else 
			out.print(false);		//	실패

		out.flush();
		out.close();
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
		
		response.setContentType("text/html; charset=UTF-8");
		
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




























