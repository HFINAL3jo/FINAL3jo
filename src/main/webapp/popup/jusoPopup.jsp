<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<% request.setCharacterEncoding("UTF-8");
	//해당시스템의 인코딩타입이 UTF-8일 경우 //request.setCharacterEncoding("EUC-KR");//해당시스템의 인코딩타입이 EUC-KR일 경우 
	String inputYn = request.getParameter("inputYn");  
	String roadFullAddr = request.getParameter("roadFullAddr");  
	String roadAddr = request.getParameter("roadAddr");  
	String addrDetail = request.getParameter("addrDetail");  
	String jibunAddr = request.getParameter("jibunAddr");  
	String zipNo = request.getParameter("zipNo");  
	String admCd = request.getParameter("admCd"); 
	String rnMgtSn = request.getParameter("rnMgtSn"); 
	String bdKdcd = request.getParameter("bdKdcd"); 
	String korAddr = request.getParameter("korAddr");
	String rn = request.getParameter("rn");
	String udrtYn = request.getParameter("udrtYn");
	String siNm = request.getParameter("siNm");
	String buldMnnm = request.getParameter("buldMnnm");
	String lnbrSlno = request.getParameter("lnbrSlno");
	String sggNm = request.getParameter("sggNm");
	String emdNm = request.getParameter("emdNm");
	String lnbrMnnm = request.getParameter("lnbrMnnm");
	String buldSlno = request.getParameter("buldSlno");
	String mtYn = request.getParameter("mtYn");
	String liNm = request.getParameter("liNm");
	%>
</head>
<script> 
	function init(){ 
		var url = location.href; 
		var confmey = "devU01TX0FVVEgyMDIwMDQwODE3MDIwNzEwOTYyNjY="; 
		var resultType = "2"; //도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번
		var inputYn= "<%=inputYn%>"; 
		$('#confmkey').val(confmKey);
		$('#returnUrl').val("juso.jsp");
		$('#resultType').val(resultType);
		
		if(inputYn != "Y"){ 
			document.form.confmKey.value = confmKey; 
			document.form.returnUrl.value = "juso.jsp"; 
			document.form.resultType.value = resultType; 
			document.form.action="http://www.juso.go.kr/addrlink/addrEngUrl.do"; 
			document.form.submit(); 
			}else{ 
				opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddr%>","<%=addrDetail%>","<%=jibunAddr%>",
						"<%=zipNo%>","<%=admCd%>","<%=rnMgtSn%>","<%=bdKdcd%>","<%=siNm %>","<%=sggNm%>","<%=emdNm%>",
						"<%=liNm%>","<%=rn%>","<%=udrtYn%>","<%=buldMnnm%>","<%=buldSlno%>","<%=mtYn%>","<%=lnbrMnnm %>",
						"<%=lnbrSlno%>","<%=korAddr%>"); 
				window.close(); 
				} 
		} 
	</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" /> 
		<input type="hidden" id="returnUrl" name="returnUrl" value="" /> 
		<input type="hidden" id="resultType" name="resultType" value="" />
		<!-- 기본 인코딩타입은 UTF-8임. 해당시스템의 인코딩타입이 EUC-KR일 경우 아래 내용  추가-->
		<!-- <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/> -->
	</form>
</body>
</html>