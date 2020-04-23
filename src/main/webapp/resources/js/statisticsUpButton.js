// 조아요
	document.getElementById('uPbtn1').onclick = function(){
		//console.log("실행");
		location.href="statistic.do?choose=T_LIKES";
	}		
	
	// 조회수
	document.getElementById('uPbtn2').onclick = function(){
		//console.log("실행");
		location.href="statistic.do?choose=T_VIEWS";
	}	
	
	// 검색 키워드
	document.getElementById('uPbtn2').onclick = function(){
		//console.log("실행");
		location.href="statistic.do?choose=SA_COUNT";
	}
	
	// 기타 정보
	document.getElementById('uPbtn4').onclick = function(){
		//console.log("실행");
		location.href="statisticSurplus.do?choose=Surplus";
	}
	
 function graphSircle(){
	//google 차트
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
									
	// 데이터 처리
	function drawChart() {
//		var data = [
//			['성별', '값'],
//			['남', 65],
//			['여', 45]
//		];		
		var jsonObject = JSON.parse(document.getElementById('list_1').value);
		
		var keyName = new Array();
		var data = new Array();
		
		keyName.push('성별');
		keyName.push('값');
		data.push(keyName);
		
		for(key in jsonObject){
			var value = new Array();;
			value.push(key);
			value.push(jsonObject[key]);
			
			data.push(value);
		}
						  
		var options = {
				title: '전체 회원 남여 비율',
				is3D: true,
				width: 420, 
				height: 390,
				margin: 0,
				animation:{
				duration: 1000,
				easing: 'out',
				}
			}
		var chart = new google.visualization.PieChart(document.getElementById('chart1'));
		chart.draw(new google.visualization.arrayToDataTable(data), options);
	}
}
 // =====================
 var charOption = {
	    	title: '',
	        width: 550,
	        height: 500,
	        padding: 50,
	        legend: { position: 'left', maxLines: 3 },
	        bar: { groupWidth: '75%' },
	        isStacked: true,
	     };
 function graphSircle3(){
		//google 차트
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
										
		// 데이터 처리
	function drawChart() {
//[
//	['Genre', 'Fantasy & Sci Fi', 'Romance', 'Mystery/Crime', 'General','Western', 'Literature', { role: 'annotation' } ],
//	['테바별(1차)', 10, 				24, 		20, 			32, 		18, 		5, 			''],];
			
			var jsonObject = JSON.parse(document.getElementById('list_2').value);
			
			var keyName = new Array();
			var value = new Array();
			var data = new Array();
		
			keyName.push('테 마');
			
			for(ss in jsonObject){
				keyName.push(ss);
			}
			
			value.push('값');
			for(ss in jsonObject){
				value.push(jsonObject[ss]);
			}
			
			data.push(keyName);
			data.push(value);
			
		    var chart = new google.visualization.ColumnChart(document.getElementById('chart3'));
			chart.draw(new google.visualization.arrayToDataTable(data), charOption);
		}
	}


 function graphSircle8(){
		//google 차트
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
										
		// 데이터 처리
	function drawChart() {
		// 1. 첫번째 열 : 수직 축, 2. 두번째 열 : 수평 축
//		[
//		     ['조아요', '조회수'],
//		     [1, 2],
//		     [7, 6],
//		     [6, 6],
//		     [7, 8],
//		     [1, 3],
//		     [5, 5],
//		     [6, 9],
//		     [4, 2],
//		];
		
		// 조아요
		var jsonObject1 = JSON.parse(document.getElementById('list_3').value);
		// 조회수
		var jsonObject2 = JSON.parse(document.getElementById('list_4').value);
		
		var keyName = new Array();
		var data = new Array();
		
		keyName.push('조아요');
		keyName.push('조회수');
		data.push(keyName);
		
		var likeMax = 0;
		var likeMin = 0;
		var T_viewsMax = 0;
		var T_viewsMin = 0;
		
		for(key in jsonObject1){
			var value = new Array();
			value.push((jsonObject1[key]*1));
			value.push((jsonObject2[key]*1));
			
			console.log("조아요" + (jsonObject1[key]*1));
			console.log("조회수" + (jsonObject2[key]*1));
			
			likeMax = (likeMax >= jsonObject1[key]*1)? likeMax : (jsonObject1[key]*1);
			likeMin = (likeMin < jsonObject1[key]*1)? (jsonObject1[key]*1):likeMin;
			
			T_viewsMax = (T_viewsMax >= jsonObject2[key]*1)? T_viewsMax : (jsonObject2[key]*1);
			T_viewsMin = (T_viewsMax < jsonObject2[key]*1)? (jsonObject2[key]*1):T_viewsMax;
			
			data.push(value);
		}
		      var options = {
		    	title: '테마별 분포 도표',
		        width: 450,
		        height: 500,
		        hAxis : {title : '조아요', minValue : likeMin, maxValue : likeMax},
		        vAxis : {title : '조회수', minValue : T_viewsMin, maxValue : T_viewsMax}
		     };
//		 console.log("likeMin : "+likeMin + ", likeMax : "+likeMax);     
//		 console.log("T_viewsMin : "+T_viewsMin+", T_viewsMax : "+T_viewsMax); 
		   var chart = new google.visualization.ScatterChart(document.getElementById('chart8'));
			chart.draw(new google.visualization.arrayToDataTable(data), options);
			//chart.draw(data, options);
		}
	}
			 
// ajax
 //xhr.open('POST','SurplusAjax.do');
 //xhr.send("value="+value);
 var s;
 var DataChange = function(){
	 
	 var value = document.getElementById('Data1').value;
	 if(value == ''){
		 alert('변경할 데이터를 선택 해주세요.');
		 return;
	 }
	 
	 // XMLHttpRequest을 이용해서 AJAX 작성 
	//var xhr = new XMLHttpRequest();
	var xhr;
	if (window.XMLHttpRequest) { // 모질라, 사파리, IE7+ ...
		xhr = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE 6 이하
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	 xhr.open('POST','SurplusAjax.do?value='+value);
	 xhr.send(null);
	 	
	 xhr.onreadystatechange = function() {
	       if (xhr.readyState === 4 && xhr.status === 200) {
	        	console.log('ok 전송 성공');
	            s = xhr.responseText;
	            
	            var obj = JSON.parse(s);
	            var obj1 = obj['JsonObject2'];
	            document.getElementById('list_2').value = JSON.stringify(obj['JsonObject2']);
	            
//	            var obj2 = obj['JsonObject3'];
	            document.getElementById('list_3').value = JSON.stringify(obj['JsonObject3']);
//	            var obj3 = obj['JsonObject4'];
	            document.getElementById('list_4').value = JSON.stringify(obj['JsonObject4']);
	            
	            graphSircle3();
	        	
	        	graphSircle8();
	        }else if (xhr.status === 500){			// 전송 오류
	            console.log('request2 Error: ' + xhr.status);
	        }
	    };
	 
 }
	
