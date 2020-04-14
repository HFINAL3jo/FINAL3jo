<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1" width="300" height="300" align="center">
		
			<span style="color: green; font-weight: bold;">인증 번호를 입력하세요</span><br>
			<br>
			<div style="text-align: center;">
				<tr>
					<td>
							<form action="join_injeung.do${dice}" method="post">
									<br>
									<div>
										<input type="number" name="emailPopup"
											placeholder="  인증번호를 입력하세요. ">
									</div>
									<br> <br>
									<button type="submit" name="submit">인증번호 전송</button>
							</form>
					</td>
				</tr>
			</div>
	</table>
</body>
</html>
 --%>