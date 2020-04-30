<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="KOR">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="stylesheet" href="resources/css/nice-select.css">
    <link rel="stylesheet" href="resources/css/price_rangs.css">
    <style type="text/css">
	.breadcrumb{
		background-image:url('${contextPath}/resources/images/sung.jpg');
		background-size: 100% 100%;
	 }
	 #bt tr{
		background:white;
	}
	#bt tr:hover{
		background:#f0f1f2;
		cursor:pointer;
	}
	
	#pag>li{
		justify-content:center !important;
		display:inline-block;
	}
	
	#pag{
		margin-left:250px !important;
	}
</style>
</head>

<body>
    <!--::header part start::-->
    <%@ include file="../common/menubar.jsp"%>
    <!-- Header part end-->

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg" style="height:760px;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2 style="font-size:4em; padding-top:100px; position:relative; left:-10%;">My Reviews</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <%@ include file="../common/assideMyPage.jsp"%>
               
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                          <div	class="product_top_bar d-flex justify-content-between align-items-center">

						<div class="single_product_menu">
								Number of posts <span>${pi.listCount}</span>
							</p>
						</div>

						<div class="single_product_menu d-flex">
							<div class="input-group">

								<button id="topview" class="genric-btn success"
									style="width: 100%; height: 90%;">Top Views</button>

							</div>
							&nbsp;&nbsp;
							<div class="input-group">
								<button class="genric-btn success" id="mostLiked"
									style="width: 100%; height: 90%;">Most Liked</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="aList" class="row align-items-center latest_product_inner">
			<div class="table-responsive">
        <table class="table table-striped table-sm" id="bt" style="text-align:center;">
            <thead><tr>
              <th style="width:7%;">NO</th>
              <th style="width:52%;">Subject</th>
              <th style="widht:14%;">Writer</th>
              <th style="width:12%;">Date</th>
              <th style="widht:7%;">Views</th>
              <th style="widht:8%;">Likes</th>
            </tr></thead>
          <tbody>
           <c:url var="blog" value="bDetailView.do">
           		<c:param name="bId" value="${b.bId }"/>
           		<c:param name="currentPage" value="${pi.currentPage }"/>
           </c:url>
            <c:forEach var="b" items="${list }">
            <a href="${blog }">
            <tr>
  				<td>${b.bId }</td>
  				<td>${b.bTitle }</td>
  				<td>${b.bWriter }</td>     
  				<td>${b.bCreateDate }</td>
  				<td>${b.bViews }</td>     
  				<td>${b.bLikes }</td>     
            </tr></a>
            </c:forEach>
            </tbody>
        </table>
	      </div>
			      
		  <ul id="pag">
		  	 <c:url var="page" value="blog.do">
		  	 	<c:param name="currentPage" value="${pi.currentPage }"></c:param>
		  	 </c:url>
		  	 <c:if test="${pi.currentPage eq 1}">
		  <li>
		      <a class="page-link" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    </c:if>
		    <c:if test="${pi.currentPage ne 1}">
		    <li>
			  <c:url var="prev" value="blog.do">
			  	<c:param name="currentPage" value="${pi.currentPage -1}"/>
			  </c:url>		      
		      <a class="page-link" href="${prev}" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    </c:if>
		    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
		    <c:if test="${p eq pi.currentPage }">
		    <li><a class="page-link" tabindex="-1" aria-disabled="true">${p}</a></li>
		    </c:if>
		    <c:if test="${p ne pi.currentPage}">
		    	<li><a class="page-link" href="${page }" tabindex="-1" aria-disabled="true">${p}</a></li>
		    </c:if>
		    </c:forEach>
		    <c:if test="${pi.currentPage eq pi.endPage}">
		    <li><a class="page-link" tabindex="-1" aria-disabled="true">Next</a>
		    </li>
		    </c:if>
		    <c:if test="${pi.currentPage ne pi.endPage}">
		    <c:url var="next" value="blog.do">
		    	<c:param name="currentPage" value="${pi.currentPage + 1}"/>
		    </c:url>
		    <li><a class="page-link" tabindex="-1" aria-disabled="true" href="${next}">Next</a>
		    </c:if>
		  </ul>
		  </div>
		  </div>
		  </div>
	<br>

    <!--::footer_part start::-->
    <%@ include file="../common/footer.jsp"%>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>
     <script src="resources/js/custom.js"></script>
     
     <script>
     	
     	$(function(){
     		var bWriter = '${sessionScope.loginUser.nickname}';
     		$.ajax({
     			url:"myReviewList.do",
     			data:{bWriter:bWriter},
     			type:"post",
     			dataType:"json",
     			success:function(data){
    				
     				var $tbody = $('#bt tbody');
     				var $tr;
     				var $bId;         
     				var $bTitle;     
     				var $bWriter;
     				var $bModifyDate;
     				var $bViews;     
     				var $bLikes;
     				$tbody.html("");
     				
     				for(var i in data){
     					//"bDetailView.do?bId="+data[i].bId);
     					$tr = $('<tr>');
     					$bId = $('<td>').text(data[i].bId);
     					$bTitle = $('<td>').text(data[i].bTitle);
     					$bWriter = $('<td>').text(data[i].bWriter);
     					$bModifyDate = $('<td>').text(data[i].bModifyDate);
     					$bViews  = $('<td>').text(data[i].bViews);
     					$bLikes = $('<td>').text(data[i].bLikes);
     					
     					$tr.append($bId);
     					$tr.append($bTitle);
     					$tr.append($bWriter);
     					$tr.append($bModifyDate);
     					$tr.append($bViews);
     					$tr.append($bLikes);
     					
     					$tbody.append($tr);
     				}
					     				
     			},error:function(){
     				
     			}
     		});
     	});
     	
     	$('.bdv').mouseenter(function(){
     		$(this).css('cursor','pointer');
     	}).click(function(){
     		console.log($(this));
     	});
     </script>
</body>
</html>