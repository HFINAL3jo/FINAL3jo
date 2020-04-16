<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                        <a href="likedList.do">Liked List ♡</a>
                                        <span>(${pi.listCount})</span>
                                    </li>
                                    <li>
                                        <a href="myReview.do">My Reveiw</a>
                                        <span>(6)</span>
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
                                        <a href="deleteMember.do">Delete Account</a>
                                    </li>                                    
                                </ul>
                                
                            </div>
                        </aside>

                        
                    </div>
                </div>
</body>
</html>