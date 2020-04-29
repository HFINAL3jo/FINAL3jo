<%@page import="com.aligo.spring.member.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Get inspired for your journey! - aligo</title>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
  <style>
  .breadcrumb{
  	background-image:url('${contextPath}/resources/images/qnaflowers.jpg');
    background-size: 100% 100%;
  }
  
  .btn {
	color: #0067b8 !important;
	border: 1px solid #0067b8 !important;
	background: white !important;
}

.btn:hover {
	color: snow !important;
	border: 1px solid #0067b8 !important;
	background: #0067b8 !important;
}
  
</style>
</head>

<body>
  <!--::header part start::-->
  <%@ include file="../common/menubar.jsp"%>
  <!-- Header part end-->

  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg" style="height:760px;">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2 style="color:white; font-size:4em;">Q&A</h2>
              <p style="color:white; font-size:2em;"><strong>Ask Anything! </strong></p>
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
</div>
      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">문의하기(Q&A)</h2>
      <hr>
        </div>
        
        <div class="col-lg-8">
          <form action="qinsert.do" method="post">
            <div class="row">


                <div class="col-12">
                        <div class="form-group">
                          <input class="form-control" name="qTitle" id="subject" type="text" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '제목(title)'" placeholder='제목(title)'>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-group"><!-- disabled -->
                          <input class="form-control" name="qWriter" id="Writer" type="text" onfocus="this.placeholder = ''"
                             value="${ loginUser.nickname }" readonly>
                        </div><%-- //onblur="this.placeholder = '작성자(writer)': ${q.qWriter}" --%>
                      </div>
                      <!-- <div class="col-sm-6">
                        <div class="form-group">
                          <input class="form-control" name="email" id="email" type="email" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '이메일(email)'" placeholder='이메일(email)'>
                        </div>
                      </div> -->

                      <div class="col-12">
                        <div class="form-group">
                  <textarea class="form-control w-100" name="qContent" id="message" cols="30" rows="9"
                    onfocus="this.placeholder = ''" onblur="this.placeholder = '문의내용(message)'"
                    placeholder='문의내용(message)'></textarea>
                </div>
              </div>


            </div>
            <div class="form-group mt-3">
              <input type="submit" class="btn" value="Send">
            </div>
          </form>
        </div>
        <div class="col-lg-4">
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-home"></i></span>
            <div class="media-body">
              <h3>Gangnam-gu, Seoul</h3>
              <p>6, Teheran-ro 14-gil</p>
            </div>
          </div>

          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
              <h3>noticealigo@gmail.com</h3>
  				<p></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ contact section end ================= -->

  <!--::footer_part start::-->
  <%@ include file="../common/footer.jsp"%>
   <!--::footer_part end::-->
</body>
</html>