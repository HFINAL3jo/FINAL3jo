<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                    <!-- <h5>Theme</h5> -->
                                <ul class="list">
                                    <li>
                                        <label for="ha">Nature</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha" checked="checked">
                                            <label for="ha"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="ha2">Restaurant</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha2" checked="checked">
                                            <label for="ha2"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="ha3">History</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha3" checked="checked">
                                            <label for="ha3"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="ha4">Shopping</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha4" checked="checked">
                                            <label for="ha4"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="ha5">Bar</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha5" checked="checked">
                                            <label for="ha5"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="ha6">Activity</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha6" checked="checked">
                                            <label for="ha6"></label>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="ha7" >Exhibition</label>
                                        <div class="confirm-radio">
                                            <input type="checkbox" id="ha7" checked="checked">
                                            <label for="ha7"></label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </aside>
                        
                        <aside class="left_widgets p_filter_widgets">
                        <hr>
                            <div class="l_w_title">
                            </div>
                            <div class="widgets_inner">
                             <br><br>
                             <c:if test="${!empty loginUser }">
                             <button id="wb" type="button" class="btn btn-outline-danger" style="width:200px; height:50px;">Write Post</button></c:if>
                            </div>
                        </aside>
                    </div>
                </div>
  <script>
  	$('#wb').click(function(){
  		location.href="themeInsertView.do";
  	});
  	
  	
  </script>
</body>
</html>