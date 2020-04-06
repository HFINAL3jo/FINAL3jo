package com.aligo.spring.recom.model.service;

import java.util.ArrayList;

import com.aligo.spring.recom.model.vo.Recommend;

public interface RecomService {

	/**
	 * 	1.	Recommend 페이지 질문/답변 LIST를 가져오는 Service
	 * @return
	 */
	ArrayList<Recommend> selectRecommendQA();
}
