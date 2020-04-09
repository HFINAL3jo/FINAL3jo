<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Post ALigo</title>
  
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
  
  #infoD{
  	width: 150px;
  	height: 50px;  	
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
  <h1 align="center">${t.tTitle}</h1>
  <br>
  <section class="img_board_view">
    
     <div class="img_view" align="center" style="width:500px; height:300px; position:relative; margin:auto;">
          
      <div><h3><img src="resources/tuploadFiles/${t.tModifyFile }" style="width:500px; height:300px;" alt=""></h3></div>
      <div><h3><img src="resources/img/product/example/example2.jpg" style="width:500px; height:300px;" alt=""></h3></div>
      <div><h3><img src="resources/img/product/example/example3.jpg" style="width:500px; height:300px;" alt=""></h3></div>
      <div><h3><img src="resources/img/product/example/example4.jpg" style="width:500px; height:300px;" alt=""></h3></div>
   
  </div>
  <br><br>
  <div class="img_slide" align="center" style="width:1200px; height:300px; position:relative; margin:auto;">
      <div><h3><img src="resources/tuploadFiles/${t.tModifyFile }" style="width:200px; height:200px;" alt=""></h3></div>
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
        <!-- <li class="nav-item">
          <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false">Reviews</a>
        </li> -->
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="description" role="tabpanel" aria-labelledby="description-tab">
          <p>
          ${t.tContent}
          </p>
       
        </div>
        <!-- Location-->
        <div class="tab-pane fade" id="location" role="tabpanel" aria-labelledby="location-tab" align="center">
          <div class="table-responsive">
         
            <table class="table">
              <tbody>
                <tr>
                  <td>Writer : ${t.tWriter }</td>
                  <td>Address : ${t.tAddress}</td>
                </tr>
                <tr>
                  <td>Views : ${t.tViews }</td>
                  <td>Likes : ${t.tLikes}</td>
                </tr>
                <tr>
                  <td>Keyword : ${t.tKeyword }</td>
                  <td>HashTagName : ${t.tName }</td>
                </tr>
                <tr>
                   <td>PostDate : ${t.tCreateDate }</td>
                   <td>ModifyDate : ${t.tModifyDate }</td>	
              </tbody>
            </table>
          </div>
          <!--지도-->
          <br>
        <div id="map" style="width:80%;height:400px;position:relative;overflow:hidden;"></div>
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
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=services,clusterer,drawing"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=LIBRARY"></script>  
  <script>
	$(function(){
  		/* //지도 api
	    var mapContainer = document.getElementById('map');
		var mapOption = {
		    center: new daum.maps.LatLng(37.566826, 126.9786567),
		    level: 8
		};
		var map = new daum.maps.Map(mapContainer, mapOption);		
		//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 주소-좌표 변환 객체 생성
		var geocoder = new daum.maps.services.Geocoder();		
		var listData = [
		    '서울특별시 송파구 오금로13길 8',
		    '서울특별시 송파구 올림픽로 25',
		    '서울특별시 성북구 인촌로 73',
		    '서울특별시 광진구 동일로18길 80',
		    '서울특별시 종로구 지봉로 25'
		];		
		listData.forEach(function(addr, index) {
		    geocoder.addressSearch(addr, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            var coords = new daum.maps.LatLng(result[0].y, result[0].x);		
		            var marker = new daum.maps.Marker({
		                map: map,
		                position: coords
		            });
		            var infowindow = new daum.maps.InfoWindow({
		                //content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
		                disableAutoPan: true
		            });
		            //infowindow.open(map, marker);
			        kakao.maps.event.addListener(marker, 'click', function() {
			            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			            infowindow.setContent('<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>');
			            infowindow.open(map, marker); 
			        });
		        }
		    });		
		}); */
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var positions = [
			{
				title: '경남경찰청 성폭력 특수수사대', 
				addr: '경남 창원시 의창구 상남로 289 '
			},
			{
				title: '창원가정상담센터', 
				addr: '경남 창원시 성산구 창이대로 663번길 7'
			},
			{
				title: '창원성폭력상담소', 
				addr: '경남 창원시 의창구 신월로 42 토월복합상가 725호'
			},
			{
				title: '여성긴급전화경남센터',
				addr: '경남 창원시 의창구 북면 동전로179-18'
			}
		];  
		// 주소-좌표 변환 객체를 생성합니다.
		positions.forEach(function(v,i){
			var geocoder = new kakao.maps.services.Geocoder();
			var bounds = new kakao.maps.LatLngBounds();
			geocoder.addressSearch(positions[i].addr, function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {	
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
        			var marker = new kakao.maps.Marker({
            			map: map,
            			position: coords
        			});
					
        			// 결과값으로 받은 위치를 마커로 표시합니다
					var infoDiv = 	'<div id="infoD">'
									+positions[i].title+positions[i].addr+
									'</div>';
					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
					    content: infoDiv
					});
					infowindow.open(map, marker);			
					
			} 		
		});
	});   	  	    	
		function relayout() {    
		 // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		 // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		 // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		 map.relayout();
  		}
		
		$("#location-tab").on("click",function(){
			
			window.setTimeout(function() {
			    map.relayout();
			},200);
		});
  		
   	   	$('#description-tab').click();
   	  
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
  

  </script>
  
  <%@ include file="../common/footer.jsp" %>
</body>

</html>