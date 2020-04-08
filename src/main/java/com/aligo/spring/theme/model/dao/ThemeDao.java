package com.aligo.spring.theme.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.Theme;

@Repository("tDao")
public class ThemeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("themeMapper.getListCount");
	}

	public ArrayList<Theme> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getThemeLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getThemeLimit());
		
		return (ArrayList)sqlSession.selectList("themeMapper.selectList",null,rowBounds);
	}

	public int insertTheme(Theme t,TFile tf) {
		int result1 = sqlSession.insert("themeMapper.insertTheme",t);
		int result2 = 0;
		if(result1>0) result2 = sqlSession.insert("themeMapper.insertThemeFiles",tf);
		
		return result1 + result2;
	}

	public Theme selectTheme(int bId) {
		return sqlSession.selectOne("themeMapper.selectTheme",bId);
	}
}
