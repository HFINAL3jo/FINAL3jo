package com.aligo.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.member.model.dao.MemberDao;
import com.aligo.spring.member.model.vo.Member;

@Service("memService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memDao;

	@Override
	public int insertMember(Member m) {
		return memDao.insertMember(m);
	}
	
}
