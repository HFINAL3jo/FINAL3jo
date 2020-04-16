<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/assideMyPage.jsp" %>
	 <div class="col-lg-9" >
                    <h3 style="align-self: center;">Edit Profile</h3>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center" style="align-self: center;">
                                <form action="main.do" style="margin-left: 5%; width: 45%;">
                                    <label style="margin-bottom: 0; margin-top: 5%;">email</label>
                                    <div class="mt-10">
                                        <input type="email" name="EMAIL" placeholder="Email address *수정불가*" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Email address'" required class="single-input" >
                                    </div>
                                    <label style="margin-bottom: 0; margin-top: 5%;">password</label>
                                    <div class="mt-10">
                                        <input type="password" id="password" name="password" placeholder="password" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'password'" required class="single-input">
                                    </div>                                    
                                    <label style="margin-bottom: 0; margin-top: 5%;">nickname</label>
                                    <div class="mt-10">
                                        <input type="text" name="nickname" placeholder="Nickname" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Last Name'" required class="single-input">
                                    </div>                                    
                                    <br><br>
                                    <input class="genric-btn success-border small" type="submit" value="finish" style="margin : 10%">
            <!--                         <input class="genric-btn primary-border small" type="button" value="Delete Account" style="margin: 10px;" onclick="return deletemember()">   -->                                  
                              	 	<button type="button" class="genric-btn primary-border small" style="margin: 10px;" onclick="location.href='${ memDelete }';">Delete Account</button>
                                </form> 
                            </div>
                        </div>
                    </div>

                    <!-- <div class="row align-items-center latest_product_inner">                  
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>                        
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            
                        </div>
                        <div class="col-lg-12">
                            
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
    </section>
    <%@ include file="../common/footer.jsp" %>
    
     <script>		
        function deletemember(){
            if($('#password').val() == ""){
            alert("비밀번호를 입력해주세요!");
            return false;
            }     
            location.href ='#' //true때는 서블릿으로 넘겨줍시당~~
        }
    </script>
    
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>
</body>
</html>