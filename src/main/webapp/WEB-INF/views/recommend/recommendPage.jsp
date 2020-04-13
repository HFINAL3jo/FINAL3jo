<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    
    <style>
    /* Containers */
	html, body {
	  min-height: 100%;
	}
	
	.rb-box {
	    position: relative;
	  width: 80%;
	  max-width: 72%;
	  margin: 50px auto;
	  padding: 1.3em;
	  border-radius: .75em;
	  /* -webkit-filter: drop-shadow(1px 2px 5px rgba(0,0,0,.3));
	  filter: alpha(opacity=50);
	  box-shadow: 
	    0 2px 2px rgba(122, 118, 128, 0.5),
	    0 0px 5px rgba(122, 118, 128,.15),
	    0 0px 4px rgba(0,0,0,.35),
	    0 5px 20px rgba(122, 118, 128,.25),
	    0 15px 50px rgba(122, 118, 128,.75),
	    inset 0 0 15px rgba(255,255,255,.05); */
	}
	
	/* Custom Radio Button */
	p {
	  font-size: 1.5em;
	}
	
	.rb {
	  padding: 16px 0;
	  text-align: center;
	  background: rgba(255,255,255,.03);
	  border-radius: .3em;
	}
	
	.rb-tab {
	  display: inline-block;
	  position: relative;
	  width: 20%;
	}
	
	.rb-txt {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  font-size: .5em;
	  color: #FFFFFF;
	}
	
	.rb-spot {
	  position: absolute;
	  width: 18px;
	  height: 18px;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background: transparent;
	  border: 2px solid rgba(255,255,255,.3);
	  border-radius: 100%;
	  cursor: pointer;
	  transition: ease .5s;
	}
	
	.rb-tab-active .rb-spot {
	  background: rgba(255, 0, 0, 0.35);
	  border: 2px solid rgba(243,49,128,.6);
	}

	/* Submit Button */
	.button-box {
	  padding: 10px 0;
	  text-align: center;
	}
    .q-title{
        border-top: 5px solid rgba(0, 0, 0, 0.6);
        border-bottom: 5px solid rgba(0, 0, 0, 0.6);
        width: 75%;
        margin: auto;
        text-align: center;
        clear: both;
        padding: 30px 0;
    }
    
    .area{
	    margin: auto;
	    max-width: 1600px;
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
        width: 30em;
        height: 30em;
        text-align: center;
        margin: auto;
        margin-top: 15px;
        border-radius: 7em;
        background: white;
        -webkit-filter: drop-shadow(2px 3px 5px rgba(0,0,0,.3));
		  filter: alpha(opacity=50);
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
        background-image: url('${contextPath}/resources/images/Recom_showcase6.jpg');
        background-size: 100% 100%;
	}	
       
    .showcase_content{
    		/* background-color: white; */
        width: 100%;
        height: 100%;
        position: relative;
        background: rgba(0, 0, 0, 0.3);
	        
	}
       
       .showcase_content>div>h1{
       		color: white;
       		font-size: 4.0em;
       		
	}
       
       .margin-center{
	       margin-right: 0px !important;
	       margin-left: 0px !important;
	}
       
      .down{
      		color: darkgray;
      		cursor: pointer;
	}
       
	.mybtn {
	  color: #0067b8; 
	  border:1px solid #0067b8; 
	  background: white; 
	  width: 20em;
	  height: 3em; 
	  font-size: 15px; 
	  margin-bottom: 10%;
	}
	
	.mybtn:hover {
	  color: snow;
	  border: 1px solid #0067b8;
	  background: #0067b8;
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
                                
    <%@ include file="../common/menubar.jsp" %>
    <!-- Header part end-->

	

	<c:if test="${ !empty sessionScope.loginUser }">
	<div class="showcase">
		<div class="showcase_content">
		    <div class="row justify-content-center margin-center" style="margin-top: 20%;">
		    	<h1 data-aos="zoom-in">Recommend</h1>
			</div>
			<div class="row justify-content-center margin-center" style="margin-top: 15%; margin-bottom:10%;">
				<i class="fas fa-angle-double-down fa-5x down" data-aos="zoom-in"></i>
	        </div>
    	</div>
	</div>
	

    <!-- survey part start -->
    <div class="feature_part">
        <form action="rResultList.do" onsubmit="return check();">
            <!-- 질문 1번 -->
            <div>
                <div class="area">
                    <div class="justify-content-center" style="width: 80%; margin: 100px auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
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
                    <div class="row justify-content-center margin-center" style="margin-top: 50px; margin-bottom: 20px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <i class="fas fa-angle-double-down fa-5x down"></i>
                    </div>
                </div>
            </div>



            <!-- 질문 2번 -->
            <div>
                <div class="area">
                    <div class="justify-content-center" style="width: 80%; margin: 100px auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <h2 class="q-title" id="que2"></h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="keyword2_1" name="keyword2" value="">
                                <label for="keyword2_1">
                                    <h3></h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="keyword2_2" name="keyword2" value="">
                                <label for="keyword2_2">
                                    <h3></h3>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center margin-center" style="margin-top: 50px; margin-bottom: 20px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <i class="fas fa-angle-double-down fa-5x down"></i>
                    </div>
                </div>
            </div>



            <!-- 질문 3번 -->
            <div>
                <div class="area">
                    <div class="justify-content-center" style="width: 80%; margin: 100px auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <h2 class="q-title" id="que3"></h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="keyword3_1" name="keyword3" value="">
                                <label for="keyword3_1">
                                   <h3></h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="keyword3_2" name="keyword3" value="">
                                <label for="keyword3_2">
                                   <h3></h3>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center margin-center" style="margin-top: 50px; margin-bottom: 20px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <i class="fas fa-angle-double-down fa-5x down"></i>
                    </div>
                </div>
            </div>


            <!-- 질문 4번 -->
            <div>
                <div class="area">
                    <div class="justify-content-center" style="width: 80%; margin: 100px auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <h2 class="q-title" id="que4"></h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="keyword4_1" name="keyword4" value="">
                                <label for="keyword4_1">
                                    <h3></h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="keyword4_2" name="keyword4" value="">
                                <label for="keyword4_2">
                                    <h3></h3>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center margin-center" style="margin-top: 50px; margin-bottom: 20px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <i class="fas fa-angle-double-down fa-5x down"></i>
                    </div>
                </div>
            </div>


            <!-- 질문 5번 -->
            <div>
                <div class="area">
                    <div class="justify-content-center" style="width: 80%; margin: 100px auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <h2 class="q-title" id="que5"></h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="keyword5_1" name="keyword5" value="">
                                <label for="keyword5_1">
                                    <h3></h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="keyword5_2" name="keyword5" value="">
                                <label for="keyword5_2">
                                    <h3></h3>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center margin-center" style="margin-top: 50px; margin-bottom: 20px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <input type="submit" value="RESULT" class="mybtn e-large">
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    
    </c:if>
    <c:if test="${ empty sessionScope.loginUser }">
    	<br><br><br><br>    	<br><br><br><br>
    	<div style="margin: auto; align-content: center; text-align: center;">
	    	<h1 style="margin: auto; align-content: center; font-weight: bolder;">After login, you can use.</h1>
    	</div>
    	<br><br><br><br>    	<br><br><br><br>
    </c:if>
    <!--::footer_part start::-->
   	<%@ include file="../common/footer.jsp" %>
    <!--::footer_part end::-->

    <!-- custom js -->
    <script>
        $(function(){
        	
        	// ajax로 질문/ 답변 DB에서 꺼내옴
            $.ajax({
            	
            	url : "rSelectQA.do",
            	dataType : "json",
            	success : function(data){
            		$.each(data, function(index, value){

	           			var count = 1;
            			var que = "#que" + (index+1);
	            		var keyword1 = "#keyword" + (index+1) + "_1"; 
	            		var keyword2 = "#keyword" + (index+1) + "_2";
	            		
	            		$(que).text(value.recomContent);
	            		$(keyword1).val(value.keyword1);
	            		$(keyword1).siblings().children().text(value.keyword1Content);
	            		$(keyword2).val(value.keyword2);
	            		$(keyword2).siblings().children().text(value.keyword2Content);
            		});
            	},
            	error : function(){
            		alert('Failed to load value! \n Please refresh');
            	}
            	
            	
            });
        	
        	

        	//	페이지 이동 animate script
            $('.down').on('click',function(){
                
                var offset = $(this).parent().parent().parent().next().children().offset();
                
                $('html').animate({scrollTop : offset.top - 110}, 1000);
            });
            
        	//	클릭 시 색상 변화 animate script
            $('.select_box').on('click',function(){
            	
            	var click = $(this).children("input[type=radio]");
            	
	            if(click.prop('checked') == true){
	            	click.parent().css({
	            		'background':'rgba(0,10,10,.8)'
	            	});
	            	click.siblings().children().css({
	            		'color':'white'
	            	});
	            	
	            	click.parent().siblings().css('background','white');
	            	click.parent().siblings().children('label').children().css({
	            		'color':'black'
	            	});
	            }
            });
            
        });
        
        function check(){
        	
        	if(!$('input[name="keyword1"]:checked').val()){
        		alert('Please choose all items and try again');
        		var offset = $('input[name="keyword1"]').parent().parent().parent().parent().offset();
        		$('html').animate({scrollTop : offset.top - 110}, 1000);
        		return false;
        	}else if(!$('input[name="keyword2"]:checked').val()){
        		alert('Please choose all items and try again');
        		var offset = $('input[name="keyword2"]').parent().parent().parent().parent().offset();
        		$('html').animate({scrollTop : offset.top - 110}, 1000);
        		return false;
        	}else if(!$('input[name="keyword3"]:checked').val()){
        		alert('Please choose all items and try again');
        		var offset = $('input[name="keyword3"]').parent().parent().parent().parent().offset();
        		$('html').animate({scrollTop : offset.top - 110}, 1000);
        		return false;
        	}else if(!$('input[name="keyword4"]:checked').val()){
        		alert('Please choose all items and try again');
        		var offset = $('input[name="keyword4"]').parent().parent().parent().parent().offset();
        		$('html').animate({scrollTop : offset.top - 110}, 1000);
        		return false;
        	}else if(!$('input[name="keyword5"]:checked').val()){
        		alert('Please choose all items and try again');
        		var offset = $('input[name="keyword5"]').parent().parent().parent().parent().offset();
        		$('html').animate({scrollTop : offset.top - 110}, 1000);
        		return false;
        	}else{
        		
        		var saveYN = confirm("Would you like to update your taste information?");
        		if(saveYN){
        			$.ajax({
        				url : "rUserUpdate.do",
        				data : {
        					keyword1 : $('input[name="keyword1"]:checked').val(),
        					keyword2 : $('input[name="keyword2"]:checked').val(),
        					keyword3 : $('input[name="keyword3"]:checked').val(),
        					keyword4 : $('input[name="keyword4"]:checked').val(),
        					keyword5 : $('input[name="keyword5"]:checked').val()
        				},
        				success : function(data){
        					return data;
        				},
        				error : function(){
        					alert("Recommend keyword update error");
        					return false;
        				}
        			});
        		}
        	}
        	
        }
    </script>

    
</body>
</html>