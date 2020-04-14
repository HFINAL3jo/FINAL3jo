<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>aranaz</title>
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
    background-color: #3B4CF7;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #FFB6C1;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #FAFAFA;
  }

	ul[id~=pagenation]>li{
  	display:inline;
  }

</style>
</head>

<body>
  <!--::header part start::-->
  <%@ include file="../common/menubar.jsp"%>
  <!-- Header part end-->

  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>contact us</h2>
              <p>Home <span>-</span> contact us</p>
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
            <th>처리 여부</th>
        </tr>
    </thead>
    <tbody id="tbody">
	<%-- <c:forEach var="q" items="${ list }">
        <tr>
            <td>${ q.qId }</td>
            <td>
            	<c:url var="qdetail" value="qdetail.do">
            		<c:param name="qId" value="${ q.qId }"/>
            		<c:param name="currentPage" value="${ pi.currentPage }"/> 
            	</c:url>
            	<c:if test="${ empty loginUser }">
            		${ q.qTitle }
            	</c:if>
            </td>
            <td>${ q.qWriter }</td>
            <td>${ q.qCreateDate }</td>
            <td>${ q.qStatus }</td>
        </tr>
	</c:forEach> --%>
    </tbody>
    
    <!-- 페이징 처리 -->
    <tr id="pagingDiv" align="center" height="20">
    	<td colspan="6">
    	
    	<!-- [이전] -->
    	<c:if test="${ pi.currentPage eq 1 }">
    		[이전] &nbsp;
    	</c:if>
    	<c:if test="${ pi.currentPage ne 1 }">
    		<c:url var="prev" value="contactView.do">
    			<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
    		</c:url>
    		<a href="${ prev }" onclick="getList(${ pi.currentPage -1 })">[이전]</a> &nbsp;
    	</c:if>
    	
    	<!-- 페이지 -->
    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
    		<c:if test="${ p eq pi.currentPage }">
    			<font color="pink" size="4"><b>[${ p }]</b></font>
    		</c:if>
    		
    		<c:if test="${ p ne pi.currentPage }">
    			<c:url var="pagination" value="contactView.do">
    				<c:param name="currentPage" value="${ p }"/>
    			</c:url>
    			<a href="${ pagination }" onclick="getList(${p})">${ p }</a> &nbsp;
    		</c:if>
    	</c:forEach>
    	
    	<!-- [다음] -->
    	<c:if test="${ pi.currentPage eq pi.maxPage }">
    		[다음]
    	</c:if>
    	<c:if test="${ pi.currentPage ne pi.maxPage }">
    		<c:url var="next" value="contactView.do">
    			<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
    		</c:url>
    		<a href="${ next }" onclick="getList(${pi.currentPage + 1})">[다음]</a>
    	</c:if>
	</tr>
    </table>
</div>
</div>
      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">문의하기(QnA)</h2>
        </div>
        <div class="col-lg-8">
          <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm"
            novalidate="novalidate">
            <div class="row">


                <div class="col-12">
                        <div class="form-group">
                          <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '제목(title)'" placeholder='제목(title)'>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                          <input class="form-control" name="name" id="name" type="text" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '이름(name)'" placeholder='이름(name)'>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <input class="form-control" name="email" id="email" type="email" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '이메일(email)'" placeholder='이메일(email)'>
                        </div>
                      </div>

                      <div class="col-12">
                        <div class="form-group">
                  <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9"
                    onfocus="this.placeholder = ''" onblur="this.placeholder = '문의내용(message)'"
                    placeholder='문의내용(message)'></textarea>
                </div>
              </div>


            </div>
            <div class="form-group mt-3">
              <a href="#" class="btn_3 button-contactForm">보내기(send)</a>
            </div>
          </form>
        </div>
        <div class="col-lg-4">
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-home"></i></span>
            <div class="media-body">
              <h3>Gangnam-gu, Seoul</h3>
              <p>6, Teheran-ro 14-gil</p>
            </div>
          </div>

          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
              <h3>noticealigo@gmail.com</h3>
  				<p>우리 존재 화이팅,,,</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ contact section end ================= -->

  <!--::footer_part start::-->
  <%@ include file="../common/footer.jsp"%>
   <!--::footer_part end::-->

<script>
	$(function(){
		getList();	
	});
	
	function getList(){
		$.ajax({
			url:"contactListView.do",
			dataType:"json",
			success:function(data){
				$tableBody = $("qtb tbody");
				$tableBody.html("");
				
				var $tr;
				var $qId;
				var $qTitle;
				var $qContent;
				var $qCreateDate;
				var $qStatus;
				console.log(data.list.length);
				console.log(data.list);
				if(data.list.length > 0){
					for(var i in data.list){
						$tr = $("<tr>");
						$qId = $("<td>").text(data[i].list.qId);
						$qTitle = $("<td>").text(data[i].list.);
						$qWriter = $("<td>").text(data[i]);
						$tr.append($qId);
						$tableBody.append($tr);
					}
				}else{
					$tr = $("<tr>");
					/* $tr.append($qContent);
					$tableBody.append($tr); */
				}
			},error:function(){
				console.log("전송실패");
			}
		});
	}	
</script>
</body>
</html>