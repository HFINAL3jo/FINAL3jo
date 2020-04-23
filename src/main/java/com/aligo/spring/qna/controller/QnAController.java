package com.aligo.spring.qna.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.QnAPagination;
import com.aligo.spring.qna.model.service.QnAService;
import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class QnAController {

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
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) throws JsonIOException, IOException {
		//System.out.println(currentPage);
		
		
		int listCount = qService.getListCount();
		
		QnAPageInfo pi = QnAPagination.getQnAPageInfo(currentPage, listCount);
		
		ArrayList<QnA> list = qService.selectList(pi);
		
		Map hmap = new HashMap();
		hmap.put("list",list);
		hmap.put("pi",pi);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson().newBuilder().setDateFormat("yyyy.MM.dd hh:mm a").create();
		gson.toJson(hmap,response.getWriter());
	}
	
	@RequestMapping("qdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, int qId, 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		QnA q = qService.selectBoard(qId);
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
}
