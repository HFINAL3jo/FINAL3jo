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
 <style>
 	input[class~=adi]{
 		width:150%;
 	}
 	#tt{
    height: 30px;
    font-family: "Montserrat";
    margin-left:-100px;
    font-size: 18px;
    letter-spacing: 2px;
    padding: 0px 45px 0px 18px;
    caret-color: #000;
    background: transparent;
    z-index: 5;
}
	table>td{
		width:120%;
	}
 	#tss{
 		size:2em;
 	}
 	
 	.single-input{
 		background:#f0f0f7;
 	}
 	
 	table tr td{
 		width:400px;
 	}
 	
 </style>
</head>
<body>
	<c:if test="${!empty loginUser}">
    <form action="blogInsert.do" method="POST" id="gosubmit" enctype="multipart/form-data" onsubmit="return false;">
    <div id="editor">
    <br>
    <div><input type="text" size="40" name="bTitle" id="tt" placeholder="Title.." style="border-radius:5px;"></div>
    <br><br>
    <span style="float:left; padding-right:10px;">Category &nbsp;&nbsp;
    <select name="bCode" id="category">
      <option>--</option>
      <option value="Information">Information</option>
      <option value="Transportation">Transportation</option>
      <option value="Travel Guide">Travel Guide</option>
      <option value="Accommodation">Accommodation</option>
      <option value="Reviews">Reviews</option>
      <option value="etc">etc</option>
    </select></span>
    <span style="float:left;">HashTag 
    &nbsp;<input type="text" id="ht" name="bTag"></span>
    <div style="display:inline-block; float:right; padding-left:50px;">Writer&nbsp;<input type="text" name="bWriter" value="${loginUser.nickname }" style="border:none; width:200px;" readonly></div>
    <br><br>
	<textarea name="BContent" id="smarteditor2" rows="30" cols="104"></textarea>
    <br><br>
    
    <table align="center" id="at">
	    <thead>
	    <tr><button type="button" id="ars">search</button></tr>
    </thead>
    <tr>
		<td><input type="text" id="postcode" placeholder="ZIPCODE" class="single-input" size="6">
		</td>
	</tr>
	<tr>
		<td><input type="text" id="da" class="single-input" name="bAddressH" placeholder="도로명주소" class="adi"></td>
	</tr>
	<tr>
		<td><input type="text" id="ja" class="single-input" name="bAddress" placeholder="ADDRESS" class="adi"></td>
	</tr>
	<tr>
		<td><input type="text" id="ad" class="single-input" placeholder="영문 지번 주소" class="adi"></td>
	</tr>
	<tr>
		<td><input type="text" class="single-input" id="sample4_extraAddress" placeholder="상세 주소"></td>
	</tr>
	<tr>
		<td><input type="text" placeholder="Tel" class="single-input" id="tel" name="bTel"></td>
	</tr>
	<tr>
		<td><input type="text" class="single-input" placeholder="Fee" id="fee" name="bFee"></td>
	</tr>
	<tr>
		<td><input type="text" class="single-input" placeholder="Transportation" id="trans" name="bTrans"></td>
	</tr>
	<tr>
		<td><input type="text" class="single-input" placeholder="Opening hours" id="oh" name="bHours">
	</tr>
	</table>
	<br>
    <button id="cancel" class="btn btn-light" type="reset">Cancle</button>
    <input type="button" class="btn btn-light" id="sbtn" value="Submit"> 
	</div>
    </form>
    </c:if>
<script type="text/javascript" src="resources/se3/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false&autoMapping=false"></script>
<script>
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "smarteditor2",
 sSkinURI: "resources/se3/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
 
});
  	
   $('#sbtn').click(function(){
   oEditors.getById["smarteditor2"].exec("UPDATE_CONTENTS_FIELD",[]);
   
   if(validation()) {
	   $('#gosubmit').attr('onsubmit','true');
	   $('#gosubmit').submit();
	   }
   });
   
   function validation(){
	   var title = document.getElementById('tt').value;
	   var contents = document.getElementById('smarteditor2').value;
	   var category = document.getElementById('category').value;
	   
	   if(!chk(contents == '<p>&nbsp;</p>' || contents == '' || contents == null || contents == '<p><br></p>' || contents == '<br>',"Insert Content")){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
	   
	   oEditors.getById['smarteditor2'].exec('FOCUS'); 
	   return false;
	   }
	   
	   if(!chk(title == '',"Fill out title")){
		   return false;
	   }
	   if(!chk(category == '' || category == '--',"Select category")){
		   return false;
	   }
	   
 		return true; 
	 }
   
   function chk(ele,msg){
	   if(ele){
		 alert(msg);
		 return false;
	   }
	   return true;
		   
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
</script>
</body>
</html>