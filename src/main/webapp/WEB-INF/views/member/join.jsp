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
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus
	{
	border-bottom: 2px solid #0067b8 !important;
	color: #0067b8 !important;
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
	cursor: pointer;
}
/* 지워도 되나 */
input:focus {
	outline: 0;
	border-color: #848484;
}
/* 지워도 되나 */
input:focus+.input-icon i {
	color: #adadad;
}
/* 지워도 되나 */
input:focus+.input-icon:after {
	border-right-color: #cccccc;
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
	background-color: #cccccc;
	color: #fff;
	border-color: #848484;
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

/* 비밀번호 보이기 */
.input .eyes {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto 2px;
	height: 30px;
	font-size: 22px;
	cursor: pointer;
}
.breadcrumb{
  	background-image:url('${contextPath}/resources/images/hanbok.jpg');
    background-size: 100% 100%;
  }
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Get inspired for your journey! - aligo</title>
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
					<img src="resources/images/seoul-5.jpg"> 
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
							<form class="row contact_form" action="signUp.do" method="post">

								<%
										request.setCharacterEncoding("UTF-8");
										String email = request.getParameter("e_mail");
									%>


								<div class="col-md-12 form-group p_star">
									<input type=text class="form-control" name="email" value="${ email }" readonly>
								</div>

								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="password"
										name="password" value="" placeholder="Password" required>
								</div>

								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="passwordchk"
										name="passwordchk" value="" placeholder="Password check" required>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="nickname"
										name="nickname" placeholder="Nickname" required>
										
										<span id="ok" style="display: none;" class="guide ok">
										Your Nickname is Available</span> 
										<span id="error" style="display: none;"
										class="guide error">Your Nickname is Not Available</span> 
										
											<input type="hidden" name="nickDuplicateCheck" id="nickDuplicateCheck"
										value="0" required>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="number" max="99" min="10" class="form-control"
										id="age" name="age" placeholder="age" required>
								</div>

								<div class="col-md-12 form-group p_star" id="input-group">
									<input type="radio" name="gender" value="M" id="M"/> <label
										for="M">Male</label> <input type="radio" name="gender"
										value="F" id="F"/> <label for="F">Female</label>
								</div>

<!-- 								<div class="col-md-12 form-group">
									<input type="button" class="btn_3" value="go to recommend"><a
										href="recommend.do"></a>
								</div> -->

								<div class="col-md-12 form-group">
									<button type="submit" value="submit" class="btn_3"
										href="index.jsp">SIGN UP</button>
								</div>
								<br>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->

	<script src="resources/js/stellar.js"></script>
	<script src="resources/js/price_rangs.js"></script>



	<!-- ■■■■■■■■■■■■ Script part ■■■■■■■■■■■■ -->


	<script>
 	
		$(function() {

			//비밀번호 확인
			$('#passwordchk').blur(function() {
				if ($('#password').val() != $('#passwordchk').val()) {
					if ($('#passwordchk').val() != '') {
						alert("not matched password");
						$('#passwordchk').val('');
						$('#passwordchk').focus();
					}
				}
			})
		});
		
		
		
		$("#password").change(function(){
		    checkPassword($('#password').val());
		});
		function checkPassword(password){
		    
		    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
		        alert('8 digits in combination of numbers + alphabetic characters + special characters');
		        $('#password').val('').focus();
		        return false;
		    } 
		    }
		

		   var nickCheck = 0;
			/*닉네임 중복체크*/
		 	function validate() {

				if ($("nickDuplicateCheck").val() == 0) {

					alert("Your Nickname is Not Available");
					$("#nickname").focus();
					return false;
				} else {
					return true;
				}
			}

			$(function() {

				$('#nickname').on("keyup", function() {

					var nickname = $(this).val();

					if (nickname.length < 6) {
						$(".guide").hide();
						$("#nickDuplicateCheck").val(0);

						return;
					}

					$.ajax({
						url : "nickCheck.do",
						data : {
							nickname : nickname
						},
						type : "post",
						success : function(data) {
							console.log(data);
							if (data == "ok") {
								$(".error").hide();
								$(".ok").show();
								$("#nickDuplicateCheck").val(1);
								$('.btn_3').attr('disabled',false); 

								
								
							} else {
								$(".ok").hide();
								$(".error").show();
								$("#nickDuplicateCheck").val(0);
								$('.btn_3').attr('disabled',true); 

								
							}

						},
						error : function() {
							console.log("ajax 처리 실패")
						}
					});
				});
			});
			
			
			$("#nickname").change(function(){
			    checknickname($('#nickname').val());
			});
			function checknickname(nickname){
			    
			    if(!(/^.{4,12}$/).test(nickname)){            
			        alert('Between 4 ~ 12');
			        $('#nickname').val('').focus();
			        return true;
			    } 
			    }
			
			
		
		
	</script>
</body>

</html>
