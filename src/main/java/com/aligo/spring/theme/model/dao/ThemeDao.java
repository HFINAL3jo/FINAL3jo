package com.aligo.spring.theme.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tDao")
public class ThemeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
