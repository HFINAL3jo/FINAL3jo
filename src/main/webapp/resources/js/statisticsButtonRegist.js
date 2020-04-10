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
		
	document.getElementById('btn1').onclick = function(){
		console.log("btn1 실행");
	}	
	
	document.getElementById('btn2').onclick = function(){
		console.log("btn2 실행");
	}	
	
	document.getElementById('btn3').onclick = function(){
		console.log("btn3 실행");
	}	
	
//
// 표를 그리는 이벤트 처리
	function showTopList(data){
		
	}
