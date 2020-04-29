package com.aligo.spring.blog.model.service;

import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.common.AligoException;

public interface BlogService {

	public int insertImg(BFile bf);
	
	int getBNum();

	public int insertBlog(Blog b, int bNum) throws AligoException;
	
}
