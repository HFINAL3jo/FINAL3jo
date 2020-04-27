<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Aligo</title>
    <link rel="stylesheet" href="resources/css/nice-select.css">
   
    <link rel="stylesheet" href="resources/css/price_rangs.css">
<style type="text/css">
	.breadcrumb{
		background-image:url('${contextPath}/resources/images/knocker.jpg');
		background-size: 100% 100%;
	 }
</style>
</head>

<body>
    <!--::header part start::-->
   <%@ include file="../common/menubar.jsp"%>
    <!-- Header part end-->

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Delete Account</h2>
                            <p>Home <span>-</span> My Profile</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <%@ include file="../common/assideMyPage.jsp" %>
                <div class="col-lg-9" >
                    <h3 style="align-self: center;">Delete Account</h3>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center" style="align-self: center;">
                        		<h3>Are you sure you want to unsubscribe😢</h3>                        		
                                <form role="form" method="post" action="/member/deleteMember" id="delForm" autocomplete="off" style="margin-left: 5%; width: 45%;">
                                    <label style="margin-bottom: 0; margin-top: 5%;">email</label>
                                    <div class="mt-10">
                                        <input type="text" name="email" value="${ loginUser.email }" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Email address'" required class="single-input" readonly>
                                    </div>
                                    <label style="margin-bottom: 0; margin-top: 5%;">password</label>
                                    <div class="mt-10">
                                        <input type="password" id="password" name="password" placeholder="password" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'password'" required class="single-input">
                                    </div>                                    
                                    
                                    <br><br>
                                  
                               <!-- <button type="submit" id="submit" name="submit" class="genric-btn primary-border small" style="margin-left: 30%;">Delete Account</button> -->
                               				<button class="genric-btn primary-border small" style="margin-left: 30%;" type="button" id="submit">회원탈퇴</button>
                               
                                </form> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>    
	<%@ include file="../common/footer.jsp" %>
    <!-- jquery plugins here-->
    <script src="resources/js/jquery.counterup.min.js"></script>
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>

    <script>		

 /*      function deleteAccount(){
            if($('#password').val() == ""){
            	alert("Enter your Password");
            	return false;
            }else if( $('#password').val() == "${ sessionScope.loginUser.password }" ){
            	console.log("확인");
            	location.href ='memDelete.do' //true때는 서블릿으로 넘겨줍시당~~ 
            	return true;
            }
        }  */
        
		
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("enter your password");
					$("#password").focus();
					return false;
				}
				$.ajax({
					url : "passChk.do",
					type : "POST",
					dateType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("want withdraw?")){
								$("#delForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
						}
					}
				})
				
			});
   
    </script>
</body>

</html>