<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.aligo.spring.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Get inspired for your journey! - aligo</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

td {
	border-bottom: 1px solid #444444;
}

#qtitle {
	background-color: #FAFAFA;
	border-bottom: 1px dashed #ddd;
}

#qwriter {
	background-color: #FAFAFA;
	border-bottom: 1px solid #ddd;
}

table {
	border: none;
}

th, td {
	padding: 10px;
	border: none;
}

/* 댓글 css */
.form-control:focus {
	border-color: #66afe9 !important;
	outline: 0 !important;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6) !important;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6) !important;
}

textarea {
	border: 0.5px solid #F8F8F8 !important;
}

.btn {
	color: #0067b8 !important;
	border: 1px solid #0067b8 !important;
	background: white !important;
}

.btn:hover {
	color: snow !important;
	border: 1px solid #0067b8 !important;
	background: #0067b8 !important;
}

.breadcrumb {
	background-image: url('${contextPath}/resources/images/qnaflowers.jpg');
	background-size: 100% 100%;
}
</style>
<script src="resources/js/jquery-3.4.1.min.js"></script>
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
							<h2 style="color: white; font-size:4em;">Q&A</h2>
							<p style="color: white; font-size:2em;">
								<strong>Ask Anything! </strong>
							</p>
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

				<h2>Q&A</h2>
				<hr>

				<!-- 글 내용-->
				<!-- <form id="BoardDelForm" name="" action="" method="post"> -->
				<div class="ec-base-table typeWrite ">
					<table border="1" summary="">
						<colgroup>
							<col style="width: 130px;">
							<col style="width: auto;">
						</colgroup>
						<input type="hidden" name="qId" value="${ q.qId }" />
						<tbody>
							<tr id="qtitle">
								<th colspan="2" align="left"><h4>
										<strong>${ q.qTitle }</strong>
									</h4></th>
							</tr>
							<tr id="qwriter">
								<td width="500">작성자 ㅣ <strong>${ q.qWriter }</strong></td>
								<td align="right">작성일 ㅣ <a>${ q.qCreateDate }</a></td>
							</tr>
							<tr>
								<td colspan="2">${ q.qContent }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ec-base-button" align="right">
					<span class="gRight"> <!--      <a href="qupView.do?qId=">Edit</a>&nbsp;&nbsp;&nbsp; -->
						<a href='javascript:void(0);' onclick="edit();">Edit</a>&nbsp;&nbsp;&nbsp;
						<a href='javascript:void(0);' onclick="deleteQNA();">Delete</a>&nbsp;&nbsp;&nbsp;
					</span> <span class="gLeft"> <span class="displaynone"> </span> <a
						href="contactView.do">List</a>
					</span>
				</div>
			</div>
			<!-- </form>     -->
			<!-- 여기부터 댓글 -->
			<div class="comments-area">
				<h4>Comments</h4>

			</div>

			<c:if test='${ sessionScope.loginUser.email == "ADMIN" }'>
			<div class="comment-form">
				<h4>Leave a Reply</h4>
				<form class="form-contact comment_form" action="addReply.do">
					<input type="hidden" name="rWriterNickname" value="${ sessionScope.loginUser.nickname }" />
					<input type="hidden" name="refQid" value="${ q.qId }"/>
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<textarea class="form-control w-100" name="rContent"
									id="comment" cols="30" rows="9" placeholder="Write Comment"></textarea>
							</div>
						</div>
					</div>
					<div class="form-group mt-3">
						<input type="submit" class="btn" value="submit" />
					</div>
				</form>
			</div>
			</c:if>
		</div>
	</section>




		<script>
			/* edit, delete 버튼 */
			var edit = function() {
				location.href = "qupView.do?qId="
						+ document.getElementsByName('qId')[0].value;
			}

			var deleteQNA = function() {
				location.href = "qDelete.do?qId="
						+ document.getElementsByName('qId')[0].value;
			}

			$(function() {
				getReplyList();
			});

			function getReplyList() {

				var qId = ${ q.qId };
				$comments = $('.comments-area');

				$.ajax({
							url : "rList.do",
							data : {
								qId : qId
							},
							dataType : "json",
							success : function(data) {

								console.log(data);

								$.each(data, function(index, item) {

													console.log(item.rCreateDate);
													$diva = $('<div>')
															.addClass(
																	'comment-list');
													$divb = $('<div>')
															.addClass(
																	'single-comment justify-content-between d-flex');
													$divc = $('<div>')
															.addClass(
																	'user justify-content-between d-flex');
													$desc = $('<div>')
															.addClass('desc');
													$comment = $('<p>')
															.addClass('comment');
													$div1 = $("<div>")
															.addClass(
																	'd-flex justify-content-between');
													$div2 = $('<div>')
															.addClass(
																	'd-flex align-items-center');
													$h5 = $('<h5>');
													$date = $('<p>').addClass(
															'date');
													$hr = $('<hr>');

													console.log('확인');
													console.log(item.rContent);

													$comment
															.text(item.rContent);
													$h5
															.text(item.rWriterNickname);
													$date
															.text(item.rCreateDate);

													$div1.append($div2);
													$div2.append($h5);
													$div2.append($date);

													$desc.append($comment);
													$desc.append($div1);

													$divc.append($desc);
													$divb.append($divc);
													$diva.append($divb);

													$('.comments-area').append(
															$diva);

												});
							}

						});

			}
		</script>

		<!--::footer_part start::-->
		<%@ include file="../common/footer.jsp"%>
		<!--::footer_part end::-->
</body>
</html>