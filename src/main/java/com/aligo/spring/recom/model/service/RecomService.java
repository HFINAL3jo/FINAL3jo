package com.aligo.spring.recom.model.service;

import java.util.ArrayList;

import com.aligo.spring.recom.model.vo.Recommend;
import com.aligo.spring.recom.model.vo.ThemeVo;
import com.aligo.spring.theme.model.vo.PageInfo;

public interface RecomService {

	/**
	 * 	1.	Recommend 페이지 질문/답변 LIST를 가져오는 Service
	 * @return
	 */
	ArrayList<Recommend> selectRecommendQA();

	/**
	 * 	2.	Recommend_Q 테이블의 첫 번째 질문을 불러오는 Service
	 * @return
	 */
	Recommend selectRecomFirst();

	/**
	 * 	3.	Recommend_Q 테이블의 recomNum 번째 질문 select
	 * @param recomNum
	 * @return
	 */
	Recommend selectRecomNum(int recomNum);

	/**
	 * 	4.	Recommend_Q 테이블의 recomCode에 해당하는 데이터를 R_STATUS 'N'으로 변경
	 * @param recomCode
	 * @return
	 */
	int deleteRecomQA(String recomCode);

	/**
	 *  5.	RQCODE 마지막 번호를 SELECT
	 * @return
	 */
	String selectLastCode();

	/**
	 * 	6.	Recommend_Q 테이블 INSERT
	 * @param r
	 * @return
	 */
	int insertRecomQA(Recommend r);

	/**
	 * 	7.	Member 의 Recommend 컬럼 Update
	 * @param mid
	 * @param recomStr
	 * @return
	 */
	int rUserUpdate(Object m);

	/**
	 * 	8.	recom 조건에 맞는 리스트 SELECT
	 * @param tv
	 * @return
	 */
	ArrayList<ThemeVo> selectList(ThemeVo tv);

	/**
	 * 	9.	조건에 맞는 list 갯수 반환
	 * @param tv
	 * @return
	 */
	int getListCount(ThemeVo tv);

	/**
	 *  10.	THEME_LIST 테이블 select
	 * @param pi
	 * @param tv
	 * @return
	 */
	ArrayList<ThemeVo> rResultMoreList(PageInfo pi, ThemeVo tv);
	
}
