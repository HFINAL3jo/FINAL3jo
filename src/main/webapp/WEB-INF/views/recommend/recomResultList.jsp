<%@page import="com.aligo.spring.recom.model.vo.ThemeVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");

	Map<Integer, ArrayList<ThemeVo>> map = (Map)request.getAttribute("map");
	System.out.println(map.size());
	System.out.println(map.get(0));
	System.out.println(map.get(1));
	System.out.println(map.get(2));
	System.out.println(map.get(3));
	System.out.println(map.get(4));
	System.out.println(map.get(5));
	System.out.println(map.get(6));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get inspired for your journey! - aligo</title>

	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

	<style>
	html, body {
	  min-height: 100%;
	}
	
	.showcase {
		margin-top: 1%;
		width: 100%;
		height: 100%;
		/* background: url('https://i.ibb.co/zGSDGCL/slide1.png') no-repeat center center/cover; */
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center;
		justify-content: flex-end;
		/* padding-bottom: 50px; */
		/* margin-bottom: 20px; */
		background-image:
			url('${contextPath}/resources/images/Recom_showcase6.jpg');
		background-size: 100% 100%;
	}
	
	.showcase_content {
		/* background-color: white; */
		width: 100%;
		height: 100%;
		position: relative;
		background: rgba(0, 0, 0, 0.3);
	}
	
	.showcase_content>div>h1 {
		color: white;
		font-size: 4.0em;
	}
	
	.down{
 		color: darkgray;
 		cursor: pointer;
	}
	.down:hover{
		color: peachpuff;
	}
	
	.card-section {
		width: 100%;
		padding: 25px;
		display: flex;
		flex-direction: column;
		margin:1% auto;
		max-width: 77%;
	}
	.card-section h2 {
	    font-size: 36px;
	    color: #1a1a1a;
	    line-height: 27px;
	    font-weight: 700;
	    position: relative;
	    margin-bottom: 1%;
	    left: 6%;
	}
	.moreView {
	    color: #adadad;
	    font-size: 16px;
	    font-weight: 700;
	    margin-left: 60px;
	    cursor: pointer;
	}
	.moreView:hover {
	    color: orangered;
	    
	}
	.alltheme {
	    color: #adadad;
	    font-size: 16px;
	    font-weight: 700;
	    margin-left: 60px;
	    cursor: pointer;
	}
	.alltheme:hover {
	    color: orangered;
	    
	}
	
	.card-section>h1 {
		margin-top: 0;
		margin-bottom: 0;
	}
	
	.card-section>h4 {
		color: #999;
		margin-top: 3px;
		margin-bottom: 6px;
	}
	
	.card-list {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: center;
	}
	
	.card {
		width: 380px;
		height: 240px;
		border-radius: 10px;
		overflow: hidden;
		margin: 15px 20px;
		box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2), 0 0 5px rgba(0, 0, 0, 0.15);
		transform: scale3d(1, 1, 1);
		transition: all 0.2s ease-out, filter 0.75s ease-out;
		background: rgba(0, 0, 0, 0.2);
		filter: grayscale(0.1) saturate(95%) brightness(95%) contrast(90%);
	}
	
	.card:hover {
		box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4), 0 0 15px rgba(0, 0, 0, 0.3);
		filter: grayscale(0) saturate(105%) brightness(100%) contrast(100%);
	}
	
	.card>img {
		position: absolute;
		width: 108%;
		height: 108%;
		/* top: -4%; */
		/* left: -4%; */
		z-index: -10;
		transform: scale(1.05);
		transition: all 0.2s ease-out, transform 0.2s ease-out, filter 0.75s
			ease-out;
		filter: blur(0px);
		cursor: pointer;
	}
	
	.card>span {
		text-align: center;
		position: relative;
		top: 175px;
		color: white;
		font-size: 1.4em;
		font-weight: 600;
		cursor: pointer;
	}
	
	.card.blur>img {
		filter: blur(1px) grayscale(0.1) saturate(95%);
	}
	
	.card>.shineLayer {
		height: 100%;
		width: 100%;
		background: linear-gradient(0deg, rgba(255, 255, 255, 0) 0%,
			rgba(255, 255, 255, 0) 80%);
		transition: all 0.2s ease-out;
	}
	.margin-center{
       margin-right: 0px !important;
       margin-left: 0px !important;
	}
	
	hr{
		width: 90%;
		height: 3px !important;
		border: 2px !important;
		border-top: 1px solid darkblue !important;
		
	}
	
	.breadcrumb{
    	background-image: url('${contextPath}/resources/images/Recom_showcase6.jpg');
    }
	</style>

