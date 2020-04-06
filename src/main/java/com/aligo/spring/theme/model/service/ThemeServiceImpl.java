package com.aligo.spring.theme.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.theme.model.dao.ThemeDao;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Service("tService")
public class ThemeServiceImpl implements ThemeService {
	
	@Autowired
	private ThemeDao tDao = new ThemeDao();
	
	@Override
	public int getListCount() {
		return tDao.getListCount();
	}

	@Override
	public ArrayList<Theme> selectList(PageInfo pi) {
		return tDao.selectList(pi);
	}

}