<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
   	 border: 1px solid #444444;
    border-bottom: 1px solid #444444;
    padding: 10px;
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
  
  .div_left{
  	width: 50%;
  	/* width : 150px; */ 
  	height:350px;
    float: left;
    box-sizing: border-box;
  }
  
  .div_right{
  	width: 50%;
/*   	width : 150px; */
  	height:350px;
    float: right;
    box-sizing: border-box;
  }


</style>

<!-- c3.js 차트 사용 하기위한 스크립트 -->

<!-- 
	c3가 기본으로 제공하는 디자인 형식인 c3.min.css 파일을 <head> 부분에 추가한다. 
	그리고 c3.js는 d3.js 기반에서 돌아가므로 d3.min.js를 먼저 자바스크립트 파트에 추가해 준 뒤에 c3.min.js를 추가하면 될 것이다. 
	CDN을 이용해서 간편하게 사용하겠다면 다음과 같이 추가하면 될 것이다.
 -->
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<script src="https://d3js.org/d3.v3.min.js"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

</head>
<body>
  <%@ include file="../common/menubar.jsp" %>
  <%@ include file="assideAdmin.jsp" %>
  
  <!--  조아요 / 조회수 / 검색 키워드 별 버튼으로 구현 -->
  <script>
  // <a href='#' class='genric-btn success-border e-large'>Large</a>&nbsp; &nbsp;
  (function(){
	  document.getElementById("inset_1")
	  .innerHTML += 
		  	"<p style='font-size:20px; padding-top: 20px;'>간단한 통계 자료</P>"
	  		+"<div class='row align-items-center latest_product_inner' style='padding-top: 10px;'>"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:210px; height:130px'> <p class='showLetter'>조아요</p> </a> &nbsp;&nbsp;"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:210px; height:130px'> <p class='showLetter'>조회수</p> </a> &nbsp;&nbsp;"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:210px; height:130px'> <p class='showLetter'>검색 키워드</p></a> &nbsp;&nbsp;"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:210px; height:130px'> Large </a> &nbsp;&nbsp;";   
 			+"</div>"
  })();
  </script>
  
  <!-- 통계를 보여주는 공간 -->
  
  	<div> 
  		<button>원 차트 보기</button> 
  	</div>
<!--   	<section class="cat_product_area section_padding"> -->
  	<div>
        <div class="div_left" style="border: 1px solid gold;">
        	<!-- c3.js 예제 2 -->
            <div id="piechart"></div>
        </div>
        
        <div class="div_right">
            <!-- c3.js 예제 1 -->
           <!--  <div id="linechart"></div> -->
           <table style="border: 1px solid; width:100%; height:100%;">
            <thead>
           		<tr>
           			<th style="width:15%">순위</th>
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
           	</tbody>
           </table>
        </div>
        
        </div>
<!--     </section> -->
	  

  <!-- 기타 게시판 형식으로 top5, -->
  
  <%@ include file="../common/footer.jsp" %>
  
  <!-- 나중에 따로 스크립트 파일로 뺄것 -->
    <script>
  var pieData = {
		  사과: 500,
		  호두: 200,
		  블루베리: 666,
		  치즈: 54,
		  딸기: 120
		};
		var chartDonut = c3.generate({
		  bindto: "#piechart",
		  data: {
		    json: [pieData],
		    keys: {
		      value: Object.keys(pieData),
		    },
		    type: "donut",
		  },
		  donut: {
		    title: "Hello my world",
		  },
		});

		var chartDonutColors = chartDonut.data.colors();
		$("#text-apple").css("color", chartDonutColors["사과"]);
		$("#text-walnut").css("color", chartDonutColors["호두"]);
		$("#text-berry").css("color", chartDonutColors["블루베리"]);
		$("#text-cheese").css("color", chartDonutColors["치즈"]);
		$("#text-strawberry").css("color", chartDonutColors["딸기"]);
		
  </script>
  
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




