package com.aligo.spring.blog.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.common.AligoException;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;

public interface BlogService {

	public int insertImg(BFile bf);
	
	int getBNum();

	public int insertBlog(Blog b, int bNum) throws AligoException;

	public int getListCount(SearchCondition sc);

	public ArrayList<Blog> selectList(PageInfo pi,SearchCondition sc);

	public void insertMyReview(Blog b);

	public Blog selectBlog(int bId);

	public int getSearchListCount(SearchCondition sc);

	public ArrayList<Blog> selectSearchList(PageInfo pi, SearchCondition sc);

	public BFile getFile(int bId);

	public int updateLike(HashMap<String, String> map);

	public int updateBlog(Blog b);

	public int deleteBlog(Blog b);
}
