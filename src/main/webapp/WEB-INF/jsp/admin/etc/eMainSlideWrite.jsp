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
	<script>
	$(function() {
	var useYn = $("input[name='use_yn']:checked").val();
		if(useYn=='Y'){
			$('#order').show();
		}else{
			$('#order').hide();
		}
	});
	function orderShow(val){
		if(val=='Y'){
			$('#order').show();
		}else{
			$('#order').hide();
		}
	}
	function useYnCount(){
		var useYn = $("input[name='use_yn']:checked").val();
		console.log(useYn);
		var form = $("#mainSlideForm");
		var num = $("#num").val();
	 	if(useYn=='Y'){
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/esoomTemplate/useYnCount.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			        	"num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res>2){
				       	 	alert("최대 출력 슬라이드 3개를 초과했습니다.기존 출력 게시물을 변경 후 진행해주시기 바랍니다.");
				        }else{
				        	form.submit();
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
		}else{
			form.submit();
		} 
	}
	function readURL2(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview2').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview2').src = '';
		  }
		}
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = '';
		  }
		}
	function openPhoto2(){
		if($('#img2Txt').text().trim() === '' || $('#img2Txt')[0].innerText =='사진을 첨부하세요.'){
			alert("선택된 파일이 없습니다.");
		}else{
			$('#img2Pop').trigger('click');
		}
	}
	function openPhoto(){
		if($('#img1Txt').text().trim() === '' || $('#img1Txt')[0].innerText =='사진을 첨부하세요.'){
			alert("선택된 파일이 없습니다.");
		}else{
			$('#img1Pop').trigger('click');
		}
	}
	</script>
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
					<h3 class="aside_title">ETC</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="ePopupList.do" class="snb_link">팝업</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="eMainSlideList.do" class="snb_link current">메인슬라이드 관리</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">메인슬라이드관리</h3>

				<form action="mergeSlide.do" enctype="multipart/form-data" method="post" id="mainSlideForm">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>메인슬라이드 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="title">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="title" name="title" placeholder="제목을 입력하세요." value="${result.title}" required>
									</td>
								</tr>
								<tr>
									<th scope="row">pc 이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img1" id="img1" onchange="readURL(this);">
													<span class="frm_input gray m400" id="img1Txt">
													<c:if test="${result.img1 != null }">
														${result.img1 }
													</c:if>
													<c:if test="${result.img1 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<button type="button" class="el_btn btn frm_btn line2" onclick="openPhoto()">사진보기</button>
											<button class="openModal" id="img1Pop" data-target="#detailPopup"></button>
											<span class="el_info">※ 이미지 사이즈 [1920X951]</span>
											<input type="hidden" name="img1_bf" id="img1_bf" value="${result.img1}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">mobile 이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img2" id="img2" onchange="readURL2(this);">
													<span class="frm_input gray m400" id="img2Txt">
													<c:if test="${result.img2 != null }">
														${result.img2 }
													</c:if>
													<c:if test="${result.img2 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<button type="button" class="el_btn btn frm_btn line2" onclick="openPhoto2()">사진보기</button>
											<button class="openModal" id="img2Pop" data-target="#detailPopup2"></button>
											<span class="el_info">※ 이미지 사이즈 [1125X1380]</span>
											<input type="hidden" name="img2_bf" id="img2_bf" value="${result.img2}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="links">링크</label></th>
									<td>
										<input type="text" class="frm_input" id="links" name="links" value="${result.links}">
									</td>
								</tr>
								<tr>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.use_yn != null }">
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="Y" <c:if test="${result.use_yn == 'Y'}">checked</c:if> onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="N" <c:if test="${result.use_yn == 'N'}">checked</c:if> onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										<c:if test="${result.use_yn == null }">
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="Y" onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="N" checked onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr id="order">
									<th scope="row"><label for="banner_order">출력순서</label></th>
									<td>
										<select class="frm_select" id="banner_order" name="banner_order" aria-label="출력순서 선택">
											<option value="1" <c:if test="${result.banner_order eq '1'}">selected</c:if>>1</option>
											<option value="2" <c:if test="${result.banner_order eq '2'}">selected</c:if>>2</option>
											<option value="3" <c:if test="${result.banner_order eq '3'}">selected</c:if>>3</option>
										</select>
										<span class="el_info">※ 숫자가 작을수록 우선순위 입니다.</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button type="button" class="el_btn md line" onclick="useYnCount()">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteMainSlide(${result.num })">삭제</button>
					</div>
				</form>
				<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">사진보기</h4>
							</div>

							<div class="modal_body custom_scroll" style="text-align:center;">
								<!-- 작성자 정보 -->
								<img src="/resources/common/images/upload/main_banner/${result.img1}" id="preview" alt="">
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 미리보기 팝업 -->
				<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup2" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">사진보기</h4>
							</div>

							<div class="modal_body custom_scroll" style="text-align:center;">
								<!-- 작성자 정보 -->
								<img src="/resources/common/images/upload/main_banner/${result.img2}" id="preview2" alt="">
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 미리보기 팝업 -->
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
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