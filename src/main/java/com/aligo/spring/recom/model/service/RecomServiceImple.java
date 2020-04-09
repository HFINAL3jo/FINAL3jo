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

	@Override
	public Recommend selectRecomFirst() {

		return rDao.selectRecomFirst();
	}

	@Override
	public Recommend selectRecomNum(int recomNum) {

		return rDao.selectRecomNum(recomNum);
	}

	@Override
	public int deleteRecomQA(String recomCode) {

		return rDao.deleteRecomQA(recomCode);
	}

	@Override
	public String selectLastCode() {

		return rDao.selectLastCode();
	}

	@Override
	public int insertRecomQA(Recommend r) {

		return rDao.insertRecomQA(r);
	}
	
	

	
}
