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

thead tr {
	background-color: #77AAAD;
	color: #ffffff;
}

tbody tr:nth-child(2n) {
	background-color: #D8E6E7;
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

.button_header {
	width: 20%;
	height: 110px;
	padding: 0px;
	margin: 5px;
	margin-left: 5px;
}

.button_body_chart_div {
	margin-bottom: 1%;
	width: 99%;
	height: 12%;
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

<!-- 버튼 상단 이벤트 처리 -->
<script src="resources/js/statistics.js"></script>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<!-- 내용 저장 위의 버튼(맨위의 조아요등 ) 클릭시 저장하는 값-->
	<!-- 리스트 형태로 html태그에 저장시 공백을 처리하지 않으면 값이 공백에서 끝어져 .vlaue; 시에 데이터가 끝어서 나온다. -->
	
	<input type="hidden" id="list" value=${list} ><!-- StatisticController의 list 값을 가져온다. -->
	<!--<input type="hidden" id="reverTableData" value=${reverTableData} > --><!-- StatisticController의 역순 차트 값을 가져온다. -->

	<input type="hidden" id="jObj" value=${jObj} ><!-- StatisticController의 차트에 쓰일 JSON 값을 가져온다. -->
	<!-- 	<input type="hidden" id="JsonReverseList" value=${JsonReverseList} > --><!-- StatisticController의 차트에 쓰일  내림 차순 JSON 값을 가져온다. -->

	<input type="hidden" id="jObjArray" value=${jObjArray} >
	<input type="hidden" id="JsonReverseArray" value=${JsonReverseArray}>
	
	<input type="hidden" id="charDataShow" value=${charDataShow}>
	<input type="hidden" id="choose" value=${choose} ><!-- StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 가져왔는 확인. -->
	<input type="hidden" id="chartValue" value=${chartValue} ><!-- StatisticController에서 어떤 차트를 섰는지 표시 가져온다. -->
	
<!--	<input type="hidden" id="tableValue" value="1"> 테이블의 형식(오름/내림/average)을 변경(기본 1: 내림차군, 2:오름 차순, 3:average)-->

	<%-- 	<c:set var ="listTest" value="${list}" />
	<c:set var ="jObjTest" value="${jObj}" />
	
	<input type="hidden" id="clist" value=${list} >
	<input type="hidden" id="cjObj" value=${jObj} > --%>


	<!-- 통계를 보여주는 공간 -->
	<!-- 인포그램에서 도넛, 바, 파이, 그래프을 보여 줘야 되므로 조아요, 조회수, 검색 키워드 등 컬럼명 마다 ~~ -->
	<section class="cat_product_area section_padding" style="">
		<div class="container" style="margin-bottom: 15px;">
			<div class="row" style="margin-left: 0px;">
				<%@ include file="assideAdmin.jsp"%>

				<div class="col-lg-10">
					<!--  조아요 / 조회수 / 검색 키워드 별 버튼으로 구현 -->
					<p style='font-size: 20px; padding-top: 20px;'>간단한 통계 자료</P>
					<br>
					<div class='row align-items-center latest_product_inner'
						style='padding-top: 10px; width: 100%; margin-left: 8%; margin-bottom: 4%;'>
						<button class='genric-btn success-border e-large button_header'
							id='uPbtn1'>
							<p class='showLetter'>조아요</p>
						</button>
						<button class='genric-btn success-border e-large button_header'
							id='uPbtn2'>
							<p class='showLetter'>조회수</p>
						</button>
						<button class='genric-btn success-border e-large button_header'
							id='uPbtn3'>
							<p class='showLetter'>검색 키워드</p>
						</button>
						<button class='genric-btn success-border e-large button_header'
							id='uPbtn4'>Large</button>
					</div>

					<div class="div_left">

						<span style="float: left;">차트 검색 &nbsp;<input type="search"
							list="tcl" id="whatChart"></span>
						<datalist id="tcl">
							<option value="donut">Doughut Chart</option>
							<option value="pie">Pie Chart</option>
							<option value="bar">Bar Chart</option>
						</datalist>
						&nbsp;&nbsp;&nbsp;
						<!--  -->
						<span style="float: left; margin-left: 5%;">데이터 검색 &nbsp;<input
							type="search" list="chartTcl" id="whatData"></span>
						<datalist id="chartTcl">
							<option value="address">주 소</option>
							<option value="themaName">테 마</option>
						</datalist>
						&nbsp;&nbsp;&nbsp;
						<button id="ChangeChart" onclick="drawShowChart()">변 경</button>
						<!-- c3.js 적용 차트 그리는 공간-->
						<div id="chart"></div>
					</div>

					<div class="div_right">
						<!-- c3.js 예제 1 -->
						<!--  <div id="linechart"></div> -->
						<div style="height: 50px; padding-bottom: 5px;">
							<button class="genric-btn success large button_body_chart"
								id="btn1">Low list 10</button>
							&nbsp;&nbsp;
							<button class="genric-btn success large button_body_chart"
								id="btn2">TOP list 10</button>
							&nbsp;&nbsp;
							<button class="genric-btn success large button_body_chart"
								id="btn3">Average</button>
							&nbsp;&nbsp;
						</div>
						<table style="border: 1px solid;">
							<thead>
								<tr>
									<th style="width: 30%">순 위</th>
									<th>HELLO</th>
								</tr>
							</thead>
							<tbody id="chartDataTable">
								<c:set var="count" value="1" />
								<c:forEach var="s" items="${list}">
									<tr>
										<td>${count}</td>
										<td>${s.columnAddressName}</td>
										<td>${s.columnAddressNumber}</td>
										<c:set var="count" value="${count+1}" />
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 게시판, 통계 자료 페이징 처리한 게시판 -->
	</section>
	<%@ include file="../common/footer.jsp"%>

<!-- 버튼 상단 -->
<script src="resources/js/statisticsButtonRegist.js"></script>
<script>
//var str = "<c:out value='${jObj}' />";
/* window.onload = function(){
	
	// 왼쪽 바를 선택헤서 들어오면 무조건 여기서 부터 값을 가져 오게 한다.
	if(!document.referrer.includes("goodStatistic.do")){
		location.href="goodStatistic.do?first=T_LIKES";
	}
	// 콘솔 출력시에  "<c:out value='${jObj}' />" 로 나온다 즉 jstl이 파싱이 되지 않는다.
	// var str = "<c:out value='${jObj}'/>";	
} */

showChart();

// 차트를 뷰에서 띄우기 위한 차트 모형 || 데이터 검색 메소드
drawShowChart();

</script>
</body>
</html>




