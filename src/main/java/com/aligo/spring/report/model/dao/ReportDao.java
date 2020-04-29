package com.aligo.spring.report.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.report.model.vo.Report;
import com.aligo.spring.theme.model.vo.PageInfo;

@Repository("ReportDao")
public class ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectTotalInt(Map<String, String> map) {
		return sqlSession.selectOne("reportMappers.selectTotalInt", map);
	}

	public ArrayList<Report> selectTotalList(Map<String, String> map, PageInfo pi) {
		
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() -1) * pi.getThemeLimit()), pi.getThemeLimit());
		
		return (ArrayList)sqlSession.selectList("reportMappers.selectTotalList", map, rowBounds);
	}

	public Report reportDetail(String number) {
		
		return sqlSession.selectOne("reportMappers.reportDetail", number);
	}

	public Report reportContentEnsure(Map<String, String> map) {
		
		int num = sqlSession.update("reportMappers.reportContentEnsure", map);
		
		if(num >= 1) {
			String number = map.get("number");
			
			return sqlSession.selectOne("reportMappers.reportDetail", number);
		}
		
		return null;
	}
	
}
