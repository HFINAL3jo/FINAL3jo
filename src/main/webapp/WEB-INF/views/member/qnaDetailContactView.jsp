<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>aranaz</title>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
  <style>

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
    
  th {
    /* border-bottom: 1px dashed #444444; */
  }
  
  td{
  	border-bottom: 1px solid #444444 ;
  	
  }
  
  #qtitle{
  background-color:#FAFAFA;
  border-bottom: 1px dashed #ddd;
  }
  
  #qwriter{
  	background-color:#FAFAFA;
  	border-bottom: 1px solid #ddd;
  }
  
  
  table{
  border: none;
  }
  th,td{
  	padding: 10px;
  	border: none;
  }

/* 댓글 css */
.form-control:focus {
    border-color: #66afe9 !important;
    outline: 0 !important;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6) !important;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6) !important;
}

textarea{
	border: 0.5px solid #F8F8F8 !important; 
}

@font-face {
  font-family: 'Open Sans';
  font-style: italic;
  font-weight: 300;
  src: local('Open Sans Light Italic'), local('OpenSans-LightItalic'), url(https://fonts.gstatic.com/s/opensans/v17/memnYaGs126MiZpBA-UFUKWyV9hrIqY.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: italic;
  font-weight: 400;
  src: local('Open Sans Italic'), local('OpenSans-Italic'), url(https://fonts.gstatic.com/s/opensans/v17/mem6YaGs126MiZpBA-UFUK0Zdcg.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: italic;
  font-weight: 600;
  src: local('Open Sans SemiBold Italic'), local('OpenSans-SemiBoldItalic'), url(https://fonts.gstatic.com/s/opensans/v17/memnYaGs126MiZpBA-UFUKXGUdhrIqY.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: italic;
  font-weight: 700;
  src: local('Open Sans Bold Italic'), local('OpenSans-BoldItalic'), url(https://fonts.gstatic.com/s/opensans/v17/memnYaGs126MiZpBA-UFUKWiUNhrIqY.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(https://fonts.gstatic.com/s/opensans/v17/mem5YaGs126MiZpBA-UN_r8OUuhs.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans Regular'), local('OpenSans-Regular'), url(https://fonts.gstatic.com/s/opensans/v17/mem8YaGs126MiZpBA-UFVZ0e.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 600;
  src: local('Open Sans SemiBold'), local('OpenSans-SemiBold'), url(https://fonts.gstatic.com/s/opensans/v17/mem5YaGs126MiZpBA-UNirkOUuhs.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 700;
  src: local('Open Sans Bold'), local('OpenSans-Bold'), url(https://fonts.gstatic.com/s/opensans/v17/mem5YaGs126MiZpBA-UN7rgOUuhs.ttf) format('truetype');
}
.no-padding {
  padding-right: 0;
  padding-left: 0;
}
.comment-wrapper .comment-border {
  margin: 70px 5px 0 5px;
  border-top: 1px solid #CFD4D6;
}
.comment-wrapper .comment-border .comment-box .form-control {
  margin: 20px 0 10px;
  padding: 10px 10px;
  font-size: 1em;
  border: none;
  border-radius: 0;
}
.comment-wrapper .comment-border .comment-box .btn {
  padding: 5px;
  font-size: 1.1em;
  color: #fff;
  background-color: #3B3E44;
}
.comment-wrapper .comment-border .comment-box .btn:hover {
  text-decoration: none;
}
.comment-wrapper .comment-post-box {
  padding: 5px;
  border-bottom: 2px solid #F4F4F1;
}
.comment-wrapper .comment-post-box .comment-post {
  border-radius: 0;
  margin-top: 10px;
}
.comment-wrapper .comment-post-box .comment-post .comment-post-header {
  border-radius: 0;
}
.comment-wrapper .comment-post-box .comment-post .comment-post-header img {
  display: inline-block;
  height: 30px;
  width: 30px;
}
.comment-wrapper .comment-post-box .comment-post .comment-post-header h5 {
  display: inline-block;
  margin: 0;
  padding-left: 6px;
}
.comment-wrapper .comment-post-box .comment-post .comment-post-header h5 a {
  color: #000;
}
.comment-wrapper .comment-post-box .comment-post .comment-post-header h5 small {
  margin-top: 5px;
  padding: 8px;
}
.comment-wrapper .comment-post-box .comment-post .comment-post-header .fa {
  color: #8A8B8F;
}
@media screen and (max-width: 768px) {
  .comment-wrapper .comment-post-box .comment-post .comment-post-box {
    margin-top: 70px;
  }
}
.comment-wrapper .show {
  border-radius: 5px;
}
.comment-wrapper .comment-post-box {
  display: none;
}
.recent-wrapper .center {
  text-align: center;
}

.recent-wrapper .recent-act .glyphicon {
  font-size: 4em;
}
.recent-wrapper .recent-act .title {
  padding: 20px 0;
  font-weight: 400;
}
.recent-wrapper .recent-act .notif-list {
  height: 300px;
  overflow: scroll;
}
.recent-wrapper .recent-act .per-notif {
  margin: 0 36px 0 36px;
  padding: 13px;
  font-size: 0.9em;
}
.recent-wrapper .recent-act .per-notif img {
  max-width: 30px;
  max-heigth: 30px;
}
.recent-wrapper .recent-act .per-notif .glyphicon {
  font-size: 30px;
  color: #3B3E44;
}
.recent-wrapper .recent-act .per-notif .per-notif-body {
  text-align: justify;
  text-justify: inter-word;
}

.breadcrumb{
	background-image:url('${contextPath}/resources/images/qnaflowers.jpg');
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
              <h2 style="color:white;">Q&A</h2>
              <p style="color:white;"><strong>Ask Anything! </strong></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section padding_top">
    <div class="container">
 	<div class="qnaPage">
     
      <h2>Q&A</h2>
      <hr>
        
        <!-- 글 내용-->
        <form id="BoardDelForm" name="" action="" method="post">
            <div class="ec-base-table typeWrite ">
                            <table border="1" summary="">
                            <colgroup>
            <col style="width:130px;">
            <col style="width:auto;">
            </colgroup>
            <input type="hidden" name="qId" value="${ q.qId }">
		<%-- <input type="hidden" name="qCreateDate;" value="${ q.qCreateDate }">
		<input type="hidden" name="qAnswerDate;" value="${ q.qAnswerDate }">
		<input type="hidden" name="qStatus;" value="${ q.qStatus }"> --%>
            <tbody>
            <tr id="qtitle">
            <th colspan="2" align="left"><h4><strong>${ q.qTitle }</strong></h4></th>
               </tr>
            <tr id="qwriter">
               <td>작성자&nbsp;&nbsp;&nbsp;<strong>${ q.qWriter }</strong></td>
               <td><fmt:formatDate pattern="yyyy.MM.dd HH:mm " value="${q.qCreateDate }"/></td>
            </tr>
            <tr>
            <td colspan="2">${q.qContent }</td>
             	</tr>
            </tbody>
            </table>
            </div>
            <div class="ec-base-button" align="right">
                            <span class="gRight">
                           <!--      <a href="qupView.do?qId=">Edit</a>&nbsp;&nbsp;&nbsp; -->
                           <a href='javascript:void(0);' onclick="edit();">Edit</a>&nbsp;&nbsp;&nbsp;
                                <a href='javascript:void(0);' onclick="deleteQNA();">Delete</a>&nbsp;&nbsp;&nbsp;
                            </span>
                            <span class="gLeft">
                                <span class="displaynone">
                                </span>
                                <a href="contactView.do">List</a>
                            </span>
                        </div>
            </div>
            </form>    
  <!-- 여기부터 댓글 -->
  <div class="col-md-9 comment-wrapper">
  <div class="comment-border">
    <div class="comment-box">
      <textarea class="form-control comment-input" placeholder="Write a comment" id="comment-box" rows=""></textarea>
      <div align="right">
      <button class="btn pull-right">submit</button>
      </div>
    </div>
  </div>
  <div class="comment-body-box">
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <strong>Kendall</strong>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <strong>Kendall</strong>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse commod</p>
          </div>
        </div>
      </div>
    </div>
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <strong>Kendall</strong>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <a href="">Kendall</a>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <strong>Kendall</strong>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <strong>Kendall</strong>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="comment-post-box">
      <div class="comment-post">
        <div class="comment-post-header">
          <h5>
                <strong>Kendall</strong>
                <small>Posted 12 hr ago</small>
              </h5>
          <i class="fa fa-pencil-square-o pull-right"></i>
        </div>
        <div class="panel-body comment-post-body">
          <div class="comment-post-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- <button class="btn btn-default btn-link btn-block more show hidden" id="see-more">
      <small>Show more comments</small>
      <i class="fa fa-caret-down"></i>
    </button>
    <button class="btn btn-default btn-link btn-block more show hidden" id="see-less">
      <small>Show less comments</small>
      <i class="fa fa-caret-up"></i>
    </button> -->
  </div>
</div>
<div class="col-md-3 recent-wrapper no-padding">


</div>
</div>

  </section>
  <!--// 본문 -->
  <script>
  $(".comment-body-box").each(function (index) {
	  $(this).children(".comment-post-box").slice(-3).show();
	});

	/* $("#see-more").removeClass("hidden");

	$("#see-more").click(function (e) {
	  // click event for load more
	  e.preventDefault();
	  $(this).siblings(".comment-post-box:hidden").slice(-3).show(); // select next 5 hidden divs and show them
	  if ($(this).siblings(".comment-post-box:hidden").length == 0) {
	    // check if any hidden divs
	    $("#see-less").removeClass("hidden");
	    $("#see-more").addClass("hidden");
	  }
	});

	$("#see-less").click(function (e) {
	  e.preventDefault();
	  $(this).siblings(".comment-post-box").slice(3).hide();
	  $("#see-less").addClass("hidden");
	  $("#see-more").removeClass("hidden");
	}); */

  </script>
  
  <!-- ================ contact section end ================= -->

  <!--::footer_part start::-->
  <%@ include file="../common/footer.jsp"%>
   <!--::footer_part end::-->

<!-- <script>
	function getReplyList(){
		var prev = ${ prev };
		var pageSelect = ${ p };
		var next = ${ next };
		
		$.ajax({
			url:"contactView.do",
			data:{currentPage:currentPage},
			dataType:"json",
			success:function(data){
				location.href="contactView.do";
			},error:function(){
				console.log("전송실패");
			}
		});
	}
</script> -->
<script>
	var edit = function(){
		location.href = "qupView.do?qId="+document.getElementsByName('qId')[0].value;
	}

	var deleteQNA = function(){
		location.href = "qDelete.do?qId="+document.getElementsByName('qId')[0].value;
	}
</script>
</body>
</html>