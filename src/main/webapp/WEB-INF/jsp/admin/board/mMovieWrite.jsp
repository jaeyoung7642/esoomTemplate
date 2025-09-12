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
	<script>
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
			<aside id="aside" class="ly_aside custom_scroll">
				<h3 class="aside_title">MEDIA</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="mNewsList.do" class="snb_link">뉴스</a></li> <!-- 현재 페이지 메뉴 current -->
						<li><a href="mMovieList.do" class="snb_link current">영상</a></li>
						<li><a href="mPhotoList" class="snb_link">사진</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">영상</h3>

				<form action="mergeBoard.do" enctype="multipart/form-data" method="post">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<input type="hidden" name="part" id="part" value="movie">
					<input type="hidden" name="flag" id="flag" value="N">
					<input type="hidden" name="visited" id="visited" value="${result.visited }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>영상 등록 테이블</caption>
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
									<th scope="row"><label for="linkurl">링크 URL</label></th>
									<td>
										<div class="frm_group">
										<input type="text" class="frm_input" id="linkurl" name="linkurl" placeholder="링크 내 코드를 입력하세요." value="${result.linkurl}">
										<a href="https://www.youtube.com/@kccegis" class="el_btn btn frm_btn line2" target="_blank" rel="noreferrer">&nbsp; 농구단 유투브 ▶</a>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">영상구분</th>
									<td>
										<select class="frm_select m400" aria-label="영상 구분" name="wtype" id="wtype">
											<option value="U" <c:if test="${result.wtype eq 'U'}">selected</c:if>>유튜브</option>
											<option value="S" <c:if test="${result.wtype eq 'S'}">selected</c:if>>숏츠</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">썸네일</th>
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
											<span class="el_info">※ 이미지 사이즈 [410X273]</span>
											<input type="hidden" name="img1_bf" id="img1_bf" value="${result.img1}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">메인용썸네일</th>
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
											<input type="hidden" name="img2_bf" id="img2_bf" value="${result.img2}">
											<button type="button" class="el_btn btn frm_btn line2" onclick="openPhoto2()">사진보기</button>
											<button class="openModal" id="img2Pop" data-target="#detailPopup2"></button>
										</div>
											<span class="el_info">※ 유튜브 사이즈 [635X358] &nbsp;&nbsp;&nbsp;&nbsp;※ 숏츠 사이즈 [400X581]</span>
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
				<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">사진보기</h4>
							</div>

							<div class="modal_body custom_scroll" style="text-align:center;">
								<!-- 작성자 정보 -->
								<img src="/resources/common/images/upload/movie/${result.img1}" id="preview" alt="">
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
								<img src="/resources/common/images/upload/movie/${result.img2}" id="preview2" alt="">
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
		<script>
		let gameCd;
		let gameNm;
		let playerCd;
		let playerNm;
		// 경기일 선택
		$(document).on('click', '.matchDayPopup .result_box a', function() {
			$(this).toggleClass('selected');
			$(this).siblings('a').removeClass('selected');
			
			gameNm = $(this).text();
			gameCd = $(this).prev('input').val();
		});

		$(document).on('click', '#matchDayPopup .conform', function() {
			if($('.gameCds.selected').length>0){
				$('#game_date').val(gameCd);
				$('#game_date_nm').val(gameNm);
			}else{
				$('#game_date').val('');
				$('#game_date_nm').val('');
			}
		});


		$(document).on('click', '#tagPopup .conform', function() {
			var checkedCds = [];
			var checkedNms = [];
			_.forEach($(".frm_checkbox input:checked"), function(obj) {
				checkedNms.push($(obj).parent().text().trim());  
				checkedCds.push(obj.value);  
	    	});
	    	$('#tags_nm').val(checkedNms);
	    	$('#tags').val(checkedCds);
		});
		$(document).on('click', '.round', function() {
			$(this).toggleClass('active');
			$(this).siblings('button').removeClass('active');
			var text = $(this).text();
			var type = "";
			var game_round = "";
			switch (text) {
			  case '1R':
			    type = "01";
			    game_round = "1";
			    break;
			  case '2R':
				type = "01";
				game_round = "2";
			    break;
			  case '3R':
			  	type = "01";
			    game_round = "3";
			    break;
			  case '4R':
		  		type = "01";
			    game_round = "4";
			    break;
			  case '5R':
			  	type = "01";
			    game_round = "5";
			    break;
			  case '6R':
			  	type = "01";
			    game_round = "6";
			    break;
			  case 'PO':
			  	type = "03";
			    game_round = "1";
			    break;
			  case 'CH':
			  	type = "04";
			    game_round = "1";
			    break;
			}
			$.ajax({
			   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "/kccadm/gameList",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "game_round":game_round,
			       	 "type":type
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	$("#gameListView").empty();
				        if(res.length>0){
				        	res.forEach(function(item) {
				                $("#gameListView").append("<input type='hidden' value='"+item.gameCd+"'>"
				                		+"<a href='#' class='gameCds'>"+item.gameNm+"</a>");
				            });
				        }else{
				        	alert('데이터가 없습니다.');
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
		});

		</script>
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