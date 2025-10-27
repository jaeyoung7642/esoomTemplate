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
						<a href="teamRank.do" class="swiper-slide snb_link current"><span>팀 순위</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRank.do" class="swiper-slide snb_link"><span>선수 순위</span></a>
					</div>
				</nav>
			</div>

			<!-- 팀 순위 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header m_col">
						<h4 class="el_heading lv1">팀 순위</h4>
						<form action="" class="forms">
							<div class="frm_group">
								<select class="frm_select max240 m155" aria-label="시즌 선택">
									<option value="1">2024-2025시즌</option>
									<option value="2">2023-2024시즌</option>
									<option value="3">2022-2023시즌</option>
								</select>
								<select class="frm_select group_input rt max240 m155" aria-label="라운드 선택">
									<option value="">전체</option>
									<option value="1">1라운드</option>
									<option value="2">2라운드</option>
									<option value="3">3라운드</option>
								</select>
							</div>
						</form>
					</div>
			
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="순위, 팀명 정보 제공">
								<caption>팀 순 안내 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="team">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">순위</th>
										<th scope="col">팀명</th>
									</tr>
								</thead>
								<tbody>
									<tr class="point">
										<td>1</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
												</div>
												<span>부산 KCC</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_16.svg'/>" alt="">
												</div>
												<span>원주 DB</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_50.svg'/>" alt="">
												</div>
												<span>창원 LG</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_06.svg'/>" alt="">
												</div>
												<span>수원 KT</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
												</div>
												<span>서울 SK</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>6</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_10.svg'/>" alt="">
												</div>
												<span>울산 현대모비스</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>7</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_64.svg'/>" alt="">
												</div>
												<span>대구 한국가스공사</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>8</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_66.svg'/>" alt="">
												</div>
												<span>고양 소노</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>9</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_70.svg'/>" alt="">
												</div>
												<span>안양 정관장</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>10 </td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="<c:url value='/resources/common/images/game/logo_35.svg'/>" alt="">
												</div>
												<span>서울 삼성</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="승, 패, 승률, 승차, 연승, 연패, 최다연승, 최다연패, 정보 제공" style="--mmin: 500px;">
									<caption>팀 순 안내 스크롤영역</caption>
									<colgroup>
										<col width="11.22%">
										<col width="11.22%">
										<col>
										<col width="11.22%">
										<col width="11.22%">
										<col width="11.22%">
										<col width="14.58%">
										<col width="14.58%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">승</th>
											<th scope="col">패</th>
											<th scope="col">승률</th>
											<th scope="col">승차</th>
											<th scope="col">연승</th>
											<th scope="col">연패</th>
											<th scope="col">최다연승</th>
											<th scope="col">최다연패</th>
										</tr>
									</thead>
									<tbody>
										<tr class="point">
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>00</td>
											<td>00</td>
											<td>0.000</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //팀 순위 -->

			<!-- 부문별 팀 순위 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">부문별 팀 순위</h4>
						<form action="" class="forms">
							<div class="frm_group">
								<select class="frm_select max240 m155" aria-label="시즌 선택">
									<option value="1">2024-2025시즌</option>
									<option value="2">2023-2024시즌</option>
									<option value="3">2022-2023시즌</option>
								</select>
							</div>
						</form>
					</div>

					<article class="bl_card t_ranking_content bg_logo">
						<div class="col logo_area">
							<div class="el_logo md m80">
								<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
							</div>
							<div class="season">
								<p class="year">2023-2024</p>
								<p class="txt">SEASON</p>
							</div>
						</div>
						<div class="col rank_area">
							<ul class="bl_card_list col5">
								<li class="item">
									<div class="box box1">
										<p class="tit">득점</p>
										<p class="score">100</p>
									</div>
									<span class="el_badge gold" data-raink="1"></span>
								</li>
								<li class="item">
									<div class="box box2">
										<p class="tit">리바운드</p>
										<p class="score">100</p>
									</div>
									<span class="el_badge silver" data-raink="2"></span>
								</li>
								<li class="item">
									<div class="box box3">
										<p class="tit">어시스트</p>
										<p class="score">40</p>
									</div>
									<span class="el_badge bronze" data-raink="3"></span>
								</li>
								<li class="item">
									<div class="box box4">
										<p class="tit">스틸</p>
										<p class="score">20</p>
									</div>
									<span class="el_badge bronze" data-raink="5"></span>
								</li>
								<li class="item">
									<div class="box box5">
										<p class="tit">블록</p>
										<p class="score">20</p>
									</div>
									<span class="el_badge bronze" data-raink="10"></span>
								</li>
							</ul>
						</div>
					</article>
				</div>
			</section>
			<!-- //부문별 팀 순위 -->

			<script>
				$(function() {
					const $tables = $('.tbl');
					
					$tables.each((_, table) => {
						const $point = $tables.find('tr.point');
						let top = 0;

						if ($point.length === 0) return;

						$(table).append('<span class="point_line"></span>')
						
						function addPoint() {
							const offsetTop = $point.offset().top - $(table).offset().top;
							
							if (top === offsetTop) return;
							top = offsetTop;

							$('.point_line').css('top', top);
						}

						$(window).on('resize', () => {
							if ($point.length === 0) return;

							addPoint();
						}).trigger('resize');
					});

					
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