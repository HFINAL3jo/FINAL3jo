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
		  width: 13em;
		  height: 2em; 
		  font-size: 15px; 
		  margin-bottom: 10%;
		}
		
		.mybtn:hover {
		  color: snow;
		  border: 1px solid #0067b8;
		  background: #0067b8;
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

	
	<div class="chat" >
		<div class="chatList">
			<input type="button" value="RESULT" class="mybtn e-large">
		
		</div>
	
		<div>
			<input type="text" id="sender" value="${sessionScope.loginUser.email }"
				style="display: none;"> <input type="text" id="messageinput">
		</div>
		<div>
			<button type="button" onclick="openSocket();">Open</button>
			<button type="button" onclick="send();">Send</button>
			<button type="button" onclick="closeSocket();">Close</button>
		</div>
		<!-- Server responses get written here -->
		<div id="messages"></div>
		<!-- websocket javascript -->
	</div>
	
	
	<!--::footer_part start::-->
	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->
	
	<script type="text/javascript">
		var ws;
		var messages = document.getElementById("messages");

		function openSocket() {
			if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				writeResponse("WebSocket is already opened.");
				return;
			}
			//웹소켓 객체 만드는 코드
			ws = new WebSocket("ws://localhost:8888/spring/ac.do"); // 각자 서버주소기준 

			ws.onopen = function(event) {
				if (event.data === undefined)
					return;

				writeResponse(event.data);
			};
			ws.onmessage = function(event) {
				writeResponse(event.data);
			};
			ws.onclose = function(event) {
				writeResponse("Connection closed");
			}
		}

		function send() {
			var text = document.getElementById("messageinput").value + ","
					+ document.getElementById("sender").value;
			ws.send(text);
			text = "";
		}

		function closeSocket() {
			ws.close();
		}
		function writeResponse(text) {
			messages.innerHTML += "<br/>" + text;
		}
	</script>
	
	

</body>
</html>