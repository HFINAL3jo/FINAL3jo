package com.aligo.spring.statistics.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.statistics.model.dao.statisticsDao;

@Service("serviceStatics")
public class statisticsServiceImpl implements statisticsService {

	@Autowired
	private statisticsDao statisticsDao;
	
	@Override
	public ArrayList AllGoodStatistic() {
		
		return statisticsDao.AllGoodStatistic();
	}

}
