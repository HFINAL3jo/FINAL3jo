<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Get inspired for your journey! - aligo</title>
  <style>
  	/* Showcase */
        .showcase {
	        width: 100%;
	        margin-left: auto;
	        margin-right: auto;
	        height: 750px;
	        margin-top:1%;
        /* background: url('https://i.ibb.co/zGSDGCL/slide1.png') no-repeat center center/cover; */
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        text-align: center;
	        justify-content: flex-end;
	        padding-bottom: 50px;
	        margin-bottom: 20px;
	        background-image: url('${contextPath}/resources/images/main_sample2.jpg');
	        background-size: 100% 100%;
        }

        .showcase h1, .showcase p {
	        margin-bottom: 10px;
	        color: white;
        }
        
        .showcase h1{
        	font-size:4em;
        }
        
        #welcome_p{
        	font-size:1.6em;
        }

        .showcase .btn {
        	margin-top: 20px;
        }
        
        /* card section css start */
        body { 
	        color: #111;
	        background: #F1F1F4;
        }

        .card-section {
	        width: 100%;
	        margin: 15px 0 20px 0;
	        padding: 25px;
	        display: flex;
	        flex-direction: column;
	        align-items: center;
        }

        .card-section > h1 {
	        margin-top: 0;
	        margin-bottom: 0;
        }

        .card-section > h4 {
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
	        box-shadow: 0 8px 30px rgba(0,0,0,0.2), 0 0 5px rgba(0,0,0,0.15);
	        transform: scale3d(1, 1, 1);
	        transition: all 0.2s ease-out, filter 0.75s ease-out;
	        background: rgba(0,0,0,0.2);
	        filter: grayscale(0.1) saturate(95%) brightness(95%) contrast(90%);
        }

        .card:hover {
	        box-shadow: 0 20px 60px rgba(0,0,0,0.4), 0 0 15px rgba(0,0,0,0.3);
	        filter: grayscale(0) saturate(105%) brightness(100%) contrast(100%);
        }

        .card > img {
	        position: absolute;
	        width: 108%;
	        height: 108%;
	        /* top: -4%; */
	        /* left: -4%; */
	        z-index: -10;
	        transform: scale(1.05);
	        transition: all 0.2s ease-out, transform 0.2s ease-out, filter 0.75s ease-out;
	        filter: blur(0px);
	        cursor:pointer;
        }

        .card > span {
            text-align: center;
            position: relative;
            top: 175px;
            color: white;
            font-size: 1.4em;
            font-weight: 600;
            cursor:pointer;

        }

        .card.blur > img {
        	filter: blur(1px) grayscale(0.1) saturate(95%);
        }

        .card > .shineLayer {
	        height: 100%;
	        width: 100%;
	        background: linear-gradient(0deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0) 80%);
	        transition: all 0.2s ease-out;
        }

        #home-cards-title{
            text-align: center;
        }
        /* card section css end */
        
        @import url('https://fonts.googleapis.com/css?family=Roboto:400,300,100');
		@import url('https://cdnjs.cloudflare.com/ajax/libs/weather-icons/1.3.2/css/weather-icons.min.css');
		
		.weather_wrapper h1,
		h2,
		h3,
		h4 {
			color: white;
			font-family: 'Roboto';
			font-weight: 100;
			line-height: 1.1;
			letter-spacing: 0.025em;
			margin: 0; padding: 0;
		}
		a {
			color: white;
			opacity: 0.54;
			text-decoration: none;
		}
		a:hover,
		.active {opacity: 1;}
		
		.weather_wrapper {
			width: 480px;
			margin: 0 auto;
		}
		.searchbar,
		.button {
			height: 45px;
			margin: 1em 0 4em;
			padding: 0;
			font: 400 1rem 'Roboto';
			letter-spacing: 0.025em;
			text-transform: uppercase;
			color: white;
			border: none;
		}
		.searchbar {
			float: left;
			width: 380px;
			border-bottom: solid thin white;
			color: #E8E8E8;
			color: rgba(255, 255, 255, 0.7);
		}
		
		.searchbar::-webkit-input-placeholder {color: white; opacity: 0.35;}
		.searchbar::-moz-placeholder {color: white; opacity: 0.35;}
		.searchbar:-ms-input-placeholder {color: white; opacity: 0.35;}
		.searchbar:-moz-placeholder {color: white; opacity: 0.35;}
		
		.button:focus,
		.searchbar:focus {outline: none; color: white;}
		.searchbar:focus::-webkit-input-placeholder {color: white; opacity: 0.7;}
		.searchbar:focus::-moz-placeholder {color: white; opacity: 0.7;}
		.searchbar:focus:-ms-input-placeholder {color: white; opacity: 0.7;}
		.searchbar:focus:-moz-placeholder {color: white; opacity: 0.7;}
		
		.button {
			float: right;
			width: 100px;
		}
		.panel {
			width: 100%;
			display: inline-block;
		}
		.weather {
			width: 100%;
			margin-top: 20px;
			display: inline-block;
		}
		.city {
			text-align: left;
			border-bottom: solid thin white;
			text-transform: uppercase;
			color: #E8E8E8;
			color: rgba(255, 255, 255, 0.7);
		}
		.group {
			width: 165px;
			margin-bottom: 20px;
			text-align: right;
			float: right;
			clear: both;
		}
		.temp {
			font-size: 4.5em;
			font-weight: 300;
			line-height: 0.75;
		}
		.celsius,
		.fahrenheit,
		.divider {
			font-size: 1.75rem;
			vertical-align: super;
		}
		.divider {
			margin: 0 0.05em;
		}
		.forecast {
			display: table;
			text-transform: uppercase;
			width: 100%;
		}
		.block {
			display: table-cell;
			padding: 1.5em 0 0 0;
			text-align: center;
		}
		.high {
			font-weight: 300;
			margin: 0.25em 0;
		}
		
		.secondary {opacity: 0.7;}
		.transparent {background: transparent;}
		.hot {background: #FF5722;}
		.warm {background: #FF6F00;}
		.cool {background: #2196F3;}
		.cold {background: #3F51B5;}
		.color404 {background: #161616;}
		.button-hot {background: #BF360C;}
		.button-warm {background: #B34E00;}
		.button-cool {background: #0D47A1;}
		.button-cold {background: #1A237E;}
		.button404 {background: black;}
  </style>
</head>
<body>
    <!--::header part start::-->
    <%@ include file="common/menubar.jsp" %>
    <!-- Header part end-->

    <!-- main start -->
    <div id="wrap">
      <!-- Showcase -->
      <div class="showcase">
          <div id="showcas-div">
        <h1>Welcome to SEOUL!</h1>
        <p id="welcome_p">
			Get inspired for your journey!
        </p>
        <!-- <a href="#" class="btn">
          Shop Now <i class="fas fa-chevron-right"></i>
        </a> -->
          </div>
        </div>
      <!-- card section start -->
      <div class="card-section">
        <h1 style="margin:10px 0px">Must-visit in Seoul</h1>
        <h4>Please check out the latest travel contents recommended by aligo!</h4>
        <div class="card-list">
          <div class="card" id="card1">
            <img src="${ contextPath }/resources/images/recommend_place_bibimbab.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card2">
            <img src="${ contextPath }/resources/images/recommend_place_lottetower.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card3">
            <img src="${ contextPath }/resources/images/recommend_place_chunggyechun.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card4">
            <img src="${ contextPath }/resources/images/recommend_place_gyungbokgung.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card5">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card6">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card7">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="card8">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
        </div>
      </div>
      <script>
      	 $(function(){
      		topList();
      	});
      	
      	function topList(){
      		$.ajax({
      			url:"topList.do",
      			dataType:"json",
      			success:function(data){
      				console.log(data);
      				$.each(data, function(index, value){
      					console.log(value);
      					var card = "#card" + (index + 1);	
      					
      					$(card).children('img').attr('src',"/spring/resources/tuploadFiles/"+value.tModifyFile);
      					$(card).children('span').html(value.tTitle);
      					$(card).on("click",function(){
      						location.href="topListDetail.do?tId="+value.tId;
      					});
      				});
      			},error:function(){
      				/* alert('Failed to load value!'); */
      				console.log("error card section");
      			}
      		});
      	}
      </script>
      <!-- card section end -->

      <!-- Home cards 1 -->
      <%-- <div id="home-cards-title">
        <h1>aligo theme</h1>
        <h4 style="color:#999">Please check out a variety of information about culture, local food, shopping, activity and take a rest</h4>
        </div>
      <section class="home-cards">
            <div class="theme1" id="theme1">
            <img src="${ contextPath }/resources/images/chicken_food.jpg" alt="">
            <h3>#example_Seoul_Posting</h3>
            <p>
                2020.04 exmple title
            </p>
            <a href="#">Learn More <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="theme2" id="theme2">
            <img src="${ contextPath }/resources/images/gyungbok_palace.jpg" alt="" />
            <h3>#example_Seoul_Posting2</h3>
            <p>
                2020.04 exmple title2
            </p>
            <a href="#">Learn More <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="theme3" id="theme3">
            <img src="${ contextPath }/resources/images/night_street.jpg" alt="" />
            <h3>#example_Seoul_Posting3</h3>
            <p>
                2020.04 exmple title3
            </p>
            <a href="#">Learn More <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="theme4" id="theme4">
            <img src="${ contextPath }/resources/images/korea_market.jpg" alt="" />
            <h3>#example_Seoul_Posting4</h3>
            <p>
                2020.04 exmple title4
            </p>
            <a href="#">Learn More <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="theme5" id="theme5">
                <img src="${ contextPath }/resources/images/samsung_library.jpg" alt="" />
                <h3>#example_Seoul_Posting4</h3>
                <p>
                    2020.04 exmple title4
                </p>
                <a href="#">Learn More <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="theme6" id="theme6">
                <img src="${ contextPath }/resources/images/samsung_library.jpg" alt="" />
                <h3>#example_Seoul_Posting4</h3>
                <p>
                    2020.04 exmple title4
                </p>
                <a href="#">Learn More <i class="fas fa-chevron-right"></i></a>
            </div>
      </section>
      <script>
      	$(function(){
      		themeList();
      	});
      	
      	function themeList(){
      		$.ajax({
      			url:"themeList.do",
      			dataType:"json",
      			success:function(data){
      				$.each(data,function(index, value){
      					var theme = "#theme" + (index + 1);
      					
      					$(theme).children('img').attr('src','/spring/resources/tuploadFiles/'+value.tModifyFile);
      					$(theme).children('h3').html(value.tTitle);
      					$(theme).children('p').html(value.tCreateDate);
      					$(theme).on("click",function(){
      						location.href="themeDetail.do";
      					});
      				});
      			},error:function(){
      				/* alert("page load failed"); */
      				console.log("error");
      			}
      		});
      	};
      </script>
    </div> --%>
    
    <!-- card section start -->
      <div class="card-section">
        <h1 style="margin:10px 0px">aligo theme</h1>
        <h4>Please check out a variety of information about culture, local food, shopping, activity and take a rest</h4>
        <div class="card-list">
          <div class="card" id="theme1">
            <img src="${ contextPath }/resources/images/recommend_place_bibimbab.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="theme2">
            <img src="${ contextPath }/resources/images/recommend_place_lottetower.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="theme3">
            <img src="${ contextPath }/resources/images/recommend_place_chunggyechun.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="theme4">
            <img src="${ contextPath }/resources/images/recommend_place_gyungbokgung.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="theme5">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="theme6">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
          <div class="card" id="theme7">
            <img src="${ contextPath }/resources/images/recommend_place_hanriverpark.jpg"/>
            <span>테스트 일번</span>
          </div>
        </div>
      </div>
      <script>
      	 $(function(){
      		themeList();
      	});
      	
      	function themeList(){
      		$.ajax({
      			url:"themeList.do",
      			dataType:"json",
      			success:function(data){
      				$.each(data, function(index, value){
						var theme = "#theme" + (index + 1);
      					
      					$(theme).children('img').attr('src','/spring/resources/tuploadFiles/'+value.tModifyFile);
      					$(theme).children('span').html(value.tTitle);
      					$(theme).on("click",function(){
      						location.href="themeDetail.do?tId="+value.tId;;
      					});
      				});
      			},error:function(){
      				/* alert("page load failed"); */
      				console.log("error");
      			}
      		});
      	};
      </script>

    <!--::footer_part start::-->
    <%@ include file="common/footer.jsp" %>
    <!--::footer_part end::-->

</body>
</html>