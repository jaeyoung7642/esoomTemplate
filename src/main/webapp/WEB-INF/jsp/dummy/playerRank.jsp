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
	<meta property="og:title" content="팀/선수 순위 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>팀/선수 순위 : KCC이지스 프로농구단</title>
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
						<li>팀/선수 순위</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>
				
				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList.do" class="swiper-slide snb_link"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank.do" class="swiper-slide snb_link current"><span>팀/선수 순위</span></a>
								<a href="teamRecord.do" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
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
						<a href="teamRank.do" class="swiper-slide snb_link"><span>팀 순위</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRank.do" class="swiper-slide snb_link current"><span>선수 순위</span></a>
					</div>
				</nav>
			</div>

			<!-- 부분별 선수 순위 -->
			<section class="section overflow_hidden">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">24-25 SEASON</h4>
					</div> 
					
					<div class="p_ranking_content">
						
						<div class="swiper-wrapper p_ranking_list">
							<!-- POINT -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">POINT</h5>
								<div class="accordion">
									<div class="accordion_item">
										<button type="button" class="accordion_btn on">
											<p class="rank">1</p>
											<p class="player">
												<span class="num">3</span>
												<span class="pos">GUARD</span>
												<span class="name">허웅</span>
											</p> 
											<p class="score">13.9</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge gold " data-raink="1"></span><br>
													<p class="sm"><span>3</span> <span>GUARD</span></p>
													<p>허웅</p>
												</div>
												<div class="box_btm">
													<p class="score">13.9</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>3</span> <span>GUARD</span></p>
														<p>허웅</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									<div class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">2</p>
											<p class="player">
												<span class="num">3</span>
												<span class="pos">GUARD</span>
												<span class="name">허웅</span>
											</p> 
											<p class="score">12.5</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge silver " data-raink="2"></span><br>
													<p class="sm"><span>3</span> <span>GUARD</span></p>
													<p>허웅</p>
												</div>
												<div class="box_btm">
													<p class="score">12.5</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>3</span> <span>GUARD</span></p>
														<p>허웅</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									<div class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">3</p>
											<p class="player">
												<span class="num">3</span>
												<span class="pos">GUARD</span>
												<span class="name">허웅</span>
											</p> 
											<p class="score">11.3</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge bronze " data-raink="3"></span><br>
													<p class="sm"><span>3</span> <span>GUARD</span></p>
													<p>허웅</p>
												</div>
												<div class="box_btm">
													<p class="score">11.3</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>3</span> <span>GUARD</span></p>
														<p>허웅</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
								</div>
							</div>
							<!-- //POINT -->
							<!-- REBOUND -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">REBOUND</h5>
								<div class="accordion">
									<d class="accordion_item">
										<button type="button" class="accordion_btn on">
											<p class="rank">1</p>
											<p class="player">
												<span class="num">2</span>
												<span class="pos">FORWARD</span>
												<span class="name">최준용</span>
											</p> 
											<p class="score">6.7</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_02.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge gold " data-raink="1"></span><br>
													<p class="sm"><span>2</span> <span>FORWARD</span></p>
													<p>최준용</p>
												</div>
												<div class="box_btm">
													<p class="score">6.7</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>2</span> <span>FORWARD</span></p>
														<p>최준용</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">2</p>
											<p class="player">
												<span class="num">2</span>
												<span class="pos">FORWARD</span>
												<span class="name">최준용</span>
											</p> 
											<p class="score">6.0</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_02.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge silver " data-raink="2"></span><br>
													<p class="sm"><span>2</span> <span>FORWARD</span></p>
													<p>최준용</p>
												</div>
												<div class="box_btm">
													<p class="score">6.0</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>2</span> <span>FORWARD</span></p>
														<p>최준용</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">3</p>
											<p class="player">
												<span class="num">2</span>
												<span class="pos">FORWARD</span>
												<span class="name">최준용</span>
											</p> 
											<p class="score">5.5</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_02.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge bronze " data-raink="3"></span><br>
													<p class="sm"><span>2</span> <span>FORWARD</span></p>
													<p>최준용</p>
												</div>
												<div class="box_btm">
													<p class="score">5.5</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>2</span> <span>FORWARD</span></p>
														<p>최준용</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
								</div>
							</div>
							<!-- //REBOUND -->
							<!-- ASSIST -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">ASSIST</h5>
								<div class="accordion">
									<d class="accordion_item">
										<button type="button" class="accordion_btn on">
											<p class="rank">1</p>
											<p class="player">
												<span class="num">24</span>
												<span class="pos">FORWARD</span>
												<span class="name">알리제 존슨</span>
											</p> 
											<p class="score">11.1</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_03.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge gold " data-raink="1"></span><br>
													<p class="sm"><span>24</span> <span>FORWARD</span></p>
													<p>알리제 존슨</p>
												</div>
												<div class="box_btm">
													<p class="score">11.1</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>24</span> <span>FORWARD</span></p>
														<p>알리제 존슨</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">2</p>
											<p class="player">
												<span class="num">24</span>
												<span class="pos">FORWARD</span>
												<span class="name">알리제 존슨</span>
											</p> 
											<p class="score">10.4 </p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_03.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge silver " data-raink="2"></span><br>
													<p class="sm"><span>24</span> <span>FORWARD</span></p>
													<p>알리제 존슨</p>
												</div>
												<div class="box_btm">
													<p class="score">10.4 </p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>24</span> <span>FORWARD</span></p>
														<p>알리제 존슨</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">3</p>
											<p class="player">
												<span class="num">24</span>
												<span class="pos">FORWARD</span>
												<span class="name">알리제 존슨</span>
											</p> 
											<p class="score">9.9</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_03.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge bronze " data-raink="3"></span><br>
													<p class="sm"><span>24</span> <span>FORWARD</span></p>
													<p>알리제 존슨</p>
												</div>
												<div class="box_btm">
													<p class="score">9.9</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>24</span> <span>FORWARD</span></p>
														<p>알리제 존슨</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
								</div>
							</div>
							<!-- //ASSIST -->
							<!-- STEAL -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">STEAL</h5>
								<div class="accordion">
									<d class="accordion_item">
										<button type="button" class="accordion_btn on">
											<p class="rank">1</p>
											<p class="player">
												<span class="num">3</span>
												<span class="pos">GUARD</span>
												<span class="name">허웅</span>
											</p> 
											<p class="score">13.9</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge gold " data-raink="1"></span><br>
													<p class="sm"><span>3</span> <span>GUARD</span></p>
													<p>허웅</p>
												</div>
												<div class="box_btm">
													<p class="score">13.9</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>3</span> <span>GUARD</span></p>
														<p>허웅</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">2</p>
											<p class="player">
												<span class="num">3</span>
												<span class="pos">GUARD</span>
												<span class="name">허웅</span>
											</p> 
											<p class="score">12.5</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge silver " data-raink="2"></span><br>
													<p class="sm"><span>3</span> <span>GUARD</span></p>
													<p>허웅</p>
												</div>
												<div class="box_btm">
													<p class="score">12.5</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>3</span> <span>GUARD</span></p>
														<p>허웅</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">3</p>
											<p class="player">
												<span class="num">3</span>
												<span class="pos">GUARD</span>
												<span class="name">허웅</span>
											</p> 
											<p class="score">11.3</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_01.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge bronze " data-raink="3"></span><br>
													<p class="sm"><span>3</span> <span>GUARD</span></p>
													<p>허웅</p>
												</div>
												<div class="box_btm">
													<p class="score">11.3</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>3</span> <span>GUARD</span></p>
														<p>허웅</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
								</div>
							</div>
							<!-- //STEAL -->
							<!-- BLOCK -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">BLOCK</h5>
								<div class="accordion">
									<d class="accordion_item">
										<button type="button" class="accordion_btn on">
											<p class="rank">1</p>
											<p class="player">
												<span class="num">2</span>
												<span class="pos">FORWARD</span>
												<span class="name">최준용</span>
											</p> 
											<p class="score">6.7</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_02.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge gold " data-raink="1"></span><br>
													<p class="sm"><span>2</span> <span>FORWARD</span></p>
													<p>최준용</p>
												</div>
												<div class="box_btm">
													<p class="score">6.7</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>2</span> <span>FORWARD</span></p>
														<p>최준용</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">2</p>
											<p class="player">
												<span class="num">2</span>
												<span class="pos">FORWARD</span>
												<span class="name">최준용</span>
											</p> 
											<p class="score">6.0</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_02.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge silver " data-raink="2"></span><br>
													<p class="sm"><span>2</span> <span>FORWARD</span></p>
													<p>최준용</p>
												</div>
												<div class="box_btm">
													<p class="score">6.0</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>2</span> <span>FORWARD</span></p>
														<p>최준용</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
									<d class="accordion_item">
										<button type="button" class="accordion_btn">
											<p class="rank">3</p>
											<p class="player">
												<span class="num">2</span>
												<span class="pos">FORWARD</span>
												<span class="name">최준용</span>
											</p> 
											<p class="score">5.5</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2">
											<a href="#" class="box">
												<img src="<c:url value='/resources/common/images/dummy/player_02.png'/>" alt="최준용 선수 사진" class="photo">
												<div class="box_top">
													<span class="el_badge bronze " data-raink="3"></span><br>
													<p class="sm"><span>2</span> <span>FORWARD</span></p>
													<p>최준용</p>
												</div>
												<div class="box_btm">
													<p class="score">5.5</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>2</span> <span>FORWARD</span></p>
														<p>최준용</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="#" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="#" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>5위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>2위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>7위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</d>
								</div>
							</div>
							<!-- //BLOCK -->
							
						</div>
						
					</div>
				</div>
			</section>
			<!-- //부분별 선수 순위 -->


			<!-- 자세한 부분별 선수 순위  -->
			<section class="section mt50">
				<div class="ly_inner md">
					<h4 class="blind">부분별 선수 순위</h4>

					<!-- 검색 -->
					<div class="search_box">
						<form action="" class="search_box_form">
							<div class="row">
								<div class="col grow">
									<select class="frm_select max240" aria-label="리그 선택">
										<option value="1">정규리그</option>
										<option value="2">플레이오프</option>
									</select>
									<select class="frm_select max240" aria-label="시즌 선택">
										<option value="1">2024-2025시즌</option>
										<option value="2">2023-2024시즌</option>
										<option value="3">2022-2023시즌</option>
									</select>
									<select class="frm_select max240" aria-label="부분 선택">
										<option value="1">득점</option>
										<option value="2">리바운드</option>
										<option value="3">어시스트</option>
										<option value="4">스틸</option>
										<option value="5">블록</option>
									</select>
									<button type="button" class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<div class="page_header">
						<h4 class="el_heading lv1">득점</h4>
					</div>

					<!-- 득점 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(16.771vw * 1.3, 322px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>이주영</td>
									</tr>
									<tr>
										<td>2</td>
										<td>이주영</td>
									</tr>
									<tr>
										<td>3</td>
										<td>이주영</td>
									</tr>
									<tr>
										<td>4</td>
										<td>이주영</td>
									</tr>
									<tr>
										<td>5</td>
										<td>이주영</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 2점합계, 3점합계, 자유투합계, 득점합계, 득점평균, 정보 제공">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col>
										<col width="17.43%">
										<col width="17.43%">
										<col width="17.72%">
										<col width="17.43%">
										<col width="17.43%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">2점합계</th>
											<th scope="col">3점합계</th>
											<th scope="col">자유투합계</th>
											<th scope="col">득점합계</th>
											<th scope="col">득점평균</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>52</td>
											<td>266</td>
											<td>408</td>
											<td>151</td>
											<td>825</td>
											<td>15.9</td>
										</tr>
										<tr>
											<td>52</td>
											<td>266</td> 
											<td>408</td>
											<td>151</td>
											<td>825</td>
											<td>15.9</td>
										</tr>
										<tr>
											<td>52</td>
											<td>266</td>
											<td>408</td>
											<td>151</td>
											<td>825</td>
											<td>15.9</td>
										</tr>
										<tr>
											<td>52</td>
											<td>266</td>
											<td>408</td>
											<td>151</td>
											<td>825</td>
											<td>15.9</td>
										</tr>
										<tr>
											<td>52</td>
											<td>266</td>
											<td>408</td>
											<td>151</td>
											<td>825</td>
											<td>15.9</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //득점 -->

					<!-- 리바운드 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(16.771vw * 1.3, 322px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>이주영</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 수비 리바운드, 공격 리바운드, 리바운드 합계, 리바운드평균, 정보 제공">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col>
										<col width="21.614%">
										<col width="21.614%">
										<col width="21.614%">
										<col width="21.614%">
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">수비 리바운드</th>
											<th scope="col">공격 리바운드</th>
											<th scope="col">리바운드 합계</th>
											<th scope="col">리바운드평균</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>52</td>
											<td>266</td>
											<td>408</td>
											<td>151</td>
											<td>15.9</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //리바운드 -->
					<!-- 어시스트 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(26.979vw * 1.3, 518px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>이주영</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 어시스트 합계, 어시스트 평균, 정보 제공" style="--mwth: 100%; --mmin: 255px;">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col width="33.3333%">
										<col width="33.3333%">
										<col>
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">어시스트 합계</th>
											<th scope="col">어시스트 평균</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>15</td>
											<td>145</td>
											<td>4.1</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //어시스트 -->
					<!-- 스틸 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(26.979vw * 1.3, 518px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>이주영</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 스틸 합계, 스틸 평균, 정보 제공" style="--mwth: 100%; --mmin: 255px;">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col width="33.3333%">
										<col width="33.3333%">
										<col>
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">스틸 합계</th>
											<th scope="col">스틸 평균</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>15</td>
											<td>145</td>
											<td>4.1</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //스틸 -->
					<!-- 블록 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(26.979vw * 1.3, 518px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>이주영</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 블록 합계, 블록 평균, 정보 제공" style="--mwth: 100%; --mmin: 255px;">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col width="33.3333%">
										<col width="33.3333%">
										<col>
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">블록 합계</th>
											<th scope="col">블록 평균</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>15</td>
											<td>145</td>
											<td>4.1</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //블록 -->


				</div>
			</section>
			<!-- //자세한 부분별 선수 순위  -->
	
			
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