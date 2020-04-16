package com.aligo.spring.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.member.model.dao.MypageDao;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MypageDao mpDao = new MypageDao();

	@Override
	public int getListCount() {
		return mpDao.getListCount();
	}

	@Override
	public ArrayList<Theme> selectList(PageInfo pi) {
		return mpDao.selectMyList(pi);
	}

}
