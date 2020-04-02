<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>aranoz</title>
  
  <link rel="stylesheet" href="resources/css/lightslider.min.css">

 <style>
  #modalist {
    border:2px solid gray;
    display:none;
    position:relative;
    width:120px;
    height:250px;
    float:right;
    right:-200px;
    top:-200px;
    background-color:lightsteelblue;
    z-index:1;
  }

  .modal_content {
    margin:5px auto;
  }
  
  .modal_layer{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0, 0, 0, 0.3);
    z-index:-1;
  }   
  </style>
<link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css" />
</head>

<body>

  <%@ include file="../common/menubar.jsp" %>
  <!-- breadcrumb start-->
  
  <!-- breadcrumb start-->
  <!--================End Home Banner Area =================-->
  <!--이미지 슬라이드-->
  <br><br><br><br>
  <h1 align="center">Title Here</h1>
  <br>
  <section class="img_board_view">
    
     <div class="img_view" align="center" style="width:500px; height:300px; position:relative; margin:auto;">
          
      <div><h3><img src="resources/img/product/example/example.jpg" style="width:500px; height:300px;" alt=""></h3></div>
      <div><h3><img src="resources/img/product/example/example2.jpg" style="width:500px; height:300px;" alt=""></h3></div>
      <div><h3><img src="resources/img/product/example/example3.jpg" style="width:500px; height:300px;" alt=""></h3></div>
      <div><h3><img src="resources/img/product/example/example4.jpg" style="width:500px; height:300px;" alt=""></h3></div>
   
  </div>
  <br><br>
  <div class="img_slide" align="center" style="width:1200px; height:300px; position:relative; margin:auto;">
      <div><h3><img src="resources/img/product/example/example.jpg" style="width:200px; height:200px;" alt=""></h3></div>
    <div><h3><img src="resources/img/product/example/example2.jpg"style="width:200px; height:200px;" alt=""></h3></div>
    <div><h3><img src="resources/img/product/example/example3.jpg"style="width:200px; height:200px;" alt=""></h3></div>
    <div><h3><img src="resources/img/product/example/example4.jpg"style="width:200px; height:200px;" alt=""></h3></div>
  </div>
  <br>
  <!--모달 팝업 및 좋아요 아이콘-->
  <img class="list" src="resources/img/product/example/list.svg" class="modal_content" align="right" widht="40px" height="40px" style="margin-right:10%;">
  <br><br><br>
  <img id="thumb" src="resources/img/product/example/heart.svg" widht="40px" height="40px" align="right" style="margin-right:10%;">
    <div id="modalist">
     <div id="fav"><img src="resources/img/product/example/star.svg" class="modal_content" widht="40px" height="40px">&nbsp;즐겨찾기</div>
     <div id="share"><img src="resources/img/product/example/link.svg" class="modal_content" widht="40px" height="40px">&nbsp;공유하기</div>
     <div id="print"><img src="resources/img/product/example/print.svg" class="modal_content" widht="40px" height="40px">&nbsp;인쇄</div>
     <hr>
     <div id="save"><img src="resources/img/product/example/download.svg" class="modal_content" widht="40px" height="40px">&nbsp;저장</div>
    <div class="modal_layer"></div>
  </div>
