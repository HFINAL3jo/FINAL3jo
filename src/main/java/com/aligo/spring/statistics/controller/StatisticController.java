package com.aligo.spring.statistics.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.statistics.model.service.StatisticsService;
import com.aligo.spring.statistics.model.vo.Statistics;
import com.aligo.spring.theme.model.vo.Theme;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class StatisticController {

	//
	@Autowired
	private StatisticsService serviceStatics;

	// 자바스크립트로 보낼때 기본 값이 GET 으로 되어 있어 method=RequestMethod.GET를 설정 해야 된다.
	@RequestMapping(value = "goodStatistic.do", method = RequestMethod.GET)
	public ModelAndView goodStatistic(ModelAndView mav, HttpServletResponse response, HttpServletRequest request) {

		ArrayList<Statistics> list = null;
		ArrayList<Statistics> reversList = null;
		ArrayList<Statistics> reverTableData = null; 			// 표에 보여줄 데이터를 가져온다.
		JSONObject jObj = null;
		String chartValue = "";									// 어떤 모양의 차트의 도표 그릴것지 선택 
		//String tableChange = "";							 
		// 
		if (request.getParameter("first").equals("good") || request.getParameter("first") != null) {
			list = serviceStatics.AllGoodStatistic();
			
			int limit = 9;			// 차트에 쓰일 자료의 갯수를 10개이하로 끝는다.
			chartValue = "donut";	// 바에서 선택시 기본값으로 차트에 도표는 처음에는 donut 으로 지정.

			reverTableData = cut(limit, list);
			reverseSort(reverTableData, "address"); //(오름 차순)역순 정렬
			jObj = ConvertJson(cut(limit, list), "address");
		}

		// JSONObject에서 통계를 쓰기 위한 데이터 값만 받는다.

//		for (Statistics out : list) {
//			jObj.put(out.getColumnAddressName().replaceAll(" ", ""), out.getColumnAddressNumber());
//		}

		mav.addObject("list", list);
		mav.addObject("reverTableData", reverTableData);
		mav.addObject("jObj", jObj);
		mav.addObject("chartValue", "donut"); // 어떤 차트(인포그램/통계)를 사용 할 것지 표시
		mav.setViewName("admin/statistics");
		return mav;
	}

	/**
	 * 2. list를 json으로 형태의 문자열로 변환
	 * 
	 * @param list, property : address/themaName 으로 구분하여 변환하는 json 데이터를 다르게 처리
	 * @return
	 */
	public JSONObject ConvertJson(ArrayList<Statistics> list, String property) {

		JSONObject JsonData = new JSONObject();
		if (property.equals("address")) {

			for (Statistics out : list) {
				JsonData.put(out.getColumnAddressName().replaceAll(" ", ""), out.getColumnAddressNumber());
			}
			return JsonData;

		} else if (property.equals("themaName")) {

			for (Statistics out : list) {
				JsonData.put(out.getColumnTnameName().replaceAll(" ", ""), out.getColumnTnameNumber());
			}
			return JsonData;
		}else {
			// 조건에 없을 시에 null 반환
			return null;
		}
	}

	/**
	 * 3. 차트에 표시할 데이터를 위해 정한 갯수 만큼 list를 잘라 낸다.
	 * 
	 * @param limit
	 * @param list1
	 * @return
	 */
	public ArrayList<Statistics> cut(int limit, ArrayList<Statistics> list1) {

		ArrayList<Statistics> c = new ArrayList<Statistics>();

		for (int i = 0; i <= list1.size() - 1; i++) {
			if (i <= limit) {
				c.add(list1.get(i));
			} else {
				String name = "기 타";
				int num = 0;

				// limit 미만의 자료는 기타로 처리
				for (int j = i; j <= list1.size() - 1; j++) {
					num += list1.get(j).getColumnAddressNumber();
				}

				c.add(new Statistics());
				c.get(i).setColumnAddressName(name);
				c.get(i).setColumnAddressNumber(num);

				return c;
			}
		} // end for
		return c;
	}
	
	
	/**
	 * 1. property 에 따른 (오름 차순)역순 정렬
	 * @param list, property : address/themaName 으로 구분
	 * @param property
	 */
	public void reverseSort(ArrayList<Statistics> list, String property) {
		
		Collections.sort(list, new Comparator<Statistics>() {
            @Override
            public int compare(Statistics s1, Statistics s2) {
            	if(property.equals("address")) {
            		return (s1.getColumnAddressNumber() > s2.getColumnAddressNumber())? 1:(s1.getColumnAddressNumber() < s2.getColumnAddressNumber())? -1:0;   
            	}else if(property.equals("themaName")) {
            		return (s1.getColumnTnameNumber() > s2.getColumnTnameNumber() )? 1:(s1.getColumnTnameNumber()  < s2.getColumnTnameNumber() )? -1:0; 
            	}else {
            		 System.out.println("역 정렬할 property가 없습니다.");
            		 return 0;
            	}
            }
        });
	} //end reverseSort

}
