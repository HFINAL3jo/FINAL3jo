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
  
  h{
  	margin:0 0 0 !important;
  }
  
  th {
    /* border-bottom: 1px dashed #444444; */
  }
  
  td{
  	border-bottom: 1px solid #444444;
  	
  }
  
  table{
  border: none;
  }
  th,td{
  	padding: 10px;
  	border: none;
  }
  thead tr {
    background-color: #3B4CF7;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #FAFAFA;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #ffffff;
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
     
      <h2>상세보기</h2>
      <hr>
        
        <!-- 글 내용-->
        <form id="BoardDelForm" name="" action="" method="post" target="_self" enctype="multipart/form-data">
            <div class="ec-base-table typeWrite ">
                            <table border="1" summary="">
                            <colgroup>
            <col style="width:130px;">
            <col style="width:auto;">
            </colgroup>
            <tbody>
            <tr>
            <th colspan="2" align="left"><h4><strong>${ q.qTitle }</strong></h4></th>
               </tr>
            <tr>
               <td>작성자&nbsp;&nbsp;&nbsp;${ q.qWriter }</td>
               <td>${q.qCreateDate }</td>
            </tr>
            <tr>
            <td colspan="2">${q.qContent }</td>
             	</tr>
            </tbody>
            </table>
            </div>
            <div class="ec-base-button ">
                            <span class="gLeft">
                                <span class="displaynone">
                                </span>
                                <a href="#" class="btn">목록</a>
                            </span>
                            <span class="gRight">
                                <a href="#"  class="displaynone btn">삭제</a>
                                <a href="#" class="displaynone btn btn-black">수정</a>
                                <a href="#" class="displaynone btn">답변</a>
                            </span>
                        </div>
            </div>
            </form>    
            
                    <div class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002 "><!-- 코멘트 리스트 -->
            <!-- 코멘트 페이징 -->
            <!-- 댓글 수정 -->
            <form id="commentForm" name="" action="" method="post" target="_self" enctype="multipart/form-data" style="display: none;">
            <input id="board_no" name="board_no" value="1" type="hidden">
            <input id="no" name="no" value="4060" type="hidden">
            <input id="comment_no" name="comment_no" value="" type="hidden">
            <input id="member_id" name="member_id" value="" type="hidden"><div class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002 "><fieldset>
            <legend>댓글 수정</legend>
                                <p>비밀번호 : <input id="comment_password" name="comment_password"  value="" type="password"> <span class="secret displaynone"><label>비밀댓글</label></span></p>
                                <div class="view">
                                    <textarea id="comment_modify" name="comment_modify" ></textarea>                        <span class="submit">
                                        <a href=#" alt="수정"></a>
                                        <a href="#" ><img src="./제일 예쁜 웹퍼블릭 심플 문의사항_files/btn_comment_cancel.gif" alt="취소"></a>
                                    </span>
                                </div>
                                <p class="displaynone"> /  byte</p>
                            </fieldset>
            </div>
            </form><!-- 비밀글 확인 -->
</div>
</div>
  </section>
  <!-- ================ contact section end ================= -->

  <!--::footer_part start::-->
  <%@ include file="../common/footer.jsp"%>
   <!--::footer_part end::-->

<!-- <script>
	function getReplyList(){
		var prev = ${ prev };
		var pageSelect = ${ p };
		var next = ${ next };
		
		$.ajax({
			url:"contactView.do",
			data:{currentPage:currentPage},
			dataType:"json",
			success:function(data){
				location.href="contactView.do";
			},error:function(){
				console.log("전송실패");
			}
		});
	}
</script> -->
</body>
</html>