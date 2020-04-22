package com.aligo.spring.statistics.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.statistics.model.dao.StatisticsDao;
import com.aligo.spring.statistics.model.vo.Statistics;

@Service("serviceStatics")
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsDao statisticsDao;
	
	@Override
	public ArrayList<Statistics> AllStatistic(Statistics temp) {
		// TODO Auto-generated method stub
		return statisticsDao.AllStatistic(temp);
	}

	@Override
	public ArrayList<Statistics> StatisticAjax(Statistics temp) {
		
		return statisticsDao.StatisticAjax(temp);
	}

	@Override
	public ArrayList<Statistics> SearchAreaSaCount(Statistics temp) {
		
		return statisticsDao.SearchAreaSaCount(temp);
	}

	@Override
	public ArrayList<Statistics> StatisticAjaxSaCount(Statistics temp) {
		return statisticsDao.StatisticAjaxSaCount(temp);
	}

	@Override
	public ArrayList<Statistics> list_1() {
		
		return statisticsDao.list_1();
	}

	@Override
	public ArrayList<Statistics> list_2(Statistics temp) {
		
		return statisticsDao.list_2(temp);
	}

	@Override
	public ArrayList<Statistics> list_3(Statistics temp) {
		
		return statisticsDao.list_3(temp);
	}


}
