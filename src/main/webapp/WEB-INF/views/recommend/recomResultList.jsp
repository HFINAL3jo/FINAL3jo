<%@page import="com.aligo.spring.recom.model.vo.ThemeVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	Map<Integer, ArrayList<ThemeVo>> map = (Map)request.getAttribute("map");
	System.out.println(map.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		max-width: 70%;
		border-bottom: 2px solid rgba(0, 0, 0, 0.4);
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

	<div class="showcase">
		<div class="showcase_content">
		    <div class="row justify-content-center margin-center" style="margin-top: 20%;">
		    	<h1 data-aos="zoom-in">Recommend List</h1>
			</div>
			<div class="row justify-content-center margin-center" style="margin-top: 15%; margin-bottom:10%;">
				<i class="fas fa-angle-double-down fa-5x down" data-aos="zoom-in"></i>
	        </div>
    	</div>
	</div>

	<%! 
		int count = 0;
	%>
	<% for(int i=1; i<8; i++){ %>
		<% count=count+1; %>
		<div class="card-section">
		<% if( !map.get(count).isEmpty() ){ %>
			<h2><%= map.get(count).get(0).getTname() %> LIST
				<% if( map.get(count).size() == 3 ){ %>
				<span class="moreView">View more...</span>
				<%} %>
			</h2>
			<input type="hidden" value="<%= map.get(count).get(0).getTcode() %>" class="cardTcode"/>
			<input type="hidden" value="<%= map.get(count).get(0).getKeywords() %>" class="keywords"/>
				<div class="card-list">
			<% for(int j = 0; j < map.get(count).size(); j++){ %>
				<% if( map.get(count).get(j) != null ){ %>
					<div class="card">
						<img src="<%= map.get(count).get(j).getTfile() %>" 
							onclick="location.href='postdetail.do?tId='+<%= map.get(count).get(j).getTid() %>;">
						<span><%= map.get(count).get(j).getTtitle() %></span>
					</div>
				<%} %>
			<%} %>
				</div>
		<%}else{ %>
			<% switch(i){
			case 1 : %>
				<h2>NATURE LIST</h2>
				<%break;
			case 2 : %>
				<h2>RESTAURANT LIST</h2>
				<%break;
			case 3 : %>
				<h2>HISTORY LIST</h2>
				<%break;
			case 4 : %>
				<h2>SHOPPING LIST</h2>
				<%break;
			case 5 : %>
				<h2>BAR LIST</h2>
				<%break;
			case 6 : %>
				<h2>ACTIVITY LIST</h2>
				<%break;
			case 7 : %>
				<h2>EXHIBITION LIST</h2>
				<%break;
			}%>
			<div class="card-list" style="height: 150px;">
				<h4>There is no list.</h4>
			</div>
			
		<%} %>
		</div>
	<%} %>
		
	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->
	
	<script>
		$(function(){
			//	페이지 이동 animate script
		    $('.down').on('click',function(){
		        
		        var offset = $(this).parent().parent().parent().next().children().offset();
		        
		        $('html').animate({scrollTop : offset.top - 110}, 1000);
		    });
			
			
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
						
						$.each(data, function(index, value){
							
							if(index > 3){
								
								$div1 = $('<div>').addClass('card');
								$img1 = $('<img>').attr('src', data[index].tfile);
								$img1.attr('onclick',"location.href='postdetail.do?tId='+"+data[index].tid+";")
								$span1 = $('<span>').text(data[index].ttitle);
								
								$div1.append($img1);
								$div1.append($span1);
								
								$div.append($div1);
							}
						});
						
						$vmspan.remove();
						$addspan = $('<span>').addClass('moreView').text('All theme...');
						$addspan.attr('onclick', "viewmore('"+rkStr+"');");
						$h2.append($addspan);
						
					}
				});
			});
			
		});
		
		function viewmore(rkStr){
			
			console.log(rkStr);
			//location.href="rResultList2.do?rkStr='"+rkStr+"';";
		}
		
		
	</script>
</body>
</html>