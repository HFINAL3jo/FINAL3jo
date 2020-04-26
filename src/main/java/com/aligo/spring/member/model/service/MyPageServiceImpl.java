package com.aligo.spring.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.member.model.dao.MypageDao;
import com.aligo.spring.member.model.vo.Member;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MypageDao mpDao = new MypageDao();

	/**
	 * 좋아요 리스트 갯수 가져오기
	 */
	@Override
	public int getListCount(String mId) {
		return mpDao.getListCount(mId);
	}

	/**
	 *좋아요 리스트 가져오기
	 */
	@Override
	public ArrayList<Theme> selectList(PageInfo pi,String mId) {
		return mpDao.selectMyList(pi,mId);
	}

	/**
	 * 회원 탈퇴
	 */
	/*
	 * @Override public int memberDelete(Member m) { return mpDao.memberDelete(m); }
	 */
	@Override
	public int memberUpdate(Member m) {
		return mpDao.memberUpdate(m);
	}

}
