<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%
	String baseUrl = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	String currentUrl = baseUrl + (queryString != null ? "?" + queryString : "");
	%>
	<meta property="og:type" content="website">
	<meta property="og:url" content="<%= currentUrl %>">
	<meta property="og:title" content="시즌 기록실 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>시즌 기록실 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="<c:url value="/resources/common/assets/font/font.css"/>" />
	<link rel="shortcut icon" href="<c:url value="/resources/common/images/common/favicon_kccegis.png"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/swiper-bundle.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/common.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/sub.css"/>"> <!-- sub only -->
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/game.css"/>"> <!-- 디렉토리  game only -->
	<script src="<c:url value="/resources/common/assets/js/jquery-3.6.0.min.js"/>"></script>
	<script src="<c:url value="/resources/common/assets/js/jquery.scrollDetector.min.js"/>" defer></script>
	<script src="<c:url value="/resources/common/assets/js/lenis.min.js"/>" defer></script>
	<script src="<c:url value="/resources/common/assets/js/swiper-bundle.min.js"/>" defer></script>
	<script src="<c:url value="/resources/common/assets/js/jquery.kinetic.min.js"/>" defer></script>
	<script src="<c:url value="/resources/common/assets/js/common.js"/>" defer></script> 
	<script src="<c:url value="/resources/common/assets/js/jquery.nice-select.min.js"/>" defer></script> <!-- sub only -->
	<script src="<c:url value="/resources/common/assets/js/sub.js"/>" defer></script> <!-- sub only -->
	<script src="<c:url value="/resources/common/assets/js/link.js"/>" defer></script>
	<script src="<c:url value="/resources/common/assets/js/script.js"/>" defer></script> <!-- 개발용 -->
	<script src="<c:url value="/resources/common/assets/js/gsap.min.js"/>" defer></script> <!-- main only -->
	<script src="<c:url value="/resources/common/assets/js/ScrollTrigger.min.js"/>" defer></script> <!-- main only -->
