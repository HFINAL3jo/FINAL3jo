<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Get inspired for your journey! - aligo</title>
<style>
ul[class~=social-icons]>li {
	font-size: 2em;
	display: inline;
}
.breadcrumb{
  	background-image:url('${contextPath}/resources/images/hanbok.jpg');
    background-size: 100% 100%;
  }
</style>
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
						<div class="breadcrumb_iner_item" style="height:760px;">
							<h2 style="font-size:4em;">Login</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================login_part Area =================-->
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
							<h3>
								Welcome Back ! <br> Please Sign in now
							</h3>
							<form class="row contact_form" action="login.do" method="post">
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="email" name="email" placeholder="e-mail">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Password">
								</div>
								<div class="col-md-12 form-group">
									<br>
									<button type="submit" value="submit" class="btn_3">
										log in</button>
										
										
									<input type="button" class="btn_3" style="width:100%;" id="bs" value="Sign up">
									  
									<a class="lost_pass" id="find" style="cursor: pointer;">forgot your password?</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================login_part end =================-->

	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->


	<script src="resources/js/stellar.js"></script>
	<script src="resources/js/price_rangs.js"></script>
	<script>
		 $('#bs').click(function(){
			location.href="signUp.do";
		 });
		 
		 
		 $('#find').click(function(){
			 location.href="findPwd.do";
		 });
		 
		 var start = $('.login_part padding_top').offset();
		 
		 window.setTimeout(function(){
				var offset=window.innerHeight;
				$('html,body').stop().animate({scrollTop:'800'},800);
				$('#email').focus();	
				}, 200);
	</script>
</body>

</html>