package com.aligo.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.member.model.vo.Member;

@Repository("memDao2")
public class MemberDao2 {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {

		return (Member)sqlSession.selectOne("memberMapper.loginMember", m);
	}

	
}
