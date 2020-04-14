package com.aligo.spring.theme.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.theme.model.dao.ThemeDao;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
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
	public ArrayList<Theme> selectList(PageInfo pi,SearchCondition sc) {
		return tDao.selectList(pi,sc);
	}

	@Override
	public int insertTheme(Theme t,int tNum) {
		
		switch(t.gettCode()) {
		case "History":t.settCode("T1"); break;
		case "Food":t.settCode("T2"); break;
		case "Shopping":t.settCode("T3"); break;
		case "Festival":t.settCode("T4"); break;
		case "Night View":t.settCode("T5"); break;
		case "Museum":t.settCode("T6"); break;
		case "Exotic":t.settCode("T7"); break;
		}
		
		int chk = tDao.checkFile(tNum);
		
		if(chk != 1) {
			String str = t.gettContent();
			System.out.println(str.length());
			str = str.substring(str.indexOf("src")+5,str.indexOf("alt")-2);
			System.out.println(str);
			System.out.println(str.length());
			t.settOriginalFile(str);
			t.settModifyFile(str);
			TFile tf = new TFile();
			tf.settCodeNumber(tNum);
			tf.settOriginalFile(str);
			tf.settModifyFile(str);
			int insertLink = tDao.insertImg(tf);
		}
		return tDao.insertTheme(t);
	}

	@Override
	public Theme selectTheme(int bId) {
		return tDao.selectTheme(bId);
	}

	@Override
	public int insertImg(TFile tf) {
		int cl = tDao.getTCount(tf);
		if(cl >= 1) return tDao.updateImg(tf); else return tDao.insertImg(tf);
	}

	@Override
	public int getTNum() {
		return tDao.getTNum();
	}

}
