<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Post</title>
<script type="text/javascript" src="resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>

</style>
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
    <input type="file" multiple="multiple" id="file_select" name="uploadFile" style="float: left;">
    <input id="fd" type="button" value="file delete" style="float:right;">
    <div style="width:300px; height:100%; border:1px solid black;">
      	<table id="flist" style="align-content:center; width:100%;">
      		<thead>파일목록</thead>
      		<tbody>
      		
      		</tbody>
        </table>
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
	 
	  $('#file_select').change(function(){
		  
		 for(var i=0; i< $(this).get(0).files.length;i++){
		 
		 var $tbody = $('#flist tbody');
		 var $tr = $('<tr>');
		 var $td = $('<td>');
		 $td.text($(this).get(0).files[i].name);
		 $tr.append($td);
		 $tbody.append($tr);
		 
		 /* }else if($(this).get(0).files.length > 1){
			 for(var i in $('#file_select').get(0).files[2].name;) */
		 }
		 
	  });
	  $('#cancel').click(function(){
		  $('#flist tbody').html("");
	  });
	  
	  $('#fd').click(function(){
	  });
 </script>
</body>
</html>