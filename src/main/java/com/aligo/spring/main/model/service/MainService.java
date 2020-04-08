package com.aligo.spring.main.model.service;

import java.util.ArrayList;

import com.aligo.spring.theme.model.vo.Theme;

public interface MainService {

	/**
	 * 1. 메인페이지에서 좋아요 순 게시물 표시
	 * @return
	 */
	ArrayList<Theme> selectTopList();

	/**
	 * 2. 메인페이지에 테마별 게시물 표시
	 * @return
	 */
	ArrayList<Theme> selectThemeList();

}
