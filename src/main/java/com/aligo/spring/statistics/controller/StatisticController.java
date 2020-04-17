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
		JSONObject googleChart = null;				// 구글 차트에서 쓰기 위한 것
		
		JSONArray jObjArray = null;
		JSONArray JsonReverseArray = null;
		
		String chartValue = "donut";					// 어떤 모양의 차트의 도표 그릴것지 선택 
		String choose = "";							 	// StatisticController의 조아요(T_LIKES)/조회수(T_VIEWS)/기타(Surplus)
														//키워트 중 하나에 대한 데이터를 값을 뷰에 보여주는지 확인.
		
		String charDataShow  = "address";				// 주소(address) / 테마(themaName) 등 어디에 해당하는 데이터인지 표시 , 
														//  검색 키워드는 ""(일단), 기본값으로  address 표시
		
		String checkingParameter = request.getParameter("choose");
		Statistics temp = new Statistics();
		
		if (checkingParameter.equals("T_LIKES")) {
			
			choose="T_LIKES";
			
			temp.setColumnTlikeName("T_LIKES");
			temp.setColumnTlikeValue(choose);

		}else if(checkingParameter.equals("T_VIEWS")) {
			
			choose="T_VIEWS";
			
			temp.setColumnTlikeName("T_VIEWS");
			temp.setColumnTlikeValue(choose);
			
		}else if(checkingParameter.equals("")) {//기타 정보
			
			
		}
		
		list = serviceStatics.AllStatistic(temp);
		
//		reverseSort(reverTableData = cut(limit, list), "address"); //(오름 차순)역순 정렬	
//		JsonReverseList = ConvertJson(reverTableData, "address");
		jObj = ConvertJson(cut(limit, list), charDataShow);
		
		jObjArray = ConvertJsonArray(cut(limit, list), charDataShow);
		reverseSort((reverTableData = cut(limit, list)), charDataShow);
		JsonReverseArray =   ConvertJsonArray(reverTableData, charDataShow);

//{"rows":[{"c":[{"v":"강남"},{"v":50}]},{"c":[{"v":"광장시장"},{"v":45}]},{"c":[{"v":"북한산"},{"v":45}]},{"c":[{"v":"부산"},{"v":40}]},{"c":[{"v":"명동"},{"v":40}]},{"c":[{"v":"불꽃놀이"},{"v":35}]},{"c":[{"v":"경희루"},{"v":35}]},{"c":[{"v":"동대문"},{"v":35}]},{"c":[{"v":"제주천지연폭포"},{"v":30}]},{"c":[{"v":"삼청동"},{"v":30}]},{"c":[{"v":"삼계탕"},{"v":25}]},{"c":[{"v":"이촌"},{"v":25}]},{"c":[{"v":"남산"},{"v":20}]}],"cols":[{"label":"장소","type":"string"},{"label":"조아요","type":"number"}]}		
		googleChart = GoogletJson(list, charDataShow);

		mav.addObject("list", list);
//		mav.addObject("reverTableData", reverTableData);
		
		mav.addObject("jObj", jObj);
		mav.addObject("JsonReverseList", JsonReverseList);
		mav.addObject("googleChart", googleChart);
		
		mav.addObject("jObjArray", jObjArray);
		mav.addObject("JsonReverseArray", JsonReverseArray);//
		
		mav.addObject("chartValue", chartValue); 			// 어떤 차트(인포그램/통계)를 사용 할 것지 표시
		mav.addObject("choose", choose); 					// StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 뷰에 보여주는지 확인.
		mav.addObject("charDataShow", charDataShow);
		
		mav.setViewName("admin/statistics");
		return mav;
	}

	// 기타 정보클릭시에 이동
	@RequestMapping(value="statisticSurplus.do", method=RequestMethod.GET)
	public ModelAndView statisticSurplus(ModelAndView mav) {
		
		// 가로 바 조아요/조회수 을 가지고 TKEYWORD 표시
		// 신고내역 처리수 비중등
		// TCODE 하위의 별 조아요/조회수의 TKEYWORD 'Stacked bar charts
		// 전체 가입자 중 남자/여자 비율
		
		ArrayList<Statistics> list = null;
		
		mav.setViewName("admin/statisticsSurplus");
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
		JSONObject googleChart = null;				// 구글 차트에서 쓰기 위한 것
		
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
		}else if(choose.equals("")) { // 검색 키워드
			
		}else if(choose.equals("")) { // 기타 정보 x
			
		}
		
		list = serviceStatics.StatisticAjax(temp);
		
		// 데이터가 잘 들어 왔는지 확인
		System.out.println(list);
		
		reverseSort(reverTableData = cut(limit, list),  td); //(오름 차순)역순 정렬	
		JsonReverseList = ConvertJson(reverTableData, td);
		jObj = ConvertJson(cut(limit, list),  td);
		googleChart = GoogletJson(list, td);
		
		jObjArray = ConvertJsonArray(cut(limit, list),  td);
		reverseSort((reverTableData = cut(limit, list)),  td);
		JsonReverseArray =   ConvertJsonArray(reverTableData, td);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		mav.addObject("list", list);
