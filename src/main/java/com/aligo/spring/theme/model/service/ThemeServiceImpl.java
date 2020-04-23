package com.aligo.spring.theme.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.theme.model.dao.ThemeDao;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.TReply;
import com.aligo.spring.theme.model.vo.Theme;

@Service("tService")
public class ThemeServiceImpl implements ThemeService {
	
	@Autowired
	private ThemeDao tDao = new ThemeDao();
	
	@Override
	public int getListCount(SearchCondition sc) {
		return tDao.getListCount(sc);
	}

	@Override
	public ArrayList<Theme> selectList(PageInfo pi,SearchCondition sc) {
		return tDao.selectList(pi,sc);
	}

	@Override
	public int insertTheme(Theme t,int tNum) {
		
		switch(t.gettCode()) {
		case "NATURE":t.settCode("T1"); break;
		case "RESTAURANT":t.settCode("T2"); break;
		case "HISTORY":t.settCode("T3"); break;
		case "SHOPPIN":t.settCode("T4"); break;
		case "BAR":t.settCode("T5"); break;
		case "ACTIVITY":t.settCode("T6"); break;
		case "EXHIBITION":t.settCode("T7"); break;
		}
		
		int chk = tDao.checkFile(tNum);
		
		if(chk != 1) {
			String str = t.gettContent();
			str = str.substring(str.indexOf("src")+5,str.length()-str.indexOf("src")+5);
			str = str.substring(0,str.indexOf("\""));
			
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
		if(cl == 0) {
			return  cl = tDao.insertImg(tf);
		}else if(cl >= 1) {
			return cl = tDao.updateImg(tf);
		}
		return cl;
	}

	@Override
	public int getTNum() {
		return tDao.getTNum();
	}

	@Override
	public int updateCount(int bId) {
		return tDao.updateCount(bId);
	}

	@Override
	public int updateSearchKeywordCount(SearchCondition sc) {
		String findKeyword = tDao.findKeywordArea(sc);
		if(findKeyword == null) {
			findKeyword = tDao.findKeywordTheme(sc);
			if(findKeyword != null) {
				return tDao.updateCountKwT(findKeyword);
			}else {
				return 0;
			}
		}else {
			return tDao.updateCountKwA(findKeyword);
		}
	}

	@Override
	public int addTReply(TReply r) {
		return tDao.insertTReply(r);
	}

	@Override
	public ArrayList<TReply> slelctTReplyList(int tId){ 
		return tDao.selectTReplyList(tId);
	}

	@Override
	public String getKeyword() {
		return tDao.getKeyword();
	}
}
