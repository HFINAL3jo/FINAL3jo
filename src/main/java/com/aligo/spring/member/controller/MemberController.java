package com.aligo.spring.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aligo.spring.member.model.service.MemberService;
import com.aligo.spring.member.model.vo.Member;



/*
 * 회원가입
 * → 아이디중복체크 -> 옆에 버튼만들어서 중복체크 중복이면 알럿으로 띄워주기?
 * → 이메일 형식 지키도록 (ex. www@dfad.net 안됨) -> 인풋창 아래 올바른 형식으로 입력해주세요. 띄우기
 * → 비밀번호 영문자+숫자 조합으로 -> 인풋창아래 영문자+숫자 조합으로 입력해주세요. 띄우기
 * → 비밀번호 일치체크 -> 입력하신 비밀번호와 일치/불일치 합니다. 띄우기
 * → 닉네임중복제크 -> 옆에 버튼만들어서 중복체크 중복이면 알럿으로 띄워주기?
 * → 회원가입나이제한(0~100)
 * → 취향선택 연결하기
 */
@Controller
public class MemberController {

	@Autowired
	private MemberService memService;


	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String insertMember(Member m) {

		int result = memService.insertMember(m);
		System.out.println(m);
		
		if(result >0) {
			return "redirect:index.jsp";
		} else {
			return "common/errorPage.jsp";
		}

	}
	
	
	/**
	 * @param email
	 * @return
	 * 이메일 중복관련
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String email) {
		
		int result = memService.idCheck(email);
		
		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}
		
	}


}