//		mav.addObject("reverTableData", reverTableData);
		map.put("googleChart", googleChart);
		
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
		
//		 //json의 칼럼 객체
//        JSONObject col1 = new JSONObject();
//        JSONObject col2 = new JSONObject();
//		
//        //리턴할 json 객체
//        JSONObject data = new JSONObject(); //{}
//        
//        //("필드이름","자료형") 
//        JSONArray title = new JSONArray();
//        col1.put("label","장소"); 
//        col1.put("type", "string");
//        col2.put("label", "조아요");
//        col2.put("type", "number");
//        
//        //테이블행에 컬럼 추가
//        title.add(col1);
//        title.add(col2);
//        
//        //json 객체에 타이틀행 추가
//        data.put("cols", title);//제이슨을 넘김 => {"cols" : [{"label" : "장소","type":"string"},{"label" : "조아요", "type" : "number"}]}
//        
//        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
		if (property.equals("address")) {
			for (Statistics out : list) {
				JSONObject JsonData = new JSONObject();
				JsonData.put(out.getColumnAddressName().replaceAll(" ", ""), out.getColumnAddressNumber());
				jArr.add(JsonData);
				
				// 구글에서 쓰는 json형태로 변환
//				JSONObject JsonLabel = new JSONObject();	//json오브젝트 객체를 생성
//				JsonLabel.put("v", out.getColumnAddressName().replaceAll(" ", "")); // JsonData변수에 out에 저장된 상품의 이름을 v라고 저장한다.
//			
//				JSONObject JsonValue = new JSONObject();	//json오브젝트 객체를 생성
//				JsonValue.put("v", out.getColumnAddressNumber());
//				
//				JSONArray row = new JSONArray(); //json 배열 객체 생성
//				row.add(JsonLabel);
//				row.add(JsonValue);
//				
//				 JSONObject cell = new JSONObject();
//				 cell.put("c", row);
//				 body.add(cell);
			}
//			data.put("rows", body);
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
	
	public JSONObject GoogletJson(ArrayList<Statistics> list, String property) {
		//json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
		
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //("필드이름","자료형") 
        JSONArray title = new JSONArray();
        col1.put("label","key"); 
        col1.put("type", "string");
        col2.put("label", "KeyValue");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김 => {"cols" : [{"label" : "장소","type":"string"},{"label" : "조아요", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
		if (property.equals("address")) {
			for (Statistics out : list) {
				
				// 구글에서 쓰는 json형태로 변환
				JSONObject JsonLabel = new JSONObject();	//json오브젝트 객체를 생성
				JsonLabel.put("v", out.getColumnAddressName().replaceAll(" ", "")); // JsonData변수에 out에 저장된 상품의 이름을 v라고 저장한다.
			
				JSONObject JsonValue = new JSONObject();	//json오브젝트 객체를 생성
				JsonValue.put("v", out.getColumnAddressNumber());
				
				JSONArray row = new JSONArray(); //json 배열 객체 생성
				row.add(JsonLabel);
				row.add(JsonValue);
				
				 JSONObject cell = new JSONObject();
				 cell.put("c", row);
				 body.add(cell);
			}
			
		}else if(property.equals("themaName")) {
			for (Statistics out : list) {
				
				// 구글에서 쓰는 json형태로 변환
				JSONObject JsonLabel = new JSONObject();	//json오브젝트 객체를 생성
				JsonLabel.put("v", out.getColumnTnameName().replaceAll(" ", "")); // JsonData변수에 out에 저장된 상품의 이름을 v라고 저장한다.
			
				JSONObject JsonValue = new JSONObject();	//json오브젝트 객체를 생성
				JsonValue.put("v", out.getColumnTnameNumber());
				
				JSONArray row = new JSONArray(); //json 배열 객체 생성
				row.add(JsonLabel);
				row.add(JsonValue);
				
				 JSONObject cell = new JSONObject();
				 cell.put("c", row);
				 body.add(cell);
			}
		}
		data.put("rows", body);
		
		return data;
	}
}
