package com.aligo.spring.statistics.model.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.aligo.spring.statistics.model.vo.Statistics;

@Repository("statisticsDao")
public class StatisticsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;


	public ArrayList<Statistics> AllStatistic(Statistics temp) {
		
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.AllStatistic", temp);
	}

	public ArrayList<Statistics> StatisticAjax(Statistics temp) {
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.StatisticAjax", temp);
	}

	public ArrayList<Statistics> SearchAreaSaCount(Statistics temp) {
		
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.SearchAreaSaCount", temp);
	}

	public ArrayList<Statistics> StatisticAjaxSaCount(Statistics temp) {
		
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.StatisticAjaxSaCount", temp);
	}

	public ArrayList<Statistics> list_1() {
		
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.list_1");
	}

	public ArrayList<Statistics> list_2(Statistics temp) {
		
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.list_2", temp);
	}

	public ArrayList<Statistics> list_3(Statistics temp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("themeStatisticsMapper.list_3", temp);
	}


}
