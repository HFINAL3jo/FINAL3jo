package com.aligo.spring.member.model.service;

import java.util.ArrayList;

import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

public interface MyPageService {

	int getListCount();

	ArrayList<Theme> selectList(PageInfo pi);

}
