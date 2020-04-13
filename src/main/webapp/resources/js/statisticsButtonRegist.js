/**
 *  통계 jsp에서 사용할 버튼을 등록하는 곳
 */

// 버튼 이벤트 등록
	
	// 조아요
	document.getElementById('uPbtn1').onclick = function(){
		//console.log("실행");
		location.href="goodStatistic.do?choose=good";
	}		
	
	// 조회수
	document.getElementById('uPbtn2').onclick = function(){
		console.log("실행");
//		location.href="goodStatistic.do";
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
	
	function drowingTable(){
		
	}
	