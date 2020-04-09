package com.aligo.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.member.model.dao.MemberDao2;
import com.aligo.spring.member.model.vo.Member;

@Service("memService2")
public class MemberServiceImpl2 implements MemberService2{

	@Autowired
	private MemberDao2 memDao2;
	
	@Override
	public Member loginMember(Member m) {

		return memDao2.loginMember(m);
	}

	
	
}
