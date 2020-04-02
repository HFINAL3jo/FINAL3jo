<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>aranoz</title>
  
</head>
<body>
    <div class="col-lg-3">
        <div class="left_sidebar_area">
            <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                    <h3>Browse Categories</h3>
                </div>
                <div class="widgets_inner">
                    <ul class="list">
                        <li>
                            <a href="#">Frozen Fish</a>
                            <span>(250)</span>
                        </li>
                        <li>
                            <a href="#">Dried Fish</a>
                            <span>(250)</span>
                        </li>
                        <li>
                            <a href="#">Fresh Fish</a>
                            <span>(250)</span>
                        </li>
                        <li>
                            <a href="#">Meat Alternatives</a>
                            <span>(250)</span>
                        </li>
                        <li>
                            <a href="#">Fresh Fish</a>
                            <span>(250)</span>
                        </li>
                        <li>
                            <a href="#">Meat Alternatives</a>
                            <span>(250)</span>
                        </li>
                        <li>
                            <a href="#">Meat</a>
                            <span>(250)</span>
                        </li>
                    </ul>
                </div>
                <br>
                <!--Write button-->
                <div align="center"><button id="wb" type="button" class="btn btn-outline-danger" style="width:200px; height:50px;">Write Post</button></div>
            </aside>

            <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                    <h3>Product filters</h3>
                </div>
                <div class="widgets_inner">
                    <ul class="list">
                        <li>
                            <a href="#">Apple</a>
                        </li>
                        <li>
                            <a href="#">Asus</a>
                        </li>
                        <li class="active">
                            <a href="#">Gionee</a>
                        </li>
                        <li>
                            <a href="#">Micromax</a>
                        </li>
                        <li>
                            <a href="#">Samsung</a>
                        </li>
                    </ul>
                    <ul class="list">
                        <li>
                            <a href="#">Apple</a>
                        </li>
                        <li>
                            <a href="#">Asus</a>
                        </li>
                        <li class="active">
                            <a href="#">Gionee</a>
                        </li>
                        <li>
                            <a href="#">Micromax</a>
                        </li>
                        <li>
                            <a href="#">Samsung</a>
                        </li>
                    </ul>
                </div>
            </aside>

            <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                    <h3>Color Filter</h3>
                </div>
                <div class="widgets_inner">
                    <ul class="list">
                        <li>
                            <a href="#">Black</a>
                        </li>
                        <li>
                            <a href="#">Black Leather</a>
                        </li>
                        <li class="active">
                            <a href="#">Black with red</a>
                        </li>
                        <li>
                            <a href="#">Gold</a>
                        </li>
                        <li>
                            <a href="#">Spacegrey</a>
                        </li>
                    </ul>
                </div>
            </aside>

            <aside class="left_widgets p_filter_widgets price_rangs_aside">
                <div class="l_w_title">
                    <h3>Price Filter</h3>
                </div>
                <div class="widgets_inner">
                    <div class="range_item">
                        <!-- <div id="slider-range"></div> -->
                        <input type="text" class="js-range-slider" value="" />
                        <div class="d-flex">
                            <div class="price_text">
                                <p>Price :</p>
                            </div>
                            <div class="price_value d-flex justify-content-center">
                                <input type="text" class="js-input-from" id="amount" readonly />
                                <span>to</span>
                                <input type="text" class="js-input-to" id="amount" readonly />
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
     </div>
 <script>
 	$('#wb').click(function(){
 		location.href="blogInsert.do";	
 	});
 </script>
</body>
</html>