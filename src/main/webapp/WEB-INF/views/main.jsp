<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Welcome to aligo!</title>
  <style>
  	/* Showcase */
        .showcase {
	        margin-top: 5.5%;
	        width: 100%;
	        margin-left: auto;
	        margin-right: auto;
	        height: 400px;
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

        .showcase h2, .showcase p {
	        margin-bottom: 10px;
	        color: white;
        }

        .showcase .btn {
        	margin-top: 20px;
        }

        /* Home cards */
        .home-cards {
	        width: 80%;
	        margin-left: auto;
	        margin-right: auto;
	        display: grid;
	        grid-template-columns: repeat(3, 1fr);
	        grid-gap: 20px;
	        margin-bottom: 40px;
	        margin-top: 2%;
        }

        .home-cards img {
	        width: 100%;
	        max-height: 220px;
	        margin-bottom: 20px;
        }

        .home-cards h3 {
       	 margin-bottom: 5px;
        }

        .home-cards a {
	        display: inline-block;
	        padding-top: 10px;
	        color: #0067b8;
	        text-transform: uppercase;
	        font-weight: bold;
        }

        .home-cards a:hover i {
        	margin-left: 10px;
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
        <h2>Welcome to SEOUL!</h2>
        <p>
			Get inspired by your travels!
        </p>
        <!-- <a href="#" class="btn">
          Shop Now <i class="fas fa-chevron-right"></i>
        </a> -->
          </div>
        </div>
      <!-- card section start -->
      <div class="card-section">
        <h1 style="margin:10px 0px">Where you have to go</h1>
        <h4>Please check out the hot places aligo recommend</h4>
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
        </div>
      </div>
      <script>
      	 $(function(){
      		topList();
      		
      		$('.card').on("click",function(){
      			location.href="/spring/categoryList.jsp";
      		});
      		
      	});
      	
      	function topList(){
      		$.ajax({
      			url:"topList.do",
      			dataType:"json",
      			success:function(data){
      				$.each(data, function(index, value){
      					
      					var card = "#card" + (index + 1);	
      					
      					$(card).children('img').attr('src',"/spring/resources/tuploadFiles/"+value.tModifyFile);
      					$(card).children('span').html(value.tTitle);
      					$(card).on("click",function(){
      						location.href="topListDetail.do";
      					});
      				});
      			},error:function(){
      				/* alert('Failed to load value!'); */
      				console.log("error card section");
      			}
      		});
      	}
      </script>
      
      <!-- <div class="card-section">
        <h1>aligo theme</h1>
        <h4>Hover over the picture to get an awesome 3d parallax effect</h4>
        <div class="card-list">
          <div class="card">
            <img src="https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=320"/>
          </div>
          <div class="card">
            <img src="https://images.unsplash.com/photo-1518365428912-757c887d86c0?w=320"/>
          </div>
          <div class="card">
            <img src="https://images.unsplash.com/photo-1489573280374-2e193c63726c?w=320"/>
          </div>
          <div class="card">
            <img src="https://images.unsplash.com/photo-1535190878546-79d24dae2530?w=320"/>
          </div>
          <div class="card">
            <img src="https://images.unsplash.com/photo-1494675006433-9e9428eba6c7?w=320"/>
          </div>
        </div>
      </div> -->
      <!-- card section end -->

      <!-- Home cards 1 -->
      <div id="home-cards-title">
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
    </div>

    <!--::footer_part start::-->
    <%@ include file="common/footer.jsp" %>
    <!--::footer_part end::-->

</body>
</html>