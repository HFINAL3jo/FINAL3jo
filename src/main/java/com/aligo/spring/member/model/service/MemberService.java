package com.aligo.spring.member.model.service;

import com.aligo.spring.member.model.vo.Member;

public interface MemberService {

	/**
	 * ▶ 회원가입 메소드
	 * @param m
	 * @return
	 */
	int insertMember(Member m);

	/**
	 * ▶ 이메일 중복체크 
	 * @param email
	 * @return
	 */
	int idCheck(String email);
	
	
	/**
	 * ▶ 이메일 인증관련
	 * @param m
	 */
	public void authentication(Member m);

	/**암호화 후 로그인
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);

	/** 비번찾기
	 * @param m
	 * @return
	 */
	
	int findPwdFin(Member m);
	 
	int nickCheck(String nickname);

	int deleteAccount(Member m);
	
	public int pwdUpdate(Member m) throws Exception;



	
}
