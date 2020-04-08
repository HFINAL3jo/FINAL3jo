package com.aligo.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.member.model.dao.MemberDao;
import com.aligo.spring.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}
	

	
	

}
