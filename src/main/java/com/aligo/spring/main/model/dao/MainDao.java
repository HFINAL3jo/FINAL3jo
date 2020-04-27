package com.aligo.spring.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.theme.model.vo.Theme;

@Repository("mDao")
public class MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Theme> selectTopList() {
		
		return (ArrayList)sqlSession.selectList("mainMapper.selectTopList");
	}

	public ArrayList<Theme> selectThemeList() {

		return (ArrayList)sqlSession.selectList("mainMapper.selectThemeList");
	}

	public Theme selectTheme(String tId) {

		return (Theme)sqlSession.selectOne("mainMapper.selectTheme", tId);
	}

}
