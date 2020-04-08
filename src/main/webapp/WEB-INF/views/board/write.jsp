<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Post</title>
<script type="text/javascript" src="resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<!-- jQuery와 Postcodify를 로딩한다. -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
	$(function(){
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
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
	<textarea name="tContent" id="contents" rows="30" cols="104"></textarea>
	
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
    <table>
    <tr>
		<td>우편번호</td>
		<td>
			<input type="text" id="pn" name="post" class="postcodify_postcode5" size="6">
			<button type="button" id="postcodify_search_button">검색</button>
		</td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td><input type="text" name="address1" class="postcodify_address"></td>
	</tr>
	<tr>
		<td>상세 주소</td>
		<td><input type="text" name="address2" class="postcodify_extra_info"></td>
	</tr>
	
	</table>
    <button id="cancel" class="btn btn-light" type="reset">Cancle</button>
    <button class="btn btn-light" onclick="goSaveAndSubmit();">Write</button>
    <input type="hidden" id="pv" name="tAddress" value="ABC">
	</div>
    </form>
    
    <%-- <%@ include file="/popup/juso.jsp" %> --%>
   <script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "contents",
	 sSkinURI: "resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
	  function goSaveAndSubmit(){
	    
	   oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD",[]);
	   
	   $('#gosubmit').submit();
		
	  }
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
			 $('.se2_inputarea ').html($img);
	  });
	  $('#fd').click(function(){
		 $('#flist tr').last().remove();
	  });
	  $('#cancel').click(function(){
		  $('#flist tbody').html("");
	  });
	  
	  $("postcodify_search_button").change(function(){
		  $('#pv').val($('input[name=address1]').val() + " " + $('input[name=address2]').val());
		  console.log($('#pv'));
	  });
</script>
</body>
</html>