package com.aligo.spring.theme.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.Theme;

@Repository("tDao")
public class ThemeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("themeMapper.getListCount");
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
}
