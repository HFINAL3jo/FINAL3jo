<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.list{
	border-top:none !important;
	border:1px solid lightgray !important;
	padding:20px; 
	border-radius:5px; 
	color:gray;
	size:1em;
	margin-bottom:0px !important;
	}
	
	.list li a:hover{
		font-size:2em !important;
		color:black !important;
	}
	
	#wb{
	width:200px; 
	height:50px;
	border:0.5px dashed black;
	color:black;
	}
	
	#wb:hover{
		border:none;
		color:white;
		background:lightgray;
	}
</style>
</head>
<body>
	<span style="text-align: center;"><h2 id="titlebar" style="margin-left:8%;">
		Your Interest</h2></span>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="widgets_inner">
									<br><br>                                   
                                <ul class="list">
                                    <li>
                                        <a href="theme.do?keyword=Nature">Nature</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=Restaurant">Restaurant</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=History">History</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=Shopping">Shopping</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=Bar">Bar</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=Activity">Activity</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=Exhibition">Exhibition</a>
                                    </li>
                                    <li>
                                        <a href="theme.do?keyword=">All</a>
                                    </li>
                                </ul>
                                <br>
                                <c:if test="${loginUser.nickname eq 'ADMIN' }">
                             <button id="wb" type="button" class="btn btn-outline-danger">Write Post</button></c:if>
                            </div>
                        </aside>
                        
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                            </div>
                            <div class="widgets_inner">
                             
                            </div>
                        </aside>
                    </div>
                </div>
  <script>
  window.setTimeout(function(){
		var offset=window.innerHeight;
		$('html,body').stop().animate({scrollTop:'300'},600);
		}, 200);
  </script>
</body>
</html>