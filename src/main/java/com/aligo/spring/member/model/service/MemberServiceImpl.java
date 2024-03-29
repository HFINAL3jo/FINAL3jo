package com.aligo.spring.member.model.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

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
	public int nickCheck(String nickname) {
		return memDao.nickCheck(nickname);
	}



	@Override
	public int pwdUpdate(Member m) throws Exception {
		return	memDao.pwdUpdate(m);
	}

	@Override
	public int deleteMember(Member m) throws Exception {
		return memDao.deleteMember(m);
	}

	// 패스워드 체크
	@Override
	public int passChk(Member m) throws Exception {
		int result = memDao.passChk(m);
		return result;
	}

	@Override
	public void findPwd(Member m) throws Exception {
		memDao.findPwd(m);
	}
	






	}

	

