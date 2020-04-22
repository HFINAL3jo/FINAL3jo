package com.aligo.spring.member.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.member.model.vo.Member;

@Repository("memDao")
public class MemberDao {
	

	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int idCheck(String email) {
		return sqlSession.selectOne("memberMapper.idCheck",email);
	}

	public int authentication(Member m) {
		return  sqlSession.insert("memberMapper.authentication", m);

	}

	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int findPwdFin(Member m) {
		return sqlSession.update("memberMapper.findPwdFin", m);
	}

	
	

}
