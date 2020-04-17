/**
 *  통계 jsp에서 사용할 버튼을 등록하는 곳
 */

// 버튼 이벤트 등록
	
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
//		location.href="statistic.do?choose=T_VIEWS";
	}
	
	// 오름 차순으로 테이블 형성
	document.getElementById('btn1').onclick = function(){
		console.log("btn1 실행");
		showTopList("1");
	}	
	
	document.getElementById('btn2').onclick = function(){
		console.log("btn2 실행");
		showTopList("2");
	}	
	
	document.getElementById('btn3').onclick = function(){
		console.log("btn3 실행");
		showTopList("3");
	}	
	
	//
	function showTopList(data){
		
		// Json을 이용하여 객체을 생성 할때 var를 쓰면 'undefined' 가 발생한다. 
		jObjArray = JSON.parse(document.getElementById('jObjArray').value);
		JsonReverseArray = JSON.parse(document.getElementById('JsonReverseArray').value);
		var str = "";
		var i = 1;
		
		// Low list 10
		if(data == "1"){
			
			for(var i = 0; i<JsonReverseArray.length; i++){
				str += "<tr><td>"+(i+1)+"</td>";
				str += "<td> "+Object.keys(JsonReverseArray[i]);+"</td>";
				str += "<td> "+JsonReverseArray[i][Object.keys(JsonReverseArray[i])]+"</td>";
			}
			
			document.getElementById('chartDataTable').innerHTML=str;
			
		}else if(data == "2"){
			
			for(var i = 0; i<jObjArray.length; i++){
				str += "<tr><td>"+(i+1)+"</td>";
				str += "<td> "+Object.keys(jObjArray[i]);+"</td>";
				str += "<td> "+jObjArray[i][Object.keys(jObjArray[i])]+"</td>";
			}
			
			document.getElementById('chartDataTable').innerHTML=str;
			
		}else if(data == "3"){
			
		}else{
			
		}
	}
	
// showChart()
var drawShowChart = function(){
	//var str = document.getElementById('jObj').value;
	
		
		var check1 = document.getElementById('whatChart').value;
		var check2 = document.getElementById('whatData').value;
		
		// 차트 검색을 하지 않았을 시에  true
		var ifCheck1 = (check1 == "" || check1 == null);
		// 데이터 검색을 하지 않았을 시에  true
		var ifCheck2 = (check2 == "" || check2 == null);
		

		if(ifCheck1 || ifCheck2){
			
			// 차트 검색을 선택한후에  데이터 검색을 ""로 놓았을시에 아무것도 실행 하지 않는다.
			if(ifCheck1 && ifCheck2){
				
				//alert("데이터 입력이 되지 않았습니다. 다시 입력 해주세요.");
				return;	
			}else if( (!ifCheck1) && ifCheck2){
				document.getElementById('chartValue').value = check1;
				showChart();
			}

		}else{
			
			// choose : StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 가져왔는 확인. 
			var choose = document.getElementById('choose').value;
			
			//  차트 검색 
			var whatChart = document.getElementById('whatChart').value;
			
			// 데이터 검색
			var whatData = document.getElementById('whatData').value;
				
			// ajax 구현
			$.ajax({
		    	url: "StatisticAjax.do",
		   		type: "post",
		    	dataType: "json",
		    	data: {"whatChart":whatChart, "whatData":whatData, "choose":choose},
		    	success: function(Source){
		    		console.log("전송 성공");
//		    		console.log(Source);
//		    		console.log(Source.jObj);
//		    		console.log(Source.jObjArray);
//		    		console.log(Source.JsonReverseArray);
//		    		console.log(Source.JsonReverseList);
		    		
// 객체로 바로 넘어 온것을 그대로 document.getElementById('jObj').value = Source.jObj; 쓰면  [object Object]식이 된다.
//		    		document.getElementById('jObj').value = Source.jObj;
//		    		document.getElementById('jObjArray').value = Source.jObjArray;
//		    		document.getElementById('JsonReverseArray').value = Source.JsonReverseArray;		  
//		    		console.log(document.getElementById('jObj').value);								[object Object]
//		    		console.log(document.getElementById('jObjArray').value);						[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]
//		    		console.log(document.getElementById('JsonReverseArray').value);					[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]
		    	
		    		document.getElementById('jObj').value = JSON.stringify(Source.jObj)
		    		document.getElementById('jObjArray').value = JSON.stringify(Source.jObjArray);
		    		document.getElementById('JsonReverseArray').value = JSON.stringify(Source.JsonReverseArray);
//		    		document.getElementById('JsonReverseList').value = JSON.stringify(Source.JsonReverseList);
		    		
//		    		console.log(document.getElementById('jObj').value);								
//		    		console.log(document.getElementById('jObjArray').value);						
//		    		console.log(document.getElementById('JsonReverseArray').value);	
//		    		console.log(document.getElementById('JsonReverseList').value);	
		    		document.getElementById('chartValue').value = check1
		    		
		    		showChart();
		    		showTopList("1");
		    	},
				error: function (){        
					console.log("전송 실패");
		    	}//end error

		  	}); // end $.ajax
 		
		} // end if	

}	// end function
	
	
	
	