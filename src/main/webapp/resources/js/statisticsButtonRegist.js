/**
 *  통계 jsp에서 사용할 버튼을 등록하는 곳
 */

// 버튼 이벤트 등록
	
	// 조아요
	document.getElementById('uPbtn1').onclick = function(){
		//console.log("실행");
		location.href="goodStatistic.do?check=first";
	}		
	
	// 조회수
	document.getElementById('uPbtn2').onclick = function(){
		console.log("실행");
//		location.href="goodStatistic.do";
	}	
	
	
	
	//ChangeChart
//	document.getElementById('ChangeChart').onclick = function(){
//		console.log("ChangeChart");
//		var check1 = document.getElementById('whatChart').value;
//		var check2 = document.getElementById('whatData').value;
//		
//		if((check1 == "" || check1 == null) || (check2 == "" || check2 == null)){
//			alert("데이터 입력이 되지 않았습니다. 다시 입력 해주세요.");
//			return;
//		}
//		
//		// ajax 구현
//	}	
	
	