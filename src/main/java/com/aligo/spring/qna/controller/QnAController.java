package com.aligo.spring.qna.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.QnAPagination;
import com.aligo.spring.member.model.vo.Member;
import com.aligo.spring.qna.model.service.QnAService;
import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;
import com.aligo.spring.qna.model.vo.QnaReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class QnAController {

	// 특수문자 확인
	private static final String InjectionCheckSecurity2 = "[!@#$%^&*(),.?\":{}|<>]";
				
	@Autowired
	private QnAService qService;
	
	@RequestMapping("contactView.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage){
		
			mv.addObject("currentPage",currentPage);
			mv.setViewName("member/contactView");
		return mv;
	}
	
	@RequestMapping("contactListView.do")
	public void boardList1(
			HttpServletResponse response,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage
			,@RequestParam(value="nickname") String nickname) throws JsonIOException, IOException, ParseException {
		//System.out.println(currentPage);
		
		
		int listCount = qService.getListCount(nickname);
		
		QnAPageInfo pi = QnAPagination.getQnAPageInfo(currentPage, listCount);
		
		ArrayList<QnA> list = qService.selectList(nickname,pi);
		
		Map hmap = new HashMap();
		hmap.put("list",list);
		hmap.put("pi",pi);
		
		response.setContentType("application/json; charset=utf-8");
		//yyyy.MM.dd hh:mm a
		Gson gson = new Gson().newBuilder().setDateFormat("yyyy.MM.dd").create();
		gson.toJson(hmap,response.getWriter());
	}
	
	@RequestMapping("qdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, QnA q, 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		q = qService.selectBoard(q);
		if(q != null) {
			mv.addObject("q",q)
			  .addObject("currentPage",currentPage)
			  .setViewName("member/qnaDetailContactView");
		}else {
			mv.addObject("msg","상세조회 실패!")
			.setViewName("common/errorPage");
		}
		
		return mv;
	}

	@RequestMapping("qWrite.do")
	public String qnaWriteView() {
		return "member/qnaWriteForm";
	}	
	
	@RequestMapping("qinsert.do")
	public String writeBoard(QnA q, HttpServletRequest request) {

		int result = qService.writeBoard(q);
		if(result > 0) {
			return "redirect:contactView.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("qupView.do")
	public ModelAndView boardUpdateView(ModelAndView mv, String qId) {
		int qId1= Integer.parseInt(qId);
		mv.addObject("q",qService.selectUpdateBoard(qId1)).setViewName("member/qnaUpdateForm");
		return mv;	
	}
	
	/**
	 * 나중에 다시 
	 * @param q
	 * @param request
	 * @return
	 */
	@RequestMapping("qupdate.do")
	public String boardUpdate(QnA q, HttpServletRequest request) {
		int result = qService.updateBoard(q);
		
		if(result > 0) {
			return "redirect:contactView.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("qDelete.do")
	public String boardDelete(int qId,HttpServletRequest request) {
		QnA q = qService.selectUpdateBoard(qId);
		
		int result = qService.deleteBoard(qId);
		
		if(result > 0) {
			return "redirect:contactView.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("rList.do")
	public void getReplyList(HttpServletResponse response,int qId) throws JsonIOException, IOException {
		ArrayList<QnaReply> rList = qService.selectReplyList(qId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy.MM.dd").create();
		gson.toJson(rList,response.getWriter());
	}
	
	@RequestMapping("addReply.do")
	public ModelAndView addReply(ModelAndView mv, String rContent, int refQid, String rWriterNickname) {
		
		System.out.println(rContent + refQid + rWriterNickname);
		QnaReply qr = new QnaReply();
		qr.setrContent(rContent);
		qr.setRefQid(refQid);
		qr.setrWriter(rWriterNickname);
		
		int result = qService.insertReply(qr);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			
			mv.addObject("qId", refQid).setViewName("redirect:qdetail.do");
		}else {
			
			mv.addObject("msg", "fail!").setViewName("common/errorPage");
		}

		return mv;
	}
	
	// =================ADMIN 문의 사항==========================
	@RequestMapping(value = "goSearchQnaData.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String goSearchQnaData(HttpServletRequest request,HttpSession session) throws Exception {

		Map<String, String> map = new HashMap();
		String checkFail = "";
		for (int i = 1; i <= request.getParameterValues("value[]").length; i++) {
			
			System.out.println(request.getParameterValues("value[]")[i - 1]);
			if (Pattern.compile(InjectionCheckSecurity2).matcher(request.getParameterValues("value[]")[i - 1]).find()) {
				
				checkFail = "fail";
			}

			map.put("search" + i, request.getParameterValues("value[]")[i - 1]);
		}

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));

		QnAPageInfo pi = QnAPagination.getQnAPageInfo(currentPage, qService.getSearchQnaDataTotal(map));
		String nickname = ((Member)session.getAttribute("loginUser")).getnickname();
		
		ArrayList<QnA> list = null;
		if(nickname.equals("ADMIN")) {
			list = qService.getSearchQnaAdmin(map,pi);
		}else {
			list = qService.getSearchQnaData(map, pi);
		}

		Map qnaMap = new HashMap();
		qnaMap.put("list", list);
		qnaMap.put("pi", pi);
		qnaMap.put("checkFail", checkFail);
		
		Gson gson = new Gson().newBuilder().setDateFormat("yyyy.MM.dd").create();

		return gson.toJson(qnaMap);

	}

	@RequestMapping(value = "goErrorPage.do", method = RequestMethod.GET)
	public String goErrorPage(){
		return "common/errorPage";
	}
}
