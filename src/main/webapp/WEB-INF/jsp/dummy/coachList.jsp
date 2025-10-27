<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<meta property="og:title" content="코칭스탭 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>코칭스탭 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="<c:url value="/resources/common/assets/font/font.css"/>" />
	<link rel="shortcut icon" href="<c:url value="/resources/common/images/common/favicon_kccegis.png"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/swiper-bundle.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/common.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/sub.css"/>"> <!-- sub only -->
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/player.css"/>"> <!-- 디렉토리 player only -->
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
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
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
		<main id="container" class="ly_container player">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>PLAYER</li>
						<li>코칭스탭</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">PLAYER</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="coachList.do" class="swiper-slide snb_link current"><span>코칭스탭</span></a>  <!-- 해당페이지에 current 추가 -->
								<a href="playerList.do" class="swiper-slide snb_link"><span>선수</span></a>
								<a href="cheer.do" class="swiper-slide snb_link"><span>응원단</span></a>
								<!-- <a href="#" class="swiper-slide snb_link" onclick="alertPop('시즌 업데이트 준비중입니다.')"><span>응원단</span></a> -->
								<a href="cheer_song.do" class="swiper-slide snb_link"><span>응원가</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 코칭스탭 -->
			<section class="section">
				<div class="ly_inner md">

					<div class="page_header mb40">
						<h4 class="el_heading lv1">코칭스탭</h4>
					</div>

					<div class="coach_list">
						<!-- coach item-->
						<article class="coach_item head_coach">
							<div class="photo">
								<div class="inner">
									<img src="<c:url value='/resources/common/images/dummy/coach_01.png'/>" alt="전창진 감독 사진">
								</div>
							</div>
							<!-- info -->
							<div class="info">
								<div class="info_header">
									<h5 class="el_role">HEAD COACH</h5>
									<p class="el_name">
										<span class="kor">전창진</span>
										<span class="eng">CHUN CHANG JIN</span>
									</p>
								</div>
								<!-- profile -->
								<div class="profile_box">
									<dl>
										<dt>생년월일</dt>
										<dd>1963.05.20</dd>
									</dl>
									<dl>
										<dt>신장/체중</dt>
										<dd>185cm <span class="dash">/</span> 90kg</dd>
									</dl>
									<dl>
										<dt>출신학교</dt>
										<dd>고려대</dd>
									</dl>
								</div>
								<!-- //profile -->
								<!-- career -->
								<div class="career_box">
									<div class="col">
										<h6 class="tit">주요 경력</h6>
										<ul class="list" data-lenis-prevent>
											<li>
												<span class="year">1998</span>
												<span class="txt">삼성 썬더스 코치</span>
											</li>
											<li>
												<span class="year">1999</span>
												<span class="txt">TG 삼보 엑써스 코치</span>
											</li>
											<li>
												<span class="year">2002</span>
												<span class="txt">TG 삼보 엑써스 감독 대행</span>
											</li>
											<li>
												<span class="year">2003</span>
												<span class="txt">TG 삼보 엑써스 감독</span>
											</li>
											<li>
												<span class="year">2005</span>
												<span class="txt">동부 프로미 감독</span>
											</li>
											<li>
												<span class="year">2009</span>
												<span class="txt">KT 소닉붐 감독 </span>
											</li>
											<li>
												<span class="year">2015</span>
												<span class="txt">KGC 인삼공사 감독</span>
											</li>
											<li>
												<span class="year">2019</span>
												<span class="txt">KCC 이지스 감독</span>
											</li>
										</ul>
									</div>
									<div class="col">
										<h6 class="tit">수상 경력</h6>
										<ul class="list" data-lenis-prevent>
											<li>
												<span class="year">1986</span>
												<span class="txt">코리안리그 신인상</span>
											</li>
											<li>
												<span class="year">2004</span>
												<span class="txt">프로농구 감독상</span>
											</li>
											<li>
												<span class="year">2005</span>
												<span class="txt">프로농구 감독상</span>
											</li>
											<li>
												<span class="year">2008</span>
												<span class="txt">프로농구 정규리그 감독상</span>
											</li>
											<li>
												<span class="year">2008</span>
												<span class="txt">스포츠 토토 한국농구대상 감독상</span>
											</li>
											<li>
												<span class="year">2010</span>
												<span class="txt">프로농구 감독상</span>
											</li>
											<li>
												<span class="year">2021</span>
												<span class="txt">프로농구 감독상</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- //career -->
							</div>
							<!-- //info -->
						</article>
						<article class="coach_item coach">
							<div class="photo">
								<img src="<c:url value='/resources/common/images/dummy/coach_02.png'/>" alt="강양택 코치 사진">
							</div>
							<!-- info -->
							<div class="info">
								<div class="info_header">
									<p class="el_role">COACH</p>
									<p class="el_name">
										<span class="kor">강양택</span>
										<span class="eng">KANG YANG TAEK</span>
									</p>
								</div>
								<!-- profile -->
								<div class="profile_box">
									<dl>
										<dt>생년월일</dt>
										<dd>1968.03.05</dd>
									</dl>
									<dl>
										<dt>신장/체중</dt>
										<dd>190cm <span class="dash">/</span> 92kg</dd>
									</dl>
									<dl>
										<dt>출신학교</dt>
										<dd>연세대</dd>
									</dl>
								</div>
								<!-- //profile -->
								<!-- career -->
								<div class="career_box">
									<div class="col">
										<h6 class="tit">주요 경력</h6>
										<ul class="list" data-lenis-prevent>
											<li>
												<span class="year">2002</span>
												<span class="txt">명지대학교 코치</span>
											</li>
											<li>
												<span class="year">2003</span>
												<span class="txt">SK 나이츠 코치</span>
											</li>
											<li>
												<span class="year">2005</span>
												<span class="txt">2010 남자 농구대표팀 코치</span>
											</li>
											<li>
												<span class="year">2011</span>
												<span class="txt">LG 세이커스 코치</span>
											</li>
											<li>
												<span class="year">2019</span>
												<span class="txt">KCC 이지스 코치</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- //career -->
							</div>
							<!-- //info -->
						</article>
						<!-- //coach item-->
						<!-- coach item-->
						<article class="coach_item coach">
							<div class="photo">
								<img src="<c:url value='/resources/common/images/dummy/coach_03.png'/>" alt="이상민 코치 사진">
							</div>
							<!-- info -->
							<div class="info">
								<div class="info_header">
									<p class="el_role">COACH</p>
									<p class="el_name">
										<span class="kor">이상민</span>
										<span class="eng">LEE SANG MIN</span>
									</p>
								</div>
								<!-- profile -->
								<div class="profile_box">
									<dl>
										<dt>생년월일</dt>
										<dd>1972.11.11</dd>
									</dl>
									<dl>
										<dt>신장/체중</dt>
										<dd>182cm <span class="dash">/</span> 74kg</dd>
									</dl>
									<dl>
										<dt>출신학교</dt>
										<dd>연세대</dd>
									</dl>
								</div>
								<!-- //profile -->
								<!-- career -->
								<div class="career_box">
									<div class="col">
										<h6 class="tit">주요 경력</h6>
										<ul class="list" data-lenis-prevent>
											<li>
												<span class="year">2012~2014</span>
												<span class="txt">삼성 썬더스 코치</span>
											</li>
											<li>
												<span class="year">2014~2022</span>
												<span class="txt">삼성 썬더스 감독</span>
											</li>
											<li>
												<span class="year">2023</span>
												<span class="txt">KCC 이지스 코치</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- //career -->
							</div>
							<!-- //info -->
						</article>
						<!-- //coach item-->
						<!-- coach item-->
						<article class="coach_item coach">
							<div class="photo">
								<img src="<c:url value='/resources/common/images/dummy/coach_04.png'/>" alt="신명호 코치 사진">
							</div>
							<!-- info -->
							<div class="info">
								<div class="info_header">
									<p class="el_role">COACH</p>
									<p class="el_name">
										<span class="kor">신명호</span>
										<span class="eng">SHIN MYONG HO</span>
									</p>
								</div>
								<!-- profile -->
								<div class="profile_box">
									<dl>
										<dt>생년월일</dt>
										<dd>1983.10.08</dd>
									</dl>
									<dl>
										<dt>신장/체중</dt>
										<dd>184cm <span class="dash">/</span> 81kg</dd>
									</dl>
									<dl>
										<dt>출신학교</dt>
										<dd>경희대</dd>
									</dl>
								</div>
								<!-- //profile -->
								<!-- career -->
								<div class="career_box">
									<div class="col">
										<h6 class="tit">주요 경력</h6>
										<ul class="list" data-lenis-prevent>
											<li>
												<span class="year">2007~2020</span>
												<span class="txt">KCC 이지스 선수</span>
											</li>
											<li>
												<span class="year">2020~</span>
												<span class="txt">KCC 이지스 코치</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- //career -->
							</div>
							<!-- //info -->
						</article>
						<!-- //coach item-->
					</div>
				</div>
			</section>
			<!-- //코칭스탭 -->

			<!-- 지원스탭 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header mb40">
						<h4 class="el_heading lv1">지원스탭</h4>
					</div>

					<ul class="bl_grid_list staff_list cols4">
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_01.png'/>" alt="김경석 전력분석 사진">
								</div>
								<div class="info">
									<p class="el_role type2">전력분석</p>
									<p class="el_name">
										<span class="kor">김경석</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_02.png'/>" alt="박경상 전력분석 사진">
								</div>
								<div class="info">
									<p class="el_role type2">전력분석</p>
									<p class="el_name">
										<span class="kor">박경상</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_03.png'/>" alt="">
								</div>
								<div class="info">
									<p class="el_role type2">매니저</p>
									<p class="el_name">
										<span class="kor">신상언</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_04.png'/>" alt="김남균 통역 사진">
								</div>
								<div class="info">
									<p class="el_role type2">통역</p>
									<p class="el_name">
										<span class="kor">김남균</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_01.png'/>" alt="">
								</div>
								<div class="info">
									<p class="el_role type2">트레이너</p>
									<p class="el_name">
										<span class="kor">이정래</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_05.png'/>" alt="장지영 트레이너 사진">
								</div>
								<div class="info">
									<p class="el_role type2">트레이너</p>
									<p class="el_name">
										<span class="kor">장지영</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_06.png'/>" alt="전승화 트레이너 사진">
								</div>
								<div class="info">
									<p class="el_role type2">트레이너</p>
									<p class="el_name">
										<span class="kor">전승화</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="<c:url value='/resources/common/images/dummy/staff_07.png'/>" alt="권혁준 매니저 사진">
								</div>
								<div class="info">
									<p class="el_role type2">매니저</p>
									<p class="el_name">
										<span class="kor">권혁준</span>
									</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</section>
			<!-- //지원스탭 -->


			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="<c:url value='/resources/common/images/common/ico_gotoTop.svg'/>" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

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