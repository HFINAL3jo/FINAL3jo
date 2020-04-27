<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br><br><br><br><br>
	<%@ include file="../common/assidetheme.jsp" %>
	
	<div align="center">
	<%@ include file="blogWrite.jsp" %>
	</div>
	</div>
	</div>
	
	
	
	<%@ include file="../common/footer.jsp" %>
	<script>
		$('#titlebar').text('Write');
	</script>
</body>
</html>