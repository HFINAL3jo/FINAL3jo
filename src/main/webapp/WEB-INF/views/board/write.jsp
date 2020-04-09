<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <label>Writer</label>&nbsp;
    <input type="text" name="tWriter" size="40" value="${loginUser.email }" style="border:none;">
    <br><br>
    <span style="float:left;">Theme &nbsp;<input type="search" list="tcl" name="tCode"></span>
    <datalist id="tcl">
    	<option value="History">History</option>
    	<option value="Food">Food</option>
    	<option value="Shopping">Shopping</option>
    	<option value="Fastival">Fastival</option>
    	<option value="Night View">Night View</option>
    	<option value="Museum">Museum</option>
    	<option value="Exotic">Exotic</option>
    </datalist>&nbsp;&nbsp;&nbsp;
    Keyword &nbsp;&nbsp;<input type="text" name="tKeyword" style="margin-right:-10px;">
    <br><br>  
	<div id="contents" style="resize:none; width:100%; height:100%" contentEditable="true"><br><br>내용입력<br><br></div>
	<input type="hidden" id="tval" name="tContent" value="">
    <br><br>
    <input type="file" id="file_select" name="uploadFile" style="float:left; width:190px;">
    
    <div style="width:300px; height:100%; display:inline-block; border:1px solid black; margin-left:-30px;">
      	<table id="flist" style="align-content:center; width:100%;">
      		<thead>File List</thead>
      		<tbody align="center">
      			
      		</tbody>
        </table>
    </div>
    <div style="display:inline-block; margin-left:50px; font-size:1em;">
    <input id="fa" type="button" value="+" class="btn btn-default" style="background:rgb(206, 219, 240);">
    <input id="fd" type="button" value="-" class="btn btn-default" style="background:rgb(206, 219, 240);">
    </div>
    <br><br>
    <table align="center">
    <tr>
		<td>우편번호</td>
		<td>
			<input type="text" id="postcode" placeholder="우편번호" size="6">
			<button type="button" id="ars">검색</button>
		</td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td><input type="text" id="da" name="tAddressH" placeholder="도로명주소" class="adi"></td>
	</tr>
	<tr>
		<td>영문 도로명 주소</td>
		<td><input type="text" id="ja" name="tAddress" placeholder="영문 도로명 주소" class="adi"></td>
	</tr>
	<tr>
		<td>영문 지번 주소</td>
		<td><input type="text" id="ad" placeholder="영문 지번 주소" class="adi"></td>
	</tr>
	<tr>
		<td>상세 주소 </td>
		<td><input type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
	</tr>
	</table>
    <button id="cancel" class="btn btn-light" type="reset">Cancle</button>
    <button class="btn btn-light" onclick="goSaveAndSubmit();">Write</button>
	</div>
    </form>
    
<script type="text/javascript" src="resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false&autoMapping=false"></script>
<script>
	function goSaveAndSubmit(){
		$('#tval').val($('#contents').val());
		console.log($('#tval').val());
		
		submit;
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
   
 	  var fl = 0;
	  $('#fa').click(function(){
		 	 		
			 var file = $('#file_select');
			 var fname = file.get(0).files[0].name;
			 var $tbody = $('#flist tbody');
			 var $tr = $('<tr>');
			 var $td = $('<td>');
			 $td.text(fname);
			 $tr.append($td);
			 $tbody.append($tr);
			 var $img = $('<img>');
			 
	  });
	  
	  $('#fd').click(function(){
		 $('#flist tr').last().remove();
	  });
	  $('#cancel').click(function(){
		  $('#flist tbody').html("");
	  });

	  var upload = document.querySelector('#file_select');
      var reader = new FileReader();
	 
      reader.onload = (function () {
	 
	  this.image = document.createElement('img');
	    var vm = this;
	        
	    return function (e) {
           vm.image.src = e.target.result
	       }
	    })()
	 
	    upload.addEventListener('change',function (e) {
	        var get_file = e.target.files;
	 
	        if(get_file){
	            reader.readAsDataURL(get_file[0]);
	        }
	 		
	        $('#contents').append(image);
	    })
</script>
</body>
</html>