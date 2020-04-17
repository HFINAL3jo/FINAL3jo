<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="kor">
<head>

<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/margin.css">
<link rel="stylesheet" href="css/table.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<title>BlackList</title>

<style>
table {
	width: 100%;
	height: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	border-bottom: 1px solid #444444;
	text-align: center;
}

/* thead tr {
	background-color: #c9dff0;
	color: #ffffff;
}

tbody tr:nth-child(2n) {
	background-color: #D8E6E7;
} */
tr{
	color : #555;
}

tbody tr:nth-child(2n+1) {
	background-color: #EDECF0;
}

.div_left {
	/* 	width: 500px;
	float: left; */
	height: 500px;
	margin-bottom: 4%;
	background-color: snow;
	box-sizing: border-box;
}

.div_right {
	/* 	width: 400px; */
	height: 700px;
	/* 	float: right;  */
	margin-bottom: 10px;
	background-color: snow;
	box-sizing: border-box;
	padding: 0px;
	margin-left: 10px
}

.mybtn {
	color: #0067b8; 
	border:1px solid #0067b8; 
	background: white; 
    margin-right: 10px;
    margin-bottom: 0;
    width: 200px;
    height: 80px;
    font-size: 25px; 
}

.button_body_chart_div {
	margin-bottom: 1%;
	width: 99%;
	height: 12%;
}

.mybtn2 {
	color: #0067b8; 
	border:1px solid #0067b8; 
	background: white; 
    margin-right: 10px;
    margin-bottom: 1%;
	width: 23%;
    height: 100%;
    font-size: 25px; 
    float: right;
}

.button_body_chart {
	float: right;
	margin-left: 10px;
}

</style>

<!-- 
	c3가 기본으로 제공하는 디자인 형식인 c3.min.css 파일을 <head> 부분에 추가한다. 
	그리고 c3.js는 d3.js 기반에서 돌아가므로 d3.min.js를 먼저 자바스크립트 파트에 추가해 준 뒤에 c3.min.js를 추가하면 될 것이다. 
	CDN을 이용해서 간편하게 사용하겠다면 다음과 같이 추가하면 될 것이다.
 -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

<!-- d3.js -->
<!-- <link rel="stylesheet" href="css/d3.css"> -->
<script src="http://d3js.org/d3.v3.min.js" charset="UTF-8"></script>

<!-- google chart -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<input type="hidden" id="list" value=${list} ><!-- StatisticController의 list 값을 가져온다. -->
	<!--<input type="hidden" id="reverTableData" value=${reverTableData} > --><!-- StatisticController의 역순 차트 값을 가져온다. -->

	<input type="hidden" id="jObj" value=${jObj} ><!-- StatisticController의 차트에 쓰일 JSON 값을 가져온다. -->
	<!-- 	<input type="hidden" id="JsonReverseList" value=${JsonReverseList} > --><!-- StatisticController의 차트에 쓰일  내림 차순 JSON 값을 가져온다. -->
	<input type="hidden" id="googleChart" value=${googleChart} >

	<input type="hidden" id="jObjArray" value=${jObjArray} >
	<input type="hidden" id="JsonReverseArray" value=${JsonReverseArray}>
	
	<input type="hidden" id="charDataShow" value=${charDataShow}>
	<input type="hidden" id="choose" value=${choose} ><!-- StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 가져왔는 확인. -->
	<input type="hidden" id="chartValue" value=${chartValue} ><!-- StatisticController에서 어떤 차트를 섰는지 표시 가져온다. -->

	<section class="cat_product_area section_padding" style="">
		<div class="container" style="margin-bottom: 15px;">
			<div class="row" style="margin-left: 0px;">
				<%@ include file="assideAdmin.jsp"%>
				<div class="col-lg-10">
					<!--  조아요 / 조회수 / 검색 키워드 별 버튼으로 구현 -->
					<p style='font-size: 20px; padding-top: 20px;'>통계 자료</P>
					<br>
					<div class='row align-items-center latest_product_inner' style='padding-top: 10px; width: 100%; margin-left: 0; margin-bottom: 4%;'>
						<button class="mybtn" id="uPbtn1">좋아요</button>	
						<button class='mybtn' id='uPbtn2'>조회수</button>
						<button class='mybtn' id='uPbtn3'>검색 키워드</button>
						<button class='mybtn' id='uPbtn4'>기타 정보</button>
					</div>

					<div class="div_left">
						<div style="align-content: left;">
							<div id="chart1"></div>
						</div>
					</div>

					</div>
				</div>
			</div>
	</section>
	
	<%@ include file="../common/footer.jsp"%>

<!-- 버튼 상단 -->
<script src="resources/js/statisticsUpButton.js"></script>
<script>
//google 차트
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);

// 데이터 처리
function drawChart() {
	var data = [
		['성별', '값'],
		['남', 65],
		['여', 45]
	];					      
  
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
  var chart = new google.visualization.PieChart(document.getElementById('chart1'));
  chart.draw(new google.visualization.arrayToDataTable(data), options);				
}
</script>
</body>
</html>




