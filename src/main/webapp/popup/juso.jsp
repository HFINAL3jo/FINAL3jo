<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script> 
	function goPopup(){ 
			location.href="juso.do";
		} 
	function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, admCd, rnMgtSn, siNm, 
			sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno,korAddr){
		document.form.roadFullAddr.value = roadFullAddr;  
		document.form.roadAddr.value = roadAddr;  
		document.form.addrDetail.value = addrDetail;  
		document.form.jibunAddr.value = jibunAddr;  
		document.form.zipNo.value = zipNo;  
		document.form.admCd.value = admCd;  
		document.form.rnMgtSn.value = rnMgtSn;  
		document.form.bdKdcd.value = bdKdcd;  
		document.form.korAddr.value = korAddr;   // 필요한 항목 추가 기술 
		} 
</script>
</head>
<body>
	<form name="form" id="form" method="post">
		<input type="button" onClick="goPopup();" value="팝업 " /> 
		도로명주소 전체	<input type="text" id="roadFullAddr" name="roadFullAddr" /><br>
		도로명주소 <input type="text" id="roadAddr"  name= "roadAddr"/><br>
		고객입력 상세주소<input type="text" id="addrDetail" name="addrDetail" /><br>
		지번<input type="text" id="jibunAddr" name="jibunAddr" /><br>
		우편번호<input type="text" id="zipNo" name="zipNo" /><br> 
		행정구역코드<input type="text" style="width: 500px;" id="admCd" name="admCd" /><br>
		도로명코드<input type="text" style="width: 500px;" id="rnMgtSn" name="rnMgtSn" /><br> 
		도로명주소(한글)<input type="text" style="width: 500px;" id="korAddr" name="korAddr" /><br> 
	</form>
</body>
</html>