<%@page import="com.aligo.spring.member.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Get inspired for your journey! - aligo</title>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
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
    background-color: #0067b8;
    color: #ffffff;
  }
  /* tbody tr:nth-child(2n) {
    background-color: #ffffff;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #FAFAFA;
  } */
  td{
  background-color:#ffffff !important;
  }
  
  ul[id~=pagenation]>li{
  	display:inline;
  }

  .breadcrumb{
  	background-image:url('${contextPath}/resources/images/qnaflowers.jpg');
    background-size: 100% 100%;
  }
</style>
</head>

<body>
  <!--::header part start::-->
  <%@ include file="../common/menubar.jsp"%>
  <!-- Header part end-->
	<c:if test="${ empty sessionScope.loginUser }">
    	<br><br><br><br>    	<br><br><br><br>
    	<div style="margin: auto; align-content: center; text-align: center;">
	    	<h1 style="margin: auto; align-content: center; font-weight: bolder;">After login, you can use.</h1>
    	</div>
    	<br><br><br><br>    	<br><br><br><br>
    </c:if>
    <c:if test="${ !empty sessionScope.loginUser }">
    
  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg" style="height:760px;">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2 style="color:white; padding-top:100px; font-size:4em;">Q&A</h2>
              <p style="color:white; font-size:2em;"><strong>Ask Anything! </strong></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section padding_top">
    <div class="container">
 	<div class="qnaPage">
     
      <h2>문의게시판</h2>
      <hr>
        <div class="qnaPageTable">

    <table align="center" class="table table-striped" id="qtb">
        <thead align="center">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
            <th>답변 여부</th>
        </tr>
    </thead>
    <tbody id="tbody">
	
    </tbody>
    

    </table>
</div>
</div>
<div class="ec-base-button" align="right">
                            <span class="gRight">
                                <a href="qWrite.do">Write</a>
                            </span>
                        </div>
    </div>
    <input type="hidden" name="currentPage" value="${currentPage }" id="cp">
  </section>
  <!-- ================ contact section end ================= -->

  

<script>
	$(function(){
		var pageNo = ${currentPage};
		
		getList(pageNo);	
	});
	
	function getList(pageNo){
		$.ajax({
			url:"contactListView.do",
			data:{currentPage:pageNo, nickname:"${loginUser.nickname}"},
			dataType:"json",
			type:"post",
			success:function(data){
				console.log(data);
				
				var listText = "";
				var loginUser = "<%= ((Member)session.getAttribute("loginUser")).getnickname()%>";
				
					for(var i in data.list){
						listText += "<tr>";
						listText += "<td>"+data.list[i].qId+"</td>";
						listText += "<td>";
						listText += "<a style='color:black' href='qdetail.do?qId="+data.list[i].qId+"&currentPage="+data.pi.currentPage+"&qWriter=${loginUser.nickname}'>"+data.list[i].qTitle+"</a>";
						listText += "</td>";
						
						listText += "<td>"+data.list[i].qWriter+"</td>";
						listText += "<td>"+data.list[i].qCreateDate+"</td>";
						listText += "<td>"+data.list[i].qStatus+"</td>";

						listText +="</tr>";
				
					}
				
					   // 페이징 처리
					   listText += "<tr align='center' height='20'>";
					   listText += "<td colspan='6'>";
					   // [이전]
					   if(pageNo == 1){
						   listText +=	"[이전] &nbsp;";
					   }else{
						   listText += "<a href='javascript:void(0);' onclick='getList("+ (pageNo - 1) +")'>[이전]</a> &nbsp;&nbsp;";
					   }
						// 페이지 
						for(var p= data.pi.startPage; p<= data.pi.endPage; p++){
							if(p == data.pi.currentPage){
								listText += "<font color='red' size='4'><b>"+ [ p ] + "</b></font>&nbsp;&nbsp;";
							}else{
								listText +=  "<a href='javascript:void(0);' onclick='getList("+ p + ")'>" + p + "</a> &nbsp;&nbsp;";
							}						
						}
						// [다음]
						if(pageNo == data.pi.maxPage){
							listText += "[다음]";
						}else{
							listText += "<a href='javascript:void(0);' onclick='getList("+ (pageNo+1) +")'>[다음]</a>&nbsp;&nbsp;";
						}
						listText +="</td>";
						listText +="</tr>";
					   
					   $("#qtb tbody").html(listText);
					   
					},error:function(){
						console.log("전송실패");
					}
				});
			}

		
		</script>
		</c:if>
	<!--::footer_part start::-->
  <%@ include file="../common/footer.jsp"%>
   <!--::footer_part end::-->
</body>
</html>