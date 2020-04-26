<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="stylesheet" href="resources/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="resources/css/nice-select.css">
    <link rel="stylesheet" href="resources/css/card.css">
    <style type="text/css">
	.breadcrumb{
		background-image:url('${contextPath}/resources/images/sung.jpg');
		background-size: 100% 100%;
	 }
	</style>
</head>

<body>
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
                            <h2>Liked List</h2>
                            <p>Home <span>-</span> My List</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <%@ include file="../common/assideMyPage.jsp"%>                
                
					<!-- 내가 좋아요한 리스트 -->
					<div id="tList" class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="product_top_bar d-flex justify-content-between align-items-center">
		
								<div class="single_product_menu">
									<p>								
										Number of posts <span>${pi.listCount}</span>
									</p>									
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
							</div>
						</a>
						</div>
						</c:forEach>
					</div>
					<input id="tc" type="hidden" value="${pi.currentPage }">
					<input id="tm" type="hidden" value="${pi.maxPage }">
					<div align="center">
						<a href="javascript:void(0)" onclick="pagination();" ><button id="alb" class="genric-btn primary circle" style="width:50%; font-size:20px; background:#ebc5e4;">Lord More..</button></a>
					</div>			
					</div>					
					<!-- 내가 좋아요한 리스트 -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!--::footer_part start::-->
    <%@ include file="../common/footer.jsp"%>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>
    <!-- custom js -->
    <script type="text/javascript">
    
		var currentPage = $('#tc').val();
		var maxPage = $('#tm').val();
		
		function pagination(){
			if(maxPage == currentPage){
				$('#alb').text("End");
			}else{ 
			currentPage = (parseInt(currentPage) + 1);
			ajaxPage();
			}
		}
		function ajaxPage(){
		currentPage = parseInt(currentPage);
		$.ajax({
			url:"pagination2.do",
			data:{currentPage:currentPage},
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
			
		$('#svf').click(function(){
			location.href='likedList.do';
		});
	</script>
</body>

</html>