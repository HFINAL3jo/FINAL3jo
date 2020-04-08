package com.aligo.spring.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.main.model.dao.MainDao;
import com.aligo.spring.theme.model.vo.Theme;

@Service("mService")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mDao;
	
	@Override
	public ArrayList<Theme> selectTopList() {

		return mDao.selectTopList();
	}

	@Override
	public ArrayList<Theme> selectThemeList() {

		return mDao.selectThemeList();
	}

}
