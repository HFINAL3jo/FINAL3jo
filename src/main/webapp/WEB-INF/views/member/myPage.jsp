<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.breadcrumb{
		background-image:url('${contextPath}/resources/images/knocker.jpg');
		background-size: 100% 100%;
	 }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
	  <div class="container">
	    <div class="row justify-content-center">
	      <div class="col-lg-8">
	        <div class="breadcrumb_iner">
	          <div class="breadcrumb_iner_item">
	            <h2>My Page</h2>
	            <p>Home <span>-</span> My Page</p>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
  <!-- breadcrumb start-->
	<%@ include file="../common/assideMyPage.jsp" %>
	 <div class="col-lg-9" >
                    <h3 style="align-self: center;">change password</h3>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center" style="align-self: center;">
                                <h3>${loginUser.nickname }'s Information</h3>
                                <form action="pwdUpdate.do" method="post" style="margin-left: 5%; width: 45%;">
                                
                                    <div class="mt-10">
                                        <input type="text" name="email" value="${ loginUser.email }" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Email address'" required class="single-input" readonly>
                                    </div>
                                     <div class="mt-10">
                                        <input type="text" name="nickname" value="${loginUser.nickname }" <%-- placeholder="${ loginUser.nickname }" --%> onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = '${ loginUser.nickname }'" required class="single-input" style="background-color: rgb(232, 240, 254);" readonly>
                                    </div>
                                    
                                    <div class="mt-10">
                                        <input type="password" id="password" name="password" placeholder="password" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'password'" required class="single-input" style="background-color: rgb(232, 240, 254);">
                                    </div>                                    
                                    <div class="mt-10">
                                        <input type="password" id="passwordchk" name="passwordchk" placeholder="password check" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'password check'" required class="single-input" style="background-color: rgb(232, 240, 254);">
                                    </div>
                                  
									<br>
                                    <input class="genric-btn success-border small" type="submit" value="submit" style="margin-left: 40%;">                                             
                                </form> 
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </section>
    <%@ include file="../common/footer.jsp" %>
    
     <script>		


		$(function() {

			//비밀번호 확인
			$('#passwordchk').blur(function() {
				if ($('#password').val() != $('#passwordchk').val()) {
					if ($('#passwordchk').val() != '') {
						alert("Password is not matched");
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
    </script>
    
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>
</body>
</html>