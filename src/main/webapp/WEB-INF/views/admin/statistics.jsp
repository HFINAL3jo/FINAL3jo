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

.button_body_chart_div{
	margin-bottom: 1%;
    width: 99%;
    height: 12%;
}

.button_body_chart {
	float: right;
	margin-left: 10px;
}
</style>

<!-- c3.js 차트 사용 하기위한 스크립트 -->

<!-- 
	c3가 기본으로 제공하는 디자인 형식인 c3.min.css 파일을 <head> 부분에 추가한다. 
	그리고 c3.js는 d3.js 기반에서 돌아가므로 d3.min.js를 먼저 자바스크립트 파트에 추가해 준 뒤에 c3.min.js를 추가하면 될 것이다. 
	CDN을 이용해서 간편하게 사용하겠다면 다음과 같이 추가하면 될 것이다.
 -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

</head>
<body style="">
	<%@ include file="../common/menubar.jsp"%>

	<!-- 먼저 조아요. 내용 저장 -->
	<input type="hidden" id="list" value="${list}"/>
	<input type="hidden" id="bindto" value="${bindto}"/>
	<input type="hidden" id="jArr" value="${jArr}"/>

	<!-- 통계를 보여주는 공간 -->
	<!-- 인포그램에서 도넛, 바, 파이, 그래프을 보여 줘야 되므로 조아요, 조회수, 검색 키워드 등 컬럼명 마다 ~~ -->
	<section class="cat_product_area section_padding" style="">
		<div class="container" style="margin-bottom: 15px;">
			<div class="row" style="margin-left: 0px;">
				<%@ include file="assideAdmin.jsp" %>
				<!-- <button>원 차트 보기</button> 은  -->
			<div class="col-lg-10">
				<!--  조아요 / 조회수 / 검색 키워드 별 버튼으로 구현 -->
				<p style='font-size:20px; padding-top: 20px;'>간단한 통계 자료</P><br>
				<div class='row align-items-center latest_product_inner' style='padding-top: 10px; width: 100%; margin-left: 8%; margin-bottom: 4%;'>
					<button class='genric-btn success-border e-large button_header' id='uPbtn1'> <p class='showLetter'>조아요</p></button>
					<button class='genric-btn success-border e-large button_header' id='uPbtn2'> <p class='showLetter'>조회수</p></button>
					<button class='genric-btn success-border e-large button_header' id='uPbtn3'> <p class='showLetter'>검색 키워드</p></button>
					<button class='genric-btn success-border e-large button_header' id='uPbtn4'> Large </button>
				</div>
				
				<div class="div_left">
					<div class="button_body_chart_div">
						<button class="genric-btn success large button_body_chart">Doughut Chart</button>
						&nbsp;&nbsp;
						<button class="genric-btn success large button_body_chart">Pie Chart</button>
						&nbsp;&nbsp;
						<button class="genric-btn success large button_body_chart">Single Bar Chart</button>
						&nbsp;&nbsp;
					</div>
					<!-- c3.js 예제 2 -->
					<div id="pie"></div>
				</div>

				<div class="div_right">
					<!-- c3.js 예제 1 -->
					<!--  <div id="linechart"></div> -->
					<div style="height: 50px; padding-bottom: 5px;">
						<button class="genric-btn success large button_body_chart">기 타</button>
						&nbsp;&nbsp;
						<button class="genric-btn success large button_body_chart">Low list 10</button>
						&nbsp;&nbsp;
						<button class="genric-btn success large button_body_chart">TOP list 10</button>
						&nbsp;&nbsp;
						<button class="genric-btn success large button_body_chart">Average</button>
						&nbsp;&nbsp;
					</div>
					<table style="border: 1px solid;">
						<thead>
							<tr>
								<th style="width: 30%">순 위</th>
								<th>HELLO</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>2</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>3</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>4</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>5</td>
								<td>HELLO</td>
							</tr>			
							<tr>
								<td>6</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>7</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>8</td>
								<td>HELLO</td>
							</tr>
							<tr>
								<td>9</td>
								<td>HELLO</td>
							</tr>	
							<tr>
								<td>10</td>
								<td>HELLO</td>
							</tr>	
						</tbody>
					</table>
				</div>
			</div>
		</div>

	<!-- 게시판, 통계 자료 페이징 처리한 게시판 -->		
	</section>
	<%@ include file="../common/footer.jsp"%>

	<!-- 나중에 따로 스크립트 파일로 뺄것 -->

<script src="resources/js/statistics.js"></script>

 <script>
  var chart = c3.generate({
	  bindto: "#linechart",
	  data: {
	    json: [
	      {result_value:1.026653, calc_value:1},{result_value:1.030348, calc_value:0}
	    ],
	    keys: {
	      value: ['result_value','calc_value']
	    }
	  },
	  axis: {
	    x: {
	      type: 'category',
	      show: false,
	      categories: [
	        '2017-10-31','2017-11-01','2017-11-02','2017-11-03'
	      ]
	    }
	  }
	});
  </script>
</body>
</html>




