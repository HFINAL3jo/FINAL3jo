package com.aligo.spring.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.member.model.vo.Member;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.Theme;

@Repository("mpDao")
public class MypageDao {
	
	@Autowired SqlSessionTemplate sqlSession;

	public int getListCount(String mId) {
		return sqlSession.selectOne("myPageMapper.getMyListCount",mId);
	}

	public ArrayList<Theme> selectMyList(PageInfo pi,String mId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getThemeLimit();		
		RowBounds rowBounds = new RowBounds(offset,pi.getThemeLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMyList",mId,rowBounds);
	}

	public int getListCountReview(String bWriter) {
		return sqlSession.selectOne("myPageMapper.getListCountReview",bWriter);
	}

	public ArrayList<Blog> selectReviewList(PageInfo pi, String bWriter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPageLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPageLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.selectReviewList",bWriter,rowBounds);
	}

}