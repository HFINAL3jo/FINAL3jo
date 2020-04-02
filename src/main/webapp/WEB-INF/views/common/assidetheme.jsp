<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span style="text-align: center;"><h2>여행은 언제나 돈의 문제가 아니라 용기의 문제다. -파올로 코엘료-</h2></span>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>어디로 가고 싶으세요.</h3>
                            </div>
                            <div class="widgets_inner">
                                <div class="switch-wrap d-flex justify-content-between">
                                    <p>테마별 선택</p>
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
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>-switch 클릭시 아래에 내용 출력 여행 분석 클릭시</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li> 여행 조건 선택 1 </li>
                                    <li> 여행 조건 선택 2 </li>
                                    <li> 여행 조건 선택 3 </li>
                                    <li> 여행 조건 선택 4 </li>
                                    <li> 여행 조건 선택 5 </li>
                                </ul>
                                <ul class="list">
                                    <li> 테마 별 선택 시 </li>
                                    <li>
                                        <h6>배고파(음식).</h6>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha">
                                            <label for="ha"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <h6>맞기전 까지는 계획이 있다.</h6>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha2">
                                            <label for="ha2"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <h6>Hellow World.</h6>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha3">
                                            <label for="ha3"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <h6>이제 자자 피곤하다.</h6>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha4">
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
</body>
</html>