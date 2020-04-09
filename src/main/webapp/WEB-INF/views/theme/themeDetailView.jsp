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
    <link type="text/css" rel="stylesheet" href="https://101.livere.co.kr/extension_8/attachFile/attachFile.css">
    <link type="text/css" rel="stylesheet" href="https://101.livere.co.kr/css/default_livere8_gzip.css">
    <link type="text/css" rel="stylesheet" href="https://101.livere.co.kr/consumers/visitseoul/visitseoul.css">
    <link type="text/css" rel="stylesheet" href="https://101.livere.co.kr/css/default_actionwidzet8_gzip.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=services"></script>
    
    <style>
        .loction{
            width: 100%;
            max-width: 1200px;
            margin: 10px auto 0 auto;
            padding: 10px 0px 20px 15px;
            font-size: 16px;
            color: #666;
            background: url(../../../assets/images/2019/common/ico-home@2x.png) no-repeat 0px 15px;
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

    </style>
    <style>
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
              background: url(/humanframe/theme/visitseoul/assets/images/2019/web_content/0128/ico-arrow.png) no-repeat right center
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
     </style>
</head>

<body class="sub">
	<%@ include file="../common/menubar.jsp" %>
            <!-- sub-detail-visual -->
            <div class="sub-contents-inner" id="container">
                <!-- wide-inner-->

                <div class="loction">
                    <span class="ar">&gt;</span> 테마
                    <span class="ar">&gt;</span>
                    <span>자연과 공원</span>
                </div>
                <!-- location  -->

                <section class="infor-element">
                    <div class="text-type">
                       		공원&amp;정원</div>
                    <h3 class="h3 textcenter">낮과 밤 모두 완벽한 이곳, 석촌호수!</h3>

                    <div class="post-element">
                        <span>제작일 : 2020.02.18 / 수정일 : 2020.02.18</span>
                    </div>
                    <div class="text-area">
                        
                        <p>도심 속에서 즐기는 여유는 특별한 감성을 가져다준다.
                            <br>그곳이 고요한 호수의 산책이라면 더 훌륭하다.
                            <br>
                            <br><strong>바쁜 여행 일정 속에 몸과 마음에도 가끔은 휴식이 필요하다.<br>지친 일상을 달래줄 석촌호수의 산책로에서 여유를 즐겨 보는 건 어떨까.</strong></p>
                        <p>&nbsp;</p>
                        <p style="text-align:center;padding-bottom:15px"><img class="main-img" src="/spring/resources/images/gyungbok_palace.jpg" alt="낮과 밤 모두 완벽한 이곳, 석촌호수!"></p>
                        <p>&nbsp;</p>
                        <h3>석촌호수</h3>
                        <p>&nbsp;</p>
                        <p>석촌호수는 송파대로가 호수를 가로질러 가게 되면서 기다란 8자 모양을 하고 있다.
                            <br>잠실역과 롯데월드타워가 바로 연결되어 있어 접근성도 용이하다.
                            <br>호수를 따라 걷다 보면 알록달록한 벽화들, 전시공간, 조각품 등 다양하게 꾸며져 있어 산책로가 지루하지 않다.</p>
                        <p>&nbsp;</p>
                        <h4># 석촌호수 즐기기</h4>
                        <p><strong>1. 산책로 걷기</strong>
                            <br>
                            <br>잘 가꿔진 도심 속 쉼터라는 타이틀이 아깝지 않을 매력을 가지고 있는 석촌호수다.
                            <br>낮에는 낮의 매력을 밤에는 밤의 아름다움을 뽐내고 시즌 별로 열리는 축제도 기다리게 된다.
                            <br>그중에서도 석촌호수의 야경은 아름다운 서울을 눈에 담을 수 있는 매력적인 코스로 통한다.
                            <br>
                            <br>서호와 동호가 합쳐진 석촌호수는 약 2.5km 되며, 천천히 걸으면 한 시간이 조금 넘게 걸린다.
                            <br>동호 방향에는 롯데월드타워, 롯데월드몰이 있으며, 서호 방향에는 롯데월드가 위치해 있다.
                            <br>걷다 보면 롯데월드의 동화 같은 성을 만나기도 하고, 액티브한 놀이기구를 타는 사람들의 즐거운 비명소리를 듣기도 한다.</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p><img class="main-img" src="/spring/resources/images/gyungbok_palace.jpg" alt="석촌호수">
                        <p>&nbsp;</p>
                        <p>누구에게나 열려있는 ‘공유 피아노’를 만나게 되면 그냥 지나칠 수가 없다.
                            <br>운이 좋으면 근사한 음악 연주를 들을 수 있고, 직접 연주해 볼 수도 있어 한 번씩 머물다 가는 곳이다.</p>
                        <p>&nbsp;</p><img class="main-img" src="/spring/resources/images/gyungbok_palace.jpg" alt="석촌호수">
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <div class="cnt-blockquote">
                            <dl><dt>주소</dt>
                                <dd>서울 송파구 잠실동</dd>
                            </dl>
                            <dl><dt>지하철</dt>
                                <dd>2호선 잠실역 3번 출구</dd>
                            </dl>
                            <dl><dt>입장료</dt>
                                <dd>무료</dd>
                            </dl>
                            <dl><dt>전화번호</dt>
                                <dd>02-412-0190</dd>
                            </dl>
                            <dl><dt>이용시간</dt>
                                <dd>매일 00:00 ~ 24:00</dd>
                            </dl>
                        </div>
                        <p>&nbsp;</p>
                        <div id="map" style="width:70%;height:400px;"></div>
               <script>
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
					{	content :'디뮤지엄',
						address :'서울특별시 용산구 한남동 독서당로29길 5-6'},
					{	content :'로우앤슬로우',
						address :'서울특별시 용산구 이태원1동 보광로 126'},
					{	content :'국립중앙박물관',
						address :'서울특별시 용산구 서빙고동 서빙고로 137'},
					{	content :'Fountain',
						address :'서울특별시 용산구 이태원동 116-6'}    
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
				                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
				                disableAutoPan: true
				            });
				            //infowindow.open(map, marker);
				        }
				        kakao.maps.event.addListener(marker, 'click', function() {
				            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				            infowindow.setContent('<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>');
				            infowindow.open(map, marker);
				        });
				    });
				});
				
				
				</script>
					<br>
					<hr>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <h3 class="black"># 엔도르핀이 팍팍, 잠실</h3>
                        <p>&nbsp;</p>
                        <ul class="cols4-element">
                            <li>
                                <a href="http://me2.do/xDAyqdMi" title="서울야경 스릴 있게 즐기기!"><img src="/comm/getImage?srvcId=MEDIA&amp;parentSn=27505&amp;fileTy=MEDIA&amp;fileNo=1" alt="서울야경 스릴 있게 즐기기!"><span class="cont"><span class="title">서울야경 스릴 있게 즐기기!</span><span class="content">                    국내 최고 높이의 롯데타워 전망대에서                    아찔한 인증샷을 남겨보자.</span></span><span class="link"><span>랜드마크 서울스카이</span></span>
                                </a>
                            </li>
                            <li>
                                <a href="http://me2.do/5e04rj8z" title="비가와도 걱정 없는 이곳!"><img src="/comm/getImage?srvcId=MEDIA&amp;parentSn=27506&amp;fileTy=MEDIA&amp;fileNo=1" alt="비가와도 걱정 없는 이곳!"><span class="cont"><span class="title">비가와도 걱정 없는 이곳!</span><span class="content">아이들과의 여행에서 비가 온다면?걱정 없이 즐길 수 있는 잠실 여행코스.</span></span><span class="link"><span>하루 종일 놀 수 있는 실내코스 </span></span>
                                </a>
                            </li>
                            <li>
                                <a href="http://me2.do/GcbukJyo" title="  낮과밤 모두 완벽한 석촌호수"><img src="/comm/getImage?srvcId=MEDIA&amp;parentSn=27507&amp;fileTy=MEDIA&amp;fileNo=1" alt="  낮과밤 모두 완벽한 석촌호수"><span class="cont"><span class="title">                    낮과밤 모두 완벽한 석촌호수</span><span class="content">                    도심 속에서 즐기는 특별한 여유!                    고요한 호수 산책과                    여유를 즐겨보는 코스.</span></span><span class="link"><span>                    석촌호수 힐링여행</span></span>
                                </a>
                            </li>
                            <li>
                                <a href="http://me2.do/GXmjSWe1" title="자동차 극장은 처음이지?"><img src="/comm/getImage?srvcId=MEDIA&amp;parentSn=27508&amp;fileTy=MEDIA&amp;fileNo=1" alt="자동차 극장은 처음이지?"><span class="cont"><span class="title">자동차 극장은 처음이지?</span><span class="content">                    색다른 경험과 즐거움이 가득한                    자동차 극장 백배 즐기는 방법.</span></span><span class="link"><span>잠실 자동차 극장</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>

                </section>
                <section class="tag-element detail">
                    <span class="title">태그</span>
                    <p>
                        <a href="/search?search_radio=T&amp;lang=ko&amp;searchTerm=낮과-밤-모두-완벽한-이곳-석촌호수">#낮과-밤-모두-완벽한-이곳-석촌호수</a>
                    </p>
                </section>
                <!-- livere -->
                <div class="livere-wrap">
                    <!-- livere8 -->
                    <script type="text/javascript" src="/humanframe/theme/visitseoul/assets/script/livere8_lib.js" charset="utf-8"></script>
                    <div id="livereContainer" style="padding-top:30px;" class="livereReply_useMouseOver">
                        <script type="text/javascript">
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

                            var livere_seq = "";
                            var consumer_seq = "744";
                            var smartlogin_seq = "";

                            if (locale == 'ko') {
                                livere_seq = "18866";
                                smartlogin_seq = "879";
                            } else if (locale == 'en') {
                                livere_seq = "18867";
                                smartlogin_seq = "879";
                            } else if (locale == 'ja') {
                                livere_seq = "18869";
                                smartlogin_seq = "880";
                            } else if (locale == 'zh-CN') {
                                livere_seq = "18868";
                                smartlogin_seq = "881";
                            } else {
                                livere_seq = "24906";
                                smartlogin_seq = "881";
                            }

                            var title = '낮과 밤 모두 완벽한 이곳, 석촌호수!';

                            var refer = "evt_event_id=N_" + 33228;

                            refer = refer.replace("http://", "");

                            livereReply = new Livere(livere_seq, refer, title);
                            livereReply.site = current_url;
                            livereReply.description = current_url;
                            livereLib.start();
                        </script>
                        <div id="liverePlugIn">
                            <h3 class="livereNone">소셜댓글 라이브리 영역. SNS 계정으로 로그인해 댓글을 작성하고 SNS로 전송할 수 있습니다</h3>
                            <div id="livereWriteForm">
                                <div id="livereWriteFormTop"> <span id="livereSNSLoginTitle">소셜로그인</span>
                                    <div id="livereSNSLoginIconContainer">
                                        <ul id="livereLogged" class="livereNone"></ul>
                                        <ul id="livereNotLogged">
                                            <li id="livere_facebook">
                                                <button type="button" class="livereSNSLoginIcon livereClick livereBtn1" clicktype="snsLoginBtn" rel="tooltip"> <span class="livereSNSImage_B livere_t_indent">Facebook 로그인 페이지 새창이 열립니다</span> </button>
                                            </li>
                                            <li id="livere_twitter">
                                                <button type="button" class="livereSNSLoginIcon livereClick livereBtn1" clicktype="snsLoginBtn" rel="tooltip"> <span class="livereSNSImage_B livere_t_indent">Twitter 로그인 페이지 새창이 열립니다</span> </button>
                                            </li>
                                            <li id="livere_google_plus">
                                                <button type="button" class="livereSNSLoginIcon livereClick livereBtn1" clicktype="snsLoginBtn" rel="tooltip"> <span class="livereSNSImage_B livere_t_indent">GooglePlus 로그인 페이지 새창이 열립니다</span> </button>
                                            </li>
                                            <li id="livere_linkedIn">
                                                <button type="button" class="livereSNSLoginIcon livereClick livereBtn1" clicktype="snsLoginBtn" rel="tooltip"> <span class="livereSNSImage_B livere_t_indent">LinkedIn 로그인 페이지 새창이 열립니다</span> </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="livereWriteFormMiddle">
                                    <div id="livereWriteFromMiddleLeft">
                                        <ul id="liverePrimaryStatus">
                                            <li> <span id="liverePrimaryThumb" class="notLoggedThumb">							<img src="https://101.livere.co.kr/images/_.gif" alt="로그인 전 프로필 이미지">						</span> </li>
                                        </ul>
                                    </div>
                                    <div id="livereWriteFormMiddleRightContainer">
                                        <label for="livere_contentText" class="livereNone">댓글입력하는영역</label>
                                        <ul id="livereWriteFormMiddleRight" class="livereWriteFormWrapper">
                                            <li class="livereAccInfoWrapper">
                                                <p id="livereAccInfo" class="livereAccInfo">소셜계정으로 작성하세요</p>
                                            </li>
                                            <li id="livereWriteParamsForm" class="livereContentTextForm">
                                                <input id="livere_short_url" name="livere_short_url" type="hidden">
                                                <input id="livere_name" name="livere_name" type="hidden">
                                                <input id="livere_parent_seq" name="livere_parent_seq" type="hidden">
                                                <textarea tabindex="0" id="livere_contentText" class="livere_contentText" name="livere_content" targetname="livereParentStrCount" title="댓글입력하는영역" aria-label="댓글입력하는영역" disabled="disabled">로그인 후 작성 가능합니다</textarea>
                                            </li>
                                            <li id="livereWriteFormFunction" class="livereFunctionContainer">
                                                <ul id="livereFunctionWrapper" class="livereFunctionWrapper">
                                                    <li id="livereAttachOpenBtnsWrapper">
                                                        <button type="button" id="livereImageAttachOpenBtn" class="livereAttachOpenBtns livereBtn3 livere_t_indent" rel="tooltip"><span>사진첨부창 열기</span></button>
                                                        <button type="button" id="livereVideoAttachOpenBtn" class="livereAttachOpenBtns livereBtn3 livere_t_indent" rel="tooltip"><span>비디오첨부창 열기</span></button>
                                                    </li>
                                                    <li class="livereTextCountWrapper"> <strong id="livereParentStrCount">0</strong>/<span id="livereStrMaxCount">250</span> </li>
                                                </ul>
                                            </li>
                                            <li id="livereWriteFormMiddleBottom">
                                                <button type="button" id="livereWriteBtn" class="livereWriteBtn livereBtn2"><span class="livereFont5">보내기</span></button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="livereHome"><span id="livereHomeBtn"><a href="http://www.livere.com" title="라이브리 홈페이지 - 새 창이 열립니다" aria-label="라이브리 홈페이지 - 새 창이 열립니다" target="_blank">Powered by <strong class="livereColor1">Live</strong><strong class="livereColor2">Re</strong></a></span></div>
                            </div>
                        </div>
                    </div>
                    <!-- //livere8-->
                </div>
                <!--// livere -->
            </div>
            <%@ include file="../common/footer.jsp" %>
</body>

</html>