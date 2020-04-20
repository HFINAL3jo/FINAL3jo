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
			max-width: 80em;
			border: 1px solid black;
			height: 60em;
			position: relative;
			top: 10em;
		}
	
		.mybtn {
		  color: snow;
		  border: 1px solid #0067b8;
		  background: #0067b8;
		  width: 12em;
		  height: 2em; 
		  font-size: 15px;
		  margin: 1%;
		}
		
		.mybtn:hover {
		  color: snow;
		  border: 1px solid #0067b8;
		  background: #0067b8;
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
	<div class="chat" style="text-align: center;">
		<div class="chatList" style="position: relative; margin: 1% auto; height: auto;">
			<input type="button" value="Free Chat 1" class="mybtn e-large" id="chat1" onclick="openSocket();">
			<input type="button" value="Free Chat 2" class="mybtn e-large" onclick="openSocket();">
			<input type="button" value="Free Chat 3" class="mybtn e-large" onclick="openSocket();">
			<input type="button" value="Free Chat 4" class="mybtn e-large" onclick="openSocket();">
			<input type="button" value="Free Chat 5" class="mybtn e-large" onclick="openSocket();">
		</div>
		<!-- Server responses get written here -->
		<div class="msgArea" style="height: 90%; position: relative; display: none;">
			<div id="messages" style="position: relative; margin: auto; width: 90%; height: 87%; border: 1px solid black; overflow: auto;">
				
			</div>
			<div>
				<div style="position: relative; height: 100%; align-content: center;"> 
					<input type="text" id="sender" value="${sessionScope.loginUser.nickname }"
						style="display: none;">
					<input type="text" id="messageinput" style="height:90px; width: 77%; margin: 1% auto;">
					<!-- <button type="button" onclick="openSocket();">Open</button> -->
					<button type="button" class="mybtn" style="position: relative; width: 5%; left: 1%; height: 50px;" onclick="send();">Send</button>
					<button type="button" class="mybtn" style="position: relative; width: 5%; left: 1%; height: 50px;" onclick="closeSocket();">Close</button>
				</div>
			</div>
		</div>
	</div>
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
	
	
	<script type="text/javascript">
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
			ws = new WebSocket("ws://183.109.107.171:8888/spring/ac.do"); // 각자 서버주소기준 

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
	</script>
	
	

</body>
</html>