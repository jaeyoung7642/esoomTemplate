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
	<meta property="og:title" content="경기일정/결과 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>경기일정/결과 : KCC이지스 프로농구단</title>
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
						<li>경기일정/결과</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList.do" class="swiper-slide snb_link current"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank.do" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord.do" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket.do" class="swiper-slide snb_link"><span>티켓팅</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 최신 경기일정 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="game_card_list">
						<!-- slide --> 
						<div class="item bl_card p_hide">
							<div class="header">
								<p class="day">2024. 10. 24(목) 19:00</p>
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
							</div>
							<div class="content">
								<div class="team lt">
									<div class="el_logo">
										<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
									</div>
									<p class="blind">KCC 이지스</p>
								</div>
								<div class="team rt">
									<div class="el_logo">
										<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
									</div>
									<p class="blind">서울 SK</p>
								</div>
								<div class="state score">
									<a href="#" class="bl_score type1">
										<span class="num lt win">98</span> <!-- 이긴 팀에 win 추가 -->
										<span class="vs">:</span>
										<span class="num rt">79 </span>
									</a>
								</div>
							</div>
							<div class="footer btn_area">
								<a href="#" class="el_btn btn1"><span class="el_ico ico_vs"></span> 결과</a> 
								<a href="#" class="el_btn btn1"><span class="el_ico ico_video"></span> 영상</a>
								<a href="#" class="el_btn btn1"><span class="el_ico ico_photo"></span> 사진</a>
							</div>
						</div>
						<!-- //slide -->
						<!-- slide --> 
						<div class="item bl_card lg">
							<div class="header">
								<p class="day">2024. 10. 24(목) 19:00</p>
								<span class="el_ccl home"><span class="blind">홈경기</span></span>
								<p class="place">부산 사직</p>
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
							</div>
							<div class="content">
								<div class="team lt xm_hide">
									<div class="el_logo md m80">
										<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
									</div>
									<p class="blind">KCC 이지스</p>
									<p class="txt">승승승</p>
								</div>
								<div class="team rt">
									<div class="el_logo md m80">
										<img src="<c:url value='/resources/common/images/game/logo_06.svg'/>" alt="">
									</div>
									<p class="blind">서울 SK</p>
									<p class="txt xm_hide">패승패</p>
									<p class="txt xm_show">수원 KT</p>
								</div>
								<div class="state record">
									<ul class="record_list">
										<li class="present"><span class="tit">현재 시즌</span> <span>2승</span> <span>0패</span></li>
										<li><span class="tit">지난 시즌</span> <span>2승</span> <span>0패</span></li>
										<li><span class="tit">역대 전적</span> <span>74승</span> <span>46패</span></li>
									</ul>
									<a href="#" class="el_btn btn1 pmd line gap4 xm_hide"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
								</div>
							</div>
							<div class="footer btn_area xm_show">
								<a href="#" class="el_btn btn1 pmd"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink"><span class="el_ico ico_ticket"></span> 티켓예매</a>
							</div>
						</div>
						<!-- //slide -->
						<!-- slide --> 
						<div class="item bl_card p_hide">
							<div class="header">
								<p class="day">2024. 10. 24(목) 19:00</p>
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
							</div>
							<div class="content">
								<div class="team lt">
									<div class="el_logo">
										<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
									</div>
									<p class="blind">KCC 이지스</p>
								</div>
								<div class="team rt">
									<div class="el_logo">
										<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
									</div>
									<p class="blind">서울 SK</p>
								</div>
								<div class="state score">
									<span>VS</span>
								</div>
							</div>
							<div class="footer btn_area">
								<!-- <a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 siteLink "><span class="el_ico ico_ticket"></span> 티켓예매</a> -->
								<a href="#" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
							</div>
						</div>
						<!-- //slide -->
					</div>
				</div>
			</section>
			<!-- //최신 경기일정 -->
			
			<!-- 경기일정 리스트 -->
			<section class="section mt50">
				<div class="ly_inner md">

					<!-- 검색 -->
					<div class="search_box">
						<form action="" class="search_box_form">
							<div class="row">
								<div class="col shrink w492">
									<select class="frm_select" aria-label="리그 선택">
										<option value="1">정규리그</option>
										<option value="2">플레이오프</option>
									</select>
									<select class="frm_select rt" aria-label="시즌 선택">
										<option value="1">2024-2025시즌</option>
										<option value="2">2023-2024시즌</option>
										<option value="3">2022-2023시즌</option>
									</select>
								</div>

								<div class="col shrink check_group w472">
									<div class="group">
										<label class="frm_radio type1">
											<input type="radio" name="g_search" class="group_check" checked>
										</label>
										<select class="frm_select group_input" aria-label="월 선택">
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10" selected>10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</div>
									<div class="group">
										<label class="frm_radio type1">
											<input type="radio" name="g_search" class="group_check">
										</label>
										<select class="frm_select group_input rt pw200" aria-label="라운드 선택">
											<option value="1">1라운드</option>
											<option value="2">2라운드</option>
											<option value="3">3라운드</option>
										</select>
									</div>
								</div>

								<div class="col grow">
									<select class="frm_select" aria-label="홈/어웨이 선택">
										<option value="">전체</option>
										<option value="1">홈 경기</option>
										<option value="2">어웨이 경기</option>
									</select>
									<button type="button" class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<!-- 타입선택 -->
					<div class="board_types p_hide">
						<a href="./11100_g_schedule.html" class="el_btn type list on"><span class="blind">리스트형</span></a>
						<a href="./11100_g_schedule_2.html" class="el_btn type calendar"><span class="blind">달력형</span></a>
					</div>
					<!-- //타입선택 -->

					<!-- 게임 스케줄 (목록형) -->
					<article class="game_schedule">
						<!-- header --> 
						<div class="header">
							<div class="col date">
								<p class="txt">
									<span class="year">2024.</span>
									<span class="month">10</span>
								</p>
							</div>
							<div class="col plyers">
								<span class="el_ico lg ccl ico_birthday"></span>
								<p class="tit">이달의 생일 선수</p>
								<p class="name">
									<a href="#" class="txt_link">최준용</a> 
									<span class="dash">/</span>
									<a href="#" class="txt_link">허웅</a>
								</p>
							</div>
						</div>
						<!-- //header -->
						<div class="content game_schedule_list">
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl away"><span class="blind">원정경기</span></span>
									</div>
									<p class="time">
										<span>화요일</span>
										<span>19:00</span>
										<span>잠실학생</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner logo_lt">
										<div class="team lt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
											</div>
											<p class="name">서울 SK</p>
										</div>
										<div class="state score">
											<a href="#" class="bl_score type2">
												<span class="num lt win">98</span> <!-- 이긴 팀에 win 추가 -->
												<span class="el_ccl win"><span class="blind">패</span></span>
												<span class="num rt">79</span>
											</a>
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="#" class="el_btn btn1"><span class="el_ico ico_vs"></span> 결과</a> 
										<a href="#" class="el_btn btn1"><span class="el_ico ico_video"></span> 영상</a>
										<a href="#" class="el_btn btn1"><span class="el_ico ico_photo"></span> 사진</a>
									</div>
								</div>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl away"><span class="blind">원정경기</span></span>
									</div>
									<p class="time">
										<span>화요일</span>
										<span>19:00</span>
										<span>잠실학생</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt">
											<div class="el_logo">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
											</div>
											<p class="name">서울 SK</p>
										</div>
										<div class="state score">
											<a href="#" class="bl_score type2">
												<span class="num lt win">98</span> <!-- 이긴 팀에 win 추가 -->
												<span class="el_ccl win"><span class="blind">패</span></span>
												<span class="num rt">79</span>
											</a>
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="#" class="el_btn btn1"><span class="el_ico ico_vs"></span> 결과</a> 
										<a href="#" class="el_btn btn1"><span class="el_ico ico_video"></span> 영상</a>
										<a href="#" class="el_btn btn1"><span class="el_ico ico_photo"></span> 사진</a>
									</div>
								</div>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl home"><span class="blind">홈경기</span></span>
									</div>
									<p class="time">
										<span>일요일</span>
										<span>14:00</span>
										<span>부산사직</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt">
											<div class="el_logo">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
											</div>
											<p class="name">서울 SK</p>
										</div>
										<div class="state broad">
											SPOTV<br>
											SPOTV PRIME
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
										<a href="#" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
									</div>
								</div>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl away"><span class="blind">원정경기</span></span>
									</div>
									<p class="time">
										<span>목요일</span>
										<span>19:00</span>
										<span>수원KT아레나</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_64.svg'/>" alt="">
											</div>
											<p class="name">대구 한국가스공사</p>
										</div>
										<div class="state broad">
											중계방송<br> 
											미정
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="#" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
									</div>
								</div>
							</div>
							<!-- //row -->
						</div>
					</article>
					<!-- //게임 스케줄 (목록형) -->

					<!-- 게임 스케줄 (목록형) -->
					<article class="game_schedule">
						<!-- header --> 
						<div class="header type1">
							<div class="col date">
								<p class="txt">
									<span class="year">2024.</span>
									<span class="month">11</span>
								</p>
							</div>
							<div class="col plyers">
								<span class="el_ico lg ccl ico_birthday"></span>
								<p class="tit">이달의 생일 선수</p>
								<p class="name">
									<a href="#" class="txt_link">알리제 존슨</a> 
									<span class="dash">/</span>
									<a href="#" class="txt_link">허웅</a> 
								</p>
							</div>
						</div>
						<!-- //header -->
						<div class="content game_schedule_list">
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl away"><span class="blind">원정경기</span></span>
									</div>
									<p class="time">
										<span>화요일</span>
										<span>19:00</span>
										<span>잠실학생</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
											</div>
											<p class="name">서울 SK</p>
										</div>
										<div class="state score">
											<a href="#" class="bl_score type2">
												<span class="num lt">79</span>
												<span class="el_ccl lose"><span class="blind">패</span></span>
												<span class="num rt win">98</span> <!-- 이긴 팀에 win 추가 -->
											</a>
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="#" class="el_btn btn1"><span class="el_ico ico_vs"></span> 결과</a> 
										<a href="#" class="el_btn btn1"><span class="el_ico ico_video"></span> 영상</a>
										<a href="#" class="el_btn btn1"><span class="el_ico ico_photo"></span> 사진</a>
									</div>
								</div>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl home"><span class="blind">홈경기</span></span>
									</div>
									<p class="time">
										<span>일요일</span>
										<span>14:00</span>
										<span>부산사직</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_55.svg'/>" alt="">
											</div>
											<p class="name">서울 SK</p>
										</div>
										<div class="state broad">
											SPOTV<br>
											SPOTV PRIME
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
										<a href="#" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
									</div>
								</div>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>2024. 10. 24</p>
										<span class="el_ccl away"><span class="blind">원정경기</span></span>
									</div>
									<p class="time">
										<span>목요일</span>
										<span>19:00</span>
										<span>수원KT아레나</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_60.svg'/>" alt="">
											</div>
											<p class="name">부산 KCC</p>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<img src="<c:url value='/resources/common/images/game/logo_64.svg'/>" alt="">
											</div>
											<p class="name">대구 한국가스공사</p>
										</div>
										<div class="state broad">
											중계방송<br> 
											미정
										</div>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
										<a href="#" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
									</div>
								</div>
							</div>
							<!-- //row -->
							<!-- row  -->
							<div class="row">
								<!-- (게시물 없을 경우) -->
								<div class="col no_post">검색된 결과가 없습니다.</div>
							</div>
							<!-- //row -->
						</div>
					</article>
					<!-- //게임 스케줄 (목록형) -->

					<!-- pagination -->
					<div class="pagination g_page xm_hide">
						<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
						<a href="#" class="page_link current">1</a>
						<a href="#" class="page_link">2</a>
						<a href="#" class="page_link">3</a>
						<a href="#" class="page_link">4</a>
						<a href="#" class="page_link">5</a>
						<a href="#" class="page_link">6</a>
						<a href="#" class="page_link">7</a>
						<a href="#" class="page_link">8</a>
						<a href="#" class="page_link">9</a>
						<a href="#" class="page_link">10</a>
						<a href="#" class="page_link ico next"><span class="blind">다음</span></a>
						<a href="#" class="page_link ico last"><span class="blind">마지막</span></a>
					</div>
					<!-- // pagination -->

					<!-- pagination -->
					<div class="pagination g_page xm_show">
						<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
						<a href="#" class="page_link current">1</a>
						<a href="#" class="page_link">2</a>
						<a href="#" class="page_link">3</a>
						<a href="#" class="page_link">4</a>
						<a href="#" class="page_link">5</a>
						<a href="#" class="page_link ico next"><span class="blind">다음</span></a>
						<a href="#" class="page_link ico last"><span class="blind">마지막</span></a>
					</div>
					<!-- // pagination -->

				</div>
			</section>
			<!-- //경기일정 리스트 -->

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