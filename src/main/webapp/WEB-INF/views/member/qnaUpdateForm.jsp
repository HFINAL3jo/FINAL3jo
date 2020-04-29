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

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #3B4CF7;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #ffffff;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #FAFAFA;
  }

  ul[id~=pagenation]>li{
  	display:inline;
  }

  .breadcrumb{
  	background-image:url('${contextPath}/resources/images/qnaflowers.jpg');
    background-size: 100% 100%;
  }
  
  .btn {
	  color: #0067b8 !important; 
	  border:1px solid #0067b8 !important; 
	  background: white !important; 
	}
	
 .btn:hover {
   color: snow !important;
   border: 1px solid #0067b8 !important;
   background: #0067b8 !important;
 }
 
 .mt-3 input:last-child{
 float:right;
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
              <h2 style="color:white; padding-top:100px; font-size:4em;">Q&A</h2>
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
          <h2 class="contact-title">Edit</h2>
      <hr>
        </div>
        
        <div class="col-lg-8">
          <form action="qupdate.do" method="post">
            <div class="row">
		<input type="hidden" name="qId" value="${ q.qId }">
		<input type="hidden" name="qCreateDate;" value="${ q.qCreateDate }">
		<input type="hidden" name="qAnswerDate;" value="${ q.qAnswerDate }">
		<input type="hidden" name="qStatus;" value="${ q.qStatus }">
		
		<input type="hidden" name="check" value="${ q.qContent }">
                <div class="col-12">
                        <div class="form-group">
                          <input class="form-control" name="qTitle" value="${ q.qTitle }" id="subject" type="text" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '제목(title)'" placeholder='제목(title)'>
                        </div>
          
                    </div>

                    <div class="col-12">
                        <div class="form-group">
                          <input class="form-control" name="qWriter" id="Writer" type="text" onfocus="this.placeholder = ''"
                             value="${ loginUser.nickname }" readonly>
                        </div>
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
                    placeholder='문의내용(message)'>${ q.qContent }</textarea>
                </div>
              </div>


            </div>
            <div class="form-group mt-3">
              <input type="submit" class="btn" value="send">
              <input type="button" class="btn" value="back" onClick="location.href='javascript:history.back()'" >
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
  				<p>우리 존재 화이팅,,,</p>
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