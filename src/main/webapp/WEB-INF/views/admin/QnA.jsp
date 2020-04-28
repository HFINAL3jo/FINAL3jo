<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
   
 <style>
 /* table {
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
  
  ul[id~=pagenation]>li{
  	display:inline;
  } */
  
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
    background-color: #3B4CF7;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #ffffff;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #FAFAFA;
  }

  ul[id~=pagenation]>li{
  	display:inline;
  }

  .breadcrumb{
  	background-image:url('${contextPath}/resources/images/qnaflowers.jpg');
    background-size: 100% 100%;
  }
 </style>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<input type="hidden" id="SearchValue1" value="">
<input type="hidden" id="SearchValue2" value="">
<input type="hidden" id="SearchValue3" value="">
<input type="hidden" id="checkPaging" value="y">
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
								<option value="N">처 리 중</option>
								<option value="Y">완 료</option>
								<option value="X">해당 없음</option>
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

<script>
	//
	var injectionHiddenValue = function(){
		for(var i = 1; i<=3; i++){
			document.getElementById('SearchValue'+i).value = document.getElementsByName('checkSearch')[i-1].value;
		}
		document.getElementById('checkPaging').value = 'y';
		Search();
	}
	
	var bringData = function(){
		var array = new Array();
		for(var i = 1; i<=3; i++){
			array.push(document.getElementById('SearchValue'+i).value);
		}
		return array;
	}
	
	var Search = function(page){
		var checkSearch = new Object();
		checkSearch.value = bringData();
		
		// currentPage, checkPaging 
		var currentPage = page;
		
		if(document.getElementById('checkPaging').value == 'y'){
			currentPage = 1;
			document.getElementById('checkPaging').value = 'n';
		}
		
		checkSearch.currentPage = currentPage;
		$.ajax({
			url:"goSearchQnaData.do",
			data: checkSearch,
			dataType:"json",
			timeout : 50000,	//제한시간 지정
			type:"post",
			success:function(data){
				console.log(data);
				console.log(data.checkFail)
				// 실패 -> fail 
				if(data.checkFail == 'fail'){
					location.href = "goErrorPage.do";
				}
				var listText = "";
				
					for(var i in data.list){
						listText += "<tr>";
						listText += "<td>"+data.list[i].qId+"</td>";
						listText += "<td>";
						listText += "<a style='height: 100%; color:black' href='qdetail.do?qId="+data.list[i].qId+"&currentPage="+data.pi.currentPage+"&qWriter=" + data.list[i].qWriter+"'>"+data.list[i].qTitle+"</a>";
						listText += "</td>";
						
						listText += "<td>"+data.list[i].qWriter+"</td>";
						listText += "<td>"+data.list[i].qCreateDate+"</td>";
						listText += "<td>"+data.list[i].qStatus+"</td>";

						listText +="</tr>";
					}
				
					   // 페이징 처리
					   listText += "<tr align='center' height='20'>";
					   listText += "<td colspan='6'>";
					   // [이전]
					   if(currentPage == 1){
						   listText +=	"[이전] &nbsp;";
					   }else{
						   listText += "<a href='javascript:void(0);' onclick='Search("+ (currentPage - 1) +")'>[이전]</a> &nbsp;&nbsp;";
					   }
						// 페이지 
						for(var p= data.pi.startPage; p<= data.pi.endPage; p++){
							if(p == data.pi.currentPage){
								listText += "<font color='red' size='4'><b>"+ [ p ] + "</b></font>&nbsp;&nbsp;";
							}else{
								listText +=  "<a href='javascript:void(0);' onclick='Search("+ p + ")'>" + p + "</a> &nbsp;&nbsp;";
							}						
						}
						// [다음]
						if(currentPage == data.pi.maxPage){
							listText += "[다음]";
						}else{
							listText += "<a href='javascript:void(0);' onclick='Search("+ (currentPage+1) +")'>[다음]</a>&nbsp;&nbsp;";
						}
						listText +="</td>";
						listText +="</tr>";
					   
					   $("#qtb tbody").html(listText);
					   
					},error:function(){
						
						console.log("전송실패");
						
					}, beforeSend: function () {	// 데이터 전송시에 로딩시 보여줄 이미지 처리
		              
					  var width = 0;	//	넓이
		              var height = 0;	//	놀이
		              var left = 0;		//	이미지 배치 위치
		              var top = 0;		//	이미지 배치 위치

		              width = 50;
		              height = 50;

		              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();	// y 측 위치 계산
		              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();	// x 측 위치 계산	 

		              if($("#div_ajax_load_image").length != 0) {
		                     $("#div_ajax_load_image").css({
		                            "top": top+"px",
		                            "left": left+"px"
		                     });
		                     $("#div_ajax_load_image").show();
		              }else {
		                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' 
		                     					+ top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; ">'
		                     					+'<img src="${ contextPath }/resources/ajax-loader.gif" style="width:50px; height:50px;"></div>');
		              }

		       		}, complete: function () {
		    	   			$("#div_ajax_load_image").hide();
		       			}
		                   	
		       });
	}
</script>


</html>