<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Get inspired for your journey! - aligo</title>

<!-- nice select CSS -->
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/price_rangs.css">
<link rel="stylesheet" href="resources/css/card.css">

<style type="text/css">
	.floatdiv {
		position: fixed;
		width: 80px;
		display: inline-block;
		right: 0px; /* 창에서 오른쪽 길이 */
		top: 80%; /* 창에서 위에서 부터의 높이 */
		background-color: transparent;
		margin: 0;
	}
	
	h4{
		text-align:center;
	}
	
	.breadcrumb{
	  	background-image:url('${contextPath}/resources/images/blog_theme.jpg');
	    background-size: 100% 100%;
  }
	  
	 .genric-btn.primary:hover {
		  background:#0067b8 !important;
		  color: white !important;
		  border: 1px solid #0067b8 !important;
	}
	 .genric-btn.primary{
		  color: #0067b8 !important;
		  border: 1px solid #0067b8 !important;
		  background:white;
	}
	.genric-btn.success {
		  color: black !important;
		  background: rgba(227, 227, 227,1) !important;
		  border: 1px solid transparent;
	}
	
	.genric-btn.success:hover {
	  color: white !important;
	  border: 1px solid #c1e3f7 !important;
	  background: #c1e3f7 !important;
	}
	.side_bar{
		display:flex;
	    align-items: flex-start;
	    position: fixed;
	    z-index: 1;
	    width: 96.2px;
	    top: 264px;
	    left: 0px;
	}
	/* .mybtn {
	  color: #0067b8; 
	  border:1px solid #0067b8; 
	  background: white; 
	  width: 8em;
	  height: 2.3em; 
	  font-size: 13px; 
	  margin-bottom: 10%;
	}
	
	.mybtn:hover {
	  color: snow;
	  border: 1px solid #0067b8;
	  background: #0067b8;
	} */
	#bt tr{
		background:white;
	}
	#bt tr:hover{
		background:#f0f1f2;
		cursor:pointer;
	}
	
	ul li{
		justify-content:center !important;
		display:inline-block;
	}
	
	#pag{
		margin-left:270px !important;
	}
	#searchD{
		width:40% !important; 
		display:inline-block;
		padding-top:30px;
    	position: relative;
	    display: -ms-flexbox;
    	display: flex;
    	-ms-flex-wrap: wrap;
    	flex-wrap: wrap;
    	-ms-flex-align: stretch;
    	align-items: stretch;
    	margin-left:250px;
}
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
							<h2 style="font-size:4em; padding-top:100px; position:relative; left:-10%;">Travel Reviews</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	
	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding"
		style="padding-top: 3%; padding-bottom: 0%;">
		
		<!-- 인클루드 asside -->
		<jsp:include page="../common/assideblog.jsp"/>
		<div id="tList" class="col-lg-9">
			<div class="row">
				<div class="col-lg-12">
					<div
						class="product_top_bar d-flex justify-content-between align-items-center">

						<div class="single_product_menu">
								Number of posts <span>${pi.listCount}</span>
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
            <tr>
              <th style="width:7%;">NO</th>
              <th style="width:52%;">Subject</th>
              <th style="widht:14%;">Writer</th>
              <th style="width:12%;">Date</th>
              <th style="widht:7%;">Views</th>
              <th style="widht:8%;">Likes</th>
            </tr>
          <tbody>
            <c:forEach var="b" items="${list }">
            <tr>
  				<td>${b.bId }</td>
  				<td>${b.bTitle }</td>
  				<td>${b.bWriter }</td>     
  				<td>${b.bCreateDate }</td>
  				<td>${b.bViews }</td>     
  				<td>${b.bLikes }</td>  
            </tr>
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
			  	<c:param name="currentPage" value="${pi.currentPage - 5}"/>
			  </c:url>		      
		      <a class="page-link" href="${prev}" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    </c:if>
		    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
		    <c:url var="pp" value="blog.do">
		    	<c:param name="currentPage" value="${p }"/>
		    </c:url>
		    <c:if test="${p eq pi.currentPage }">
		    <li><a class="page-link" tabindex="-1" aria-disabled="true">${p}</a></li>
		    </c:if>
		    <c:if test="${p ne pi.currentPage}">
		    	<li><a class="page-link" href="${pp }" tabindex="-1" aria-disabled="true">${p}</a></li>
		    </c:if>
		    </c:forEach>
		    <c:if test="${pi.currentPage eq pi.maxPage}">
		    <li>
		    <a class="page-link" tabindex="-1" aria-disabled="true">Next</a>
		    </li>
		    </c:if>
		    <c:if test="${pi.currentPage ne pi.maxPage}">
		    <c:url var="next" value="blog.do">
		    	<c:param name="currentPage" value="${pi.currentPage + 5}"/>
		    </c:url>
		    <li><a class="page-link" tabindex="-1" aria-disabled="true" href="${next}">Next</a></li>
		    </c:if>
		  </ul><br><br>
		  
		</div>
<div class="input-group" id="searchD">
<input type="text" name="bkeyword" id="ss" class="form-control" placeholder="search" aria-describedby="inputGroupPrepend">
<div class="input-group-prepend" id="searchBlog">
<span class="input-group-text" id="inputGroupPrepend"><i class="ti-search"></i></span>
</div>
</div>
</div>
	</section>
	<br>
	
	<!--::footer_part start::-->

	<%@ include file="../common/footer.jsp"%>

	<!--::footer_part end::-->

	<!-- jquery plugins here-->

	<script src="resources/js/stellar.js"></script>
	<script src="resources/js/price_rangs.js"></script>

	<script>
		$('#bt tbody').find('tr').click(function(){
			location.href="bDetailView.do?bId=" + $(this).children().eq(0).text();
		});
		
		$('#searchBlog').mouseenter(function(){
			$(this).css('cursor','pointer');			
		}).click(function(){
			location.href="searchBlog.do?bkeyword="+$('#ss').val();
		});
		
		var searchValue = $('#sv').val();
	 $('#topview').click(function(){
		 location.href="blog.do?searchValue=2";
	 });
	 $('#mostLiked').click(function(){
		 location.href="blog.do?searchValue=3";
	 });
	 
	</script>
</body>
</html>