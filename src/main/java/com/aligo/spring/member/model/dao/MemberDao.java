package com.aligo.spring.member.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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



	public int nickCheck(String nickname) {
		return sqlSession.selectOne("memberMapper.nickCheck",nickname);
	}


	public int pwdUpdate(Member m) {
		return sqlSession.update("memberMapper.pwdUpdate",m);
	}

	
	// 비밀번호 변경
		@Transactional
		public int findPwd(Member m) throws Exception{
			return sqlSession.update("memberMapper.findPwd", m);
		}

		public int deleteMember(Member m) {
			return sqlSession.update("memberMapper.deteleMember",m);
		}

		public int passChk(Member m) {
			int result = sqlSession.selectOne("memberMapper.passChk", m);
			return result;

		}


}
