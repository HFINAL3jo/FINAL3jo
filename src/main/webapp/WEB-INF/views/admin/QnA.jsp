<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
   
 <style>
 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #77AAAD;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #D8E6E7;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #EDECF0;
  }
  
  #pagenation li{
  	display:inline-block;
  }
 </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="col-lg-9" >
                    <h3 style="align-self: center;">Delete Account</h3>
                    <hr>
                    <div class="row">
	<%@ include file="assideAdmin.jsp" %>
                        <div class="col-lg-12">
    <div class="qnaPage" style="width:30%">
     
      <h2>문의하기</h2>
      <hr>
        <div class="qnaPageTable">

    <table class="table table-striped">
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
        </tr>
    </thead>

    <tbody>
        <tr>
            <td>1</td>
            <td>문의합니다</td>
            <td>유승제</td>
            <td>sysdate</td>
        </tr>

        <tr>
            <td>2</td>
            <td>다시 문의합니다</td>
            <td>유승제</td>
            <td>sysdate</td>
        </tr>

    </tbody>
    </table>

    <div class=Pagenation>

        <ul id="pagenation" align="center" style="margin-left:-90px;">
          <li><button class="listbtn" value="-1">&lt;</button></li>
          <li><button class="listbtn" value="1">1</button></li>
          <li><button class="listbtn" value="2">2</button></li>
          <li><button class="listbtn" value="3">3</button></li>
          <li><button class="listbtn" value="+1">&gt;</button></li>
      </ul>
  
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>