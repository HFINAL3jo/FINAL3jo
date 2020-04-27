<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link rel="icon" href="resources/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="resources/css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="resources/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="resources/css/style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<!-- Font Awesome link -->
<link rel="stylesheet" href="resources/css/balloon.min.css">
<!-- balloon css -->
<style>
#weather_1 {
	cursor: pointer;
}

@import
	url("https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900")
	;

.weather_container {
	font-family: 'Montserrat', sans-serif;
	/* background: #112233; */
}

.weather-card {
	margin: 60px auto;
	height: 550px;
	width: 350px;
	background: #fff;
	box-shadow: 0 1px 38px rgba(0, 0, 0, 0.15), 0 5px 12px
		rgba(0, 0, 0, 0.25);
}

.weather-card .top {
	position: relative;
	height: 400px;
	width: 100%;
	background:
		url("https://s-media-cache-ak0.pinimg.com/564x/cf/1e/c4/cf1ec4b0c96e59657a46867a91bb0d1e.jpg")
		no-repeat;
	background-size: cover;
	background-position: center center;
	text-align: center;
}

.weather-card .top .wrapper {
	padding: 30px;
	position: relative;
	z-index: 1;
}

.weather-card .top .wrapper .mynav {
	height: 20px;
}

.weather-card .top .wrapper .mynav .lnr {
	color: #fff;
	font-size: 20px;
}

.weather-card .top .wrapper .mynav .lnr-chevron-left {
	display: inline-block;
	float: left;
}

.weather-card .top .wrapper .mynav .lnr-cog {
	display: inline-block;
	float: right;
}

.weather-card .top .wrapper .heading {
	margin-top: 20px;
	font-size: 35px;
	font-weight: 400;
	color: #fff;
}

.weather-card .top .wrapper .location {
	margin-top: 20px;
	font-size: 21px;
	font-weight: 400;
	color: #fff;
}

.weather-card .top .wrapper .temp {
	margin-top: 20px;
}

.weather-card .top .wrapper .temp a {
	text-decoration: none;
	color: #fff;
}

.weather-card .top .wrapper .temp a .temp-type {
	font-size: 85px;
}

.weather-card .top .wrapper .temp .temp-value {
	display: inline-block;
	font-size: 85px;
	font-weight: 600;
	color: #fff;
}

.weather-card .top .wrapper .temp .deg {
	display: inline-block;
	font-size: 35px;
	font-weight: 600;
	color: #fff;
	vertical-align: top;
	margin-top: 10px;
}

.weather-card .top:after {
	content: "";
	height: 100%;
	width: 100%;
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
}

.weather-card .bottom {
	padding: 0 30px;
	background: #fff;
}

.weather-card .bottom .wrapper .forecast {
	overflow: hidden;
	margin: 0;
	font-size: 0;
	padding: 0;
	padding-top: 30px;
	max-height: 155px;
}

.weather-card .bottom .wrapper .forecast a {
	text-decoration: none;
	color: #000;
}

.weather-card .bottom .wrapper .forecast .go-up {
	text-align: center;
	display: block;
	font-size: 25px;
	margin-bottom: 10px;
}

.weather-card .bottom .wrapper .forecast li {
	display: block;
	font-size: 25px;
	font-weight: 400;
	color: rgba(0, 0, 0, 0.25);
	line-height: 1em;
	margin-bottom: 30px;
}

.weather-card .bottom .wrapper .forecast li .date {
	display: inline-block;
}

.weather-card .bottom .wrapper .forecast li .condition {
	display: inline-block;
	vertical-align: middle;
	float: right;
	font-size: 25px;
}

.weather-card .bottom .wrapper .forecast li .condition .temp {
	display: inline-block;
	vertical-align: top;
	font-family: 'Montserrat', sans-serif;
	font-size: 20px;
	font-weight: 400;
	padding-top: 2px;
}

.weather-card .bottom .wrapper .forecast li .condition .temp .temp-type
	{
	font-size: 20px;
}

.weather-card .bottom .wrapper .forecast li.active {
	color: rgba(0, 0, 0, 0.8);
}

.weather-card.rain .top {
	background:
		url("http://img.freepik.com/free-vector/girl-with-umbrella_1325-5.jpg?size=338&ext=jpg")
		no-repeat;
	background-size: cover;
	background-position: center center;
}

