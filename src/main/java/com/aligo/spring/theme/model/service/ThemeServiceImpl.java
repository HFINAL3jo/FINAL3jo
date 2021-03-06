package com.aligo.spring.theme.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.common.AligoException;
import com.aligo.spring.theme.model.dao.ThemeDao;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.TReply;
import com.aligo.spring.theme.model.vo.Theme;
import static com.aligo.spring.common.ThemeCommon.*;

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
	public int insertTheme(Theme t,int tNum) throws AligoException{
		
		 t = themeCode(t);
		
		int chk = tDao.checkFile(tNum);
		
		TFile tf = fileCheck(t,tNum,chk);
		
		if(chk == 0) tDao.insertImg(tf);
		return tDao.insertTheme(t);
	}

	@Override
	public Theme selectTheme(int tId) {
		return tDao.selectTheme(tId);
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
	public int updateCount(int tId) {
		return tDao.updateCount(tId);
	}

	@Override
	public int updateSearchKeywordCount(SearchCondition sc) {
		String findKeyword = tDao.findKeywordArea(sc);
		if(findKeyword != null) {
			return tDao.updateCountKwA(findKeyword);
		}else if(findKeyword == null) {
			findKeyword = tDao.findKeywordTheme(sc);
		}
		
		if(findKeyword != null) return tDao.updateCountKwT(findKeyword); else return 0;
	}

	@Override
	public int addTReply(TReply r) {
		return tDao.insertTReply(r);
	}

	@Override
	public ArrayList<TReply> selectTReplyList(int tId){ 
		return tDao.selectTReplyList(tId);
	}

	@Override
	public String getKeyword() {
		return tDao.getKeyword();
	}

	@Override
	public int updateTheme(Theme t) {
		t = themeCode(t);
		
		return tDao.updateTheme(t);
	}

	@Override
	public int updateLike(HashMap<String, String> map) {
		int result = 0;
		int chk = 0;
		int result2 = 0;
		if(map.get("lv").equals("1")) {
			result = tDao.updateLike(map);
		    chk = tDao.checkLike(map);
		    result2 = tDao.updateThemeLikeCount(map);
			if(chk == 1) { 
				return 0; 
			}else {
				int result3 = tDao.insertMyLike(map);
				return result+chk+result2+result3;
			}
		}else if(map.get("lv").equals("0")) {
			result = tDao.updateLike(map);
			result2 = tDao.updateThemeLikeCount(map);
			chk = tDao.deleteMyLike(map);
			chk--;
			return result+result2+chk;
		}
		return 0;
	}

	@Override
	public int likeStatus(HashMap<String, String> map) {
		return tDao.likeStatus(map);
	}

	@Override
	public int deleteTheme(int tId) {
		return tDao.deleteTheme(tId);
	}

	@Override
	public int deleteTReply(int trId) {
		return tDao.deleteTReply(trId);
	}

	@Override
	public int getRandomListCount(String recommend) {
		return tDao.getRandomListCount(recommend);
	}

	@Override
	public ArrayList<Theme> selectTkeywordList(PageInfo pi, String recommend) {
		return tDao.selectTkeywordList(pi,recommend);
	}

	@Override
	public ArrayList<Theme> selectSearchList(PageInfo pi, SearchCondition sc) {
		return tDao.selectSearchList(pi,sc);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		return tDao.getSearchListCount(sc);
	}
}
