<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Report</title>

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
	
	<%@ include file="assideAdmin.jsp" %>
    <div class="reportPage">

      <h2>신고내역</h2>
      <hr>

        <div class="reportTable">

    <table>
        <thead>
        <tr>
            <th>썸네일</th>
            <th>제목</th>
            <th>작성자</th>
            <th>신고사유</th>
            <th>삭제</th>

        </tr>
    </thead>

    <tbody>
        <tr>
            <td>이미지</td>
            <td>어쩌고저쩌고</td>
            <td>유승제</td>
            <td>악의적내용</td>
            <td><input type="checkbox"></td>
        </tr>

        <tr>
            <td>이미지</td>
            <td>어쩌고 저쩌고333</td>
            <td>유승제</td>
            <td>거짓된내용</td>
            <td><input type="checkbox"></td>
        </tr>

    </tbody>
    </table>

    <br>
    
    <div class="button" align="right">
    <button>삭제하기</button>
    </div>
    <div class=Pagenation>

      <ul id="pagenation" align="center" style="margin-left:-90px; display:inline-block">
        <li><button class="listbtn" value="-1">&lt;</button></li>
        <li><button class="listbtn" value="1">1</button></li>
        <li><button class="listbtn" value="2">2</button></li>
        <li><button class="listbtn" value="3">3</button></li>
        <li><button class="listbtn" value="+1">&gt;</button></li>
    </ul>

</div>
</div>
</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>