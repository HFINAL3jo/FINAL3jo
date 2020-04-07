<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Post</title>
<script type="text/javascript" src="resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
    <form action="themeInsert.do" method="POST" id="gosubmit" enctype="multipart/form-data">
    <div id="editor">
    <br>
    <label for="tt" style="margin:10px;">Title&nbsp;&nbsp;
    <input type="text" size="40" name="title" id="tt"></label>&nbsp;&nbsp;
    <label>Writer</label>&nbsp;
    <input type="text" name="writer" size="40" value="${loginUser.email }" style="border:none;" readonly>
    
    <br><br>
      
	<textarea name="ir1" id="contents" rows="30" cols="104"></textarea>
	
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
    <button id="cancel" class="btn btn-light" type="reset">Cancle</button>
    <button class="btn btn-light" onclick="goSaveAndSubmit();">Write</button>
	</div>
    </form>
    
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
 </script>
 <script>
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
			 var $input = $('<input>');
			 
	  });
	  $('#fd').click(function(){
		 $('#flist tr').last().remove();
	  });
	  $('#cancel').click(function(){
		  $('#flist tbody').html("");
	  });
	  
</script>
</body>
</html>