package com.aligo.spring.theme.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.theme.model.dao.ThemeDao;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.TFile;
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

	@Override
	public int insertTheme(Theme t,TFile tf) {
		
		switch(t.gettCode()) {
		case "History":t.settCode("T1"); break;
		case "Food":t.settCode("T2"); break;
		case "Shopping":t.settCode("T3"); break;
		case "Fastival":t.settCode("T4"); break;
		case "Night View":t.settCode("T5"); break;
		case "Museum":t.settCode("T6"); break;
		case "Exotic":t.settCode("T7"); break;
		}
		return tDao.insertTheme(t,tf);
	}

	@Override
	public Theme selectTheme(int bId) {
		return tDao.selectTheme(bId);
	}
}
