<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
    <!-- Font Awesome link -->
    <link rel="stylesheet" href="resources/css/balloon.min.css">
    <!-- balloon css -->
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
    <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="main.do"> <img src="${ contextPath }/resources/images/logo.png" alt="logo" width="100" height="40"> </a>
                        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <!-- <li class="nav-item">
                                    <a class="nav-link" href="main.do">Home</a>
                                </li> -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Theme
                                    </a>
                                    <div class="dropdown-menu" id="theme" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="theme.do?keyword=Nature">Nature Theme</a>
                                        <a class="dropdown-item" href="theme.do?keyword=Restaurant">Restaurant Theme</a>
                                        <a class="dropdown-item" href="theme.do?keyword=History">History Theme</a>
                                        <a class="dropdown-item" href="theme.do?keyword=Shopping">Shopping Theme</a>
                                        <a class="dropdown-item" href="theme.do?keyword=Bar">Bar Theme</a>
                                        <a class="dropdown-item" href="theme.do?keyword=Activity">Activity Theme</a>
                                        <a class="dropdown-item" href="theme.do?keyword=Exhibition">Exhibition Theme</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="themeDetailView.do">Posting</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="recommend.do">
                                        Recommended
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contactView.do">Q & A</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="chat.do">Free Talk</a>
                                </li>
                                 <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        themePosting Test
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="themeInsertView.do">Test1</a>
                                        <a class="dropdown-item" href="blogdetail.do">Test2</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">

							<a id="search_1" href="javascript:void(0)"><i
								class="ti-search"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <!-- 로그인 전 -->
							<c:if test="${ empty sessionScope.loginUser }">
							<span data-balloon="Sign In"
								data-balloon-pos="down-right">
								<a href="loginView.do" style="color: rgba(0, 0, 0, .9);">
							 <i class="fas fa-sign-in-alt" style="margin-left: 0px;">
								Sign-In </i></a>
								 </span> 
							</c:if>

							<!-- 로그인 후 -->
							<c:if test="${ !empty sessionScope.loginUser }">
							<a href="adminView.do"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								data-balloon="Admin" data-balloon-pos="down-right"> <i
									class="fas fa-user-circle" style="margin-left: 0px;"></i>
							</span>
							</a> <a href="myPage.do"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								data-balloon="My Page" data-balloon-pos="down-right"> <i
									class="fas fa-user-circle" style="margin-left: 0px;"></i>
							</span>
							</a> <a href="likedList.do"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								data-balloon="Likes" data-balloon-pos="down-right"> <i
									class="far fa-heart" style="margin-left: 0px;"></i>
							</span>
							</a> <a href=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								data-balloon="Sign Out" data-balloon-pos="down-right"> <i
									class="fas fa-sign-out-alt" style="margin-left: 0px;"></i>
							</span>
							</a>
							</c:if>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form action="theme.do" class="d-flex justify-content-between search-inner">
                    <input type="text" name="keyword" class="form-control" id="search_input" list="sl" placeholder="Search Here and Press Enter Key">
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
    <script src="resources/js/jquery.nice-select.min.js"></script>
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
		$('#search_input').on('click keyup',function(){
			ajax({
				
			});
		});
		
	</script>
</body>
</html>