<body class="page-sub">
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<p class="blind">콘텐츠 바로가기</p>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->

		<!-- container -->
		<main id="container" class="ly_container game">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>GAME</li>
						<li>시즌 기록실</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList.do" class="swiper-slide snb_link"><span>경기일정/결과</span></a> 
								<a href="teamRank.do" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord.do" class="swiper-slide snb_link current"><span>시즌 기록실</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="ticket.do" class="swiper-slide snb_link"><span>티켓팅</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="teamRecord.do" class="swiper-slide snb_link current"><span>팀 기록</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRecord.do" class="swiper-slide snb_link"><span>선수 기록 </span></a>
					</div>
				</nav>
			</div>

			<!-- 시즌별 기록 -->
			<section class="section">
				<div class="ly_inner md">

					<div class="page_header">
						<h4 class="el_heading lv1">시즌별 기록</h4> 
						<form action="" class="forms">
							<div class="frm_group gap16m">
								<label class="frm_radio type1">
									<input type="radio" name="r_data" checked>
									평균
								</label>
								<label class="frm_radio type1">
									<input type="radio" name="r_data">
									누적
								</label>
							</div>
						</form>

						<div class="btns rt">
							<button type="button" class="el_btn btn_txt openModal" data-target="#termsInfoPopup">
								<span class="el_ico info"></span> 용어정리
							</button>
						</div> 
					</div>

					<!-- 기록 테이블 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed"> 
							<table summary="시즌 정보 제공">
								<caption>시즌별 기록 고정영역</caption>
								<colgroup>
									<col class="season">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">시즌</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>24~25</td>
									</tr>
									<tr>
										<td>23~24</td>
									</tr>
									<tr>
										<td>22~23</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1700px; --mmin: 1400px;">
									<caption>시즌별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="13">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="14">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="15">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="16">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="17">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="18">PF</a>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 기록 테이블 -->

					<div class="btn_area gap12 mt18">
						<a href="#" class="el_btn ccl add"><span class="blind">더보기</span></a>
						<a href="#" class="el_btn ccl remove" disabled><span class="blind">닫기</span></a>
					</div>

				</div>
			</section>
			<!-- //시즌별 기록 -->

			<!-- 용어정리 팝업 -->
			<div id="termsInfoPopup" tabindex="-1" class="modal type2 spc_md termsInfoPopup" data-focus="tmodal">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_header no_line">
							<h4 class="heading md">용어정리</h4>
						</div>

						<div class="modal_body" data-lenis-prevent>

							<div class="content">
								<!-- tbl -->
								<div class="tbl type2 td_xsm td_line">
									<table summary="명칭, 설명 정보 제공">
										<colgroup>
											<col class="col1">
											<col class="col2">
										</colgroup>
										<thead>
											<tr> 
												<th scope="col">명칭</th>
												<th scope="col">설명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>PTS</td>
												<td>총 득점</td>
											</tr>
											<tr>
												<td>2P</td>
												<td>2점슛</td>
											</tr>
											<tr>
												<td>2PA</td>
												<td>2점슛 시도</td>
											</tr>
											<tr>
												<td>2P%</td>
												<td>2점슛 성공률</td>
											</tr>
											<tr>
												<td>3P</td>
												<td>3점슛</td>
											</tr>
											<tr>
												<td>3PA</td>
												<td>3점슛 시도</td>
											</tr>
											<tr>
												<td>3P%</td>
												<td>3점슛 성공률</td>
											</tr>
											<tr>
												<td>PP</td>
												<td>페인트존 득점 성공</td>
											</tr>
											<tr>
												<td>PPA</td>
												<td>페인트존 득점 시도</td>
											</tr>
											<tr>
												<td>PP%</td>
												<td>페이트존 득점 성공률</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //tbl -->
								<!-- tbl -->
								<div class="tbl type2 td_xsm td_line">
									<table summary="명칭, 설명 정보 제공">
										<colgroup>
											<col class="col1">
											<col class="col2">
											<col>
										</colgroup>
										<thead class="xm_hide">
											<tr> 
												<th scope="col">명칭</th>
												<th scope="col">설명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>OFF REB</td>
												<td>공격 리바운드</td>
											</tr>
											<tr>
												<td>DEF REB</td>
												<td>수비 리바운드</td>
											</tr>
											<tr>
												<td>TOT</td>
												<td>공/수 리바운드 총합</td>
											</tr>
											<tr>
												<td>FT</td>
												<td>자유투</td>
											</tr>
											<tr>
												<td>FTA</td>
												<td>자유투 시도</td>
											</tr>
											<tr>
												<td>FT%</td>
												<td>자유투 성공률</td>
											</tr>
											<tr>
												<td>TO</td>
												<td>턴오버</td>
											</tr>
											<tr>
												<td>BS</td>
												<td>블록</td>
											</tr>
											<tr>
												<td>PF</td>
												<td>개인파울</td>
											</tr>
											<tr class="xm_hide">
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //tbl -->
							</div>

						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="tmodal"></button>
					</div>
				</div>
			</div>
			<!-- 용어정리 팝업 -->
		

			<!-- 라운드별 기록 -->
			<section class="section mt50">
				<div class="ly_inner md">

					<div class="page_header">
						<h4 class="el_heading lv1">라운드별 기록</h4> 
						<form action="" class="forms">
							<div class="frm_group gap16m">
								<label class="frm_radio type1">
									<input type="radio" name="r_data" checked>
									평균
								</label>
								<label class="frm_radio type1">
									<input type="radio" name="r_data">
									누적
								</label>
							</div>
						</form>

						<!-- <div class="btns rt">
							<a href="#" class="el_btn refresh" aria-label="새로고침"><span class="p_hide">새로고침</span></a>
						</div>  -->
					</div>

					<!-- 기록 테이블 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="라운드 정보 제공">
								<caption>라운드별 기록 고정영역</caption>
								<colgroup>
									<col class="season">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">라운드</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1R</td>
									</tr>
									<tr>
										<td>2R</td>
									</tr>
									<tr>
										<td>3R</td>
									</tr>
									<tr>
										<td>4R</td>
									</tr>
									<tr>
										<td>5R</td>
									</tr>
									<tr>
										<td>6R</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1700px; --mmin: 1400px;">
									<caption>라운드별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort sroundSort" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="13">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="14">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="15">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="16">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="17">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort sroundSort" data-pickcol="18">PF</a>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
											<td>20.9</td>
											<td>34.7</td>
											<td>60.3</td>
											<td>10.6</td>
											<td>26.4</td>
											<td>36.9</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 기록 테이블 -->
				</div>
			</section>
			<!-- //라운드별 기록 -->

			<script>
				let roundIdx = null;
				let roundSort = null;

				$(document).on('click', '.sroundSort', function() {
					let idx = $(this).data('pickcol');

					// sort
					if (roundIdx === idx) {
						roundSort = roundSort === 'desc' ? 'asc' : 'desc';
					} else {
						roundSort = 'desc';	
					}

					// select td
					selectCol($(this), roundIdx);

					// index change
					roundIdx = idx;
				});
				
			</script>
			

			<!-- 팀&팀 기록 비교 -->
			<section class="section t_record_teams mt50">
				<span class="anchor" id="TEAMRECORD"></span>
				<div class="ly_inner md">

					<!-- 팀&팀 기록 -->
					<article class="grid_header_type1">
						<div class="page_header g_header">
							<h4 class="el_heading lv1">팀&팀 기록 비교</h4> 
						</div>

						<p class="el_desc g_desc">* 표에서 팀명을 클릭하셔도 상대팀 등록이 가능합니다.</p>

						<!-- 비교 테이블 -->
						<div class="tbl type3 tblSwipe g_content">
							<div class="fixed">
								<table summary="팀명 정보 제공">
									<caption>팀&팀 기록 비교 고정영역</caption>
									<colgroup>
										<col class="season">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">팀명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>시즌 전적</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="상대팀 시즌 전적 및 선택버튼 제공" style="--mwth: 100vw; --mmin: 900px;" class="cols9">
										<caption>팀&팀 기록 비교 스크롤영역</caption>
										<thead>
											<tr>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="1">원주 DB</a> <!-- 버튼 클릭 시 아래표 셀렉트 박스 변경 -->
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="2">창원 LG</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="3">수원 KT</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="4">서울 SK</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="5">울산<br> 현대모비스</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="6">대구<br> 한국가스공사</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="7">고양 소노</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="8">안양 정관장</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="9">서울 삼성</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
												<td class="txt14">4승 2패</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- //비교 테이블 -->
					</article>
					<!-- //팀&팀 기록 -->
				</div>
			</section>
			<!-- //팀&팀 기록 비교 -->

			<section class="change_teams_record mt30">
				<div class="ly_inner md">

					<!-- 선택팀 기록 (선택팀 없을 때) -->
					<article class="t_record_content bl_card">
						<!-- KCC 이지스 -->
						<div class="team lt p_hide">
							<div class="el_logo md">
								<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
							</div>
							<p class="name">KCC 이지스</p>
						</div>
						<!-- 비교 테이블  -->
						<div class="record">
							<div class="tbl type1  tblSwipe">
								<div class="fixed">
									<table summary="현재 시즌 순 정보 제공">
										<caption>선택팀과의 주요 부문 기록 비교 고정영역</caption>
										<colgroup>
											<col class="team2">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">현재 시즌 순위</th>
											</tr>
										</thead>
										<!-- <tbody>
											<tr>
												<td>5위 : 3위</td>
											</tr>
										</tbody> -->
									</table>
								</div>
								<div class="swipearea">
									<div class="inner">
										<table summary="최근 경기, 현재 시즌 전적, 지난 시즌 전적, 누적 전적 정보 제공" style="--pmin: 480px;--mmin: 510px">
											<caption>선택팀과의 주요 부문 기록 비교 스크롤영역</caption>
											<colgroup>
												<col width="23.97%">
												<col width="27.94%">
												<col width="27.94%">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col">최근 경기</th>
													<th scope="col">현재 시즌 전적</th>
													<th scope="col">지난 시즌 전적</th>
													<th scope="col">누적 전적</th>
												</tr>
											</thead>
											<!-- <tbody>
												<tr>
													<td>승패승</td>
													<td>74승 46패</td>
													<td>74승 46패</td>
													<td>74승 46패</td>
												</tr>
											</tbody> -->
										</table>
									</div>
								</div>
								<div class="no_post sm">상태팀을 먼저 선택하세요.</div>
							</div>
						</div>
						<!-- 상대팀 -->
						<div class="team rt">
							<div class="el_logo md">
								<img src="<c:url value='/resources/common/images/game/logo_kbl.png'/>" alt="">
							</div>
							<select class="frm_select sm" aria-label="상대팀 선택" id="teamSelect">
								<option value="">상대팀</option>
								<option value="1">원주 DB</option>
								<option value="2">창원 LG</option>
								<option value="3">수원 KT</option>
								<option value="4">서울 SK</option>
								<option value="5">울산 현대모비스</option>
								<option value="6">대구 한국가스공사</option>
								<option value="7">고양 소노</option>
								<option value="8">안양 정관장</option>
								<option value="9">서울 삼성</option>
							</select>
						</div>
						<!--   -->
						<div class="btns">
							<a href="#" class="el_btn ccl ccl2">
								경기일정 <span class="el_ico ico_calendar"></span>
							</a>
						</div>
					</article>
					<!-- 선택팀 기록 -->

					<!-- 선택팀 기록 (선택팀 선택했을 때) -->
					<article class="t_record_content bl_card">
						<!-- KCC 이지스 -->
						<div class="team lt p_hide">
							<div class="el_logo md">
								<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
							</div>
							<p class="name">KCC 이지스</p>
						</div>
						<!-- 비교 테이블  -->
						<div class="record">
							<div class="tbl type1  tblSwipe">
								<div class="fixed">
									<table summary="현재 시즌 순 정보 제공">
										<caption>선택팀과의 주요 부문 기록 비교 고정영역</caption>
										<colgroup>
											<col class="team2">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">현재 시즌 순위</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>5위 : 3위</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="swipearea">
									<div class="inner">
										<table summary="최근 경기, 현재 시즌 전적, 지난 시즌 전적, 누적 전적 정보 제공" style="--pmin: 480px;--mmin: 510px">
											<caption>선택팀과의 주요 부문 기록 비교 스크롤영역</caption>
											<colgroup>
												<col width="23.97%">
												<col width="27.94%">
												<col width="27.94%">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col">최근 경기</th>
													<th scope="col">현재 시즌 전적</th>
													<th scope="col">지난 시즌 전적</th>
													<th scope="col">누적 전적</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>승패승</td>
													<td>74승 46패</td>
													<td>74승 46패</td>
													<td>74승 46패</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- <div class="no_post sm">상태팀을 먼저 선택하세요.</div> -->
							</div>
						</div>
						<!-- 상대팀 -->
						<div class="team rt">
							<div class="el_logo md">
								<img src="<c:url value='/resources/common/images/game/logo_50.svg'/>" alt=""> 
							</div>
							<select class="frm_select sm" aria-label="상대팀 선택">
								<option value="">상대팀</option>
								<option value="1">원주 DB</option>
								<option value="2" selected>창원 LG</option>
								<option value="3">수원 KT</option>
								<option value="4">서울 SK</option>
								<option value="5">울산 현대모비스</option>
								<option value="6">대구 한국가스공사</option>
								<option value="7">고양 소노</option>
								<option value="8">안양 정관장</option>
								<option value="9">서울 삼성</option>
							</select>
						</div>
						<!--   -->
						<div class="btns">
							<a href="#" class="el_btn ccl ccl2">
								경기일정 <span class="el_ico ico_calendar"></span>
							</a>
						</div>
					</article>
					<!-- 선택팀 기록 -->


					<!-- 주요 기록 비교 -->
					<article class="mt30">
						<div class="page_header">
							<h5 class="el_heading lv2">주요 기록 비교</h5> 
						</div>

						<div class="bl_grid col2 gap0m" data-scollOn="once"> 
							<!-- col -->
							<div class="bl_col">
								<div class="game_result staple_record">
									<!-- header -->  
									<div class="header type1">
										<div class="row">
											<span class="col lt">부산 KCC</span>
											<span class="col gray">VS</span>
											<span class="col rt">수원 KT</span>
										</div>
									</div> 
									<!-- //header -->
									<div class="content type1">
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="82"></span>
												</div>
												<p class="score win">83</p>
											</div>
											<div class="col ct">
												<span class="part">득점</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="82"></span>
												</div>
												<p class="score">82</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="37" data-max="50"></span>
												</div>
												<p class="score">37</p>
											</div>
											<div class="col ct">
												<span class="part">리바운드</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="45" data-max="50"></span>
												</div>
												<p class="score win">45</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="21" data-max="50"></span>
												</div>
												<p class="score win">21</p>
											</div>
											<div class="col ct">
												<span class="part">어시스트</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="18" data-max="50"></span>
												</div>
												<p class="score">18</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="7" data-max="30"></span>
												</div>
												<p class="score">7</p>
											</div>
											<div class="col ct">
												<span class="part">스틸</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="11" data-max="30"></span>
												</div>
												<p class="score win">11</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="6" data-max="30"></span>
												</div>
												<p class="score win">6</p>
											</div>
											<div class="col ct">
												<span class="part">블록</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="4" data-max="30"></span>
												</div>
												<p class="score">4</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="38" data-max="50"></span>
												</div>
												<p class="score win">38</p>
											</div>
											<div class="col ct">
												<span class="part">2점슛</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="32" data-max="50"></span>
												</div>
												<p class="score">32</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="24" data-max="50"></span>
												</div>
												<p class="score win">24</p>
											</div>
											<div class="col ct">
												<span class="part">3점슛</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="21" data-max="50"></span>
												</div>
												<p class="score">21</p>
											</div>
										</div>
										<!-- //row -->
									</div>
								</div>
							</div>
							<!-- //col -->
							<!-- col -->
							<div class="bl_col">
								<div class="game_result staple_record">
									<!-- header -->  
									<div class="header type1 p_hide">
										<div class="row">
											<span class="col lt">부산 KCC</span>
											<span class="col gray">VS</span>
											<span class="col rt">수원 KT</span>
										</div>
									</div> 
									<!-- //header -->
									<div class="content type1">
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="19" data-max="50"></span>
												</div>
												<p class="score win">19</p>
											</div>
											<div class="col ct">
												<span class="part">자유투</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="17" data-max="50"></span>
												</div>
												<p class="score">17</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="37"></span>
												</div>
												<p class="score">37</p>
											</div>
											<div class="col ct">
												<span class="part">턴오버</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="99"></span>
												</div>
												<p class="score win">99</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="37.2"></span>
												</div>
												<p class="score win">37.2</p>
											</div>
											<div class="col ct">
												<span class="part">2점슛<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="33.5"></span>
												</div>
												<p class="score">33.5</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="40.0"></span>
												</div>
												<p class="score win">40.0</p>
											</div>
											<div class="col ct">
												<span class="part">3점슛<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="36.3"></span>
												</div>
												<p class="score">36.3</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="71.1"></span>
												</div>
												<p class="score win">71.1</p>
											</div>
											<div class="col ct">
												<span class="part">자유투<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="69.8"></span>
												</div>
												<p class="score">69.8</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="58.9"></span>
												</div>
												<p class="score win">58.9</p>
											</div>
											<div class="col ct">
												<span class="part">야투<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="53.3"></span>
												</div>
												<p class="score">53.3</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="60.1"></span>
												</div>
												<p class="score win">60.1</p>
											</div>
											<div class="col ct">
												<span class="part">페인트존<br> 득점률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="58.9"></span>
												</div>
												<p class="score">58.9</p>
											</div>
										</div>
										<!-- //row -->
									</div>
								</div>
							</div>
							<!-- //col -->
						</div>
					</article>
					<!-- //주요 기록 비교 -->

					<!-- 경기별 기록 비교 -->
					<article class="grid_header_type1 mt30">
						<div class="page_header g_header">
							<h5 class="el_heading lv2">경기별 기록 비교</h5> 
							<form action="" class="forms">
								<div class="frm_group">
									<select class="frm_select max240 m155" aria-label="라운드 선택">
										<option value="1" selected>1라운드</option>
										<option value="2">2라운드</option>
										<option value="3">3라운드</option>
									</select>
								</div>
							</form>
						</div>

						<p class="el_desc g_desc">* 경기 일자 클릭 시 해당 경기 결과 페이지로 이동합니다.  </p>

						<!-- 비교 테이블 -->
						<div class="tbl type3 td_sm td_line tblSwipe g_content">
							<div class="fixed">
								<table summary="라운드 정보 제공">
									<caption>경기별 기록 비교 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2" style="height: calc(var(--tblH) * 2);">1라운드</th>
										</tr> 
									</thead>
									<tbody>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2024.03.15</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2024.02.10</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2024.01.25</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2023.12.25</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2023.12.12</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="상대팀 시즌 전적 및 선택버튼 제공" style="--pmin: 2100px; --mmin: 1570px;" class="cols28">
										<caption>경기별 기록 비교 스크롤영역</caption>
										<thead>
											<tr>
												<th scope="col" colspan="2">득점</th>
												<th scope="col" colspan="2">리바운드</th>
												<th scope="col" colspan="2">어시스트</th>
												<th scope="col" colspan="2">스틸</th>
												<th scope="col" colspan="2">블록</th>
												<th scope="col" colspan="2">2점슛</th>
												<th scope="col" colspan="2">3점슛</th>
												<th scope="col" colspan="2">자유투</th>
												<th scope="col" colspan="2">턴오버</th>
												<th scope="col" colspan="2">2점슛 성공률(%)</th>
												<th scope="col" colspan="2">3점슛 성공률(%)</th>
												<th scope="col" colspan="2">자유투 성공률(%)</th>
												<th scope="col" colspan="2">야투 성공률(%)</th>
												<th scope="col" colspan="2">페인트존 득점률(%)</th>
											</tr>
											<tr class="lv2 col_group_2">
												<th scope="col">득점</th>
												<th scope="col" class="no_bl">실점</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl">KT</th>
											</tr>
										</thead>
										<tbody>
											<tr class="col_group_2">
												<td>85</td>
												<td class="no_bl">99</td>
												<td>0.69</td>
												<td class="no_bl">0.53</td>
												<td>0.31</td>
												<td class="no_bl">0.50</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>13</td>
												<td class="no_bl">19</td>
												<td>2</td>
												<td class="no_bl">8</td>
												<td>1</td>
												<td class="no_bl">1</td>
												<td>13</td>
												<td class="no_bl">8</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>37.2</td>
												<td class="no_bl">33.5</td>
												<td>40.0</td>
												<td class="no_bl">36.3</td>
												<td>71.1</td>
												<td class="no_bl">69.8</td>
												<td>58.9</td>
												<td class="no_bl">53.3</td>
												<td>60.1</td>
												<td class="no_bl">58.9</td>
											</tr>
											<tr class="col_group_2">
												<td>85</td>
												<td class="no_bl">99</td>
												<td>0.69</td>
												<td class="no_bl">0.53</td>
												<td>0.31</td>
												<td class="no_bl">0.50</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>13</td>
												<td class="no_bl">19</td>
												<td>2</td>
												<td class="no_bl">8</td>
												<td>1</td>
												<td class="no_bl">1</td>
												<td>13</td>
												<td class="no_bl">8</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>37.2</td>
												<td class="no_bl">33.5</td>
												<td>40.0</td>
												<td class="no_bl">36.3</td>
												<td>71.1</td>
												<td class="no_bl">69.8</td>
												<td>58.9</td>
												<td class="no_bl">53.3</td>
												<td>60.1</td>
												<td class="no_bl">58.9</td>
											</tr>
											<tr class="col_group_2">
												<td>85</td>
												<td class="no_bl">99</td>
												<td>0.69</td>
												<td class="no_bl">0.53</td>
												<td>0.31</td>
												<td class="no_bl">0.50</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>13</td>
												<td class="no_bl">19</td>
												<td>2</td>
												<td class="no_bl">8</td>
												<td>1</td>
												<td class="no_bl">1</td>
												<td>13</td>
												<td class="no_bl">8</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>37.2</td>
												<td class="no_bl">33.5</td>
												<td>40.0</td>
												<td class="no_bl">36.3</td>
												<td>71.1</td>
												<td class="no_bl">69.8</td>
												<td>58.9</td>
												<td class="no_bl">53.3</td>
												<td>60.1</td>
												<td class="no_bl">58.9</td>
											</tr>
											<tr class="col_group_2">
												<td>85</td>
												<td class="no_bl">99</td>
												<td>0.69</td>
												<td class="no_bl">0.53</td>
												<td>0.31</td>
												<td class="no_bl">0.50</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>13</td>
												<td class="no_bl">19</td>
												<td>2</td>
												<td class="no_bl">8</td>
												<td>1</td>
												<td class="no_bl">1</td>
												<td>13</td>
												<td class="no_bl">8</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>37.2</td>
												<td class="no_bl">33.5</td>
												<td>40.0</td>
												<td class="no_bl">36.3</td>
												<td>71.1</td>
												<td class="no_bl">69.8</td>
												<td>58.9</td>
												<td class="no_bl">53.3</td>
												<td>60.1</td>
												<td class="no_bl">58.9</td>
											</tr>
											<tr class="col_group_2">
												<td>85</td>
												<td class="no_bl">99</td>
												<td>0.69</td>
												<td class="no_bl">0.53</td>
												<td>0.31</td>
												<td class="no_bl">0.50</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>13</td>
												<td class="no_bl">19</td>
												<td>2</td>
												<td class="no_bl">8</td>
												<td>1</td>
												<td class="no_bl">1</td>
												<td>13</td>
												<td class="no_bl">8</td>
												<td>31</td>
												<td class="no_bl">33</td>
												<td>37.2</td>
												<td class="no_bl">33.5</td>
												<td>40.0</td>
												<td class="no_bl">36.3</td>
												<td>71.1</td>
												<td class="no_bl">69.8</td>
												<td>58.9</td>
												<td class="no_bl">53.3</td>
												<td>60.1</td>
												<td class="no_bl">58.9</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						
						</div>
						<!-- //비교 테이블 -->
					</article>
					<!-- 경기별 기록 비교 -->

				</div>
			</section>

			<script>
				// 팀선택 이벤트
				const $teamBtn = $('.changeTeam');
				const $select = $('#teamSelect');

				$teamBtn.on('click', function() {
					const target = $(this).data('target');
					$select.val(target);

					selectUpdate($select);
				});
			</script>
			
			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="<c:url value='/resources/common/images/common/ico_gotoTop.svg'/>" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
</body>
</html>