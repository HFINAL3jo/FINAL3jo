<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get inspired for your journey! - aligo</title>
</head>
<body>
	<section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>My List</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                    <c:url var="like" value="likedList.do">
										<c:param name="mId" value="${sessionScope.loginUser.mid }"/>
									</c:url>
                                        <a href="${like}">Liked List ♡</a>
                                        <span>(${pi.listCount})</span>
                                    </li>
                                    <li>
                                    <c:url var="review" value="myReview.do">
										<c:param name="bWriter" value="${sessionScope.loginUser.nickname }"/>
									</c:url>
                                        <a href="${review }">My Review</a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </aside>  <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>My Profile</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                        <a href="myPage.do">Edit Profile</a>
                                    </li>
                                    <li>
                                        <a href="deleteAccount.do">Delete Account</a>
                                    </li>                                    
                                </ul>
                                
                            </div>
                        </aside>

                        
                    </div>
                </div>
</body>
</html>