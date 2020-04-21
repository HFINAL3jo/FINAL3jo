package com.aligo.spring.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.aligo.spring.member.model.dao.MemberDao;
import com.aligo.spring.member.model.vo.Member;

@Service("memService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memDao;
    
	
	@Inject
	private JavaMailSender mailSender;


	@Override
	public int insertMember(Member m) {
		return memDao.insertMember(m);
	}

	@Override
	public int idCheck(String email) {
		return memDao.idCheck(email);
	}

	@Override
	public void authentication(Member m) {
        memDao.authentication(m);

	}

	@Override
	public Member loginMember(Member m) {
		/* return memDao.loginMember(m); */
		Member loginUser = memDao.loginMember(m);
		
		return loginUser;
	}

	@Override
	public int findPwdFin(Member m) {
		return memDao.findPwdFin(m);
	}

	
	
}
