package com.aligo.spring.member.model.service;

import com.aligo.spring.member.model.vo.Member;

public interface MemberService {

	/**
	 * ▶ 회원가입 메소드
	 * @param m
	 * @return
	 */
	int insertMember(Member m);

}