.weather-card.snow .top {
	background:
		url("https://image.freepik.com/free-vector/reindeers-on-the-snow-blue-background_1048-355.jpg")
		no-repeat;
	background-size: cover;
	background-position: center center;
}

.weather-card.cloudy .top {
	background:
		url("http://www.freeapplewallpapers.com/wp-content/uploads/2013/06/Thick-Dark-Cloud.jpg")
		no-repeat;
	background-size: cover;
	background-position: center center;
}

.weather-card.sunny .top {
	background: url("http://cdn.wallpapersafari.com/28/97/RWOUId.jpg")
		no-repeat;
	background-size: cover;
	background-position: center center;
}
</style>
</head>
<body>
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
	<!--::header part start::-->
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="main.do"> <img
							src="${ contextPath }/resources/images/logo.png" alt="logo"
							width="100" height="40">
						</a>
						<button class="navbar-toggler collapsed" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<!-- <li class="nav-item">
                                    <a class="nav-link" href="main.do">Home</a>
                                </li> -->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Theme </a>
									<div class="dropdown-menu" id="theme"
										aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="theme.do?keyword=Nature">Nature
											Theme</a> <a class="dropdown-item"
											href="theme.do?keyword=Restaurant">Restaurant Theme</a> <a
											class="dropdown-item" href="theme.do?keyword=History">History
											Theme</a> <a class="dropdown-item"
											href="theme.do?keyword=Shopping">Shopping Theme</a> <a
											class="dropdown-item" href="theme.do?keyword=Bar">Bar
											Theme</a> <a class="dropdown-item"
											href="theme.do?keyword=Activity">Activity Theme</a> <a
											class="dropdown-item" href="theme.do?keyword=Exhibition">Exhibition
											Theme</a>
									</div></li>
								<li class="nav-item"><a class="nav-link"
									href="blogListView.do">Posting</a></li>
								<li class="nav-item"><a class="nav-link"
									href="recommend.do"> Recommended </a></li>
								<li class="nav-item"><a class="nav-link"
									href="contactView.do">Q & A</a></li>
							</ul>
						</div>

						<div class="hearer_icon d-flex">
							<div>
								<img id="weather_1"
									src="${ contextPath }/resources/images/weather_icon.png"
									style="width: 24px; height: 24px; opacity: 0.7;">
								<div class="weather_container">
									<div class="row">
										<div class="col">
											<div class="weather-card">
												<div class="top">
													<div class="wrapper">
														<div class="mynav">
															<a href="javascript:;"><span
																class="lnr lnr-chevron-left"></span></a> <a
																href="javascript:;"><span class="lnr lnr-cog"></span></a>
														</div>
														<h1 class="heading" id="weather_name">Rainy day</h1>
														<h3 class="location">Seoul, Korea</h3>
														<p class="temp">
															<span class="temp-value" id="temp_value">16</span>
														</p>
													</div>
												</div>
												<div class="bottom">
													<div class="wrapper">
														<ul class="forecast">
															<a href="javascript:;"><span
																class="lnr lnr-chevron-up go-up"></span></a>
															<li class="active"><span class="date">Yesterday</span>
																<span class="lnr lnr-cloud condition"> <span
																	class="temp" id="yesterday_temp">22</span>
															</span></li>
															<li><span class="date">Tomorrow</span> <span
																class="lnr lnr-cloud condition"> <span
																	class="temp" id="tomorrow_temp">18</span>
															</span></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<a id="search_1" href="javascript:void(0)"><i
									class="ti-search"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- 로그인 전 -->
								<c:if test="${ empty sessionScope.loginUser }">
									<span data-balloon="Sign In" data-balloon-pos="down-right">
										<a href="loginView.do" style="color: rgba(0, 0, 0, .9);">
											<i class="fas fa-sign-in-alt" style="margin-left: 0px;">
												Sign-In </i>
									</a>
									</span>
								</c:if>

								<!-- 로그인 후 -->
								<c:if test="${ !empty sessionScope.loginUser }">
									<c:if test='${ sessionScope.loginUser.email == "ADMIN" }'>
										<a href="adminView.do"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
											data-balloon="Admin" data-balloon-pos="down-right"> <i
												class="fas fa-user-circle" style="margin-left: 0px;"></i>
										</span>
									</c:if>
									<c:if test='${ sessionScope.loginUser.email != "ADMIN" }'>
										</a>
										<a href="myPage.do"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
											data-balloon="My Page" data-balloon-pos="down-right">
												<i class="fas fa-user-circle" style="margin-left: 0px;"></i>
										</span>
										</a>
										<c:url var="like" value="likedList.do">
											<c:param name="mId" value="${sessionScope.loginUser.mid }"/>
										</c:url>
										<a href="${like }"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
											data-balloon="Likes" data-balloon-pos="down-right"> <i
												class="far fa-heart" style="margin-left: 0px;"></i>
										</span>
									</c:if>
									</a>
									<a href="logout.do"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										data-balloon="Sign Out" data-balloon-pos="down-right">
											<i class="fas fa-sign-out-alt" style="margin-left: 0px;"></i>
									</span>
									</a>
								</c:if>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form action="theme.do"
					class="d-flex justify-content-between search-inner">
					<input type="text" name="keyword" class="form-control"
						id="search_input" list="sl"
						placeholder="Search Here and Press Enter Key">
					<datalist id="sl">
						<%--  <c:forEach var="" begin="" end="" items="">
                    	
                    	</c:forEach> --%>
					</datalist>
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
					<input type="hidden" name="searchValue" value="1">
				</form>
			</div>
		</div>

		<script>
			$(function() {
				$('.weather_container').hide();
				$('.weather_container').css('position', 'fixed');
				$('#weather_1').on("click", function() {
					$('.weather_container').slideToggle();
				});

			});
			var apiURI = "https://api.openweathermap.org/data/2.5/onecall?lat=37.57&lon=126.98&appid="
					+ "cbb2ea4f1ab7a72a57e98ecd56c439a3";
			$
					.ajax({
						url : apiURI,
						dataType : "json",
						type : "GET",
						async : "false",
						success : function(data) {
							console.log(data);
							console.log("현재온도 : "
									+ (data.current.temp - 273.15));

							var weatherId = data.current.weather[0].id
									.toString();
							var weatherName = data.current.weather[0].main;
							var temp = (data.current.temp - 273.15).toFixed(1);
							var tomorrowTemp = (data.daily[0].temp.day - 273.15)
									.toFixed(1);

							if (weatherId.charAt(0) == '2'
									|| weatherId.charAt(0) == '3'
									|| weatherId.charAt(0) == '5') {
								$('.weather-card').attr('class',
										'weather-card rain');
								$('#weather_name').text(weatherName);
								$('#temp_value').text(temp + " ℃");
								$('#tomorrow_temp').text(tomorrowTemp + " ℃");

							} else if (weatherId.charAt(0) == '6'
									|| weatherId.charAt(0) == '7') {
								$('.weather-card').attr('class',
										'weather-card snow');
								$('#weather_name').text(weatherName);
								$('#temp_value').text(temp + " ℃");
								$('#tomorrow_temp').text(tomorrowTemp + " ℃");

							} else if (weatherId == '800') {
								$('.weather-card').attr('class',
										'weather-card sunny');
								$('#weather_name').text(weatherName);
								$('#temp_value').text(temp + " ℃");
								$('#tomorrow_temp').text(tomorrowTemp + " ℃");

							} else if (weatherId.charAt(0) == '8'
									&& weatherName.includes("cloud")) {
								$('.weather-card').attr('class',
										'weather-card cloudy');
								$('#weather_name').text(weatherName);
								$('#temp_value').text(temp + " ℃");
								$('#tomorrow_temp').text(tomorrowTemp + " ℃");

							} else {
								$('.weather-card').attr('class',
										'weather-card sunny');
								$('#weather_name').text(weatherName);
								$('#temp_value').text(temp + " ℃");
								$('#tomorrow_temp').text(tomorrowTemp + " ℃");

							}
						}
					});
		</script>


	</header>

	<!-- Header part end-->

	<!-- jquery plugins here-->

	<script src="resources/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="resources/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="resources/js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="resources/js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="resources/js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="resources/js/owl.carousel.min.js"></script>
	<!-- <script src="resources/js/jquery.nice-select.min.js"></script> -->
	<!-- slick js -->
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/jquery.counterup.min.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/contact.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/jquery.form.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/mail-script.js"></script>
	<!-- custom js -->
	<script src="resources/js/custom.js"></script>

	<script>
		//datalist 추가 예정
		$('#search_input').on('click keyup', function() {
			ajax({

			});
		});
		$('#navbarDropdown_1').click(function() {
			location.href = "theme.do?keyword=";
		});
	</script>
</body>
</html>