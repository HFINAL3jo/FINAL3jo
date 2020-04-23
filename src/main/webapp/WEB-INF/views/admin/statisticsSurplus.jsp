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
	height: 430px;
	margin-bottom: 1%;
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

.left-box {
  background: red;
  float: left;
}

</style>

<!-- 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
 -->
 
<!-- d3.js -->
<link rel="stylesheet" href="css/d3.css">
<script src="http://d3js.org/d3.v3.min.js" charset="UTF-8"></script>

<!-- google chart -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<input type="hidden" id="list_1" value=${list_1}>
	<input type="hidden" id="list_2" value=${list_2}>
	<input type="hidden" id="list_3" value=${list_3}>
	<input type="hidden" id="list_4" value=${list_4}>

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
						<div id="chart1" class='left-box'></div>
						<div id="chart2" class='left-box'></div>
					</div>
					<div style="height: 28px;">
						<span style="float: left; margin-left: 3%;">테마 &nbsp;<input type="search" list="chartTcl" id="Data1"></span>&nbsp;
						: <span id="value">NATURE</span> <button id="changeChart" onclick="DataChange()" style="float:right">값 을 변경 합니다.</button>
						<datalist id="chartTcl">
							<option value="T1">NATURE</option>
							<option value="T2">RESTAURANT</option>
							<option value="T3">HISTORY</option>
							<option value="T4">SHOPPING</option>
							<option value="T5">BAR</option>
							<option value="T6">ACTIVITY</option>
							<option value="T7">EXHIBITION</option>
						</datalist>
					</div>
					<div style="width: 800px;">
						<div id="chart3" style="width:60%; height:100%; float:left;"></div>
						<div id="chart8" style="width:40%; height:100%; float:left;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../common/footer.jsp"%>

<!-- 버튼 상단 -->
<script src="resources/js/statisticsUpButton.js"></script>
<script>
	graphSircle();
	//graphSircle2();
	graphSircle3();
	
	graphSircle8();
	
	document.getElementById('Data1').onchange = function(){
		var value = document.getElementById('Data1').value;
		
		var change = (value == 'T1')? "NATURE":
					(value == 'T2')? "RESTAURANT":
					(value == 'T3')? "HISTORY":
					(value == 'T4')? "SHOPPING":
					(value == 'T5')? "BAR":
					(value == 'T6')? "ACTIVITY":
					(value == 'T7')? "EXHIBITION":"XXXX";
		document.getElementById('value').innerHTML = change;
	}
	
	//DataChange();
</script>
</body>
</html>