</section>
  <!--================Description Area =================-->
  <section class="product_description_area">
    <div class="container">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description"
            aria-selected="true">Description</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="location-tab" data-toggle="tab" href="#location" role="tab" aria-controls="location"
            aria-selected="false">Location</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="comment-tab" data-toggle="tab" href="#comment" role="tab" aria-controls="comment"
            aria-selected="false">Comments</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false">Reviews</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="description" role="tabpanel" aria-labelledby="description-tab">
          <p>
           Content Here!
          </p>
          <p>
           Content Here!
          </p>
        </div>
        <!-- Location-->
        <div class="tab-pane fade" id="location" role="tabpanel" aria-labelledby="location-tab">
          <div class="table-responsive">
            <table class="table">
              <tbody>
                <tr>
                  <td>Address</td>
                  <td>Data</td>
                </tr>
                <tr>
                  <td>Test</td>
                  <td>Where to go</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--지도-->
        
          <div id="kmap" align="center" style="width:1200px;height:400px;"></div>
        </div>
        <!--Comment-->
        <div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="comment-tab">
          <div class="row">
              
              <div class="review_box">
                <h4>Post a comment</h4>
                <form class="row contact_form" action="contact_process.php" method="post" id="contactForm"
                  novalidate="novalidate">
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="text" class="form-control" id="name" name="name" placeholder="Your Full name" />
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" />
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="text" class="form-control" id="number" name="number" placeholder="Phone Number" />
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <textarea class="form-control" name="message" id="message" rows="1"
                        placeholder="Message"></textarea>
                    </div>
                  </div>
                  <div class="col-md-12 text-right">
                    <button type="submit" value="submit" class="btn_3">
                      Submit Now
                    </button>
                  </div>
                </form>
              </div>
            </div>
            <div class="tab-pane fade show active" id="commnet" role="tabpanel" aria-labelledby="comment-tab">
                <div class="review_list">
                    <div class="review_item">
                      <div class="media">
                        <div class="d-flex">
                          <img src="" alt="" />
                        </div>
                        <div class="media-body">
                          <h4>Blake Ruiz</h4>
                          <h5>12th Feb, 2017 at 05:56 pm</h5>
                          <a class="reply_btn" href="#">Reply</a>
                        </div>
                      </div>
                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo
                      </p>
                    </div>
                    <div class="review_item">
                      <div class="media">
                        <div class="d-flex">
                          <img src="" alt="" />
                        </div>
                        <div class="media-body">
                          <h4>Blake Ruiz</h4>
                          <h5>12th Feb, 2017 at 05:56 pm</h5>
                          <a class="reply_btn" href="#">Reply</a>
                        </div>
                      </div>
                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo
                      </p>
                    </div>
                    <div class="review_item">
                      <div class="media">
                        <div class="d-flex">
                          <img src="" alt="" />
                        </div>
                        <div class="media-body">
                          <h4>Blake Ruiz</h4>
                          <h5>12th Feb, 2017 at 05:56 pm</h5>
                          <a class="reply_btn" href="#">Reply</a>
                        </div>
                      </div>
                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo
                      </p>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
  </section>
  <!--================End Product Description Area =================-->

 
  <!-- swiper js -->
  <script src="resources/js/lightslider.min.js"></script>
  <!-- slick js -->
  <script src="resources/js/swiper.jquery.js"></script>
  <script src="resources/js/stellar.js"></script>
  <!--지도 api script-->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b212c5cd9c783a273b91ad33e453caf"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
  <script>
      $(document).ready(function(){
        $('.img_view').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows:true,
        fade: true,
        asNavFor: '.img_slide'
      });
      $('.img_slide').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.img_view',
        arrows:true,
        dots: true,
        centerMode: true,
        focusOnSelect: true,
        autoplay:true,
        autoplayspeed:5000
      });
    });
    $('.list').hover(function(){
       $(this).css('cursor','pointer');
    }).click(function(){
       $('#modalist').css("display","block");
         
         if(!($('.modal_layer')).click(function(){
             $('#modalist').css('display','none');
         }));
       });
    $('#fav,#save,#print,#share').mouseenter(function(){
        $(this).css('cursor','pointer');
    }).click(function(){
      var i = $(this).attr('id');
      switch(i){

      }
    });
    $('#thumb').hover(function(){
      $(this).css('cursor','pointer')
      .click(function(){
        if($('#thumb').attr('src')=='resources/img/product/example/like.svg'){  
          $(this).attr('src','resources/img/product/example/heart.svg');
        }else{
          $(this).attr('src','resources/img/product/example/like.svg');
        }  
      });
    });
    //지도 api 
     var container = document.getElementById('kmap'); //지도를 담을 영역의 DOM 레퍼런스
     var options = { //지도를 생성할 때 필요한 기본 옵션
	   center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	   level: 3 //지도의 레벨(확대, 축소 정도)
       };

  var kmap = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
  </script>
  
  <%@ include file="../common/footer.jsp" %>
</body>

</html>