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
	<meta property="og:title" content="마이페이지 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>마이페이지 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/member.css"> <!-- 디렉토리  member only -->
	<script src="/resources/common/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/common/assets/js/jquery.scrollDetector.min.js" defer></script>
	<script src="/resources/common/assets/js/lenis.min.js" defer></script>
	<script src="/resources/common/assets/js/swiper-bundle.min.js" defer></script>
	<script src="/resources/common/assets/js/jquery.kinetic.min.js" defer></script>
	<script src="/resources/common/assets/js/common.js" defer></script> 
	<script src="/resources/common/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/sub.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/link.js" defer></script>
	<script src="/resources/common/assets/js/script.js" defer></script> <!-- 개발용 -->
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script>
	function getQueryParam(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    window.onload = function() {
        // URL에서 'msg' 파라미터 읽기
        var msg = getQueryParam('msg') || '';

        // URL 디코딩
        msg = decodeURIComponent(msg).trim();

        // 메시지가 있을 경우 알림 표시
        if (msg !== '') {
        	alertPop(msg);
        }
    }
	
	</script>
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
		<main id="container" class="ly_container member m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<div class="mypage_header">
						<div class="member">
							<span class="el_ico"><img src="/resources/common/images/img/mypage_top_img.svg" alt=""></span>
							<p class="name"><strong>${loginUserMap.name }</strong>님 안녕하세요!</p>
						</div>
						<div class="btns">
							<a href="ticket" class="el_btn btn_mb2">
								<span class="el_ico ico_ticket_line_w"></span> 티켓팅
							</a> 
						</div>
					</div>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="mypage" class="swiper-slide snb_link current"><span>마이페이지</span></a> 
								<a href="memberUpdateForm" class="swiper-slide snb_link"><span>회원정보수정</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			


			<!-- 최근 영상 -->
			<section class="section mypage_video mt50">
				<div class="ly_inner md">
					<div class="page_header float_btn">
						<h4 class="el_heading lv1">최근 영상</h4> 
					</div>

					<div class="swiper slider video_list type2 visible pcol4" data-view="[4,3,2,1]" data-space="[20,16,13,10]" data-delay="400">
						<div class="swiper-wrapper">
							<c:forEach items="${movieList}" var="movieList" varStatus="status">
							<!-- slide -->
							<div class="swiper-slide item">
								<a href="movieDetail.do?num=${movieList.num}" class="el_thumb rds el_img media video">
									<c:if test="${movieList.img1 != null && movieList.img1 != ''}">
										<img src="/resources/common/images/upload/movie/${movieList.img1 }" alt="">
									</c:if>
									<c:if test="${movieList.img1 == null || movieList.img1 == ''}">
										<img src="/resources/common/images/common/no_img.png" alt="">
									</c:if>
								</a>
							</div>
							<!-- //slide -->
							</c:forEach>
						</div>
					</div>

					<a href="movieList.do" class="el_btn ccl add float"><span class="blind">더보기</span></a>
				</div>
			</section>
			<!-- 최근 영상 -->


			<!-- 최근 게시물 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="bl_grid col2">

						<!-- 공지사항 -->
						<article class="bl_col bl_card m_full latest_bbs">
							<div class="latest_header float_btn">
								<h4 class="el_heading lv1">공지사항</h4> 
							</div>
							<div class="latest_content">
								<ul class="latest_list">
								<c:forEach items="${noticeList}" var="noticeList" varStatus="status">
									<c:choose>
									  <c:when test="${status.first}">
									     <li class="row li_notice">
											<a href="noticeDetail.do?num=${noticeList.num}">
												<div class="tit_area">
													<div class="tit txt_line1">
														${noticeList.subject}
													</div>
													<c:if test="${noticeList.tail_count != '0' }">
													<span class="count">[${noticeList.tail_count}]</span>
													</c:if>
												</div>
												<div class="cont txt_line2">
													${noticeList.content2}
												</div>
												<span class="date">${noticeList.formatted_date}</span>
											</a>
										</li>
									  </c:when>
										<c:otherwise>
										   <li class="row">
												<div class="tit">
													<a href="noticeDetail.do?num=${noticeList.num}" class="tit_link">${noticeList.subject}</a>
													<c:if test="${noticeList.tail_count != '0' }">
													<span class="count">[${noticeList.tail_count}]</span>
													</c:if>
												</div>
												<span class="date">${noticeList.formatted_date}</span>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</ul>
							</div>

							<a href="noticeList.do" class="el_btn ccl add float"><span class="blind">더보기</span></a>
						</article>
						<!-- //공지사항 -->

						<!-- 최근 내 게시물 댓글 -->
						<article class="bl_col bl_card m_full latest_bbs">
							<div class="latest_header">
								<h4 class="el_heading lv1">최근 내 게시물</h4> 
							</div>
							<div class="latest_content">
								<ul class="latest_list">
									<c:forEach items="${freeList}" var="freeList" varStatus="status">
									<li class="row">
										<div class="tit">
											<a href="freeDetail.do?num=${freeList.num}" class="tit_link">${freeList.subject }</a>
											<c:if test="${freeList.tail_count != '0' }">
											<span class="count">[${freeList.tail_count }]</span>
											</c:if>
										</div>
										<span class="date">${freeList.formatted_date }</span>
									</li>
									</c:forEach>

									<!-- (게시물 없을 경우) -->
									<c:if test="${empty freeList}">
									<li class="row no_post">
										<div class="inner">
											<p>등록된 게시물이 없습니다.</p>
											<a href="freeWriteForm" class="el_btn sm line2">게시물 작성하기 <span class="el_ico arr_right rt"></span></a>
										</div>
									</li> 
									</c:if>
								</ul>
							</div>

							<a href="freeList.do" class="el_btn ccl add float"><span class="blind">더보기</span></a>
						</article>
						<!-- //최근 내 게시물 댓글 -->
					</div>
				</div>
			</section>
			<!-- //최근 게시물 -->

			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
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