<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
	<!--::header part start::-->

	<%@ include file="../common/menubar.jsp"%>
	<!-- Header part end-->

	<c:if test="${ !empty sessionScope.loginUser }">
	<section class="breadcrumb breadcrumb_bg" style="height:760px;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2 style="font-size:4em; padding-top:100px; position:relative; left:-10%;">Recommend <br>List</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<% for(int i=0; i<7; i++){ %>
		<div class="card-section">
		<% if( !map.get(i).isEmpty() ){ %>
			<h2><%= map.get(i).get(0).getTname() %> LIST
				<% if( map.get(i).size() == 3 ){ %>
				<span class="moreView">View more...</span>
				<%} %>
			</h2>
			<input type="hidden" value="<%= map.get(i).get(0).getTcode() %>" class="cardTcode"/>
			<input type="hidden" value="<%= map.get(i).get(0).getKeywords() %>" class="keywords"/>
				<div class="card-list">
			<% for(int j = 0; j < map.get(i).size(); j++){ %>
				<% if( map.get(i).get(j) != null ){ %>
					<div class="card">
						<img src="<%= map.get(i).get(j).getTfile() %>" 
							onclick="location.href='postdetail.do?tId='+<%= map.get(i).get(j).getTid() %>;">
						<span> <%= map.get(i).get(j).getTtitle() %> </span>
					</div>
				<%} %>
			<%} %>
				</div>
				<br><hr>
		<%}else{ %>
			<% switch(i){
			case 0 : %>
				<h2>NATURE LIST</h2>
				<%break;
			case 1 : %>
				<h2>RESTAURANT LIST</h2>
				<%break;
			case 2 : %>
				<h2>HISTORY LIST</h2>
				<%break;
			case 3 : %>
				<h2>SHOPPING LIST</h2>
				<%break;
			case 4 : %>
				<h2>BAR LIST</h2>
				<%break;
			case 5 : %>
				<h2>ACTIVITY LIST</h2>
				<%break;
			case 6 : %>
				<h2>EXHIBITION LIST</h2>
				<%break;
			}%>
			<div class="card-list" style="height: 200px;">
				<h4>There is no list.</h4>
			</div>
			<hr>
		<%} %>
		</div>
		
	<%} %>
	</c:if>
	<c:if test="${ empty sessionScope.loginUser }">
	   	<br><br><br><br>    	<br><br><br><br>
	   	<div style="margin: auto; align-content: center; text-align: center;">
	    	<h1 style="margin: auto; align-content: center; font-weight: bolder;">After login, you can use.</h1>
	   	</div>
	   	<br><br><br><br>    	<br><br><br><br>
    </c:if>
    
    <input type="hidden" value="0" id="viewCheck"/>
    <input type="hidden" value="1" id="currentPage"/>
    
    
    
	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->
	
	<script>
		window.onmousewheel = function(e) {
			e.preventDefault;
			var aa = $(window).height();
			var bb = $(document).height();
			var cc = $(window).scrollTop();
			
			if (Math.floor((aa / (bb - cc)) * 100 > 60 && e.deltaY === 100)) {
				
				console.log('확인!');
				rpagination();
			}
		}
		
		function rpagination(){
			
			$.ajax({
				url : "rPagination.do",
				data : {
					currentPage : $('#currentPage')+1,
					rkStr : $('.keywords').val(),
					tcode : $('.cardTcode').val()
				},
				dataType:"json",
				success:function(data){
				
				   console.log(data);
				   
				   if(data==false){
					   
					   $('.card-section').after('<h4>There is no more data.</h4>');
				   }
				   
				   
			   	}
			});
		}
		
		$(function(){
			
			$('.moreView').on('click', function(){
				
				$vmspan = $(this);
				$h2 = $(this).parent();
				$div = $(this).parent().siblings('.card-list');
				var rkStr = $(this).parent().siblings('.keywords').val();
				
				//	$(this).parent().parent().siblings('.card-section').remove();
				$(this).parent().parent().siblings('.card-section').fadeOut(1500,function(){ $(this).remove(); });
				
				$.ajax({
					url : "rResultMoreList.do",
					data : {
						tcode : $(this).parent().siblings('.cardTcode').val(),
						rkStr : $(this).parent().siblings('.keywords').val()
					},
					dataType : 'json',
					success : function(data){
						
						console.log('확인');
						console.log(data);
						
						$.each(data, function(index, value){
							
							if(index >= 3){
								
								var imgs = value.tfile.replace('amp;','');
								$div1 = $('<div>').addClass('card');
								$img1 = $('<img>').attr('src', value.tfile);
								$img1.attr('onclick',"location.href='postdetail.do?tId='+"+value.tid+";")
								$span1 = $('<span>').text(value.ttitle);
								
								$div1.append($img1);
								$div1.append($span1);
								
								$div.append($div1);
							}
						});
						
						$vmspan.remove();
						$addspan = $('<span>').addClass('moreView').text('All theme...');
						$addspan.attr('onclick', "location.reload();");
						$h2.append($addspan);
						
						$("#viewCheck").val(1);
					}
				});
			});
			
		});
		
		
	</script>
</body>
</html>