package com.aligo.spring.statistics.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.statistics.model.dao.StatisticsDao;

@Service("serviceStatics")
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsDao statisticsDao;
	
	@Override
	public ArrayList AllGoodStatistic() {
		
		return statisticsDao.AllGoodStatistic();
	}

}
