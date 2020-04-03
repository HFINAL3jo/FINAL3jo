<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        background-image: url('${contextPath}/resources/images/Recom_showcase2.jpg');
        background-size: 100% 100%;
	}	
       
       .showcase_content{
       		/* background-color: white; */
	        width: 100%;
	        height: 100%;
	        position: relative;
	        background: rgba(0, 0, 0, 0.2);
	        
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
      		color: #FF4081;
      		cursor: pointer;
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
        <form action="">
            <!-- 질문 1번 -->
            <div>
                <div class="area">
                    <div class="justify-content-center" style="width: 80%; margin: 100px auto; margin-bottom: 50px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <h2 class="q-title">Travle propensity</h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="tpFamily" name="ans1" value="tpFamily">
                                <label for="tpFamily">
                                    <h3>익숙함을 추구한다 글자가 길어지면 어떻게 나올지 궁금해서 쳐보는 글자</h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="tpNew" name="ans1" value="tpNew">
                                <label for="tpNew">
                                    <h3>새로운 경험을 추구한다.</h3>
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
                        <h2 class="q-title">Travle propensity 2</h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="tp2Famous" name="ans2" value="tp2Famous">
                                <label for="tp2Famous">
                                    <h3>유명한 곳</h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="tp2NotFamous" name="ans2" value="tp2NotFamous">
                                <label for="tp2NotFamous">
                                    <h3>유명하지 않은 곳</h3>
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
                        <h2 class="q-title">Purpose of Travle </h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="recreation" name="ans3" value="recreation">
                                <label for="recreation">
                                   <h3>휴양</h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="tourist" name="ans3" value="tourist">
                                <label for="tourist">
                                   <h3>관광</h3>
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
                        <h2 class="q-title">Travle sensibility</h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="calm" name="ans4" value="calm">
                                <label for="calm">
                                    <h3>차분함</h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="active" name="ans4" value="active">
                                <label for="active">
                                    <h3>활동적</h3>
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
                        <h2 class="q-title">Travle sensibility 2</h2>
                    </div>
                    <div class="rb-box" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="urban" name="ans5" value="urban">
                                <label for="urban">
                                    <h3>도시적인</h3>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" width="200" height="200" style="margin: auto; opacity: .7;">
                            <div class="select_box">
                                <input type="radio" id="natural" name="ans5" value="natural">
                                <label for="natural">
                                    <h3>자연적인</h3>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center margin-center" style="margin-top: 50px; margin-bottom: 20px;" data-aos="fade-zoom-in" data-aos-duration="1500">
                        <input type="submit" value="RESULT" class="genric-btn primary e-large" style="width: 300px; font-size: 15px;">
                    </div>
                </div>
            </div>
            

        </form>
    </div>
    
    <!--::footer_part start::-->
   	<%@ include file="../common/footer.jsp" %>
    <!--::footer_part end::-->

    <!-- custom js -->
    <script>
        $(function(){

            $('.down').on('click',function(){
                
                var offset = $(this).parent().parent().parent().next().children().offset();
                
                $('html').animate({scrollTop : offset.top - 110}, 1000);
            });
            
            $('.select_box').on('click',function(){
            	
            	var click = $(this).children("input[type=radio]");
            	
	            if(click.prop('checked') == true){
	            	console.log(121212);
	            	
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
    </script>

    
</body>
</html>