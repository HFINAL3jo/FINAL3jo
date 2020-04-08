package com.aligo.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aligo.spring.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	SqlSessionTemplate sqlSession;

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	

}
