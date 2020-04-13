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
    background-color: #D8E6E7;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #EDECF0;
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
        
        <!-- 글 내용-->
        <form id="BoardDelForm" name="" action="http://webpublic.co.kr/exec/front/Board/del/1" method="post" target="_self" enctype="multipart/form-data">
            <input id="no" name="no" value="4060" type="hidden">
            <input id="bulletin_no" name="bulletin_no" value="2247" type="hidden">
            <input id="board_no" name="board_no" value="1" type="hidden">
            <input id="member_id" name="member_id" value="designpublic" type="hidden">
            <input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden">
            <input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=4060&amp;board_no=1" type="hidden">
            <input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden">
            <input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"><div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002"><!--
                            $login_page_url = /member/login.html
                            $deny_access_url = /board/free/list.html
                        -->
            <div class="ec-base-table typeWrite ">
                            <table border="1" summary="">
            <caption>게시판 상세</caption>
                            <colgroup>
            <col style="width:130px;">
            <col style="width:auto;">
            </colgroup>
            <tbody>
            <tr>
            <th scope="row">제목</th>
                                    <td>디자인 문의 관련은 '문의상담' 게시판으로만 접수받습니다.</td>
                                </tr>
            <tr>
            <th scope="row">작성자</th>
                                    <td>  <span class="displaynone">(ip:)</span> </td>
                                </tr>
            <tr class="">
            <th scope="row">작성일</th>
                                    <td>2016-11-11</td>
                                </tr>
            <tr>
            <td colspan="2">
                                        <div class="detail"><p><br></p><p>디자인 상담이나 문의할 내용이 있으신 경우 디자인퍼블릭 홈페이지의 '문의/상담' 게시판에 글 남겨주세요.</p><p><br></p><p><span>내용은 되도록 상세하게 남겨주시고 캡쳐화면을 첨부하여 주시면 내용 파악에 도움이 됩니다.</span></p><p><br></p><p>파일용량이 클 경우에는 <a href="http://mailto:design_pb@naver.com/" target="_blank">design_pb@naver.com</a>으로 보내주세요.</p><p><br></p><p><br></p><p><br></p><p><span">필요한 정보를 기재하지 않으시거나 커스터마이징 방법문의, 전문지식을 요하는 문의, 그리고 저희 디자인과 전혀 무관한 질문을 남길 경우 </span"></p><p><span style="font-size: 9pt;"><br></span></p><p><span style="font-size: 9pt;">통보없이 글이 삭제되거나 답변이 되지 않을 수 있습니다.</span></p><p><span style="font-size: 9pt;"><br></span></p><p>디자인 사용방법이나 궁금한 점에 대해서만 답변이 가능하며 <span>쇼핑몰솔루션 기능에 관련된 문의는 카페24 고객센터로 해주세요.</span></p><p></p><p></p><p><br></p></div>
                                    </td>
                                </tr>
            <tr class="attach displaynone">
            <th scope="row">첨부파일</th>
                                    <td></td>
                                </tr>
            <tr class="displaynone ">
            <th scope="row">비밀번호</th>
                                    <td><input id="password" name="password" fw-filter="" fw-label="비밀번호" fw-msg="" onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }" value="" type="password"> <span class="ec-base-help txtInfo">수정 및 삭제하려면 비밀번호를 입력하세요.</span>
            </td>
                                </tr>
            </tbody>
            </table>
            </div>
            <div class="ec-base-button ">
                            <span class="gLeft">
                                <span class="displaynone">
                                    <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="" class="admin displaynone btn">관리자게시</a>
                                    <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="" class="admin displaynone btn">게시안함</a>
                                    <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="" class="btn">스팸신고</a>
                                    <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="" class="btn">스팸해제</a>
                                </span>
                                <a href="http://webpublic.co.kr/board/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/" class="btn">목록</a>
                            </span>
                            <span class="gRight">
                                <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="BOARD_READ.article_delete(&#39;BoardDelForm&#39;,&#39;1&#39;);" class="displaynone btn">삭제</a>
                                <a href="http://webpublic.co.kr/board/free/modify.html?board_act=edit&amp;no=4060&amp;board_no=1" class="displaynone btn btn-black">수정</a>
                                <a href="http://webpublic.co.kr/board/free/reply.html" class="displaynone btn">답변</a>
                            </span>
                        </div>
            </div>
            </form>    
            
                    <div class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002 "><!-- 코멘트 리스트 -->
            <!-- 코멘트 페이징 -->
            <!-- 댓글 수정 -->
            <form id="commentForm" name="" action="http://webpublic.co.kr/exec/front/Board/CommentUpdate/1" method="post" target="_self" enctype="multipart/form-data" style="display: none;">
            <input id="board_no" name="board_no" value="1" type="hidden">
            <input id="no" name="no" value="4060" type="hidden">
            <input id="comment_no" name="comment_no" value="" type="hidden">
            <input id="member_id" name="member_id" value="" type="hidden"><div class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002 "><fieldset>
            <legend>댓글 수정</legend>
                                <p>비밀번호 : <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password"> <span class="secret displaynone"><label>비밀댓글</label></span></p>
                                <div class="view">
                                    <textarea id="comment_modify" name="comment_modify" fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea>                        <span class="submit">
                                        <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="BOARD_COMMENT.comment_update_ok(&#39;commentForm&#39;);"><img src="./제일 예쁜 웹퍼블릭 심플 문의사항_files/btn_comment_modify.gif" alt="수정"></a>
                                        <a href="http://webpublic.co.kr/article/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/4060/#none" onclick="BOARD_COMMENT.comment_cancel_ok(&#39;commentForm&#39;);"><img src="./제일 예쁜 웹퍼블릭 심플 문의사항_files/btn_comment_cancel.gif" alt="취소"></a>
                                    </span>
                                </div>
                                <p class="displaynone"> /  byte</p>
                            </fieldset>
            </div>
            </form><!-- 비밀글 확인 -->
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
              <h3>H_Class_FINAL@KH.com</h3>
              <p>Send us your query anytime!</p>
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
</script>
</body>
</html>