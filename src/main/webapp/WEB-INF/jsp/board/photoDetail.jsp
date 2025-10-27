<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<meta property="og:title" content="사진 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>사진 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="<c:url value="/resources/common/assets/font/font.css"/>" />
	<link rel="shortcut icon" href="<c:url value="/resources/common/images/common/favicon_kccegis.png"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/swiper-bundle.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/common.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/sub.css"/>"> <!-- sub only -->
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/board.css"/>"> <!-- 디렉토리 media/fan only -->
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
	<script src="<c:url value="/resources/common/assets/js/snsShare.js"/>" defer></script> <!-- 개발용 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
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
		<main id="container" class="ly_container media">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>MEDIA</li>
						<li>사진</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">MEDIA</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="newsList.do" class="swiper-slide snb_link"><span>뉴스</span></a>  
								<a href="movieList.do" class="swiper-slide snb_link"><span>영상</span></a>
								<a href="photoList.do" class="swiper-slide snb_link current"><span>사진</span></a> <!-- 해당페이지에 current 추가 -->
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 게시판 상세페이지 -->
			<section class="section board_view">
				<div class="ly_inner md">
					<!-- board header -->
					<div class="board_view_header">
						<div class="inner">
							<h4 class="subject">${photoDetail.subject }</h4>
							<input type="hidden" id="num" value="${photoDetail.num}">
							<input type="hidden" id="shareTitle" value="${photoDetail.subject}">
							<input type="hidden" id="shareImg" value="${photoDetail.img1}">
							<input type="text" id="Url" value="" style="position: absolute; top: 0; left: 0; width: 1px; height: 1px; border: 0; padding: 0; opacity: 0;" readonly>
						</div>
						<div class="bbs_info_wrap md">
							<span class="bbs_info date">${photoDetail.formatted_date}</span>
							<span class="bbs_info view">${photoDetail.visited}</span>

							<div class="dropdown sns_share">
								<button type="button" class="drop_btn el_btn btn_share" aria-expanded="false" aria-label="SNS 공유 리스트"></button>
								<div class="drop_content bubble">
									<div class="inner">
										<a href="#" class="el_btn share kakao" devSnsShare="kakaotalk"><span class="blind">카카오톡</span></a>
										<a href="#" class="el_btn share facebook" devSnsShare="facebook"><span class="blind">페이스북</span></a>
										<a href="#" class="el_btn share X" devSnsShare="twitter"><span class="blind">X</span></a>
										<a href="#" class="el_btn share link" devSnsShare="url-copy"><span class="blind">링크</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //board header -->

					<!-- board content -->
					<div class="board_view_content">

						<!-- detail -->
						<c:if test="${not empty photoChildList}">
							<div class="gallery_slider type1">
								<!-- bigimg -->
								<div class="gallery_bigimg_wrap">
									<div class="gallery_bigimg">
										<div class="swiper-wrapper">
											<c:forEach items="${photoChildList}" var="photoChildList">
											<div class="swiper-slide item">
												<img src="/resources/common/images/upload/gallery/${photoChildList.photofile }" alt="" >
											</div>
											</c:forEach>
										</div>
									</div> 		
								</div>
								<!-- //bigimg -->

								<!-- thumbnail -->
								<div class="gallery_thumb_wrap">
									<div class="gallery_thumb">
										<div class="swiper-wrapper">
											<c:forEach items="${photoChildList}" var="photoChildList">
											<div class="swiper-slide el_img media">
												<img src="/resources/common/images/upload/gallery/${photoChildList.photofile }" alt="" >
											</div>
											</c:forEach>
										</div>

										<div class="swiper-button-next type1 p_hide down"></div>
										<div class="swiper-button-prev type1 p_hide up"></div>
									</div> 		
								</div>
								<!-- //thumbnail -->
							</div>
						</c:if>
						<!-- //detail -->

						<div class="inner">
							<div class="btn_area mt50-30">
								<a href="photoList.do?listpage=${listpage}&searchKeyword=${searchKeyword}&sdate=${sdate}&edate=${edate}&otype=${otype}" class="el_btn frm_btn gray">목록</a>
							</div>
						</div>
					</div>
					<!-- //board content -->

					<!-- board nav -->
					<div class="board_view_nav">
						<div class="slider group board_nav_slider" data-view="[5,4]" data-space="[12,12]" data-delay="400">
							<div class="swiper-wrapper">
								<c:forEach items="${footPhotoList}" var="footPhotoList">
								<!-- slide -->
								<div class="swiper-slide">
									<a href="photoDetail.do?num=${footPhotoList.num}" class="nav_link thumb_hover type2">
				                		<figure class="el_thumb rds el_img media">
										<c:if test="${footPhotoList.img1 != null && footPhotoList.img1 != ''}">
											<img src="/resources/common/images/upload/gallery/${footPhotoList.img1 }" alt="" >
										</c:if>
										<c:if test="${footPhotoList.img1 == null || footPhotoList.img1 == ''}">
											<span class="no_img md"></span><!-- 대체이미지 -->
										</c:if>
										</figure>
										<div class="overlay">
											<div class="cont">
												<p class="tit txt_line2">${footPhotoList.subject}</p>
											</div>
										</div>
									</a>
								</div>
								<!-- //slide -->
								</c:forEach>
							</div>
							<div class="swiper-button-next type1 p_hide"></div>
							<div class="swiper-button-prev type1 p_hide"></div>
						</div>
					</div>
					<!-- board nav -->

				</div>
			</section>
			<!-- 게시판 상세페이지 -->


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