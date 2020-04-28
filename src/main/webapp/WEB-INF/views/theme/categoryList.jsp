<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Get inspired for your journey! - aligo</title>

<!-- nice select CSS -->
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/price_rangs.css">
<link rel="stylesheet" href="resources/css/card.css">

<style type="text/css">
.floatdiv {
	position: fixed;
	width: 80px;
	display: inline-block;
	right: 0px; /* 창에서 오른쪽 길이 */
	top: 80%; /* 창에서 위에서 부터의 높이 */
	background-color: transparent;
	margin: 0;
}

h4{
	text-align:center;
}

.breadcrumb{
  	background-image:url('${contextPath}/resources/images/nightview.jpg');
    background-size: 100% 100%;
  }
  
 .genric-btn.primary:hover {
  background:#0067b8 !important;
  color: white !important;
  border: 1px solid #0067b8 !important;
}
 .genric-btn.primary{
  /* color: #0067b8; !important; */
  border: 1px solid #0067b8 !important;
  background:white;
}
.genric-btn.success {
  color: black !important;
  background: rgba(227, 227, 227,1) !important;
  border: 1px solid transparent;
}

.genric-btn.success:hover {
  color: white !important;
  border: 1px solid #c1e3f7 !important;
  background: #c1e3f7 !important;
}

</style>

</head>

<body>
	<div id="goUp" />
	<!--::header part start::-->
	<%@ include file="../common/menubar.jsp"%>
	<!-- Header part end-->

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg" style="height:760px;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2 style="font-size:4em; padding-top:100px; position:relative; left:-10%;">${ param.keyword } Theme</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding"
		style="padding-top: 3%; padding-bottom: 0%;">
		<!-- 인클루드 asside -->
		<jsp:include page="../common/assidetheme.jsp"/>
		<div id="tList" class="col-lg-9">
			<div class="row">
				<div class="col-lg-12">
					<div
						class="product_top_bar d-flex justify-content-between align-items-center">

						<div class="single_product_menu">
								Number of posts <span>${pi.listCount}</span>
							</p>
							<!-- <p>여행 테마 -> 전통 -> 고궁</p> -->
						</div>

						<div class="single_product_menu d-flex">
							<div class="input-group">

								<button id="lastPost" class="genric-btn success"
									style="width: 100%; height: 90%;">Latest Posting</button>

							</div>
							&nbsp;&nbsp;
							<div class="input-group">
								<button class="genric-btn success" id="mostLiked"
									style="width: 100%; height: 90%;">Most Liked</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="aList" class="row align-items-center latest_product_inner">
			
			    <c:forEach var="t" items="${list }" begin="0" end="${pi.themeLimit}">
				<div class="col-lg-4 col-sm-6" style="max-width:50% !important;">
				    <c:url var="post" value="postdetail.do">
					 <c:param name="tId" value="${t.tId }"/>
					</c:url>
				<a href="${post }">
        				<div class="card-list">        				
          					<div class="card">          					
            					<img src="${t.tModifyFile }"/>
            					<span>${t.tTitle }</span>
         					</div>
					<!-- <div class="single_product_item">
							<h3><b style="color:rgba(121,125,237,0.9)">#${t.tName}</b></h3>
					</div> -->
					</div>
				</a>
				</div>
				</c:forEach>
			</div>
			<input id="tc" type="hidden" value="${pi.currentPage }">
			<input id="tm" type="hidden" value="${pi.maxPage }">
			<input id="sv" type="hidden" name="searchValue" value="${sc.searchValue}">
			<input id="kw" type="hidden" name="keyword" value="${sc.keyword}">
			<input id="lc" type="hidden" value="${pi.listCount }">
			<div align="center">
				<a href="javascript:void(0)" onclick="pagination();" ><button id="alb" class="genric-btn primary circle" style="width:50%; font-size:20px; background:white; color:#0067b8;">Lord More..</button></a>
			</div>
			
		</div>
		<div class="floatdiv">
			<a href="#goUp" class="fas fa-chevron-up" style="font-size: 50px;"></a>
			<a href="#goDown" class="fas fa-chevron-down"
				style="font-size: 50px;"></a>
		</div>
	</section>
	<br>

	<!--::footer_part start::-->

	<%@ include file="../common/footer.jsp"%>

	<!--::footer_part end::-->

	<!-- jquery plugins here-->

	<script src="resources/js/stellar.js"></script>
	<script src="resources/js/price_rangs.js"></script>

	<div id="goDown" />

	<script>
		var currentPage = $('#tc').val();
		var maxPage = $('#tm').val();
		var searchValue = $('#sv').val();
		var keyword = $('#kw').val();
		var endb = $('#lc').val();
	
	function pagination(){
		if(maxPage == currentPage){
			$('#alb').text("End");
		}else{ 
		currentPage = (parseInt(currentPage) + 1);
		ajaxPage();
		}
	}
	function ajaxPage(){
	searchValue = parseInt(searchValue);
	currentPage = parseInt(currentPage);
	$.ajax({
		url:"pagination.do",
		data:{currentPage:currentPage,searchValue:searchValue,keyword:keyword},
		dataType:"json",
		success:function(data){
		
		   $div = $('#aList');
		   $div.addClass('row align-items-center latest_product_inner');
		   for(var i in data){
			  var $diva = $('<div>').addClass('col-lg-4 col-sm-6').css('max-width','50%'); 
			  var $a = $('<a>').attr('href',"postdetail.do?tId="+data[i].tId);
			  var $divb = $('<div>').addClass('card-list');
			  var $divc = $('<div>').addClass('card');			  
			  var $img = $('<img>').attr('src',data[i].tModifyFile);
			  var $span = $('<span>').text(data[i].tTitle);
			  var $divd = $('<div>').addClass('single_product_item');
				
			  $div.append($diva);
			  $diva.append($a);
			  $a.append($divb);
			  $divb.append($divc);
			  $divc.append($img);
			  $divc.append($span);
			  $divb.append($divd);
		   }
		},error:function(){
		   console.log("에러발생");
		}
	});
}
		//스크롤 70% 스크립트 및 div 추가 
		window.onmousewheel = function(e) {
			e.preventDefault;
			var aa = $(window).height();
			var bb = $(document).height();
			var cc = $(window).scrollTop();
			
			if (Math.floor((aa / (bb - cc)) * 100 > 75 && e.deltaY === 100)) {
				
				pagination();
				}
			}
		
	 $('#lastPost').click(function(){
		 searchValue = 2;
		 currentPage = 1;
		 $('#titlebar').text('Newest');
		 $('#aList').html("");
		 ajaxPage();
	 });
	 $('#mostLiked').click(function(){
		 searchValue = 3;
		 currentPage = 1;
		 $('#titlebar').text('Most Liked');
		 $('#aList').html("");
		 ajaxPage();
	 });
	 
	 $(function(){
		var str = document.URL.substr(document.URL.indexOf('keyword=')+8,document.URL.length);

		if(str.charAt(0) =='%'){
			str = decodeURI(str.substr(0,str.indexOf('&')));
			$('#kk').text(' - ' + str);			
		}else{
			$('#kk').text(' - ' + str);
		}
	 });
	</script>
</body>
</html>