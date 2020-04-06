package com.aligo.spring.recom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.recom.model.vo.Recommend;

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
	
	
}
