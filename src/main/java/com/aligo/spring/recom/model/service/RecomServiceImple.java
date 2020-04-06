package com.aligo.spring.recom.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.recom.model.dao.RecomDao;
import com.aligo.spring.recom.model.vo.Recommend;

@Service("rService")
public class RecomServiceImple implements RecomService{

	@Autowired
	private RecomDao rDao = new RecomDao();
	
	@Override
	public ArrayList<Recommend> selectRecommendQA() {

		return rDao.selectRecommendQA();
	}

	
}
