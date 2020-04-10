//var check = document.getElementById('jObj').value;

// 콘솔 출력시에  "<c:out value='${jObj}' />" 로 나온다 즉 jstl이 파싱이 되지 않는다.
//var str = "<c:out value='${jObj}' />";
function showChart(){	
	
	var length = arguments.length;
	var chartValue = "";
	var str = "";
		
	if(length == 1){
		chartValue = document.getElementById('chartValue').value;
		str = arguments[0];
	}else if(length == 2){
		chartValue = arguments[0];
		chartValue = arguments[1];
	}
	
	str=str.replace(/&#034;/g, '\"');
	Data = JSON.parse(str);
//
	var chartDonut = c3.generate({
		bindto: "#chart",
		data: {
			json: [Data],
			keys: {
				value: Object.keys(Data),
			},
			type: chartValue
		},
		donut: {
			title: "파이의 종류",
		},
	});
	
// 차트 그리기 실행
	var chartDonutColors = chartDonut.data.colors();
	
	$("#text-apple").css("color", chartDonutColors["사과"]);
	$("#text-walnut").css("color", chartDonutColors["호두"]);
	$("#text-berry").css("color", chartDonutColors["블루베리"]);
	$("#text-cheese").css("color", chartDonutColors["치즈"]);
	$("#text-strawberry").css("color", chartDonutColors["딸기"]);
}


	