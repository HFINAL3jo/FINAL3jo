package com.aligo.spring.member.model.service;

import java.util.ArrayList;

import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

public interface MyPageService {

	int getListCount(String mId);
	
	int getListCountReview(String bWriter);
	
	ArrayList<Theme> selectList(PageInfo pi, String mId);

	ArrayList<Blog> selectReviewList(PageInfo pi, String bWriter);
}
