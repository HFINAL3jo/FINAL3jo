<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    	font-size: 2.5em;
	    	font-weight: bold;
	    	line-height: 1.5em;
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
	    
	    
	</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	
	<section class="cat_product_area section_padding" style="padding-bottom: 65px;">
        <div class="container">
            <div class="row">
			<%@ include file="assideAdmin.jsp" %>
				
			<div style="border:1px solid black;" class="col-lg-10">
				<div class="justify-content-center" style="width: 80%; margin: auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
				    <h2 class="q-title" id="que1"></h2>
				</div>
				<div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
				    <div class="row align-items-center justify-content-between">
				        <div class="select_box">
				            <input type="radio" id="keyword1_1" name="keyword1" value="">
				            <label for="keyword1_1">
				                <h3></h3>
				            </label>
				        </div>
				        <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
				        <div class="select_box">
				            <input type="radio" id="keyword1_2" name="keyword1" value="">
				            <label for="keyword1_2">
				                <h3></h3>
				            </label>
				        </div>
				    </div>
				</div>
				
				<div class="col-lg-12" style="margin-top: 5%;">
				    <div class="pageination">
				        <nav aria-label="Page navigation example">
				            <ul class="pagination justify-content-center">
				                <li class="page-item"><a class="page-link" href="#">1</a></li>
				                <li class="page-item"><a class="page-link" href="#">2</a></li>
				                <li class="page-item"><a class="page-link" href="#">3</a></li>
				                <li class="page-item"><a class="page-link" href="#">4</a></li>
				                <li class="page-item"><a class="page-link" href="#">5</a></li>
				            </ul>
				        </nav>
				    </div>
				</div>
			</div>
			
			
			</div>
		</div>
	</section>
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>