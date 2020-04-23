<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Post</title>
 <style>
 	input[class~=adi]{
 		width:150%;
 	}
 </style>
</head>
<body>
    <form action="themeInsert.do" method="POST" id="gosubmit" enctype="multipart/form-data">
    <div id="editor">
    <br>
    <label for="tt" style="margin:10px;">Title&nbsp;&nbsp;
    <input type="text" size="40" name="tTitle" id="tt"></label>&nbsp;&nbsp;
    <label>Writer&nbsp;
    <input type="text" name="tWriter" size="40" value="${loginUser.nickname }" style="border:none;" readonly></label>
    <br><br>
    <span style="float:left;">Theme &nbsp;
    <select id="tcl" name="tCode">
    	<option>--</option>
    	<option value="NATURE">NATURE</option>
    	<option value="RESTAURANT">RESTAURANT</option>
    	<option value="HISTORY">HISTORY</option>
    	<option value="SHOPPING">SHOPPING</option>
    	<option value="BAR">BAR</option>
    	<option value="ACTIVITY">ACTIVITY</option>
    	<option value="EXHIBITION">EXHIBITION</option>
    </select>&nbsp;&nbsp;&nbsp;
    Keyword &nbsp;&nbsp;<input type="text" id="tkv" name="tKeyword" style="margin-right:-10px;"></span><br><br>
    	<c:if test="${!empty list}">
    	<div id="selectVal" style="border:1px lightblue solid; display:inline-block; float:left; margin:10px; padding:10px; text-align:left;">
    		<label><input type="radio" name="f1" value="${list[0]}">&nbsp;${list[0] }</label>
    		&nbsp;&nbsp;<label><input type="radio" name="f1" value="${list[5]}">&nbsp;${list[5] }</label><br>
    		<label><input type="radio" name="f2" value="${list[1]}">&nbsp;${list[1] }</label>
    		&nbsp;&nbsp;<label><input type="radio" name="f2" value="${list[6]}">&nbsp;${list[6] }</label><br> 
    		<label><input type="radio" name="f3" value="${list[2]}">&nbsp;${list[2] }</label>
    		&nbsp;&nbsp;<label><input type="radio" name="f3" value="${list[7]}">&nbsp;${list[7] }</label><br>
    		<label><input type="radio" name="f4" value="${list[3]}">&nbsp;${list[3] }</label>
    		&nbsp;&nbsp;<label><input type="radio" name="f4" value="${list[8]}">&nbsp;${list[8] }</label><br>
    		<label><input type="radio" name="f5" value="${list[4]}">&nbsp;${list[4] }</label>
    		&nbsp;&nbsp;<label><input type="radio" name="f5" value="${list[9]}">&nbsp;${list[9] }</label><br>
    		<input type="button" id="tkvreset" value="Reset">
    	</div>
    	<br>
    	</c:if>
   	
    <br><br>
	<textarea name="tContent" id="smarteditor" rows="30" cols="104"></textarea>
    <br><br>
    
    <table align="center">
    <tr>
		<td>ZIP CODE</td>
		<td>
			<input type="text" id="postcode" placeholder="우편번호" size="6">
			<button type="button" id="ars">search</button>
		</td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td><input type="text" id="da" name="tAddressH" placeholder="도로명주소" class="adi"></td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td><input type="text" id="ja" name="tAddress" placeholder="영문 도로명 주소" class="adi"></td>
	</tr>
	<tr>
		<td>영문 지번 주소</td>
		<td><input type="text" id="ad" placeholder="영문 지번 주소" class="adi"></td>
	</tr>
	<tr>
		<td>상세 주소</td>
		<td><input type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
	</tr>
	<tr>
		<td>Tel</td>
		<td><input type="text" id="tel" name="tTel"></td>
	</tr>
	<tr>
		<td>Fee</td>
		<td><input type="text" id="fee" name="tFee"></td>
	</tr>
	<tr>
		<td>transportation</td>
		<td><input type="text" id="trans" name="tTrans"></td>
	</tr>
	<tr>
		<td>Opening hours</td>
		<td><input type="text" id="oh" name="tHours">
	</tr>
	</table>
    <button id="cancel" class="btn btn-light" type="reset">Cancle</button>
    <button class="btn btn-light" id="sbtn">Write</button>
	</div>
    </form>
    
<script type="text/javascript" src="resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false&autoMapping=false"></script>
<script>
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "smarteditor",
 sSkinURI: "resources/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
 
});
  	
   $('#sbtn').click(function(){
    
   oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD",[]);
   
   if(validation()) {
	   
	   
	   $('#sbtn').submit();
	   
	   }
   });
   
   function validation(){ 
	   var contents = $.trim(oEditors[0].getContents()); 
	   if(contents === '<p>&bnsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
		   alert("내용을 입력하세요."); 
	   
	   oEditors.getById['smarteditor'].exec('FOCUS'); 
	   return false; 
	 }else{
	   return true;
	 }
  }

	$('#ars').click(function(){
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddrEng = data.roadAddressEnglish;
                var roadAddr = data.roadAddress; 
                var jibunAddrEng = data.jibunAddressEnglish; 
                var extraRoadAddr = "";
                

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('da').value = roadAddr;
                document.getElementById("ja").value = roadAddrEng;
                document.getElementById("ad").value = jibunAddrEng;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                }
            }
        }).open();
        new daum.Postcode({
            onclose: function(state) {
                //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                if(state === 'FORCE_CLOSE'){
                    //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

                } else if(state === 'COMPLETE_CLOSE'){
                    //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
                    //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
                }
            }
        });
    });
	});
	var tkv = $('#tkv');
	var chkn = 0;
	$('#selectVal').mouseleave(function(e){
		tkv.val("");
		for(var i=0;i<10;i++){
		 var chk = $('#selectVal').children('label').children('input').eq(i);
		 if(chkn < 5){
			 
		 if(chk.is(":checked") == true && chkn == 4){
			 tkv.val(tkv.val() + chk.val());
			 chkn++;
		 }else if(chk.is(":checked") == true){
			 tkv.val(tkv.val() + chk.val() + ",");
			 chkn++;
		 }
		 }else{
			 break;
		 }
		}
	});
	$('#tkvreset').click(function(){
		chkn = 0;
		tkv.val("");
		for(var i=0;i<10;i++){
		$('#selectVal').children('label').children('input').eq(i).removeAttr("checked");
			
		}
		
	});
</script>
</body>
</html>