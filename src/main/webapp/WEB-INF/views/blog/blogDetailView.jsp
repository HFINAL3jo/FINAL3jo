<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="ko">

<head>
    <title>Get inspired for your journey! - aligo</title>
    <meta charset="UTF-8">
    <!-- Google Analytics -->
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-16476520-26"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=LIBRARY"></script>      
    <style>
    .like-content {
	    display: inline-block;
	    width: 100%;
	    margin: 40px 0 0;
	    padding: 40px 0 0;
	    font-size: 18px;
	    border-top: 10px dashed #eee;
	    text-align: center;
	}
	.like-content span {
		color: #9d9da4;
		font-family: monospace;
	}
	.like-content .btn-secondary {
		  display: block;
		  margin: 40px auto 0px;
	    text-align: center;
	    background: #ed2553;
	    border-radius: 3px;
	    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
	    padding: 10px 17px;
	    font-size: 18px;
	    cursor: pointer;
	    border: none;
	    outline: none;
	    color: #ffffff;
	    text-decoration: none;
	    -webkit-transition: 0.3s ease;
	    transition: 0.3s ease;
	}
	.like-content .btn-secondary:hover {
		  transform: translateY(-3px);
	}
	.like-content .btn-secondary .fa {
		  margin-right: 5px;
	}
	.animate-like {
		animation-name: likeAnimation;
		animation-iteration-count: 1;
		animation-fill-mode: backwards;
		animation-duration: 0.65s;
	}
	@keyframes likeAnimation {
	  0%   { transform: scale(30); }
	  100% { transform: scale(1); }
	}
        .loction{
            width: 100%;
            max-width: 1200px;
            margin: 10px auto 0 auto;
            padding: 10px 0px 20px 15px;
            font-size: 16px;
            color: #666;
            /* background: url(../../../assets/images/2019/common/ico-home@2x.png) no-repeat 0px 15px; */
            background-size: 10px 12px;
            box-sizing: border-box;
        }
        .p{
            font-size: 16px;
            font-weight: 300;
            width: 100%;
            margin: 0;
            text-align: center;
        }
        .infor-element{
            line-height: 1.6;
            max-width: 1000px;
            margin: auto;
        }
        .infor-element .text-type{
            font-size: 16px;
            color:#0066eb;
            text-align: center;
            font-weight: 700;
            margin-bottom: 3px;
        }
        .sub-contents h3.h3{
            font-weight: 600;
            color:#333;
            letter-spacing: -1px;
            word-break: keep-all;
        }
        .post-element{
            position: relative;
            height: 30px;
            margin: 40px 0;
            text-align: center;
        }
        .post-element span{
            position: relative;
            z-index: 2;
            display: inline-block;
            padding: 2px 15px;
            background-color: #fff;
            font-size: 14px;
            color: #333;
            font-weight: 300;
        }
        .post-element::after{
            content: '';
            display: block;
            clear: both;
            position: absolute;
            left: 0px;
            right: 0px;
            top: 12px;
            z-index: 1;
            height: 1px;
            background-color: #ddd;
        }
          .sub-contents-inner p {
              font-size: 16px;
              font-weight: 300;
              color: #333;
              width: 100%;
              margin: 0;
              text-align: center;
          }
          
          .main-img {
              width: 100%;
              height: auto;
          }
          
          .sub-contents-inner h5 {
              font-size: 20px;
              font-weight: 900;
              color: #000000;
              text-align: center;
              margin: 30px auto 33px;
              width: 100%;
          }
          
          .sub-contents-inner h4 {
              font-size: 28px !important;
              font-weight: 900;
              color: #0073c9 !important;
              text-align: center;
              margin: 0;
              width: 100%;
          }
          
          .sub-contents-inner h3 {
              font-size: 32px !important;
              font-weight: 900;
              color: #0073c9 !important;
              text-align: center;
              margin: 0;
              width: 100%;
          }
          
          h3.black {
              color: #333333 !important;
          }
          
          .cnt-blockquote {
              clear: both;
              padding: 50px 0px;
              border-top: 1px solid #ddd;
              border-bottom: 1px solid #ddd;
              overflow: hidden;
              background-color: #fff;
          }
          
          .cnt-blockquote dl {
              position: relative;
              width: 50%;
              float: left;
              padding: 0px 0px 0px 110px;
              box-sizing: border-box;
              height: 30px;
              margin: 15px 0px;
          }
          
          .cnt-blockquote dl dt {
              position: absolute;
              left: 0px;
              top: 0px;
              z-index: 1;
              width: 95px;
              height: 30px;
              border-radius: 15px;
              text-align: center;
              font-size: 16px;
              color: #fff;
              line-height: 29px;
              background-color: #333333
          }
          
          .cnt-blockquote dl dd {
              font-size: 16px;
              color: #000;
          }
          
          .count-element {
              margin: 25px 0px 25px 0;
              text-align: center
          }
          
          .count-element span {
              display: inline-block;
              width: 55px;
              height: 55px;
              background-color: #0073c9;
              text-align: center;
              font-size: 22px;
              font-weight: bold;
              line-height: 55px;
              color: #fff;
              border-radius: 27px;
          }
          
          .cols4-element {
              overflow: hidden;
              padding: 20px 25px;
              margin-left: -10px
          }
          
          .cols4-element li {
              float: left;
              width: 25%;
          }
          
          .cols4-element li a {
              position: relative;
              display: block;
              border: 1px solid #dddddd;
              border-radius: 3px;
              margin-left: 10px;
              height: 290px;
              overflow: hidden
          }
          
          .cols4-element li a img {
              width: 100%;
              height:100%;
          }
          
          .cols4-element li a span {
              display: block;
              height:100%;
          }
          
          .cols4-element li a .cont {
              padding: 20px 15px;
          }
          
          .cols4-element li a .cont .title {
              font-size: 16px;
              color: #333;
              font-weight: 900;
          }
          
          .cols4-element li a .cont .content {
              overflow: hidden;
              height: 50px;
              font-size: 12px;
              margin-top: 5px
          }
          
          .cols4-element li a .link {
              position: absolute;
              left: 0px;
              right: 0px;
              bottom: 0px;
              height: 50px;
              padding: 10px 0px;
              text-align: center;
              background-color: #ececec
          }
          
          .cols4-element li a .link>span {
              display: inline-block;
              font-size: 15px;
              color: #0085e9;
              padding-right: 15px;
               background: url(//humanframe/theme/visitseoul/assets/images/2019/web_content/0128/ico-arrow.png) no-repeat right center
          }
          
          @media screen and (max-width: 768px) {
              .cols4-element {
                  padding: 0px;
              }
              .cols4-element li {
                  float: left;
                  width: 50%;
                  margin-bottom: 15px
              }
          }
          
          @media screen and (max-width: 680px) {
              .cnt-blockquote dl {
                  width: 100%;
                  float: none;
              }
          }
          
          @media screen and (max-width: 480px) {
              .cols4-element {
                  margin-left: 0px
              }
              .cols4-element li {
                  float: none;
                  width: 100%;
              }
              .cols4-element li a {
                  margin-left: 0px
              }
          }
          .sub-contents-inner{
          	margin-top:7%;
          }
          /*댓글 */
          .reply{
          	  width:80%;
          	  border-collapse:collapse;
          	  font-size:1em;
          }
          
          .trd{
			 display:inline-block; 
			 border-radius:10px; 
			 height:100px; 
			 width:91%; 
			 border:1px #a9b2c2 solid;          
          }
         
          .replyList{
          		colspan:2;
          		width:70%;
          }
         </style>
     
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="sub">
	<%@ include file="../common/menubar.jsp" %>
            <!-- sub-detail-visual -->
            <div class="sub-contents-inner" id="container">
                <!-- wide-inner-->
				
                <div class="loction">
                    &gt;&nbsp;<span id="th" class="ar">Blog</span> 
                    &gt;&nbsp;<span id="tn" class="ar">${b.category }</span> 
                </div>
                <!-- location  -->

                <section class="infor-element">
                    <h3 class="h3 textcenter">${b.bTitle }</h3>
                    <br>                    
					<span style="float:right;">Views : ${b.bViews }</span><br>
					<span style="float:right;">Likes : ${b.bLikes }</span><br>
					<c:if test="${loginUser.nickname eq b.bWriter || loginUser.nickname eq 'ADMIN'}">
					<br><button id="dp" style="float:right; margin-left:10px;">Delete</button>					
					<button id="mp" style="float:right;">Modify</button>
					</c:if>
                    <div class="post-element">
                        <span>Posted : ${b.bCreateDate } / Modified : ${b.bModifyDate }</span>
                    </div>
                    <div class="text-area" style="text-align:center;">
                        ${b.bContent }
                        <br><br>
                        <div class="cnt-blockquote">
                            <dl>
                            	<dt>Address</dt>
                                <dd>${b.bAddress }</dd>
                            </dl>
                            <dl>
                            	<dt>Traffic</dt>
                                <dd>${b.bTrans }</dd>
                            </dl>
                            <dl>
                            	<dt>Fee</dt>
                            	<dd>${b.bFee }</dd>
                            </dl>
                            <dl>
                            	<dt>Tel</dt>
                                <dd>${b.bTel }</dd>
                            </dl>
                            <dl>
                            	<dt>Opening</dt>
                                <dd>${b.bHours }</dd>
                            </dl>
                        </div>
                        <p>&nbsp;</p>
                        <div id="map" style="width:100%;height:400px;"></div>
               					<br>
					<div class="like-content" align="center">
						<span>
    					Did you like this blog? Press like to make it easier for others to see!
  						</span>
  						<c:if test="${!empty loginUser }">
  						<button class="btn-secondary like-review" id="likeBtn" name="likeBtn" value="0">
    					<i class="fa fa-heart" aria-hidden="true"></i> Like </button></c:if>
					</div>
					<br><br><br>
					<div>
						<table class="reply" id="trt" align="center">
								<tr>
									<td>Reply</td>
									<c:if test="${empty loginUser }">
									<td colspan="2" width="95%"><a href="loginView.do" id="lof"><textarea name="brContent" id="tr" align="center" rows="5" cols="95" style="resize: none;" placeholder="If you want leave a message..Please login First" readonly="readonly"></textarea></a></td>
									</c:if>
									<c:if test="${!empty loginUser }">
									<td colspan="2" width="95%"><textarea name="brContent" id="trc" align="center" rows="5" cols="95" style="resize: none;" placeholder=""></textarea></td>
									</c:if>
								</tr>
						</table>
						<c:if test="${!empty loginUser}">
						<button id="bSubmit" style="float:right; margin-right:136px; border-radius:10px;">Add a Comment</button>
						</c:if>
						<br><br>
						<table class="reply" id="brtl" align="center">
							<tbody>
								<tr>
								 	
								</tr>							
							</tbody>
						</table>
					</div>
                        <br><br><br>
                
                <section class="tag-element detail">
                    <p>
                    </p>
                </section>
                    </div>
                        <br><br>
                        <ul class="cols4-element">
                            <li>
                            </li>
                        </ul>
					
                
               
            </div>
            <div class="heart heart-unliked"></div>
            <%@ include file="../common/footer.jsp" %>
            
            <script>
				var mapContainer = document.getElementById('map');
				var mapOption = {
				    center: new daum.maps.LatLng(37.566826, 126.9786567),
				    level: 5
				};  
				
				var map = new daum.maps.Map(mapContainer, mapOption); 
				
				//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				// 주소-좌표 변환 객체 생성
				var geocoder = new daum.maps.services.Geocoder();
				var adrs = '${t.tAddressH}';
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(adrs , function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${t.tAddress}'+'</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
				
				
				    /*~~~~~~~~~~~~조아요 ㅜㅜ~~~~~~~~~~~~~~~~~~*/
				    <%if(request.getSession().getAttribute("loginUser") != null){%>
				    $(function(){
				    	var loginUser = '${loginUser.nickname}';
				    	var bId = '${b.bId}';
				    	$.ajax({
				    		success:function(data){
				    			if(data =='true'){
				    			 var btn = $('#likeBtn');
				    			 btn.val(1);
				    			 btn.html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this ');
								 btn.children('.fa-heart').addClass('animate-like');
				    			}
				    		},error:function(){
				    			
				    		}
				    	});
				    	
						$(document).on('click', '.like-review', function(e) {
							if( $('#likeBtn').val() == 0 ){
								$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this ');
								$(this).children('.fa-heart').addClass('animate-like');
								$(this).val(1);
								like(this);
							}else{
								$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> Like ');
								$(this).children('.fa-heart').addClass('animate-like');
								$(this).val(0);
								like(this);
							}
						});
					});
				   <%}%>
				    function like(data) {
				   		var lv = data.value;
				   		var bId = '${b.bId}';
				   		var loginUser = '${loginUser.nickname}';
				    		
						 $.ajax({
							url: "bupdateLike.do",
							type:"post",
							data:{bId:bId,lv:lv,loginUser:loginUser},
							success:function(data){
								console.log(data);
							},error:function(){
							}
						});
					}
				    
				    $('.loction span').mouseenter(function(){
				    	$(this).css('cursor','pointer');
				    }).click(function(e){
				    	if(e.target.innerText == "Blog"){
				    		location.href="blog.do";
				    	}else{
				    		location.href="blog.do?keyword="+e.target.innerText;
				    	}
				    });
				   
				    //댓글 submit
				    $('#bSubmit').click(function(){
				    	var brWriter = '${loginUser.nickname}';
				    	var brContent = $('#brc').val();
				    	var refTid = '${b.bId}';
				    	
				    	$.ajax({
				    		url:"addTReply.do",
				    		data:{brWriter:brWriter,brContent:brContent,refTid:refTid},
				    		type:"post",
				    		success:function(data){	
				    			if(data=="success"){
				    				getTReplyList();
				    				$('#brc').val('');
				    			}
				    		},error:function(){
				    			console.log("댓글전송실패");
				    		}
				    	});
				    });
				    
				     $(function(){
				    	
				    	getTReplyList();
				    	
				    	/*  setInterval(function(){
				    		getTReplyList();
						}, 30000);  */
				     });
				    	function getTReplyList(){
				    		$tableBody = $('#brtl tbody');
				    		$tableBody.html("");
				    		
				    		var $tr; 
				    		var $trWriter; 
				    		var $td;
				    		var $trContent;
				    		var $trCreatedate;
				    		var $input;
				    		var $input2;
				    		
				    		var bId = '${b.bId}';
				    		$.ajax({
				    			url:"btrList.do",
				    			data:{tId:tId},
				    			dataType:"json",
				    			success:function(data){
				    				
				    				if(data.length > 0){
				    				
				    				for(var i in data){
				    				
					    				if(data[i].brWriter == '${loginUser.nickname}'){
					    					
					    				$tr = $('<tr>');
					    				$trWriter = $('<td>').text(data[i].brWriter);
					    				$td = $('<td>').addClass('replyList');
					    				$brContent = $('<div align="center">').addClass('trd').text(data[i].brContent);
					    				$brCreateDate = $('<td>').text(data[i].brCreateDate);
					    				var $br = $('<br>');
					    				$input = $('<input type="button" value="Delete">').css('font-size','0.8em')
					    				.attr('onclick','delReply(this);').addClass('delThis');
					    				$input2 = $('<input type="hidden">').val(data[i].brId).addClass('delbrId');

					    				$tr.append($brWriter);
					    				$tr.append($td);
					    				$td.append($brContent);
					    				$tr.append($brCreateDate);
					    				$trCreateDate.append($br);
					    				$trCreateDate.append($input);
					    				$trCreateDate.append($input2);
					    				
					    				$tableBody.append($tr);
				    					}else{
				    						$tr = $('<tr>');
						    				$brWriter = $('<td>').text(data[i].brWriter);
						    				$td = $('<td>').addClass('replyList');
						    				$brContent = $('<div align="center">').addClass('trd').text(data[i].brContent);
						    				$brCreateDate = $('<td colspan="10">').text(data[i].brCreateDate);
						    				
						    				$tr.append($brWriter);
						    				$tr.append($td);
						    				$td.append($brContent);
						    				$tr.append($brCreateDate);
						    				
						    				$tableBody.append($tr);
				    					}	
				    				}
				    				
				    				}else{
				    					$tr = $('<tr>');
				    					$td = $('<td>').addClass('replayList');
				    					$brContent = $('<div align="center">').addClass('trd').text('Leave First Reply Our Journey');
				    					
				    					$tr.append($td);
				    					$td.append($brContent);
				    					$tableBody.append($tr);
				    				}
				    			},error:function(){
				    				console.log("전송실패");
				    			}
				    		});
				    	}
				    //포스트 수정
				    $('#mp').click(function(){
				    	location.href="blogModifyView.do?bId="+'${b.bId}';
				    });
				    
				    //포스트 삭제
				    $('#dp').click(function(){
				    	var e = window.confirm("Are you delete your post?");
				    	if(e){
				    		location.href="deleteBlog.do?bId="+'${b.bId}';
				    	}
				    });
				  	
				    //댓글 삭제
				    function delReply(value){
				    	var brId = $(value).siblings('input').val();
				    	var e = window.confirm("Are you delete your reply?");
				    	if(e){
				    		$.ajax({
				    			 url:"deleteBReply.do",
				    			type:"get",
				    			data:{brId:brId},
				    			success:function(data){
				    				if(data == 'success') getTReplyList();
				    				alert("Delete Success");
				    			},error:function(){
				    				
				    			}
				    		});
				    	}
				    } 
</script>				    	
</body>

</html>