<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="zxx">
<!-- @import 'https://fonts.googleapis.com/css?family=Dosis|Roboto:300,400';
h3{
font-family: 'Dosis' !important;
} -->

<head>
<style>
input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus
	{
	border-bottom: 2px solid #ff3368 !important;
	color: #ff3368 !important;
	transition: 0.2s ease;
}

/* 성별css */
input, input[type="radio"]+label, input[type="checkbox"]+label:before,
	select option, select {
	width: 100%;
	padding: 1em;
	line-height: 1.4;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}
/* 지워도 되나 */
input:focus {
	outline: 0;
	border-color: #64ac15;
}
/* 지워도 되나 */
input:focus+.input-icon i {
	color: #7ed321;
}
/* 지워도 되나 */
input:focus+.input-icon:after {
	border-right-color: #7ed321;
}
/* 꼭 필요 */
input[type="radio"] {
	display: none;
}
/* 꼭 필요 */
input[type="radio"]+label, select {
	display: inline-block;
	width: 50%;
	text-align: center;
	float: left;
	border-radius: 0;
}
/* 지워도 될 듯 */
input[type="radio"]+label:first-of-type {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}
/* 지워도 될 듯 */
input[type="radio"]+label:last-of-type {
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}
/* 지워도 될 듯 */
input[type="radio"]+label i {
	padding-right: 0.4em;
}
/* 색 주는 거 */
input[type="radio"]:checked+label, input:checked+label:before, select:focus,
	select:active {
	background-color: #7ed321;
	color: #fff;
	border-color: #64ac15;
}
/* 꼭 필요 */
input[type="checkbox"] {
	display: none;
}
/* 위치 조절 */
input[type="checkbox"]+label {
	position: relative;
	display: block;
	padding-left: 1.6em;
}
/* 체크박스 생기게 함 */
input[type="checkbox"]+label:before {
	position: absolute;
	top: 0.2em;
	left: 0;
	display: block;
	width: 1em;
	height: 1em;
	padding: 0;
	content: "";
}
/* 얘도 약간 체크박스 달라짐 */
input[type="checkbox"]+label:after {
	position: absolute;
	top: 0.45em;
	left: 0.2em;
	font-size: 0.8em;
	color: #fff;
	opacity: 0;
	font-family: FontAwesome;
	content: "\f00c";
}
/* 체크박스 약간 달라짐 */
input:checked+label:after {
	opacity: 1;
}

/* ---//여기까지가 녹색 */
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
</head>

<body>
	<!--::header part start::-->
	<%@ include file="../common/menubar.jsp"%>
	<!-- Header part end-->


	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Sign Up</h2>
							<p>
								Home <span>-</span> Sign Up
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================sign_up part Area =================-->
	<section class="login_part padding_top">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<img src="img/korea/mainpic/wctk.jpg">
					<div class="login_part_text text-center"
						style="padding: 5%; display: none;">
						<!-- <div class="login_part_text_iner">
                            <h2>New to our Shop?</h2>
                            <p>There are advances being made in science and technology
                                everyday, and a good example of this is the</p>
                            <a href="#" class="btn_3">Create an Account</a>
                        </div> -->
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="login_part_form">
						<div class="login_part_form_iner">
							<h3>CREATE YOUR ACCOUNT</h3>
							<form class="row contact_form" method="post"
								novalidate="novalidate">
								<div class="col-md-12 form-group p_star">
									<input type="email" class="form-control" id="email"
										name="email" value="" placeholder="E-mail"> <span
										class="guide ok">사용가능 합니다</span> <span class="guide error">중복 된 이메일이 있습니다</span>
									<input type="hidden" name="idDuplicateCheck"
										id="idDuplicateCheck" value="0">
									<button type="button" class="btn_3">인증하기</button>

								</div>
								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="password"
										name="password" value="" placeholder="Password">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="passwordchk"
										name="passwordchk" value="" placeholder="Password check">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="nickname"
										name="nickname" placeholder="Nickname">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="number" max="99" min="10" class="form-control" id="age" name="age"
										placeholder="age">
								</div>



								<div class="col-md-12 form-group p_star" id="input-group">
									<input type="radio" name="gender" value="M" id="M" /> <label
										for="M">Male</label> <input type="radio" name="gender"
										value="F" id="F" /> <label for="F">Female</label>
								</div>



								<div class="col-md-12 form-group p_star">
									<input type="button" class="btn_3" value="취향선택하러가기"><a
										href="recommend.do"></a>
								</div>

								<div class="col-md-12 form-group">
									<!-- 									<div class="creat_account d-flex align-items-center">
										<input type="checkbox" id="f-option" name="selector">
										<label for="f-option">Remember me</label>
									</div> -->
									<br>
									<!-- 									<ul class="social-icons text-right">
										<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
										<li><a href="#"><i class="fab fa-twitter"></i></a></li>
										<li><a href="#"><i class="fas fa-globe"></i></a></li>
									</ul> -->
									<button type="submit" value="submit" class="btn_3">
										SIGN UP</button>
									<a class="lost_pass" href="#">forget password?</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================sign_up part end =================-->

	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->

	<script src="resources/js/stellar.js"></script>
	<script src="resources/js/price_rangs.js"></script>



	<!-- ■■■■■■■■■■■■ Script part ■■■■■■■■■■■■-->

	<script>
		function validate(){
			
			// 아이디 중복 체크 여부
			if($("idDuplicateCheck").val()==0){
				// $ : 제이쿼리가 필요하다.
				// 상단에 제이쿼리 적용하지 않았다. 근데 왜 사용가능한가?
				// 상단에 인클루드 된 메뉴바.jsp에 제이쿼리가 적용되어 있기 때문에
				
				alert("사용 가능한 아이디를 입력해주세요");
				$("#email").focus();
				return false;
			} else{
				return true;	 // 왜그런지 녹음강의 확인
			}
		}
		
		$(function(){
			
			$('#email').on("keyup",function(){
							// 키가 눌렸다 떼어졌을 때 이벤트 발생
				var userId = $(this).val();
							
				if(userId.length <5){
					$(".guide").hide();
					$("#idDuplicateCheck").val(0);
					
					return; // 길이제한 관련
				}
				
				$.ajax({
					url:"idCheck.do",
					data:{email:email}, // 넘겨주는데이터? .. 다시 음성강의 확인해보기
					type:"post",
					success:function(data){ // 성공했을때의 데이터
						console.log(data);
					if(data == "ok"){
						$(".error").hide();
						$(".ok").show();
						$("#idDuplicateCheck").val(1);
					} else{
						$(".ok").hide();
						$(".error").show();
						$("#idDuplicateCheck").val(0);
					}
						
					},error:function(){
						console.log("ajax 처리 실패")
					}
				});
			});
		});
	
	</script>

		</body>

		</html>
	