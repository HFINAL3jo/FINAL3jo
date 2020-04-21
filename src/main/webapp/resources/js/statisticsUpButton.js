// 기타 정보 데이터 (d3js)처리

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
	    	title: 'ssss',
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
//		var data = google.visualization.arrayToDataTable([
//		        ['Genre', 'Fantasy & Sci Fi', 'Romance', 'Mystery/Crime', 'General',
//		         'Western', 'Literature', { role: 'annotation' } ],
//		        ['테바별(1차)', 10, 24, 20, 32, 18, 5, ''],
//		      ]);
			
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
//		var data = google.visualization.arrayToDataTable([
//		        ['조아요', '조회수'],
//		        [1, 2],
//		        [7, 6],
//		        [6, 6],
//		        [7, 8],
//		        [1, 3],
//		        [5, 5],
//		        [6, 9],
//		        [4, 2],
//		      ]);
		var jsonObject = JSON.parse(document.getElementById('list_3').value);
		var keyName = new Array();
		var data = new Array();
		
		keyName.push('조아요');
		keyName.push('조회수');
		data.push(keyName);
		
		for(key in jsonObject){
			var value = new Array();;
			value.push((key*1));
			value.push((jsonObject[key]*1));
			
			data.push(value);
		}
		      var options = {
		    	title: '테마별 분포 도표',
		        width: 450,
		        height: 500,
		        hAxis : {title : '조아요', minValue : 0, maxValue : 100},
		        vAxis : {title : '조회수', minValue : 0, maxValue : 100}
		     };
		      
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
	 var xhr = new XMLHttpRequest();
	 xhr.open('POST','SurplusAjax.do?value='+value);
	 xhr.send(null);
	 	
	 xhr.onreadystatechange = function() {
	       if (xhr.readyState === 4 && xhr.status === 200) {
	        	console.log('ok 전송 성공');
	            console.log(xhr.responseText);
	            console.log(typeof xhr.responseText);
	            s = xhr.responseText;
	            
	            
	        }else {
	            console.log('request2 Error: ' + xhr.status);
	        }
	    };
	 
 }
	
