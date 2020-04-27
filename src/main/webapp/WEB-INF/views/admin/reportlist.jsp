<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Report</title>

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
	
  #pagenation li{
  	display:inline-block;
  }


</style>



</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section class="cat_product_area section_padding">
		<div class="container" style="margin-bottom: 15px;">
			<div class="row" style="margin-left: 0px; width:">
				<%@ include file="assideAdmin.jsp"%>
				
				<div style="width:930px; height:850px;">
					<div style="margin-top: 4%;">			
					<h1>문의 내역 게시판</h1>
				</div>
			
					<!-- 검색 처리 -->

						<div style="margin: 1%;">
							처리 여부 : 
							<select name="checkSearch" style="width:150px; margin-right:3%; margin-left: 1%;">
								<option value="Y">완 료</option>
								<option value="X">해당 없음</option>
								<option value="N">처 리 중</option>
								<option value="ALL">전부 다</option>
							</select> 
							검색 조건  : 
							<select name="checkSearch" style="width:150px; margin-right:3%; margin-left: 1%;">
								<option value="TITLE">제 목</option>
								<option value="QWRITER">작 성 자</option>
								<option value="NOT">검색 조건 없음</option>
							</select>
							<input type="text" name="checkSearch" value="" style="width:300px; margin-right:2% font-size:12pt; font-weight:bold;">
							<input type="button" onclick="injectionHiddenValue()" value="검 색">
						</div>

				   	<table align="center" class="table table-striped" id="qtb">
				        <thead align="center">
					        <tr>
					            <th>글번호</th>
					            <th>제목</th>
					            <th>작성자</th>
					            <th>날짜</th>
					            <th>처리 여부</th>
					        </tr>
				    	</thead>
				    	<tbody id="tbody">
				    		
				    	</tbody>
				    </table>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>