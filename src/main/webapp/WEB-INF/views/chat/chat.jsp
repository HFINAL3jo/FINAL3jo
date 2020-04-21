<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />

	<style>
		.chat{
			margin: auto;
			border: 1px solid black;
			height: 60em;
			position: relative;
			text-align: center;
			padding-left: 0px !important;
			padding-right: 0px !important;
		}
	
		.mybtn {
		  color: snow;
		  border: 1px solid #0067b8;
		  background: #0067b8;
		  width: 11em;
		  height: 2em; 
		  font-size: 14px;
		  margin: 1%;
		}
		
		
		.chat-bubble {
		  border-radius: 5px;
		  display: inline-block;
		  padding: 10px 18px;
		  position: relative;
		  margin: 10px;
		  max-width: 80%;
		}
		
		.chat-bubble:before {
		  content: "\00a0";
		  display: block;
		  height: 16px;
		  width: 9px;
		  position: absolute;
		  bottom: -7.5px;
		}
		
		.chat-bubble.left {
		  background-color: #e6e5eb;
		  float: left;
		  margin-left: 55px;
		}
		
		.chat-bubble.left:before {
		  background-color: #e6e5eb;
		  left: 10px;
		  -webkit-transform: rotate(70deg) skew(5deg);
		}
		
		.chat-bubble.right {
		  background-color: #158ffe;
		  color: #fff;
		  float: right;
		  margin-right: 55px;
		}
		
		.chat-bubble.right:before {
		  background-color: #158ffe;
		  right: 10px;
		  -webkit-transform: rotate(118deg) skew(-5deg);
		}
		
		.chat-bubble.right a.autolinker {
		  color: #fff;
		  font-weight: bold;
		}
		
		.message {
		  font-size: 14px;
		}
		
		.message-detail {
		  white-space: nowrap;
		  font-size: 14px;
		}
		
		.bold {
		  font-weight: bold;
		  
		}
		
		.profile-pic {
		    width: 40px;
		    height: 40px;
		    border-radius: 50%;
		    position: absolute;
		    bottom: 10px;
		}
		
		.profile-pic.left {
		    left: 10px;
		}
		
		.message-wrapper {
		  position: relative;
		}
		
		.cf {
		    clear: both !important;
		}
		
		.visit{
			font-size: 17px;
		}
		
		
		.chatTitle h3{
			position: relative;
			margin-bottom: 0px;
			border-bottom: 3px solid white;
			padding-top: 1%;
			padding-bottom: 1%;
		}
		
		.p_filter_widgets .list li a {
		    font-size: 14px;
		    font-family: "Poppins", sans-serif;
		    font-weight: normal;
		    color: #797979;
		    position: relative;
		    cursor: pointer;
		}
	</style>


