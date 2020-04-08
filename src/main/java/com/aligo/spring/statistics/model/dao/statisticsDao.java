package com.aligo.spring.statistics.model.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.aligo.spring.statistics.model.vo.statistics;

@Repository("statisticsDao")
public class statisticsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList AllGoodStatistic() {
		// 
		// 데이터 처리 방법
		// 1. 방법 - sql 구문에서 select count(*)을 이용하여 처리 : 처리 속도 향상, 뷰에서 보일 자료가 적어진다.
		// 2. 방법 - select * 을 이용해서 자바에서 데이터 처리 : 뷰에서 보일 자료가 많아짐, 처리 속도 감소
		//return sqlSession.selectList("");
		
		// 테스트를 위해 데이터를 담을 것을 생성
		ArrayList<statistics> list = new ArrayList<statistics>();
		int number = 1;
		//
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String datestr = format.format(Calendar.getInstance().getTime());
		
		list.add(new statistics(number++, datestr, "블루베리", 666));
		list.add(new statistics(number++, datestr, "사과", 500));
		list.add(new statistics(number++, datestr, "호두", 200));
		list.add(new statistics(number++, datestr, "딸기", 120));
		list.add(new statistics(number++, datestr, "치즈", 54));
		
//		for(int i = 1; i<=5; i++) {
//			for(int j = 0; j<10; j++) {
//				if(i == 1) {					
//					list.add(new statistics(number++, datestr, "블루베리", 66));
//				}else if(i == 2) {
//					list.add(new statistics(number++, datestr, "사과", 50));
//				}else if(i == 3) {
//					list.add(new statistics(number++, datestr, "호두", 20));
//				}else if(i == 4){
//					list.add(new statistics(number++, datestr, "딸기", 12));
//				}else {
//					list.add(new statistics(number++, datestr, "치즈", 5));
//				}
//			}
//		}// end
		
		return list;
	}

}
