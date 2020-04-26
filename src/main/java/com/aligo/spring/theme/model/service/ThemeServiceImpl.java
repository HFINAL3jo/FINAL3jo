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
		
//		switch(t.gettCode()) {
//		case "NATURE":t.settCode("T1"); break;
//		case "RESTAURANT":t.settCode("T2"); break;
//		case "HISTORY":t.settCode("T3"); break;
//		case "SHOPPING":t.settCode("T4"); break;
//		case "BAR":t.settCode("T5"); break;
//		case "ACTIVITY":t.settCode("T6"); break;
//		case "EXHIBITION":t.settCode("T7"); break;
//		}
		 t = themeCode(t);
		
		int chk = tDao.checkFile(tNum);
		
		TFile tf = fileCheck(t,tNum,chk);
		
//		if(chk == 0) {
//			
//			String str = t.gettContent();
//			try {
//			str = str.substring(str.indexOf("src")+5,str.length());
//			str = str.substring(0,str.indexOf("\""));
//			}catch(Exception e){
//				throw new AligoException("At least Need One Image");
//			}
//			t.settOriginalFile(str);
//			t.settModifyFile(str);
//			TFile tf = new TFile();
//			tf.settCodeNumber(tNum);
//			tf.settOriginalFile(str);
//			tf.settModifyFile(str);
//			int insertLink = tDao.insertImg(tf);
//		}
		
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
	public ArrayList<TReply> selectTReplyList(int tId){ 
		return tDao.selectTReplyList(tId);
	}

	@Override
	public String getKeyword() {
		return tDao.getKeyword();
	}

	@Override
	public int updateTheme(Theme t) {
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
	}
