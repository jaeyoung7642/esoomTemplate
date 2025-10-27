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
						<a href="teamRecord.do" class="swiper-slide snb_link"><span>팀 기록</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRecord.do" class="swiper-slide snb_link current"><span>선수 기록 </span></a>
					</div>
				</nav>
			</div>

			<!-- 개인별 시즌 기록 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header g_header">
						<h4 class="el_heading lv1">개인별 시즌 기록</h4> 
					</div>

					<div class="p_record_content">
						<!-- 주요 부문별 선수 순위  -->
						<article class="ranking">
							<div class="profile p_profile type1">
								<div class="pos">GUARD</div>
								<!-- <div class="pos long">FORWARD</div> --> <!-- 'FORWARD'일 경우 .long 클래스 추가 -->
								<div class="inner">
									<div class="photo">
										<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="허웅선수 사진">
									</div>
								</div>
							</div>
							<div class="player">
								<span class="num">No.3</span>
								<span class="name">허 웅</span>
							</div>
							<div class="btns">
								<a href="#" class="el_btn md blue full gap4">
									선수 프로필 <span class="el_ico sm more_w"></span>
								</a> <!-- 선수 프로필 페이지로 이동 -->
							</div>
							<div class="tables">
								<div class="tbl_rank">
									<table>
										<caption>주요 부문별 선수 순위</caption>
										<colgroup>
											<col width="53%">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th>득점</th>
												<td>2위</td>
											</tr>
											<tr>
												<th>리바운드</th>
												<td>5위</td>
											</tr>
											<tr>
												<th>어시스트</th>
												<td>3위</td>
											</tr>
											<tr>
												<th>스틸</th>
												<td>2위</td>
											</tr>
											<tr>
												<th>블록</th>
												<td>7위</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="forms">
								<select class="frm_select sm" aria-label="다른 선수 선택">
									<option value="">다른 선수 선택</option>
									<option value="1">이주영</option>
									<option value="2">최준용</option>
									<option value="3">이호현</option>
								</select>
							</div>
						</article>
						<!-- //주요 부문별 선수 순위  -->

						<!-- 지난 시즌 주요 부문 기록 비교  -->
						<article class="record">
							<div class="staple_record season">
								<!-- header -->  
								<div class="header">
									<div class="row">
										<span class="col lt">23-24</span> <!-- 지난시즌 -->
										<span class="col"></span>
										<span class="col rt">24-25</span> <!-- 이번시즌 -->
									</div>
								</div> 
								<!-- //header -->
								<div class="content type1" data-scollOn="once">
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="83"></span>
											</div>
											<p class="score">83</p>
										</div>
										<div class="col ct">
											<span class="part">득점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="82"></span>
											</div>
											<p class="score">82</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="37" data-max="50"></span>
											</div>
											<p class="score">37</p>
										</div>
										<div class="col ct">
											<span class="part">리바운드</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="45" data-max="50"></span>
											</div>
											<p class="score">45</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="21" data-max="50"></span>
											</div>
											<p class="score">21</p>
										</div>
										<div class="col ct">
											<span class="part">어시스트</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="18" data-max="50"></span>
											</div>
											<p class="score">18</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="7" data-max="30"></span>
											</div>
											<p class="score">7</p>
										</div>
										<div class="col ct">
											<span class="part">스틸</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="11" data-max="30"></span>
											</div>
											<p class="score">11</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="6" data-max="30"></span>
											</div>
											<p class="score">6</p>
										</div>
										<div class="col ct">
											<span class="part">블록</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="4" data-max="30"></span>
											</div>
											<p class="score">4</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="38" data-max="50"></span>
											</div>
											<p class="score">38</p>
										</div>
										<div class="col ct">
											<span class="part">2점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="32" data-max="50"></span>
											</div>
											<p class="score">32</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="24" data-max="50"></span>
											</div>
											<p class="score">24</p>
										</div>
										<div class="col ct">
											<span class="part">3점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="21" data-max="50"></span>
											</div>
											<p class="score">21</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="24" data-max="50"></span>
											</div>
											<p class="score">24</p>
										</div>
										<div class="col ct">
											<span class="part">자유투</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="21" data-max="50"></span>
											</div>
											<p class="score">21</p>
										</div>
									</div>
									<!-- //row -->
								</div>
							</div>
						</article>
						<!-- //지난 시즌 주요 부문 기록 비교  -->

						<!-- 당해년도 주요 부문 성공율 그래프 출력  -->
						<article class="chart">
							<div class="el_cart_radar chart-radar" data-scollOn="once" data-chart="[55.5, 45.5, 35.5, 25.5]"></div> <!-- 데이터 반시계 방향 -->
						</article>
						<!-- //당해년도 주요 부문 성공율 그래프 출력  -->
						<script src="<c:url value="/resources/common/assets/js/echarts.min.js"/>" defer></script> <!-- 개발용 -->
					</div>
				</div>
			</section>
			<!-- //개인별 시즌 기록 -->

			<!-- 경기별 기록 비교 -->
			<section class="section mt30">
				<div class="ly_inner md">
					<article class="grid_header_type1">
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

						<p class="el_desc g_desc">* 경기 일자 클릭 시 해당 경기 결과 페이지로 이동합니다.</p>

						<!-- 비교 테이블 -->
						<div class="tbl type2 tblSwipe g_content">
							<div class="fixed">
								<table summary="라운드 정보 제공">
									<caption>경기별 기록 비교 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">1라운드</th>
										</tr> 
									</thead>
									<tbody>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2024.10.18</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
										<tr>
											<td>
												<a href="#" class="el_btn goto">2024.10.25</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="#" class="el_btn goto">22024.10.29</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="대진팀, 경기결과, min, 득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록, 턴오버, 파울 정보 제공" style="--pmin: 1100px; --mmin: 970px;">
										<caption>경기별 기록 비교 스크롤영역</caption>
										<colgroup>
											<col>
											<col width="9.05%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">대진팀</th>
												<th scope="col">경기결과</th>
												<th scope="col">min</th>
												<th scope="col">득점</th>
												<th scope="col">2점슛</th>
												<th scope="col">3점슛</th>
												<th scope="col">자유투</th>
												<th scope="col">리바운드</th>
												<th scope="col">어시스트</th>
												<th scope="col">스틸</th>
												<th scope="col">블록</th>
												<th scope="col">턴오버</th>
												<th scope="col">파울</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>대구 한국가스공사</td>
												<td>W 102-79</td>
												<td>25’35’’</td>
												<td>16</td>
												<td>10</td>
												<td>6</td>
												<td>2</td>
												<td>2</td>
												<td>7</td>
												<td>1</td>
												<td>0</td>
												<td>0</td>
												<td>1</td>
											</tr>
											<tr>
												<td>대구 한국가스공사</td>
												<td>W 102-79</td>
												<td>25’35’’</td>
												<td>16</td>
												<td>10</td>
												<td>6</td>
												<td>2</td>
												<td>2</td>
												<td>7</td>
												<td>1</td>
												<td>0</td>
												<td>0</td>
												<td>1</td>
											</tr>
											<tr>
												<td>대구 한국가스공사</td>
												<td>W 102-79</td>
												<td>25’35’’</td>
												<td>16</td>
												<td>10</td>
												<td>6</td>
												<td>2</td>
												<td>2</td>
												<td>7</td>
												<td>1</td>
												<td>0</td>
												<td>0</td>
												<td>1</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="no_post">검색된 결과가 없습니다.</div>
						</div>
						<!-- //비교 테이블 -->
					</article>
				</div>
			</section>
			<!-- //경기별 기록 비교 -->

			<!-- 선수별 시즌 기록(평균) -->
			<section class="section mt50">
				<div class="ly_inner md">

					<div class="page_header">
						<h4 class="el_heading lv1">선수별 시즌 기록(평균)</h4>

						<div class="btns rt">
							<button type="button" class="el_btn btn_txt openModal" data-target="#termsInfoPopup">
								<span class="el_ico info"></span> 용어정리
							</button>
						</div> 
					</div>

					<!-- 검색 -->
					<div class="search_box">
						<form action="" class="search_box_form">
							<div class="row">
								<div class="col grow">
									<select class="frm_select max240" aria-label="리그 선택">
										<option value="1">정규리그</option>
										<option value="2">플레이오프</option>
									</select>
									<select class="frm_select max240 rt" aria-label="시즌 선택">
										<option value="1">2024-2025시즌</option>
										<option value="2">2023-2024시즌</option>
										<option value="3">2022-2023시즌</option>
									</select>
									<select class="frm_select max240" aria-label="평균/누적 선택">
										<option value="1">평균</option>
										<option value="2">누적</option>
									</select>
									<button type="button" class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<!-- 타입선택 -->
					<div class="board_types">
						<a href="#" class="el_btn refresh" aria-label="새로고침"><span class="p_hide">새로고침</span></a>
					</div>
					<!-- //타입선택 -->

					<!-- 기록 테이블 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공">
								<caption>시즌별 기록 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>0</td>
										<td>유병훈</td>
									</tr>
									<tr>
										<td>1</td>
										<td>켈빈 에피스톨라</td>
									</tr>
									<tr>
										<td>2</td>
										<td>이호현</td>
									</tr>
									<tr>
										<td>3</td>
										<td>최준용</td>
									</tr>
									<tr>
										<td>4</td>
										<td>허 웅</td>
									</tr>
									<tr>
										<td>5</td>
										<td>송교창</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, AST, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1780px; --mmin: 1460px;" class="sort_group">
									<caption>시즌별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="13">AST</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="14">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="15">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="16">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="17">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="18">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort" data-pickcol="19">PF</a>
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
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>14.1</td>
											<td>18.7</td>
											<td>75.4</td>
											<td>9.8</td>
											<td>4.5</td>
											<td>2.4</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>14.1</td>
											<td>18.7</td>
											<td>75.4</td>
											<td>9.8</td>
											<td>4.5</td>
											<td>2.4</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>14.1</td>
											<td>18.7</td>
											<td>75.4</td>
											<td>9.8</td>
											<td>4.5</td>
											<td>2.4</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>14.1</td>
											<td>18.7</td>
											<td>75.4</td>
											<td>9.8</td>
											<td>4.5</td>
											<td>2.4</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>14.1</td>
											<td>18.7</td>
											<td>75.4</td>
											<td>9.8</td>
											<td>4.5</td>
											<td>2.4</td>
										</tr>
										<tr>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>88.6</td>
											<td>24.5</td>
											<td>44.7</td>
											<td>54.7</td>
											<td>8.5</td>
											<td>25.0</td>
											<td>34.1</td>
											<td>14.1</td>
											<td>18.7</td>
											<td>75.4</td>
											<td>9.8</td>
											<td>4.5</td>
											<td>2.4</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 기록 테이블 -->
				</div>
			</section>
			<!-- //선수별 시즌 기록(평균) -->

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

					console.log(roundSort);

					// select td
					selectCol($(this), roundIdx);

					// index change
					roundIdx = idx;
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