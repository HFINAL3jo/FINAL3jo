package com.aligo.spring.theme.model.service;

import java.util.ArrayList;

import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

public interface ThemeService {
	
	/** 
	 * 게시판 갯수 조회
	 * @return
	 */
	int getListCount();
	
	/**
	 * 게시판 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Theme> selectList(PageInfo pi);

	/**
	 * 테마글 작성
	 * @param t
	 * @return
	 */
	int insertTheme(Theme t);
	
}