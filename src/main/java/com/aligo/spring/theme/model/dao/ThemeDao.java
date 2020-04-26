package com.aligo.spring.theme.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.TReply;
import com.aligo.spring.theme.model.vo.Theme;

@Repository("tDao")
public class ThemeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(SearchCondition sc) {
		return sqlSession.selectOne("themeMapper.getListCount",sc);
	}

	public ArrayList<Theme> selectList(PageInfo pi,SearchCondition sc) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getThemeLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getThemeLimit());
		
		return (ArrayList)sqlSession.selectList("themeMapper.selectList",sc,rowBounds);
	}
	
	public int insertTheme(Theme t) {	
		return sqlSession.insert("themeMapper.insertTheme",t);
	}

	public Theme selectTheme(int bId) {
		return sqlSession.selectOne("themeMapper.selectTheme",bId);
	}

	public int insertImg(TFile tf) {
		return sqlSession.insert("themeMapper.insertImg",tf);
	}

	public int getTNum() {
		return sqlSession.selectOne("themeMapper.getTNum");
	}

	public int getTCount(TFile tf) {
		return sqlSession.selectOne("themeMapper.getTCount",tf);
	}

	public int updateImg(TFile tf) {
		return sqlSession.update("themeMapper.updateImg",tf);
	}

	public int checkFile(int tNum) {
		return sqlSession.selectOne("themeMapper.checkFile",tNum);
	}

	public int updateCount(int bId) {
		return sqlSession.update("themeMapper.updateViewCount",bId) +
			   sqlSession.update("themeMapper.updateTagCount",bId);
	}

	public String findKeywordArea(SearchCondition sc) {
		return sqlSession.selectOne("themeMapper.findKeywordArea",sc);
	}

	public String findKeywordTheme(SearchCondition sc) {
		return sqlSession.selectOne("themeMapper.findKeywordTheme",sc);
	}

	public int updateCountKwA(String key) {
		return sqlSession.update("themeMapper.updateCountKwA",key);
	}
	
	public int updateCountKwT(String key) {
		return sqlSession.update("themeMapper.updateCountKwT",key);
	}

	public int insertTReply(TReply r) {
		return sqlSession.insert("themeMapper.insertTReply",r);
	}

	public ArrayList<TReply> selectTReplyList(int tId) {
		return (ArrayList)sqlSession.selectList("themeMapper.selectTReplyList",tId);
	}

	public String getKeyword() {
		return sqlSession.selectOne("themeMapper.getKeyword");
	}

	public int updateTheme(Theme t) {
		return sqlSession.update("themeMapper.updateTheme",t);
	}

	public int updateLike(HashMap<String, String> map) {
		return sqlSession.update("themeMapper.updateLike",map);
	}

	public int insertMyLike(HashMap<String, String> map) {
		return sqlSession.insert("themeMapper.insertMyLike",map);
	}

	public int updateThemeLikeCount(HashMap<String, String> map) {
		return sqlSession.update("themeMapper.updateThemeLikeCount",map);
	}

	public int checkLike(HashMap<String, String> map) {
		return sqlSession.selectOne("themeMapper.checkLike",map);
	}

	public int likeStatus(HashMap<String, String> map) {
		return sqlSession.selectOne("themeMapper.selectStatus",map);
	}

	public int deleteMyLike(HashMap<String, String> map) {
		return sqlSession.delete("themeMapper.deleteMyLike",map);
	}
}
