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
<title>aranaz</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th {
	/* border-bottom: 1px dashed #444444; */
	
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

.no-padding {
	padding-right: 0;
	padding-left: 0;
}

.comment-wrapper .comment-border {
	margin: 70px 5px 0 5px;
	border-top: 1px solid #CFD4D6;
}

.comment-wrapper .comment-border .comment-box .form-control {
	margin: 20px 0 10px;
	padding: 10px 10px;
	font-size: 1em;
	border: none;
	border-radius: 0;
}

.comment-wrapper .comment-border .comment-box .btn {
	padding: 5px;
	font-size: 1.1em;
	color: #fff;
	background-color: #3B3E44;
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

.comment-wrapper .comment-post-box {
	padding: 5px;
	border-bottom: 2px solid #F4F4F1;
}

.comment-wrapper .comment-post-box .comment-post {
	border-radius: 0;
	margin-top: 10px;
}

.comment-wrapper .comment-post-box .comment-post .comment-post-header {
	border-radius: 0;
}

.comment-wrapper .comment-post-box .comment-post .comment-post-header img
	{
	display: inline-block;
	height: 30px;
	width: 30px;
}

.comment-wrapper .comment-post-box .comment-post .comment-post-header h5
	{
	display: inline-block;
	margin: 0;
	padding-left: 6px;
}

.comment-wrapper .comment-post-box .comment-post .comment-post-header h5 a
	{
	color: #000;
}

.comment-wrapper .comment-post-box .comment-post .comment-post-header h5 small
	{
	margin-top: 5px;
	padding: 8px;
}

.comment-wrapper .comment-post-box .comment-post .comment-post-header .fa
	{
	color: #8A8B8F;
}

.comment-wrapper .show {
	border-radius: 5px;
}

.recent-wrapper .center {
	text-align: center;
}

.recent-wrapper .recent-act .glyphicon {
	font-size: 4em;
}

.recent-wrapper .recent-act .title {
	padding: 20px 0;
	font-weight: 400;
}

.recent-wrapper .recent-act .notif-list {
	height: 300px;
	overflow: scroll;
}

.recent-wrapper .recent-act .per-notif {
	margin: 0 36px 0 36px;
	padding: 13px;
	font-size: 0.9em;
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
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2 style="color: white;">Q&A</h2>
							<p style="color: white;">
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

				<h2>신고</h2>
				<hr>

				<!-- 글 내용-->
				<!-- <form id="BoardDelForm" name="" action="" method="post"> -->
				<div class="ec-base-table typeWrite ">
					<table border="1" summary="">
						<colgroup>
							<col style="width: 130px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr id="qtitle">
								<th colspan="2" align="left"><h4> 신고자 : <strong>${ b.reporter }</strong></h4></th>
							</tr>
							<tr id="qwriter">
								<td width="500">답변 상태 ㅣ <strong id="check">${ b.rStatus }</strong></td>
								<td align="right">작성일 ㅣ <strong>${ b.reportSdate }</strong></td>
							</tr>
							<tr id="qwriter">
								<td colspan="2">
									<strong><h3>내 용</h3></strong>
									${b.reportContent}
								</td>
							</tr>
							<c:if test="${b.rStatus != 'Y'}">
								<tr id="qwriter">
									<td colspan="2">
										<textarea id="reportContentEnsure" name="contents" style="width: 100%; height: 450px;"></textarea>
									</td>
								</tr>
								<tr id="qwriter">
									<td colspan="2" style="text-align: right;">
										<button onclick="ContentEnsure()">답 변 달기</button> 
									</td>
								</tr>
							</c:if>
							<c:if test="${b.rStatus  == 'Y'}">
								<tr id="qwriter">
									<td id="qwriter" colspan="2">
										<strong><h3>답 변</h3></strong>
										${b.reportContentEnsure}
									</td>
								</tr>
							</c:if>
							<tr>
								<td style="text-align: right;" colspan="2"><a href="#" onclick="back()">이전으로 돌아가기</a></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- </form>     -->
		</div>
	</section>
<%-- 	<c:set var="check3" value="${rCode}"/>
	<c:out value=check3/> --%>
	
	<form id="updateEnsure">
		<input type="hidden" id="check1" name="value" value = '${rCode}'>
		<input type="hidden" name="value">
	</form>

	<%@ include file="../common/footer.jsp"%>
	<!--::footer_part end::-->
	<script>
		function back(){
			history.back();
		}
		
		var ensure = document.getElementById('check').innerText;
		document.getElementById('check').innerText = (ensure == 'Y')? '답변 완 료':(ensure == 'N')? '처 리 중':'해당 없음';
		
		
		var num = "<c:out value='${b.rCode}'/>";
		document.getElementById('check1').value = num;
		
		console.log("num : "+num);
		
		var go = document.getElementById('updateEnsure');
		go.action = "reportContentEnsure.do";
		go.method = "post";
		var ContentEnsure = function(){
			// 개행 처리 를 해야 한다.
			var str = document.getElementById('reportContentEnsure').value;
			document.getElementsByName('value')[1].value = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			go.submit();
		}
		
	</script>
</body>
</html>