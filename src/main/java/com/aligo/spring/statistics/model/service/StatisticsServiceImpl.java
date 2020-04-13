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


}
