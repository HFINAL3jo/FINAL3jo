package com.aligo.spring.recom.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.member.model.vo.Member;
import com.aligo.spring.recom.model.vo.Recommend;
import com.aligo.spring.recom.model.vo.ThemeVo;
import com.aligo.spring.theme.model.vo.PageInfo;

@Repository("rDao")
public class RecomDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 	1.	Recommend Q, A List를 Select 함
	 * @return
	 */
	public ArrayList<Recommend> selectRecommendQA() {
		
		return (ArrayList)sqlSession.selectList("recomMapper.selectQA");
	}

	public Recommend selectRecomFirst() {

		return (Recommend)sqlSession.selectOne("recomMapper.selectFirst");
	}

	public Recommend selectRecomNum(int recomNum) {

		return (Recommend)sqlSession.selectOne("recomMapper.selectNum", recomNum);
	}

	public int deleteRecomQA(String recomCode) {

		return sqlSession.update("recomMapper.deleteQA", recomCode);
	}

	public String selectLastCode() {

		return (String)sqlSession.selectOne("recomMapper.lastRQCODE");
	}

	public int insertRecomQA(Recommend r) {

		return sqlSession.insert("recomMapper.insertRQ", r);
	}

	public int rUserUpdate(Object m) {

		return sqlSession.update("recomMapper.updateUserRecom", (Member)m);
	}

	public ArrayList<ThemeVo> selectList(ThemeVo tv) {

		return (ArrayList)sqlSession.selectList("recomMapper.selectListTheme", tv);
	}

	public int getListCount(ThemeVo tv) {

		return sqlSession.selectOne("recomMapper.listCount", tv);
	}

	public ArrayList<ThemeVo> rResultMoreList(PageInfo pi, ThemeVo tv) {

		int offset = (pi.getCurrentPage() - 1) * pi.getThemeLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getThemeLimit());
		
		return (ArrayList)sqlSession.selectList("recomMapper.selectMoreList",tv,rowBounds);
	}
	
	
}
