package com.aligo.spring.blog.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;

@Repository("blDao")
public class BlogDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertImg(BFile bf) {
		return sqlSession.insert("blogMapper.insertImg",bf);
	}

	public int getBNum() {
		return sqlSession.selectOne("blogMapper.getBNum");
	}

	public int getBCount(BFile bf) {
		return sqlSession.selectOne("blogMapper.getBCount",bf);
	}

	public int updateImg(BFile bf) {
		return sqlSession.update("blogMapper.updateImg",bf);
	}
	
	public int checkFile(int bNum) {
		return sqlSession.selectOne("blogMapper.checkFile",bNum);
	}
	
	public int insertBlog(Blog b) {	
		return sqlSession.insert("blogMapper.insertBlog",b);
	}
}
