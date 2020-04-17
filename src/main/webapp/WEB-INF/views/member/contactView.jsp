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
    background-color: #ffffff;
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
              <h2>Q & A</h2>
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
	
    </tbody>
    

    </table>
<!--     <div class="col-lg-12">
    <div class="pageination">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <i class="ti-angle-double-left"></i>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <i class="ti-angle-double-right"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div> -->
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
    <input type="hidden" name="currentPage" value="${currentPage }" id="cp">
  </section>
  <!-- ================ contact section end ================= -->

  <!--::footer_part start::-->
  <%@ include file="../common/footer.jsp"%>
   <!--::footer_part end::-->

<script>
	$(function(){
		var pageNo = ${currentPage};
		
		getList(pageNo);	
	});
	
	function getList(pageNo){
		$.ajax({
			url:"contactListView.do",
			data:{currentPage:pageNo},
			dataType:"json",
			type:"post",
			success:function(data){
				console.log(data);
				
				var listText = "";
				<%-- var loginUser = "<%= ((Member)session.getAttribute("loginUser")).getId()%>"; --%>
				
					for(var i in data.list){
						listText += "<tr>";
						listText += "<td>"+data.list[i].qId+"</td>";
						listText += "<td>";
						listText += "<a href='qdetail.do?qId="+data.list[i].qId+"&currentPage="+data.pi.currentPage+"'>"+data.list[i].qTitle+"</a>";
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
	
</body>
</html>