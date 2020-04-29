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
<intput type="hidden" value="${checkValue1}">
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section class="cat_product_area section_padding">
		<div class="container" style="margin-bottom: 15px;">
			<div class="row" style="margin-left: 0px; width:">
				<%@ include file="assideAdmin.jsp"%>
				
				<div style="width:930px; height:850px;">
					<div style="margin-top: 4%;">			
					<h1>신고 내역 게시판</h1>
				</div>
			
					<!-- 검색 처리 -->
					<form action="reportlist.do" action="get">
						<div style="margin: 1%;">
							처리 여부 : 
							<select name="checkSearch" style="width:150px; margin-right:1%; margin-left: 1%;" value="${checkValue1}">
								<option value="Y">완 료</option>
								<option value="X">해당 없음</option>
								<option value="N">처 리 중</option>
								<option value="ALL">전부 다</option>
							</select> 
							검색 조건  : 
							<select name="checkSearch" style="width:150px; margin-right:1%; margin-left: 1%;" value="${checkValue2}">
								<option value="TITLE">신고 된 유형</option>
								<option value="WRITER">작 성 자</option>
								<option value="CONTENT">내 용</option>
								<option value="NOT">검색 조건 없음</option>
							</select>
							<input type="text" name="checkSearch" value="${checkValue3}" style="width:300px; margin-right:2% font-size:12pt; font-weight:bold;">
							<input type="submit" value="검 색">
						</div>
					</form>
				   	<table align="center" class="table table-striped" id="qtb">
				        <thead align="center">
					        <tr>
					            <th>글번호</th>
					            <th>제 목</th>
					            <th>작성자</th>
					            <th>날짜</th>
					            <th>처리 여부</th>
					        </tr>
				    	</thead>
				    	<tbody id="tbody">
				    		<c:forEach var="rlist" items="${ list }">
				    			<tr class="trs">
					    			<td class="num">${rlist.rCode}</td>
					    			<td>${rlist.tTitle}</td>
					    			<td>${rlist.reporter}</td>
					    			<td>${rlist.reportSdate}</td>
					    			<td>${rlist.rStatus}</td>
				    			</tr>
				    		</c:forEach>
				    		<!-- 페이징 처리 -->
							<tr align="center" height="20">
								<td colspan="6">
								
									<!-- [이전] -->
									<c:if test="${ pi.currentPage eq 1 }">
										[이전] &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="reportlist.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
											<c:param name="checkSearch" value="${checkValue1}"/>
											<c:param name="checkSearch" value="${checkValue2}"/>
											<c:param name="checkSearch" value="${checkValue3}"/>
										</c:url>
										<a href="${ before }">[이전]</a> &nbsp;
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="red" size="4"><b>[${ p }]</b></font>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="reportlist.do">
												<c:param name="currentPage" value="${ p }"/>
												<c:param name="checkSearch" value="${checkValue1}"/>
												<c:param name="checkSearch" value="${checkValue2}"/>
												<c:param name="checkSearch" value="${checkValue3}"/>
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach>
									
									<!-- [다음] -->
									<c:if test="${ pi.currentPage eq pi.maxPage }">
										[다음]
									</c:if>
									<c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="reportlist.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											<c:param name="checkSearch" value="${checkValue1}"/>
											<c:param name="checkSearch" value="${checkValue2}"/>
											<c:param name="checkSearch" value="${checkValue3}"/>
										</c:url> 
										<a href="${ after }">[다음]</a>
									</c:if>
								</td>
							</tr>
				    	</tbody>
				    </table>
				</div>
			</div>
		</div>
		 <form name="paging">
		 	<input type="hidden" name="num" value=""/>
		 </form>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
	<script>
	
	$(function(){
		
		$('.trs').on('click',function(){
			
			console.log($(this).children('.num').text());
			
			var go = document.paging;
			go.num.value = $(this).children('.num').text();
			go.action = "reportDetail.do";
	    	go.method = "post";
	    	go.submit();
		});
	});
	
	 
	</script>
</body>
</html>