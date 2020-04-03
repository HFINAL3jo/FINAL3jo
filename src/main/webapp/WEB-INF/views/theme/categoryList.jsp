<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="KOR">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>

    <!-- nice select CSS -->
    <link rel="stylesheet" href="resources/css/nice-select.css">
    <link rel="stylesheet" href="resources/css/price_rangs.css">
   
    <style type="text/css"> 
        .floatdiv { 
            position:fixed;
            width:80px; 
            display:inline-block; 
            right:0px; /* 창에서 오른쪽 길이 */ 
            top:80%; /* 창에서 위에서 부터의 높이 */ 
            background-color: transparent; 
            margin:0;
            }
    </style>
       
</head>

<body>
    <div id="goUp"/>
    <!--::header part start::-->
    <%@ include file="../common/menubar.jsp" %>
    <!-- Header part end-->

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Shop Category</h2>
                            <p>Home <span>-</span> Shop Category</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_padding" style="padding-top: 3%; padding-bottom: 0%;">
       	<!-- 인클루드 asside -->
       	<%@ include file="../common/assidetheme.jsp" %>
                
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                
                                <div class="single_product_menu">
                                    <p> 결과에 맞는 데이터가 <span>300</span> 입니다.</p>
                                    <p> 여행 테마 -> 전통 -> 고궁</p>
                                </div>
                                
                                <div class="single_product_menu d-flex">
                                    <div class="input-group">
                                        
                                        <button class="genric-btn success-border" style="width: 90%; height: 100%;">최신순</button>
                                        
                                    </div>
                                    <div class="input-group">
                                        <button class="genric-btn success-border" style="width: 90%; height: 100%;">추전순</button>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row align-items-center latest_product_inner">
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="resources/TestImg/test1.jpg"style="width: 100%; height: 170px">
                                <div class="single_product_text">
                                    <h4>Quartz Belt Watch</h4>
                                    <h3>$150.00</h3>
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="resources/TestImg/test2.jpg" style="width: 100%; height: 170px">
                                <div class="single_product_text">
                                    <h4>Quartz Belt Watch</h4>
                                    <h3>$150.00</h3>
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="resources/TestImg/test3.png" style="width: 100%; height: 170px">
                                <div class="single_product_text">
                                    <h4>Quartz Belt Watch</h4>
                                    <h3>$150.00</h3>
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="resources/TestImg/test4.png" style="width: 100%; height: 170px">
                                <div class="single_product_text">
                                    <h4>Quartz Belt Watch</h4>
                                    <h3>$150.00</h3>
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="resources/TestImg/test5.png" style="width: 100%; height: 170px">
                                <div class="single_product_text">
                                    <h4>Quartz Belt Watch</h4>
                                    <h3>$150.00</h3>
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="resources/TestImg/test6.png" style="width: 100%; height: 170px">
                                <div class="single_product_text">
                                    <h4>Quartz Belt Watch</h4>
                                    <h3>$150.00</h3>
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            <div class="floatdiv" >
                <a href="#goUp" class="fas fa-chevron-up" style="font-size: 50px;"></a>
                <a href="#goDown" class="fas fa-chevron-down" style="font-size: 50px;"></a>
            </div>
    </section>
   	
    <!--::footer_part start::-->

    <%@ include file="../common/footer.jsp"%> 
        
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>
  
    <div id="goDown"/>

   <script>
        window.onmousewheel = function(e){
        	e.preventDefault;
        	var aa = $(window).scrollTop();
        	var bb = $(document).height();
        	var cc = $(window).height();
        	if(Math.floor((aa / (bb - cc)) * 100) >= 75){
        	   var data = new Array(6);   
        	
        	   for(var i in data){
        		   data[i] = document.createElement('div');
        		   data[i].classList.add('col-lg-4 col-sm-6');
        		   $('.col-lg-9').append(data[i]);
        	   }
          	}
       };
    </script>
</body>
</html>