</head>
<body>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>

	<!--::header part start::-->

	<%@ include file="../common/menubar.jsp"%>
	<!-- Header part end-->

	<c:if test="${ !empty sessionScope.loginUser }">
	<input type="hidden" id="room"/>
	<input type="hidden" id="receiveNn"/>
	
	<section class="cat_product_area section_padding" style="padding-bottom: 65px;">
        <div class="container">
            <div class="row">
            	<div class="col-lg-2" style="padding-left: 0px; padding-right: 0px; margin-right: 10px;">
					<div class="left_sidebar_area">
					    <aside class="left_widgets p_filter_widgets">
					        <div class="l_w_title">
					            <h2>Chat List</h2>
					        </div>
					        <div class="widgets_inner">
					        	<button class="mybtn" id="conBtn">Connection</button> <br>
			                    <button class="mybtn" id="createBtn">Create</button>
					            <ul class="list" id="chatRoom-area">
					            	
					            </ul>
					        </div>
					    </aside>
					</div>
				</div>
				
				<div class="chat col-lg-9" style="background-color: #F2F5F8;">
					<div class="chatTitle">
						<h3></h3>
					</div>
					<!-- Server responses get written here -->
					<div class="msgArea" style="height: 90%; position: relative;">
						<div id="messageArea" style="position: relative; margin: auto; width: 90%; height: 87%; overflow: auto;">
							
						</div>
						<div>
							<div style="position: relative; height: 100%; align-content: center;"> 
								<%-- <input type="text" id="sender" value="${sessionScope.loginUser.nickname }"
									style="display: none;"/> --%>
								<input type="text" id="message" style="height:90px; width: 77%; margin: 1% auto;">
								<!-- <button type="button" onclick="openSocket();">Open</button> -->
								<button type="button" class="mybtn" style="width: 6em;" onclick="clientSend();">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	</c:if>
	
	<c:if test="${ empty sessionScope.loginUser }">
    	<br><br><br><br>    	<br><br><br><br>
    	<div style="margin: auto; align-content: center; text-align: center;">
	    	<h1 style="margin: auto; align-content: center; font-weight: bolder;">After login, you can use.</h1>
    	</div>
    	<br><br><br><br>    	<br><br><br><br>
    </c:if>
	
	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->
	
	
	
	<script>
		var socket;
		var connect = false;
		var serverport;
		
		$(function(){
			/* 
			$.ajax({
				url : "spring/serverIdSetting.properties",
				dataType : "text",
				success : function(data){
					var temp = data.split("=");
					serverport = temp[temp.length-1];
				}
			});
			 */
			/* 
			$("#id").change(function(){
	    		var roomVal=$("#room").val().trim();
	    		var idVal=$('#id').val().trim();
	    		if(idVal.length<1){
	    			alert('id를 입력해 주세요');
	    			$('#id').focus();
	    			return;
    		}
	    	 */
	    	$("#messageinput").keydown(function(key) {
                if (key.keyCode == 13) {
                	clientSend();
                }
            });
	    	 
		});
			
		//message token구성
		function MessageFlag(nickname, room, msg, flag, receiveNn){
			this.nickname=nickname;
			this.room=room;
			this.msg=msg;
			//file / msg / filename
			this.flag=flag;
			this.receiveNn=receiveNn;
		}
		
		function clientSend(){
        	/* 
			if($("#id").val().trim().length<2){
        		alert('2자이상의 아이디를 입력하세요');
        		$("#id").focus();
        		return;
        	}
        	if($("#room").val().trim().length<2){
        		alert('2자이상의 아이디를 입력하세요');
        		$("#room").focus();
        		return;
        	}
        	 */
            console.log(message);
            socket.send(JSON.stringify(new MessageFlag("${ sessionScope.loginUser.nickname }", $("#room").val(), $('#message').val(), "msg", $("#receiveNn").val() )));
            
			
            
            //귓속말해제하기!
            //$("#receiveNn").val("");
        }
		 
		$('#conBtn').on('click', function(){
        	
			connect = true;
        	socket = new WebSocket('ws://localhost:8888/spring/chat.do');
        	socket.onmessage =function(e){
               if(e.data.includes("file")){
                	createLink(e.data);
        		}
               else{
        			var data=JSON.parse(e.data);
        			console.log(data);
        			
        			if(data["flag"]=="room"){
        				var rooms = data['msg'].split(",");
        				/* 
        				$("#chatRoom-container").html('<p>채팅방현황</p>');
        				 */
        				 
        				 /*
        				 	<li>
			            		<a>asdfasfd</a>
			            	</li>
        				 */
        				for(var i=0;i<rooms.length;i++){
        					$("#chatRoom-area").append( $("<li>").html("<a>" + rooms[i] + "</a>").click(function(){
        						
        						$("#room").val( $(this).children().html() );

        						$('.chatTitle').children().html($(this).children().html());
        					}));
        				}
        				checkCurrentRoom(rooms);
        			}
        			else if(data["flag"]=="user"){
        				var users=data['msg'].split(",");
        				//$("#users-container").html("<p>접속자현황</p>");
        				/* for(var i=0;i<users.length;i++){
        					$("#users-container").append( $("<P>").html(users[i]).click(function(){
        						$("#receiveNn").val($(this).html());
        						checkclick(this);
        					}));
        				} */
        			}
        			else{
        				/* $('#result>#message-container').append($("<p>").html(data["id"]+" : "+data["msg"])); */ 
        				if( data['nickname'] == "${ sessionScope.loginUser.nickname }" ){
        					
        					console.log("내가 보낸 메시지");
	        				var addtag = '<div class="message-wrapper">' + 
							'<div class="chat-bubble right">' +
							'<div class="message">' + data['msg'] + '</div>' +
							'</div>' +
							'</div>' +
							'<div class="cf"></div>';
				
							$('#messageArea').append(addtag);
        				}else if( data['nickname'] != "${ sessionScope.loginUser.nickname }" ){
        					
        					console.log("다른사람이 보낸 메시지");
        					var addtag = '<div class="message-wrapper">' + 
        					'<div class="chat-bubble left">' +
        					'<div class="message">' + data['msg'] + '</div>' +
        					'<div class="message-detail">' +
        					    '<span class="bold">' + data['receiveNn'] + '</span>' +
        					'</div>' +
        					'</div>' +
        					'</div>' +
        					'<div class="cf"></div>';
        				
        					$('#messages').append(addtag);
        				}
        				
        			}
               }
               /* $("#result>#message-container").scrollTop($("#result>#message-container")[0].scrollHeight); */
               
               $("#messageArea").scrollTop($("#messageArea")[0].scrollHeight);
            }
        	
	        socket.onerror=function(data){
	        	console.log(data);
	        }
	        socket.onclose=function(data){
	        	console.log(data)
	        }
        	//clientSend();
        });
		 /* 
		//파일을 업로드 후 파일에 따라 링크방법 변경 사진이면, 이미지 출력 다른파일이면 a태그.
        function createLink(data){
        	var d=JSON.parse(data);
        	var ext=d["msg"].substring(d["msg"].lastIndexOf(".")).toUpperCase();
        	var a="";
        	if(ext.includes("PNG")||ext.includes("JPG")||ext.includes("GIF")){
        		var img=$("<img>").attr({"src":"web/upload/"+d['msg']}).css({"width":"150px","height":"100px"});
        		a=$("<a>").attr({"href":"web/chattingDown?file="+d['msg']}).html(img).css("display","block");
        	}else if(ext.includes("WEBM")||ext.includes("OGG")||ext.includes("MP4")){
        		var video=$("<video>").attr({"src":"web/upload/"+d['msg'],"width":"300","height":"250","controls":"true"});
        		var id=$("<p>").html(d['id']).append(video);
        		a=id;
        	}else{
        		a=$("<p>").html(d['id']+" : ").append($("<a>").attr({"href":"web/chattingDown?file="+d['msg']}).html(d['msg'] +" 다운로드(click)").css({"text-decoration":"none","color":"#04B404"}));
        	}
        	
        	$('#result>#message-container').append(a);
        }
        //파일 다운로드 기능 수행(서블릿을 이용)
        function downloadFile(d){
        	location.href="web/chattingDown?file="+d;
        }
        
        //파일 업로드하기
        function fileSend(){
        	var file=$("#file")[0].files[0];
        	socket.binaryType="arraybuffer";
        	var reader=new FileReader();
        	var rawData=new ArrayBuffer();
        	reader.onload=function(e){
        		socket.send(JSON.stringify(new MessageFlag($("#id").val(),$("#room").val(),file.name,"file",$("#receiveId").val())));
        		rawData=e.target.result;
        		socket.send(rawData);
        		//귓속말해제
        		$("#receiveId").val("");
        		$("div#users-container>p").css({background:"white"});
        	}
        	reader.readAsArrayBuffer(file);
        }
         */
         
		//방,접속자를 클릭했을때 배경색을 변경시키는 것.
        function checkclick(e){
        	 console.log('checkclick');
        	 
        	 console.log(this);
        	 
        	 
        	/* $(e).parent().find("p").css({background:"white"});
        	$(e).css({background:"lightgray"}); */
        }
        
        //현재접속한 방을 확인하여 배경을 설정하는 로직.
        function checkCurrentRoom(e){

        	console.log('checkCurrentRoom');
	       	$("div#chatRoom-container>p").css({background:"white"});
       		$("div#chatRoom-container>p").each(function(i,item){
      				if($("#room").val()==$(item).html()){					
      					$(item).css({background:"lightgray"});
       			}
       		});
       	}
         
        $('#createBtn').on('click',function(){
        	
        	$("#room").val(prompt("Enter the name of the chat room."));
        	socket.send(JSON.stringify(new MessageFlag($("#id").val(),$("#room").val(),"","createroom",$("#receiveId").val())));
        });
        
	</script>
	
	
	
	
	<script type="text/javascript">
	/*
		$(function(){
			$("#messageinput").keydown(function(key) {
                if (key.keyCode == 13) {
                	send();
                }
            });
			
			setInterval(function() {
				$.ajax({
					url : 'chatCount.do',
					success : function(data){
						console.log(data);
						
						$('#chat1').val('Free Chat 1 [ ' + data + ' ]');
					}
				});
			}, 1000);
 
			$("#createBtn").on('click',function(){
				
			});
		});
	
		var ws;
		var messages = document.getElementById("messages");
		
		function openSocket() {
			$('.msgArea').slideDown(200);
			
			if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				writeResponse("WebSocket is already opened.");
				return;
			}
			
			//웹소켓 객체 만드는 코드
			ws = new WebSocket("ws://localhost:8888/spring/ac.do"); // 각자 서버주소기준 

			ws.onopen = function(event) {
				if (event.data === undefined){
					
					var msg = 'CODE_onopen';
					var sender = "${ sessionScope.loginUser.nickname }";
					
					ws.send(msg + "(SPLPOINT!!)" + sender);
					
					return;
				}
			};
			ws.onmessage = function(event) {
				writeResponse(event.data);
			};
			ws.onclose = function(event) {
				writeResponse("Connection closed");
			}
		}

		function send() {
			var msg = $('#messageinput').val();
			var sender = "${ sessionScope.loginUser.nickname }";
			
			if(msg == ''){
				
			}else{
				var text = msg + "(SPLPOINT!!)" + sender;
				ws.send(text);
				
				$("#messages").scrollTop($("#messages")[0].scrollHeight);
				$('#messageinput').val('').focus();
			}
		}

		function closeSocket() {
			ws.close();
		}
		
		function writeResponse(text) {
			var msg = text.split("(SPLPOINT!!)")[0];
			var sender = text.split("(SPLPOINT!!)")[1];
			
			if( sender != "${ sessionScope.loginUser.nickname }" && msg != 'CODE_onopen' ){
				
				var addtag = '<div class="message-wrapper">' + 
					'<div class="chat-bubble left">' +
					'<div class="message">' + msg + '</div>' +
					'<div class="message-detail">' +
					    '<span class="bold">' + sender + '</span>' +
					'</div>' +
					'</div>' +
					'</div>' +
					'<div class="cf"></div>';
				
				$('#messages').append(addtag);
			}else if ( sender == "${ sessionScope.loginUser.nickname }" && msg != 'CODE_onopen' ){
				var addtag = '<div class="message-wrapper">' + 
							'<div class="chat-bubble right">' +
							'<div class="message">' + msg + '</div>' +
							'</div>' +
							'</div>' +
							'<div class="cf"></div>';
				
				$('#messages').append(addtag);
			}else if ( msg == 'CODE_onopen' ){
				
				var addtag = '<div class="message-wrapper">'
							+ '<span class="visit">----------------------- <span class="bold">'
							+ sender + '</span> 님이 입장하셨습니다. -----------------------</span>'
							+ '</div>'
							+ '<div class="cf"></div>';
				$('#messages').append(addtag);
				
			}
			
			$("#messages").scrollTop($("#messages")[0].scrollHeight);
			
		}
		*/
	</script>


	<script>
		/* var socket;//socket객체 보관용
		var connect=false;//연결이 되었는지
		var serverport;
		
		$(function(){
			connect=true;
        	socket = new WebSocket('ws://localhost:8888/spring/chatting.do');

        	socket.onmessage =function(e){
        		console.log(e.data);
               if(e.data.includes("file")){
                	createLink(e.data);
        		}
               else{
        			var data=JSON.parse(e.data);
        			if(data["flag"]=="room"){
        				var rooms=data['msg'].split(",");
        				$("#chatRoom-container").html('<p>채팅방현황</p>');
        				for(var i=0;i<rooms.length;i++){
        					$("#chatRoom-container").append($("<P>").html(rooms[i]).click(function(){
        						$("#room").val($(this).html());
        						checkclick(this);
        					}));
        				}
        				checkCurrentRoom(rooms);
        			}
        			else if(data["flag"]=="user"){
        				var users=data['msg'].split(",");
        				$("#users-container").html("<p>접속자현황</p>");
        				for(var i=0;i<users.length;i++){
        					$("#users-container").append($("<P>").html(users[i]).click(function(){
        						$("#receiveId").val($(this).html());
        						checkclick(this);
        					}));
        				}
        			}
        			else{
        				$('#result>#message-container').append($("<p>").html(data["id"]+" : "+data["msg"])); 
        			}
               }
               $("#result>#message-container").scrollTop($("#result>#message-container")[0].scrollHeight);
            }
        	
	        socket.onerror=function(data){
	        	console.log(data);
	        }
	        socket.onclose=function(data){
	        	console.log(data);
	        }
		});
        	
        	 */
		
		
	</script>	
	

</body>
</html>