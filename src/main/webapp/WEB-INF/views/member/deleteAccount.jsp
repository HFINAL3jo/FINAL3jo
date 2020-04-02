<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="stylesheet" href="resources/css/nice-select.css">
   
    <link rel="stylesheet" href="resources/css/price_rangs.css">
 
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
                            <h2>Shop Category</h2>
                            <p>Home <span>-</span> Shop Category</p>
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
                                <form action="#" style="margin-left: 5%; width: 45%;">
                                    <label style="margin-bottom: 0; margin-top: 5%;">email</label>
                                    <div class="mt-10">
                                        <input type="email" name="EMAIL" placeholder="Email address *수정불가*" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Email address'" required class="single-input" disabled="disabled">
                                    </div>
                                    <label style="margin-bottom: 0; margin-top: 5%;">password</label>
                                    <div class="mt-10">
                                        <input type="password" id="password" name="password" placeholder="password" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'password'" required class="single-input">
                                    </div>                                    
                                    
                                    <br><br>
                                    <input class="genric-btn primary-border small" type="button" value="Delete Account" style="margin-left: 30%;"onclick="return deletemember()">
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
        function deletemember(){
            if($('#password').val() == ""){
            alert("비밀번호를 입력해주세요!");
            return false;
            }     
            location.href ='#' //true때는 서블릿으로 넘겨줍시당~~
        }
    </script>


</body>

</html>