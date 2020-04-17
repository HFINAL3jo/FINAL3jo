//var check = document.getElementById('jObj').value;

// 콘솔 출력시에  "<c:out value='${jObj}' />" 로 나온다 즉 jstl이 파싱이 되지 않는다.
//var str = "<c:out value='${jObj}' />";

var showChart = function(){	
	
	//var chartValue = document.getElementById('chartValue').value;
	var str = document.getElementById('jObj').value;
	
	//----------구글 json 자동 x---------
	var strObject = document.getElementById('googleChart').value;
	var strA = strObject.replace(/&#034;/g, '\"');
	ss = JSON.parse(strA);
	//---------------------------------
	
	var chartValue = document.getElementById('chartValue').value;
//	str = arguments[0];
		
	str=str.replace(/&#034;/g, '\"');
	Data = JSON.parse(str);
// 	// c3.js
//	var chartDonut = c3.generate({
//		bindto: "#chart",
//		
//		size: {
//			  width: 600,
//			  height: 480
//		},	
//		data: {
//			json: [Data],
//			keys: {
//				value: Object.keys(Data),
//			},
//			type: chartValue
//		},
//		donut: {
//			title: "파이의 종류",
//		},
//	});
//	
// 	// 차트 그리기 실행
//	var chartDonutColors = chartDonut.data.colors();
	
	// google 차트
	 google.charts.load("current", {packages:["corechart"]});
     google.charts.setOnLoadCallback(drawChart);
     
     // 데이터 처리
     function drawChart() {
//       var data = google.visualization.arrayToDataTable();
       
       var keys = new Array();
       var Dd = new Array();
       
       keys.push("name");
       keys.push("value");

       Dd.push(keys);
       
       for(var key in Data){
    	   var value = new Array();
    	   value.push(key);
    	   value.push(Data[key])
    	   Dd.push(value);
       }
       
       var options;
       if(chartValue == 'donut' || chartValue == 'bar'){
    	  options = {
    		 title: 'My Daily Activities',
    		 is3D: true,
    		 width: '100%', 
    		 height: 460,
    		 animation:{
    		     duration: 1000,
    		     easing: 'out',
    		 }
    	  };
       }
       
       if(chartValue == 'donut'){
//    	   console.log('donut 실행')
//    	   console.log(Dd);
    	   var chart = new google.visualization.PieChart(document.getElementById('chart'));
    	   chart.draw(google.visualization.arrayToDataTable(Dd), options);
    	   
//    	   console.log('json 실행');
//    	   var chart = new google.visualization.PieChart(document.getElementById('chart'));
//    	   chart.draw(new google.visualization.DataTable(ss), options);
       }else if(chartValue == 'bar'){    	   
//    	   console.log('bar 실행')
    	   var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
    	   chart.draw(google.visualization.arrayToDataTable(Dd), options);
    	   
//    	   console.log('json 실행');
//    	   var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
//    	   chart.draw(new google.visualization.DataTable(ss), options);
       }
     }
}



//	// d3.js
/*	
	var svgWidth = 930; //window.getComputedStyle(document.getElementById('chart'), null).getPropertyValue('width');		// SVG 요소의 넓이●
	var svgHeight = 475; //window.getComputedStyle(document.getElementById('chart'), null).getPropertyValue('height');		// SVG 요소의 높이
	var offsetX = 40;		// X 좌표의 오프셋(어긋남의 정도)
	var offsetY = 30;		// Y 좌표의 오프셋(어긋남의 정도) = 
	var barElements;		// 막대그래프의 막대 요소를 저장할 변수
	
	// json 값 처리 (키/값 분류)=======================
	var dataSet = new Array();
	var labelName = new Array();
	for (var key in Data) {
		labelName.push(key)
		dataSet.push(Data[key]);
	}
	var max = dataSet.reduce(function(a, b) {
	    return Math.max(a, b);
	});
	console.log(labelName);
	console.log(dataSet);
	// ===========================================
	var dataMax = max;// 데이터의 최댓값
	console.log(max);
	var barWidth = 50;		// 막대의 넓이
	var barMargin = 30;		// 막대의 옆 간격	
	
	// 그래프 그리기
	barElements = d3.select("#chart")
			.selectAll('rect')
			.data(dataSet)
			
	// 데이터가 갱신 될때
		barElements.attr("height", function(d, i){
			return d*6;
		})	
		
	// 데이터 삭제시
	barElements.exit().remove()
			
	// 데이터 추가
	barElements.enter()	// 데이터 수만큼 반복
		.append("rect")	// 데이터 수만큼 rect 요소가 추가됨
		.attr("class", "bar")	// CSS 클래스 설정
		.attr("height", 0)
		.attr("width", barWidth)	// 넓이 지정●
		.attr("x", function(d, i){
			return i * (barWidth+barMargin)+offsetX;		// X 좌표를 표시 순서×25+offsetX로 함 ●
		})
	 	.attr("y", svgHeight -offsetY)									// 그래프 가장 아래에 좌표를 설정, svgHeight -offsetY
	 	// 이벤트 추가
	 	.on("mouseover", function(){
	 		d3.select(this).style("fill", "red")			// 막대의 칠하기 스타일을 빨간색으로 
	 	})
	 	.on("mouseout", function(){
	 		d3.select(this).style("fill", "orange");
	 	})
		// 애니메이션 처리 : 여기서부터 barElements.enter() 전 까지 추가한 곳
		.transition()
		.duration(1500)
		.delay(function(d, i){
			return i * 1000;
		})
		.attr("y", function(d, i){							// Y 좌표를 지정
			return svgHeight - d*6 -offsetY;				// Y 좌표를 계산	svgHeight - d -offsetY
		})
		.attr("height", function(d, i){
			return d*6;
		})
		barElements.enter()	// text 요소 지정
			.append("text")	// text 요소 추가
			.attr("class", "barNum")	// CSS 클래스 설정
			.attr("x", function(d, i){	// X 좌표를 지정
				return i * (barWidth+barMargin) + 10+offsetX;	// 막대그래프의 표시 간격을 맞춤●
			})
			.attr("y", svgHeight - 5-offsetY)	// Y 좌표를 지정
			.text(function(d, i){	// 데이터 표시
				return d;
			})
			
	// 눈금을 표시하기 위한 스케일 설정
	var yScale = d3.scale.linear()  // 스케일 설정
		.domain([0, dataMax])   // 원래 크기
		.range([dataMax*6, 0]) // 실체 출력 크기
	// 위의 것은 비율로 domain : range 형식으로 비율을 맞추는 것
		
	// 세로 방향의 눈금을 설정하고 표시
	d3.select("#chart")
		.append("g")
		.attr("class", "axis")
		.attr("transform", "translate("+offsetX+", "+((svgHeight-dataMax*6)-offsetY)+")")
		.call(
			d3.svg.axis()
			.scale(yScale)  //스케일 적용
			.orient("left") //눈금의 표시 위치를 왼쪽으로 지정
		)

	// 세로 방향의 선을 표시
	d3.select("#chart")
		.append("rect")
		.attr("class", "axis_x")
		.attr("width", svgWidth)
		.attr("height", 1)
		.attr("transform", "translate("+offsetX+", "+(svgHeight-offsetY)+")");
		
	// 막대의 레이블을 표시
	barElements.enter()
		.append("text")
		.attr("class", "barName")
		.attr("x", function(d, i){	// X 좌표를 지정
			return i * (barWidth+barMargin) + 10+offsetX;	// 막대그래프의 표시 간격을 맞춤
		})
		.attr("y", svgHeight-offsetY+15)
		.text(function(d, i){
			return labelName[i];	// 레이블 이름을 반환●
		})
	
	console.log(barElements)
	console.log(typeof barElements)
		
		
}*/
//var show = function(){	
//	//var length = arguments.length;
//	
//	console.log("d3.js");
//	
//	var chartValue = document.getElementById('chartValue').value;
//	var str = document.getElementById('jObj').value;
//	
//	chartValue = document.getElementById('chartValue').value;
//		
//	str=str.replace(/&#034;/g, '\"');
//	Data = JSON.parse(str);
//	
////	// d3.js
//	
//	// json 값 처리 (키/값 분류)=======================
//	var dataSet = new Array();
//	var labelName = new Array();
//	for (var key in Data) {
//		labelName.push(key)
//		dataSet.push(Data[key]);
//	}
//	var max = dataSet.reduce(function(a, b) {
//	    return Math.max(a, b);
//	});
//	console.log(labelName);
//	console.log(dataSet);
//	// ===========================================
//	var dataMax = max;// 데이터의 최댓값
//	
//	 //구글차트 
//    google.charts.load('current', {'packages':['corechart']}); 
//    google.charts.setOnLoadCallback(drawChart);
//    function drawChart() {
//        var data = new google.visualization.DataTable();
//        data.addColumn('string','지역');
//        data.addColumn('number','수');
//
//        data.addRows([ 
//        	
//            ['피자',5],
//            ['치킨',2],
//            ['햄버거',3]
//        ]);
//        var opt = {
//                'title':'좋아하는 음식',
//                'width':400,
//                'height':400,
//                pieSliceText:'label',
//                legend:'none' 
//        };
//        var chart = new google.visualization.PieChart(document.getElementById('chart'));
//        chart.draw(data,opt);
//    }

	
//}











	