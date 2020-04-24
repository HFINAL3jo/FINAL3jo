<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="ko">

<head>
    <title>aligo</title>
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
              margin: 5px 0px
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
              padding-top: 3px
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
              width: 100%
          }
          
          .cols4-element li a span {
              display: block;
          }
          
          .cols4-element li a .cont {
              padding: 20px 15px;
          }
          
          .cols4-element li a .cont .title {
              font-size: 16px;
              color: #333;
              font-weight: 900
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
              height: 20px;
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
                    &gt;&nbsp;<span id="th" class="ar">Theme</span> 
                    &gt;&nbsp;<span id="tn" class="ar">${t.tName }</span> 
                </div>
                <!-- location  -->

                <section class="infor-element">
                    <h3 class="h3 textcenter">${t.tTitle }</h3>
                    <br>                    
					<span style="float:right;">Views : ${t.tViews }<br></span>
					<c:if test="${loginUser.nickname eq t.tWriter || loginUser.nickname eq 'ADMIN'}">
					<c:url var="mo" value="themeModifyView.do">
						<c:param name="t" value="${t }"/>
					</c:url>
					<br><button id="mp" value="${mo }" style="float:right;">Modify</button>					
					</c:if>
                    <div class="post-element">
                        <span>Posted : ${t.tCreateDate } / Modified : ${t.tModifyDate }</span>
                    </div>
                    <div class="text-area" style="text-align:center;">
                        ${t.tContent }
                        <br><br>
                        <div class="cnt-blockquote">
                            <dl><dt>Address</dt>
                                <dd>${t.tAddress }</dd>
                            </dl>
                            <dl><dt>Traffic</dt>
                                <dd>${t.tTrans }</dd>
                            </dl>
                            <dl><dt>Fee</dt>
                                <c:if test="${!empty t.tFee  }">${t.tFee }<dd></dd></c:if>
                                <c:if test="${empty t.tFee  }">Free<dd></dd></c:if>
                            </dl>
                            <dl><dt>Tel</dt>
                                <dd>${t.tTel }</dd>
                            </dl>
                            <dl><dt>Opening</dt>
                                <dd>${t.tHours }</dd>
                            </dl>
                        </div>
                        <p>&nbsp;</p>
                        <div id="map" style="width:100%;height:400px;"></div>
               					<br>
					<div class="like-content" align="center">
						<span>
    					Did you like this review? Press like to make it easier for others to see!
  						</span>
  
  						<button class="btn-secondary like-review" id="likeBtn" name="likeBtn" value="0" onclick="like(this);">
    					<i class="fa fa-heart" aria-hidden="true"></i> Like ${t.tLikes}
  						</button>
					</div>
					<br><br><br>
					<div>
						<table class="reply" id="trt" align="center">
								<tr>
									<td>Reply</td>
									<c:if test="${empty loginUser }">
									<td colspan="2" width="95%"><a href="loginView.do" id="lof"><textarea name="trContent" id="tr" align="center" rows="5" cols="95" style="resize: none;" placeholder="If you want leave a message..Please login First" readonly="readonly"></textarea></a></td>
									</c:if>
									<c:if test="${!empty loginUser }">
									<td colspan="2" width="95%"><textarea name="trContent" id="trc" align="center" rows="5" cols="95" style="resize: none;" placeholder=""></textarea></td>
									</c:if>
								</tr>
						</table>
						<c:if test="${!empty loginUser}">
						<button id="rSubmit" style="float:right; margin-right:136px; border-radius:10px;">Add a Comment</button>
						</c:if>
						<br><br>
						<table class="reply" id="trtl" align="center">
							<tbody>
								<tr>
								 	
								</tr>							
							</tbody>
						</table>
					</div>
                        <br><br><br>
                        <h3 class="black"># ${t.tKeyword}</h3>
                        <br><br>
                        <ul class="cols4-element">
                            <li>
                                <a href="http://me2.do/xDAyqdMi" title="서울야경 스릴 있게 즐기기!"><img src="//comm/getImage?srvcId=MEDIA&amp;parentSn=27505&amp;fileTy=MEDIA&amp;fileNo=1" alt="서울야경 스릴 있게 즐기기!"><span class="cont"><span class="title">서울야경 스릴 있게 즐기기!</span><span class="content">                    국내 최고 높이의 롯데타워 전망대에서                    아찔한 인증샷을 남겨보자.</span></span><span class="link"><span>랜드마크 서울스카이</span></span>
                                </a>
                            </li>
                            <li>
                                <a href="http://me2.do/5e04rj8z" title="비가와도 걱정 없는 이곳!"><img src="//comm/getImage?srvcId=MEDIA&amp;parentSn=27506&amp;fileTy=MEDIA&amp;fileNo=1" alt="비가와도 걱정 없는 이곳!"><span class="cont"><span class="title">비가와도 걱정 없는 이곳!</span><span class="content">아이들과의 여행에서 비가 온다면?걱정 없이 즐길 수 있는 잠실 여행코스.</span></span><span class="link"><span>하루 종일 놀 수 있는 실내코스 </span></span>
                                </a>
                            </li>
                            <li>
                                <a href="http://me2.do/GcbukJyo" title="  낮과밤 모두 완벽한 석촌호수"><img src="//comm/getImage?srvcId=MEDIA&amp;parentSn=27507&amp;fileTy=MEDIA&amp;fileNo=1" alt="  낮과밤 모두 완벽한 석촌호수"><span class="cont"><span class="title">                    낮과밤 모두 완벽한 석촌호수</span><span class="content">                    도심 속에서 즐기는 특별한 여유!                    고요한 호수 산책과                    여유를 즐겨보는 코스.</span></span><span class="link"><span>                    석촌호수 힐링여행</span></span>
                                </a>
                            </li>
                            <li>
                                <a href="http://me2.do/GXmjSWe1" title="자동차 극장은 처음이지?"><img src="//comm/getImage?srvcId=MEDIA&amp;parentSn=27508&amp;fileTy=MEDIA&amp;fileNo=1" alt="자동차 극장은 처음이지?"><span class="cont"><span class="title">자동차 극장은 처음이지?</span><span class="content">                    색다른 경험과 즐거움이 가득한                    자동차 극장 백배 즐기는 방법.</span></span><span class="link"><span>잠실 자동차 극장</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
					
                </section>
                <section class="tag-element detail">
                    <span class="title">태그</span>
                    <p>
                        <a href="/search?search_radio=T&amp;lang=ko&amp;searchTerm=낮과-밤-모두-완벽한-이곳-석촌호수">#${t.tKeyword }</a>
                    </p>
                </section>
               
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
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+adrs+'</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
				
				
				
				//--------------------------------
                            //		jQuery.noConflict();
                            var locale = 'ko';
                            var current_url_ = 'http://korean.visitseoul.net/nature/낮과-밤-모두-완벽한-이곳-석촌호수_/33228';
                            var current_url = location.href;
                            /* 		if(current_url.indexOf("&WT.ac") != -1){
                            			//current_url=current_url.replace(current_url.slice(current_url.indexOf("&WT"), current_url.length),"");
                            		}else{
                            			current_url=current_url+"&WT.ac=MainBanner1-1";
                            			current_url_=current_url_+"&WT.ac=MainBanner1-1";
                            		} */

                            var consumer_seq = "744";
                            var smartlogin_seq = "";

                            if (locale == 'ko') {
                                smartlogin_seq = "879";
                            } else if (locale == 'en') {
                                smartlogin_seq = "879";
                            } else if (locale == 'ja') {
                                smartlogin_seq = "880";
                            } else if (locale == 'zh-CN') {
                                smartlogin_seq = "881";
                            } else {
                                smartlogin_seq = "881";
                            }

                            var title = '낮과 밤 모두 완벽한 이곳, 석촌호수!';

                            var refer = "evt_event_id=N_" + 33228;

                            refer = refer.replace("http://", "");

                        $(function() {
                        	  $(".heart").on("click", function() {
                        	    $(this).toggleClass("is-active");
                        	  });
                        	});
				    /*~~~~~~~~~~~~조아요 ㅜㅜ~~~~~~~~~~~~~~~~~~*/
				    $(function(){
						$(document).on('click', '.like-review', function(e) {
							if( $('#likeBtn').val() == 0 ){
								$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this '+${t.tLikes});
								$(this).children('.fa-heart').addClass('animate-like');
								$(this).val(1);
								
							}else{
								$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> Like '+ ${t.tLikes});
								$(this).children('.fa-heart').addClass('animate-like');
								$(this).val(0);
							}
						});
					});
				    /*~~~~~~~~~~~~조아요 ㅜㅜ~~~~~~~~~~~~~~~~~~*/
				    function like(value) {
				   		console.log(value);
						/* $.ajax({
							url: "updateLike.do",
							type: ,
							data:
						}); */
					}
				    
				    //theme > themename 링크
				    $('.loction span').mouseenter(function(){
				    	$(this).css('cursor','pointer');
				    }).click(function(e){
				    	if(e.target.innerText == "Theme"){
				    		location.href="theme.do";
				    	}else{
				    		location.href="theme.do?keyword="+e.target.innerText;
				    	}
				    });
				   
				    //댓글 submit
				    $('#rSubmit').click(function(){
				    	var trWriter = '${loginUser.nickname}';
				    	var trContent = $('#trc').val();
				    	var refTid = ${t.tId};
				    	
				    	$.ajax({
				    		url:"addTReply.do",
				    		data:{trWriter:trWriter,trContent:trContent,refTid:refTid},
				    		type:"post",
				    		success:function(data){	
				    			if(data=="success"){
				    				getTReplyList();
				    			}
				    		},error:function(){
				    			console.log("댓글전송실패");
				    		}
				    	});
				    });
				    
				    $(function(){
				    	
				    	getTReplyList();
				    	
				    	setInterval(function(){
				    		getTReplyList();
						}, 30000);
				    	
				    	function getTReplyList(){
				    		$tableBody = $('#trtl tbody');
				    		$tableBody.html("");
				    		
				    		var $tr; 
				    		var $trWriter; 
				    		var $td;
				    		var $trContent;
				    		var $trCreatedate;
				    		var $input;
				    		
				    		var tId = ${t.tId};
				    		$.ajax({
				    			url:"trList.do",
				    			data:{tId:tId},
				    			dataType:"json",
				    			success:function(data){
				    				
				    				if(data.length > 0){
				    				
				    				for(var i in data){
				    				
					    				if(data[i].trWriter == '${loginUser.nickname}'){
					    					
					    				$tr = $('<tr>');
					    				$trWriter = $('<td>').text(data[i].trWriter);
					    				$td = $('<td>').addClass('replyList');
					    				$trContent = $('<div align="center">').addClass('trd').text(data[i].trContent);
					    				$trCreateDate = $('<td>').text(data[i].trCreateDate);
					    				var $br = $('<br>');
					    				$input = $('<input type="button" value="Delete">').css('font-size','0.8em')
					    				.attr('onclick','window.confirm("Are you sure?");');
					    				
					    				$tr.append($trWriter);
					    				$tr.append($td);
					    				$td.append($trContent);
					    				$tr.append($trCreateDate);
					    				$trCreateDate.append($br);
					    				$trCreateDate.append($input);
					    				
					    				$tableBody.append($tr);
				    					}else{
				    						$tr = $('<tr>');
						    				$trWriter = $('<td>').text(data[i].trWriter);
						    				$td = $('<td>').addClass('replyList');
						    				$trContent = $('<div align="center">').addClass('trd').text(data[i].trContent);
						    				$trCreateDate = $('<td colspan="10">').text(data[i].trCreateDate);
						    				
						    				$tr.append($trWriter);
						    				$tr.append($td);
						    				$td.append($trContent);
						    				$tr.append($trCreateDate);
						    				
						    				$tableBody.append($tr);
				    					}	
				    				}
				    				
				    				}else{
				    					$tr = $('<tr>');
				    					$td = $('<td>').addClass('replayList');
				    					$trContent = $('<div align="center">').addClass('trd').text('Leave First Reply Our Journey');
				    					
				    					$tr.append($td);
				    					$td.append($trContent);
				    					$tableBody.append($tr);
				    				}
				    			},error:function(){
				    				console.log("전송실패");
				    			}
				    		});
				    	}
				    });
				    
					</script>
</body>

</html>