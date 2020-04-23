<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span style="text-align: center;"><h2 id="titlebar" style="margin-left:8%;">
		Your Interest</h2></span>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <!-- <h3>어디로 가고 싶으세요.</h3> -->
                            </div>
                            <div class="widgets_inner">
                                <div class="switch-wrap d-flex justify-content-between">
                                    <p>View by Theme</p>
                                    <div class="primary-switch">
                                        <input type="checkbox" id="primary-switch" checked="">
                                        <label for="primary-switch"></label>
                                    </div>
                                </div>
                                <div class="switch-wrap d-flex justify-content-between">
                                    <p>여행 분석 선택</p>
                                    <div class="confirm-switch">
                                        <input type="checkbox" id="confirm-switch">
                                        <label for="confirm-switch"></label>
                                    </div>
                                </div>
                             <button type="button" id="svf" class="btn btn-outline-primary" style="width:100%;">Reset Findings</button>
                             <br><br>
                             <c:if test="${!empty loginUser }">
                             <button id="wb" type="button" class="btn btn-outline-danger" style="width:200px; height:50px;">Write Post</button></c:if>
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>-switch 클릭시 아래에 내용 출력 여행 분석 클릭시</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li> user 맞춤 테마 목록 뿌려주기만 버튼 X </li>
                                    <li> 사용자 테마1 </li>
                                    <li> 사용자 테마2 </li>
                                    <li> 사용자 테마3 </li>
                                    <li> 사용자 테마4 </li>
                                </ul>
                                <ul class="list">
                                    <h5>By Place</h5><br>
                                    <li>
                                        <label>Restaurant</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha2" checked="checked">
                                            <label for="ha2"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>Bar</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha4" checked="checked">
                                            <label for="ha4"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>Nature</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha" checked="checked">
                                            <label for="ha"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>History</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha3" checked="checked">
                                            <label for="ha3"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>Shopping</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha4" checked="checked">
                                            <label for="ha4"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>Activity</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha4" checked="checked">
                                            <label for="ha4"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>Exhibition</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha4" checked="checked">
                                            <label for="ha4"></label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </aside>
                        <!-- <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>Filter</h3>
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
                        </aside> -->

                        <!-- <aside class="left_widgets p_filter_widgets price_rangs_aside">
                            <div class="l_w_title">
                                <h3>Price Filter</h3>
                            </div>
                            <div class="widgets_inner">
                                <div class="range_item"> -->
                                    <!-- <div id="slider-range"></div> -->
                                    <!-- <input type="text" class="js-range-slider" value="" />
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
                        </aside> -->
                    </div>
                </div>
  <script>
  	$('#wb').click(function(){
  		location.href="themeInsertView.do";
  	});
  </script>
</body>
</html>