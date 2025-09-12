<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1270, initial-scale=1">
	<title>KCC EGIS 관리자</title>
	<link rel="stylesheet preload" as="style" crossorigin href="<c:url value="/resources/common/admin/assets/font/font.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/common/admin/assets/css/common.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/admin/assets/css/subpage.css"/>"> 
	
	<script src="<c:url value="/resources/common/admin/assets/js/jquery.nice-select.min.js"/>" defer></script> <!-- sub page only -->
	<script src="<c:url value="/resources/common/admin/assets/js/common.js"/>" defer></script> <!-- sub page only -->
	<script src="<c:url value="/resources/common/admin/assets/js/jquery-ui.min.js"/>" defer></script> <!-- sub page only -->
	<script src="<c:url value="/resources/common/admin/assets/js/script.js"/>" defer></script> 
	<script src="<c:url value="/resources/common/admin/assets/js/jquery-3.6.0.min.js"/>"></script>
	<script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
	<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script> -->
	
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-sub">
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<h2 class="blind">컨텐츠 바로가기</h2>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->
		<!-- container -->
		<div id="container" class="ly_container"> 
			<!-- aside -->
			<aside id="aside" class="ly_aside">
				<div class="aside_inner custom_scroll">
					<h3 class="aside_title">FANZONE</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="fNoticeList.do" class="snb_link current">공지사항</a></li> 
							<li><a href="fFreeList.do" class="snb_link">팬게시판</a></li>
							<li><a href="fEventList.do" class="snb_link">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">공지사항</h3>

				<form action="mergeBoard.do"  method="post">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<input type="hidden" name="part" id="part" value="notice">
					<input type="hidden" name="visited" id="visited" value="${result.visited }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>공지사항 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="subject">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="subject" name="subject" placeholder="제목을 입력하세요." value="${result.subject}">
									</td>
								</tr>
								<tr>
									<th scope="row">공지</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.wtype != null }">
											<label class="frm_radio type1">
												<input type="radio" name="wtype" value="Y" <c:if test="${result.wtype == 'Y'}">checked</c:if>>
												공지
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="wtype" value="" <c:if test="${result.wtype != 'Y'}">checked</c:if>>
												일반글
											</label>
										</c:if>
										<c:if test="${result.wtype == null }">
											<label class="frm_radio type1">
												<input type="radio" name="wtype" value="Y" >
												공지
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="wtype" value="" checked>
												일반글
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.flag != null }">
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="N" <c:if test="${result.flag == 'N'}">checked</c:if>>
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="Y" <c:if test="${result.flag == 'Y'}">checked</c:if>>
												미출력
											</label>
										</c:if>
										<c:if test="${result.flag == null }">
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="N">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="Y" checked>
												미출력
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td>
										<!-- 편집기 영역 -->
										<textarea name="content" id="ckeditor" cols="30" rows="10" class="frm_input">${result.content }</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button class="el_btn md line">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteNews(${result.num },'${result.part}')">삭제</button>
					</div>
				</form>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
	<script>
	$(function() {
		CKEDITOR.replace('ckeditor',{
			uploadUrl: "/fileupload.do/drag",
			filebrowserUploadUrl:  "/fileupload.do",
			toolbar: [
			    { name: 'clipboard', items: [ 'Undo', 'Redo' ] },
			    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
			    { name: 'paragraph', items: [ 'Blockquote','Indent','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
			    { name: 'insert', items: [ 'Image', 'Table', 'SpecialChar' ] },
			    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
			    { name: 'Styles', items: [ 'Font', 'FontSize' ] },
			    { name: 'Links', items: [ 'Link'] },
			],
			font_names: '맑은 고딕/Malgun Gothic;' +
            '돋움/Dotum;' +
            '굴림/Gulim;' +
            '바탕/Batang;' +
            '궁서/Gungsuh;' +
            'HY견고딕/HY견고딕;' +
            'HY견명조/HY견명조'
		});
	});
    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
		  <script src="https://www.googletagmanager.com/gtag/js?id=UA-180137319-1"></script>
		  <script>
		    window.dataLayer = window.dataLayer || [];
		    function gtag() { dataLayer.push(arguments); }
		    gtag('js', new Date());
		    gtag('config', 'UA-180137319-1');
		  </script>
</body>
</html>