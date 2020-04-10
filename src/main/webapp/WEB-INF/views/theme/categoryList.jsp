<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>

<!-- nice select CSS -->
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/price_rangs.css">

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
</style>

</head>

<body>
	<div id="goUp" />
	<!--::header part start::-->
	<%@ include file="../common/menubar.jsp"%>
	<!-- Header part end-->

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>THEME</h2>
							<p>
								Home <span>-</span> Theme
							</p>
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
		<%@ include file="../common/assidetheme.jsp"%>

		<div id="tList" class="col-lg-9">
			<div class="row">
				<div class="col-lg-12">
					<div
						class="product_top_bar d-flex justify-content-between align-items-center">

						<div class="single_product_menu">
							<p>								
								Number of posts <span>${pi.listCount}</span>
							</p>
							<!-- <p>여행 테마 -> 전통 -> 고궁</p> -->
						</div>

						<div class="single_product_menu d-flex">
							<div class="input-group">

								<button class="genric-btn success-border medium"
									style="width: 100%; height: 90%;">Latest Posting</button>

							</div>
							&nbsp;&nbsp;&nbsp;
							<div class="input-group">
								<button class="genric-btn success-border medium"
									style="width: 100%; height: 90%;">Most Liked</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			    
			<div id="aList" class="row align-items-center latest_product_inner">
			    <c:forEach var="t" items="${list }" begin="0" end="${pi.themeLimit}">
			    <c:url var="post" value="postdetail.do">
				 <c:param name="tId" value="${t.tId }"/>
				</c:url>
				<a href="${post }">
				<div class="col-lg-4 col-sm-6">
					<div class="single_product_item">
						<img src="resources/tuploadFiles/${t.tModifyFile }"	style="width: 100%; height: 170px">
						<div class="single_product_text">
							<h4>${t.tTitle }</h4>
							<h3><b style="color:rgba(121,125,237,0.9)">#${t.tName}</b></h3>
							<h5></h5>
							<a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
						</div>
					</div>
				</div>
				</a>
				</c:forEach>
			</div>
			<input id="tc" type="hidden" value="${pi.currentPage }">
			<input id="tm" type="hidden" value="${pi.maxPage }">
			<div align="center">
				<a href="javascript:void(0)" onclick="ex();" ><button id="alb" class="genric-btn primary circle" style="width:50%; font-size:20px; background:#ebc5e4;">Lord More..</button></a>
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
		
	function ex(){
		if(maxPage == currentPage){
			$('#alb').text("End");
		}else{ 
		currentPage = (parseInt(currentPage) + 1);
		$.ajax({
			url:"pagination.do",
			data:{currentPage:currentPage},
			dataType:"json",
			success:function(data){
			   $div = $('#aList');
			   $div.addClass('row align-items-center latest_product_inner');
			   for(var i in data){
								
				  var $diva = $('<div>').addClass('col-lg-4 col-sm-6'); 
				  var $divb = $('<div>').addClass('single_product_item');
				  var $img = $('<img>').attr('src',data[i].tModifyFile).css({"width":"100%","height":"170px"});
				  var $divc = $('<div>').addClass("single_product_text");
				  var $h4 = $('<h4>').text(data[i].tTitle);
				  var $h3 = $('<h3>');
				  var $b  = $('<b>').css({"color":"rgba(121,125,237,0.9)"}).text(data[i].tName);
				  var $h5 = $('<h5></h5>');
				  var $a = $('<a>').attr('href','#').addClass('add_cart').text('+ add to cart');
				  var $i = $('<i>').addClass('ti-heart');

				  $div.append($diva);
				  $diva.append($divb);
				  $divb.append($divc);
				  $divb.append($img);
				  $divb.append($divc);
				  $divc.append($h4);
				  $h3.append($b);
				  $divc.append($h3);
				  $divc.append($h5);
				  $a.append($i);
				  $divc.append($a);
			   }
			},error:function(){
				
			}
	});
	}
	}
		//스크롤 70% 스크립트 및 div 추가 
		window.onmousewheel = function(e) {
			e.preventDefault;
			var aa = $(window).height();
			var bb = $(document).height();
			var cc = $(window).scrollTop();
			
			if (Math.floor((aa / (bb - cc)) * 100 > 75 && e.deltaY === 100)) {
				
				ex();
				}
			}
	 $('.col-lg-4 col-sm-6').click(function(){
		 
	 });
	</script>
</body>
</html>