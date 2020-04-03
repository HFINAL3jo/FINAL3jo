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

   .showLetter{
   		font-size: 20px;
   		padding-top: 35px;
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
	  		"<div class='row align-items-center latest_product_inner'>"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:230px; height:130px'> <p class='showLetter'>조아요</p> </a> &nbsp;&nbsp;"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:230px; height:130px'> <p class='showLetter'>조회수</p> </a> &nbsp;&nbsp;"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:230px; height:130px'> <p class='showLetter'>검색 키워드</p></a> &nbsp;&nbsp;"
	  			 +"<a href='#' class='genric-btn success-border e-large' style='min-width:230px; height:130px'> Large </a> &nbsp;&nbsp;";   
 			+"</div>"
  })();
  </script>
  
  <!-- 통계를 보여주는 공간 -->
  
  
  <!-- 기타 게시판 형식으로 top5, -->
  
  <%@ include file="../common/footer.jsp" %>
</body>
</html>




