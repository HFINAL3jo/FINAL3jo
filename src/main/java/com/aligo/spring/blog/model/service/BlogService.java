package com.aligo.spring.blog.model.service;

import java.util.ArrayList;

import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.common.AligoException;
import com.aligo.spring.theme.model.vo.PageInfo;

public interface BlogService {

	public int insertImg(BFile bf);
	
	int getBNum();

	public int insertBlog(Blog b, int bNum) throws AligoException;

	public int getListCount();

	public ArrayList<Blog> selectList(PageInfo pi);

	public void insertMyReview(Blog b);
	
}
