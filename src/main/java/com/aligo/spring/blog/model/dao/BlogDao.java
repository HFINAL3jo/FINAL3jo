package com.aligo.spring.blog.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;

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
	
	public int insertBlog(Blog b) {	
		return sqlSession.insert("blogMapper.insertBlog",b);
	}

	public int getListCount(SearchCondition sc) {
		return sqlSession.selectOne("blogMapper.getListCount",sc);
	}

	public ArrayList<Blog> selectList(PageInfo pi,SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getThemeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getThemeLimit());
		
		switch(sc.getSearchValue()) {
		case 2:return (ArrayList)sqlSession.selectList("blogMapper.selectList2",sc,rowBounds);
		case 3: return (ArrayList)sqlSession.selectList("blogMapper.selectList3",sc,rowBounds);
		default:return (ArrayList)sqlSession.selectList("blogMapper.selectList1",sc,rowBounds);
		}
	}

	public void insertMyReview(Blog b) {
		sqlSession.insert("blogMapper.insertMyReview",b);
	}

	public Blog selectBlog(int bId) {
		return sqlSession.selectOne("blogMapper.selectBlog",bId);
	}

	public int getSearchListCount(SearchCondition sc) {
		return sqlSession.selectOne("blogMapper.getSearchListCount",sc);
	}

	public ArrayList<Blog> selectSearchList(PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getThemeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getThemeLimit());
		return (ArrayList)sqlSession.selectList("blogMapper.selectSearchList",sc,rowBounds);	
	}

	public BFile getFile(int bId) {
		return sqlSession.selectOne("blogMapper.getFile",bId);
	}

	public void updateCount(int bId) {
		sqlSession.update("blogMapper.updateCount",bId);
	}

	public int updateLike(HashMap<String, String> map) {
		return sqlSession.update("blogMapper.updateLike",map);
	}

	public int updateBlog(Blog b) {
		return sqlSession.update("blogMapper.updateBlog",b);
	}
	
	public int deleteBlog(Blog b) {
		return sqlSession.update("blogMapper.deleteBlog",b);
	}
}
