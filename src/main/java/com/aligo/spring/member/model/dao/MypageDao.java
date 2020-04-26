package com.aligo.spring.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	/*
	 * public int memberDelete(Member m) { return
	 * sqlSession.delete("memberMapper.deleteMember",m); }
	 */
	public int memberUpdate(Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

}
