package com.aligo.spring.statistics.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	public static int limit = 9; // 차트에 쓰일 자료의 갯수를 10개이하로 끝는다.
	//
	@Autowired
	private StatisticsService serviceStatics;

	// 자바스크립트로 보낼때 기본 값이 GET 으로 되어 있어 method=RequestMethod.GET를 설정 해야 된다.
	// 뷰에서 최 상단 버튼 조아요/조회수.키워트 중 하나를 클릭시에 작동하는 StatisticController
	@RequestMapping(value = "statistic.do", method = RequestMethod.GET)
	public ModelAndView goodStatistic(ModelAndView mav, HttpServletResponse response, HttpServletRequest request) {

		ArrayList<Statistics> list = null;
		ArrayList<Statistics> reverTableData = null; 			// 표에 보여줄 데이터를 가져온다.
		
		JSONObject jObj = null;
		JSONObject JsonReverseList = null;
		
		JSONArray jObjArray = null;
		JSONArray JsonReverseArray = null;
		
		String chartValue = "donut";							// 어떤 모양의 차트의 도표 그릴것지 선택 
		String choose = "";							 			// StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 뷰에 보여주는지 확인.
		String charDataShow  = "";						// 주소(address) / 테마(themaName) 등 어디에 해당하는 데이터인지 표시 , 기본값으로  address 표시
		
		String checkingParameter = request.getParameter("choose");
		Statistics temp = new Statistics();
		
		if (checkingParameter.equals("T_LIKES")) {
			
			choose="T_LIKES";
			charDataShow = "address";
			
			temp.setColumnTlikeName("T_LIKES");
			temp.setColumnTlikeValue(choose);

		}else if(checkingParameter.equals("T_VIEWS")) {
			choose="T_VIEWS";
			charDataShow = "address";
			
			temp.setColumnTlikeName("T_VIEWS");
			temp.setColumnTlikeValue(choose);
		}
		
		list = serviceStatics.AllStatistic(temp);
		
//		reverseSort(reverTableData = cut(limit, list), "address"); //(오름 차순)역순 정렬	
//		JsonReverseList = ConvertJson(reverTableData, "address");
		jObj = ConvertJson(cut(limit, list), charDataShow);
		
		jObjArray = ConvertJsonArray(cut(limit, list), charDataShow);
		reverseSort((reverTableData = cut(limit, list)), charDataShow);
		JsonReverseArray =   ConvertJsonArray(reverTableData, charDataShow);

		mav.addObject("list", list);
//		mav.addObject("reverTableData", reverTableData);
		
		mav.addObject("jObj", jObj);
		mav.addObject("JsonReverseList", JsonReverseList);
		
		mav.addObject("jObjArray", jObjArray);
		mav.addObject("JsonReverseArray", JsonReverseArray);//
		
		mav.addObject("chartValue", chartValue); 			// 어떤 차트(인포그램/통계)를 사용 할 것지 표시
		mav.addObject("choose", choose); 					// StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 뷰에 보여주는지 확인.
		mav.addObject("charDataShow", charDataShow);
		
		mav.setViewName("admin/statistics");
		return mav;
	}

	// ajax 	
	@RequestMapping(value="StatisticAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> StatisticAjax(HttpServletRequest request,  HttpServletResponse response, ModelAndView mav) {
				
		ArrayList<Statistics> list = null;
		ArrayList<Statistics> reverTableData = null; 			// 표에 보여줄 데이터를 가져온다.
		
		JSONObject jObj = null;
		JSONObject JsonReverseList = null;
		
		JSONArray jObjArray = null;
		JSONArray JsonReverseArray = null;
		
		String chartValue = request.getParameter("whatChart");	// 어떤 모양의 차트의 도표 그릴것지 선택 
		String choose = request.getParameter("choose");			// StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 뷰에 보여주는지 확인.
		String td  = request.getParameter("whatData");			// 주소(address) / 테마(themaName) 등 어디에 해당하는 데이터인지 표시 , 기본값으로  address 표시
		
		Statistics temp = new Statistics();
		
		if(choose.equals("T_LIKES")) {

			temp.setColumnTlikeName("T_LIKES");
			temp.setColumnTlikeValue(choose);
			
			if(td.equals("address")) {
				
				temp.setColumnAddressName("TADDRESS");
				list = serviceStatics.StatisticAjax(temp);
				
			}else if(td.equals("themaName")) {
				
				temp.setColumnTnameName("TNAME");
				list = serviceStatics.StatisticAjax(temp);
				
			}else {
				
			}
			
			
		}else if(choose.equals("T_VIEWS")) {
			
			temp.setColumnTlikeName("T_VIEWS");
			temp.setColumnTlikeValue(choose);
			
			if(td.equals("address")) {
				
				temp.setColumnAddressName("TADDRESS");
				list = serviceStatics.StatisticAjax(temp);
				
			}else if(td.equals("themaName")) {
				
				temp.setColumnTnameName("TNAME");
				list = serviceStatics.StatisticAjax(temp);
				
			}else {
				
			}
		}
		
		list = serviceStatics.StatisticAjax(temp);
		
		// 데이터가 잘 들어 왔는지 확인
		System.out.println(list);
		
		reverseSort(reverTableData = cut(limit, list),  td); //(오름 차순)역순 정렬	
		JsonReverseList = ConvertJson(reverTableData, td);
		jObj = ConvertJson(cut(limit, list),  td);
		
		jObjArray = ConvertJsonArray(cut(limit, list),  td);
		reverseSort((reverTableData = cut(limit, list)),  td);
		JsonReverseArray =   ConvertJsonArray(reverTableData, td);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		mav.addObject("list", list);
//		mav.addObject("reverTableData", reverTableData);
		
		map.put("jObj", jObj);
//		map.put("JsonReverseList", JsonReverseList);
		
		map.put("jObjArray", jObjArray);
		map.put("JsonReverseArray", JsonReverseArray);//
		
//		mav.addObject("chartValue", chartValue); 			// 어떤 차트(인포그램/통계)를 사용 할 것지 표시
//		mav.addObject("choose", choose); 					// StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 뷰에 보여주는지 확인.
//		mav.addObject("charDataShow", td);				// 주소(address) / 테마(themaName) 등 어디에 해당하는 데이터인지 표시 , 기본값으로  address 표시
		
//		mav.put("admin/statistics");
		
		return map;
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

	
	public JSONArray ConvertJsonArray(ArrayList<Statistics> list, String property) {

		JSONArray jArr = new JSONArray();
		if (property.equals("address")) {
			for (Statistics out : list) {
				JSONObject JsonData = new JSONObject();
				JsonData.put(out.getColumnAddressName().replaceAll(" ", ""), out.getColumnAddressNumber());
				jArr.add(JsonData);
			}
			return jArr;

		} else if (property.equals("themaName")) {
			for (Statistics out : list) {
				JSONObject JsonData = new JSONObject();
				JsonData.put(out.getColumnTnameName().replaceAll(" ", ""), out.getColumnTnameNumber());
				jArr.add(JsonData);
			}
			return jArr;
			
		}else {
			// 조건에 없을 시에 null 반환
			return null;
		}
	}
}
