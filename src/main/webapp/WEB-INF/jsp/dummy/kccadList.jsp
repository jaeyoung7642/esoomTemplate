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
	<meta property="og:title" content="KCC광고 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>KCC광고 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="<c:url value="/resources/common/assets/font/font.css"/>" />
	<link rel="shortcut icon" href="<c:url value="/resources/common/images/common/favicon_kccegis.png"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/swiper-bundle.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/common.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/sub.css"/>"> <!-- sub only -->
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/club.css"/>"> <!-- 디렉토리 player only -->
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
						<li>CLUB</li>
						<li>KCC광고</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">CLUB</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="front.do" class="swiper-slide snb_link"><span>구단소개</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="chistory.do" class="swiper-slide snb_link"><span>역사관</span></a> 
								<a href="sponsor.do" class="swiper-slide snb_link"><span>스폰서</span></a>
								<a href="kccadList.do" class="swiper-slide snb_link current"><span>KCC 광고</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area p_show">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="#" class="swiper-slide snb_link current"><span>기업PR</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="#" class="swiper-slide snb_link"><span>KCC창호</span></a>
						<a href="#" class="swiper-slide snb_link"><span>숲으로</span></a> 
						<a href="#" class="swiper-slide snb_link"><span>HOMECC</span></a> 
						<a href="#" class="swiper-slide snb_link"><span>KCC건설 스위첸</span></a> 
					</div>
				</nav>
			</div>

			<!-- 검색 -->
			<section class="section mt70 kccad_content">
				<div class="ly_inner md inner">
					<!-- 광고 카테고리 (3차 메뉴도 동일하게 적용) -->
					<aside class="kccad_cate_area">
						<div class="bl_sticky_wrap">
							<nav class="kccad_cate p_hide bl_sticky">
								<a href="#" class="cate_link current">
									<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_01.svg"></span> 기업PR
								</a> <!-- 해당페이지에 current 추가 -->
								<a href="#" class="cate_link">
									<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_02.svg"></span> KCC창호
								</a>
								<a href="#" class="cate_link">
									<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_03.svg"></span> 숲으로
								</a>
								<a href="#" class="cate_link">
									<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_04.svg"></span> HOMECC
								</a>
								<a href="#" class="cate_link">
									<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_05.svg"></span> KCC건설 스위첸
								</a>
							</nav>
						</div>
					</aside>
					<!-- //광고 카테고리 -->
			
					<!-- 광고 영상 리스트 -->
					<ul class="kccad_list">
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_01.jpg" alt="">
								</div>
								<div class="info">
									<p>TVC극장</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">TVC극장</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://youtube.com/embed/LZ-3oZBHfUU"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_02.jpg" alt="">
								</div>
								<div class="info">
									<p>KCC 박찬호</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">KCC 박찬호</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/x_gicLTIWxk"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_03.jpg" alt="">
								</div>
								<div class="info">
									<p>KCC 원더랜드</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">KCC 원더랜드</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/8xlsrqAr7dg"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_04.jpg" alt="">
								</div>
								<div class="info">
									<p>계속하는 것이 힘이다. (60주년)</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">계속하는 것이 힘이다. (60주년)</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/U1rfhSdotwI"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_05.jpg" alt="">
								</div>
								<div class="info">
									<p>KCC가 지킵니다. (2017)</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">KCC가 지킵니다. (2017)</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/JlpJNO8opr0"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_06.jpg" alt="">
								</div>
								<div class="info">
									<p>앞으로 가는 미래를 만듭니다. (2016)</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">앞으로 가는 미래를 만듭니다. (2016)</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/gZfYrnEbHLY"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_07.jpg" alt="">
								</div>
								<div class="info">
									<p>미래를 만듭니다. (2015)</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">미래를 만듭니다. (2015)</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/gZfYrnEbHLY"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<img src="/resources/common/images/dummy/kccad_thumb_08.jpg" alt="">
								</div>
								<div class="info">
									<p>그림같은 내일 (2014)</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">그림같은 내일 (2014)</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="https://www.youtube.com/embed/xdw8hPbxQb4"></button>
											<a href="#" class="el_btn download_lg"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
					</ul>
					<!-- //광고 영상 리스트 -->
				</div>
			</section>
			<!-- 검색 -->

			<script src="https://www.youtube.com/iframe_api"></script>

			<script>
				// 유튜브 id 추출
				function youtubeId(url) {
					let match = url.match(/(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/);
					if (match) {
							return match[1];
					} else {
							return null;
					}
				}

				let player = null;

				$(document).on('click', '.videoOpen', function() {
					const videoId = youtubeId($(this).data('video'));

					player = new YT.Player('player', {
							height: '315',
							width: '560',
							videoId: videoId,
							playerVars: {
								'rel': 0 
							},
							events: {
									'onReady': () => {
										player.playVideo();
									}
							}
					});
				});

				// modal close
				$(document).on('click', '.videoClose, .dim', function() {
					if (player && $('.kccadPopup').hasClass('open')) {
						player.stopVideo();
						player.destroy();
						player = null;
					}
				});

				$(document).on('keydown', (e) => { 
					if (player && $('.kccadPopup.open').length > 0 && e.keyCode == 27){
						player.stopVideo();
						player.destroy();
						player = null;
					}
				});

			</script>

			<!-- 월페이퍼 미리보기 팝업 -->
			<div id="kccadPopup" tabindex="-1" class="modal type3 kccadPopup" data-focus="modal" style="--pmax: 1140px">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<div class="video el_video">
								<div id="player"></div>
							</div>
						</div>
						<button type="button" class="el_btn close w closeModal videoClose" data-focus-next="modal"></button>
					</div>
				</div>
			</div>
			<!-- 월페이퍼 미리보기 팝업 -->


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