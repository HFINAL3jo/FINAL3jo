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
	--간단한 공지-- 
	ALIGO에서 THEME_LIST 테이블에서 데이터를 가져와 구글 차트를 이용해서 처리 하고, 차트 검색과 데이터 검색에 따른 조건에 따라서 ajax처리를 이용해서 처리 
	여기서 기타 정보는 따로 'THEME_LIST' 테이블을 이용하지 못해 따로 jsp페이지를 만들어서 처리 하였다.
	차트는 구글 차트이고 데이터는 com.aligo.spring.statistics.controller.StatisticsController.java 에서 컨트롤러에 보내지고
	json형태로 보내져 input태그에 type ='hidden' 형태로 String 타입으로 저장 된다. 그래서 이를 다시 JSON.parse()을 이용해서 json형태로 만들어서
	사용 한다.
	showChart() : 구글 차트 처리 하는 함수
	
	drawShowChart() : 데이터 검색과 차트 검색 에 따른 결과(비동기 식으로) 처리하는 함수
	
	showTopList() : 데이터의 자료를 표에 나타내는 주는 함수
	
	statisticsButtonRegist.js : drawShowChart(), showTopList() 함수의 코드 등록
								
	statistics.js : showChart() 함수의 코드 등록
 								
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
	<!-- 내용 저장 위의 버튼(맨위의 조아요등 ) 클릭시 저장하는 값-->
	
	<!-- <input type="hidden" id="list" value=${list}> --><!-- StatisticController의 list 값을 가져온다. -->
	<!--<input type="hidden" id="reverTableData" value=${reverTableData} > --><!-- StatisticController의 역순 차트 값을 가져온다. -->

	<input type="hidden" id="jObj" value=${jObj} ><!-- StatisticController의 차트에 쓰일 JSON 값을 가져온다. -->
	<!-- 	<input type="hidden" id="JsonReverseList" value=${JsonReverseList} > --><!-- StatisticController의 차트에 쓰일  내림 차순 JSON 값을 가져온다. -->
	<input type="hidden" id="googleChart" value=${googleChart} >

	<input type="hidden" id="jObjArray" value=${jObjArray} >
	<input type="hidden" id="JsonReverseArray" value=${JsonReverseArray}>
	
	<input type="hidden" id="charDataShow" value=${charDataShow}>
	<input type="hidden" id="choose" value=${choose} ><!-- StatisticController의 조아요/조회수.키워트 중 하나에 대한 데이터를 값을 가져왔는 확인. -->
	<input type="hidden" id="chartValue" value=${chartValue} ><!-- StatisticController에서 어떤 차트를 섰는지 표시 가져온다. -->
	
	<%-- 	<c:set var ="listTest" value="${list}" />
			<c:set var ="jObjTest" value="${jObj}" />
	 --%>


	<!-- 통계를 보여주는 공간 -->
	<!-- 인포그램에서 도넛, 바, 파이, 그래프을 보여 줘야 되므로 조아요, 조회수, 검색 키워드 등 컬럼명 마다 ~~ -->
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
						<button onclick="drawShowChart()">변 경</button>
						<!-- 적용 차트 그리는 공간-->
						<div style="align-content: left;">
							<div id="chart"></div>
						</div>
					</div>

					<div class="div_right">
						<div style="height: 50px; padding-bottom: 5px;">
							<button class="mybtn2" id="btn1">Low list</button> &nbsp;&nbsp;
							<button class="mybtn2" id="btn2">TOP list</button> &nbsp;&nbsp;
						</div>
						<table style="border: 1px solid;">
							<thead>
								<tr>
									<th style="width: 30%">순 위</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<!-- showTopList()에 의해 변경 되는 통계 자료 표 -->
							<tbody id="chartDataTable">

							</tbody>
						</table>
					</div>
				</div>
			</div>

			
	</section>
	<%@ include file="../common/footer.jsp"%>

<!-- 버튼 상단 이벤트 및 ajax 코드 -->
<script src="resources/js/statisticsButtonRegist.js"></script>
<!-- showChart() 코드 -->
<script src="resources/js/statistics.js"></script>

<script>

// 구글 차트 모형
showChart();

// 데이터 검색과 차트 검색 에 따른 결과(비동기 식으로) 처리하는 함수
drawShowChart();

// id="chartDataTable" 를 가진 표를 데이터 검색에 따른 데이터 변경시 마다 변경
showTopList(1);


</script>
</body>
</html>




