package com.aligo.spring.statistics.model.service;

import java.util.ArrayList;

import com.aligo.spring.statistics.model.vo.Statistics;

public interface StatisticsService {

	/**
	 * 1. () 버튼 클릭시에 데이터를 가져온다.
	 * @return
	 */
	ArrayList<Statistics> AllStatistic(Statistics temp);

	/**
	 * 2.  조아요/조회수.키워트 통합 ajax사용
	 * @param choose : 		 조아요/조회수.키워트 중 어느 것인지 확인을 위한 파라미터
	 * @param charDataShow:	 주소(address) / 테마(themaName) 등 어디에 해당하는 데이터인지 확인 하고 db 접근하는 파라미터
	 * @param temp :		 위의 데이터를 객체에 담는다. (selectList 은 하나의 Object 컬럼 밖에 받지 못한다.)
	 * @return
	 */
	ArrayList<Statistics> StatisticAjax(Statistics temp);


}
