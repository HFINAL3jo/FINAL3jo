<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		.q-title{
	        border-top: 5px solid rgba(0, 0, 0, 0.6);
	        border-bottom: 5px solid rgba(0, 0, 0, 0.6);
	        width: 75%;
	        margin: auto;
	        text-align: center;
	        clear: both;
	        padding: 30px 0;
	        cursor: pointer;
	    }
	    
	    .select_box>label{
	        width: 100%;
	        height: 100%;
	        cursor: pointer;
	        justify-content: center;
	        align-items: center;
	        display: flex;
	        margin-bottom: 0px;
	        padding-left: 7%;
	        padding-right: 7%;
	    }
	    
	    .select_box>label>h3{
	    	font-size: 1.5em;
	    	font-weight: bold;
	    	line-height: 1em;
	    }
	    
	    .select_box>input{
	    	display: none;
	    }
	
	    .select_box{
	        width: 25em;
	        height: 25em;
	        text-align: center;
	        margin: auto;
	        margin-top: 15px;
	        border-radius: 4em;
	        background: white;
	        -webkit-filter: drop-shadow(2px 3px 5px rgba(0,0,0,.3));
			  filter: alpha(opacity=50);
	    }
	    
	    .page-item{
	    	margin-left: 3%;
	    	margin-right: 3%;
	    }
	    
	    .page-link{
	    	font-size: 2em !important;
	    	color: #63666A !important;
	    	cursor: pointer;
	    }
	    
	    .change_Area{
	    	background: #63666a;
	    	width: 100%;
		    padding-right: 15px;
		    padding-left: 15px;
		    margin-right: auto;
		    margin-left: auto;
		    height: 3em;
		    border-radius: 1em;
		    z-index: 100;
	    }
	    
	    .change_input{
	    	background: #63666a;
	    	border: none;
	    	color: #ffffff;
	    	width: 100%;
	    	height: 100%;
	    	margin: auto;
	    	margin-right: 2%;
	    	font-size: 1.3em;
	    }
	    
	    .change_input::placeholder{
	    	margin: auto;
	    	color: rgba(50, 50, 50);
	    }
	    
	    .ti-close{
	        color: #fff;
		    font-weight: 600;
		    cursor: pointer;
		    padding: 10px;
		    padding-right: 0;
		    margin-top: 0.5%;
		}
		
		.change_btn{
			margin: auto;
			margin-top: 1%;
			width: 5em;
			background: white;
			border-radius: 0.5em;
		}
		
		.mybtn {
		  color: #63666A; 
		  border:1px solid #63666A; 
		  background: white; 
		  width: 15em;
		  height: 3em; 
		  font-size: 15px;
		  margin-top: 2%;
		}
		
		.mybtn:hover {
		  color: snow;
		  border: 1px solid #63666A;
		  background: #63666A;
		}
	</style>
	
	
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<section class="cat_product_area section_padding" style="padding-bottom: 65px;">
        <div class="container">
            <div class="row">
			<%@ include file="assideAdmin.jsp" %>
			<div class="col-lg-10">
				<div class="justify-content-center" style="width: 80%; margin: auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
					<input type="text" id="code" value="${ r.recomCode }" hidden/>
				    <h2 class="q-title search_1" id="que">${ r.recomContent }</h2>
					
					<div class="change_Area" id="title_input_box" style="display: none;">
			            <div class="container">
			                <div class="d-flex justify-content-between search-inner">
			                    <input type="text" class="change_input" id="change_input" placeholder="질문 내용 입력" value="${ r.recomContent }">
			                    <button class="change_btn" id="titleChangeBtn">변경</button>
			                    <span class="ti-close close_change" title="Close Search"></span>
			                </div>
			            </div>
			        </div>
				</div>
				<div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
				    <div class="row align-items-center justify-content-between">
				        <div class="select_box">
				        	<input type="radio" id="keyword1" value="${ r.keyword1 }" disabled="disabled">
				            <label for="keyword1">
				                <h3>${ r.keyword1Content }</h3>
				            </label>
				            
	       					<div class="change_Area" id="k1_input_box" style="display: none; margin-top: -25%; margin-bottom: 1%;">
					            <div class="container">
					                <div class="d-flex justify-content-between search-inner">
					                    <input type="text" class="change_input" placeholder="키워드 입력" value="">
					                    <button class="change_btn keywordChangeBtn" style="margin-top: 2.5%;">변경</button>
					                    <span class="ti-close close_change" title="Close Search"></span>
					                </div>
					            </div>
					        </div>
					        <div class="change_Area" id="kc1_input_box" style="display: none;">
					            <div class="container">
					                <div class="d-flex justify-content-between search-inner">
					                    <input type="text" class="change_input" placeholder="키워드 내용 입력" value="">
					                    <button class="change_btn keywordContentChangeBtn" style="margin-top: 2.5%;">변경</button>
					                    <span class="ti-close close_change" title="Close Search"></span>
					                </div>
					            </div>
					        </div>
					        
				        </div>
				        <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
				        <div class="select_box">
				        	<input type="radio" id="keyword2" value="${ r.keyword2 }" disabled="disabled">
				            <label for="keyword2">
				                <h3>${ r.keyword2Content }</h3>
				            </label>
				            
				            <div class="change_Area" id="k1_input_box" style="display: none; margin-top: -25%; margin-bottom: 1%;">
					            <div class="container">
					                <div class="d-flex justify-content-between search-inner">
					                    <input type="text" class="change_input" placeholder="키워드 입력" value="">
					                    <button class="change_btn keywordChangeBtn" style="margin-top: 2.5%;">변경</button>
					                    <span class="ti-close close_change" title="Close Search"></span>
					                </div>
					            </div>
					        </div>
					        <div class="change_Area" id="kc1_input_box" style="display: none;">
					            <div class="container">
					                <div class="d-flex justify-content-between search-inner">
					                    <input type="text" class="change_input" placeholder="키워드 내용 입력" value="">
					                    <button class="change_btn keywordContentChangeBtn" style="margin-top: 2.5%;">변경</button>
					                    <span class="ti-close close_change" title="Close Search"></span>
					                </div>
					            </div>
					        </div>
				        </div>
				    </div>
				</div>
				
				<br><br>
				
				<div class="col-lg-12" style="margin-top: 7%;">
				    <div class="pageination">
				        <nav aria-label="Page navigation example">
				            <ul class="pagination justify-content-center">
				                <li class="page-item"><a class="page-link">1</a></li>
				                <li class="page-item"><a class="page-link">2</a></li>
				                <li class="page-item"><a class="page-link">3</a></li>
				                <li class="page-item"><a class="page-link">4</a></li>
				                <li class="page-item"><a class="page-link">5</a></li>
				                <li class="page-item"><button class="mybtn" id="finalBtn">Recommend 수정</button></li>
				            </ul>
				        </nav>
				    </div>
				</div>
			</div>
			
			
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
	
	
	
	<script>
		$(function(){
			$('.page-link').on('click',function(){
				$.ajax({
					url : "rUpdateViewPi.do",
					data : { recomNum : $(this).text() },
					dataType : "json",
					success: function(data){
						
						$('#code').val(data.recomCode);
						$('#que').text(data.recomContent);
						$('#keyword1').val(data.keyword1);
						$('#keyword1').siblings('label').children().text(data.keyword1Content);
						$('#keyword2').val(data.keyword2);
						$('#keyword2').siblings('label').children().text(data.keyword2Content);
					},
					
				});
			});
			
			$('.q-title').on('click',function(){
				$('#title_input_box').toggle();
			});
			
			$('.close_change').on('click', function(){
				$(this).parent().parent().parent().css('display','none');
			});
			
			$('#titleChangeBtn').on('click', function(){
				$(this).parent().parent().parent().siblings('#que').text( $(this).siblings('#change_input').val() );
			});
			
			$('.select_box').children('label').on('click', function(){
				$(this).siblings('.change_Area').toggle();
			});
			
			$('.keywordChangeBtn').on('click', function(){
				$(this).parent().parent().parent().siblings('input').val($(this).siblings('.change_input').val());
			});
			
			$('.keywordContentChangeBtn').on('click', function(){
				$(this).parent().parent().parent().siblings('label').children().text($(this).siblings('.change_input').val());
			});
			
			$('#finalBtn').on('click', function(){
				
				console.log($('#code').val());
				console.log($('#que').text());
				console.log($('#keyword1').val());
				console.log($('#keyword1').siblings('label').children().text());
				console.log($('#keyword2').val());
				console.log($('#keyword2').siblings('label').children().text());
				
				var check = confirm("정말로 수정하시겠습니까?");
				
				if(check){
					$.ajax({
						url : 'rUpdateQA.do',
						data : {
							recomCode : $('#code').val(),
							recomContent : $('#que').text(),
							keyword1 : $('#keyword1').val(),
							keyword1Content : $('#keyword1').siblings('label').children().text(),
							keyword2 : $('#keyword2').val(),
							keyword2Content : $('#keyword2').siblings('label').children().text()
						},
						success : function(data){
							alert(data);
						}
					});
				}else{
					alert('수정 취소');
				}
				
			});
			
			
		});
	
	</script>
</body>
</html>


















