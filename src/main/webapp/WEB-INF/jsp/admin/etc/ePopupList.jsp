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
			<aside id="aside" class="ly_aside">
				<div class="aside_inner custom_scroll">
					<h3 class="aside_title">ETC</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="ePopupList.do" class="snb_link current">팝업</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="eMainSlideList.do" class="snb_link">메인슬라이드 관리</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<div class="page_header">
					<h3 class="heading">팝업</h3>

				</div>

				<!-- board list -->
				<table class="tbl type2">
					<caption>메인슬라이드 관리</caption>
					<colgroup>
						<col width="50">
						<col width="130">
						<col width="370">
						<col width="160">
						<col width="160">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">썸네일</th>
							<th scope="col">제목</th>
							<th scope="col">등록일시</th>
							<th scope="col">기간</th>
							<th scope="col">출력여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${popupList}" var="popupList">
						<c:if test="${popupList.main_chk == 'Y'}">
						<tr class="point">
						</c:if>
						<c:if test="${popupList.main_chk == 'N'}">
						<tr>
						</c:if>
							<td>${popupList.num}</td>
							<td>
								<c:if test="${popupList.pop_img != null && popupList.pop_img != ''}">
									<a href="ePopupWrite?num=${popupList.num }"><img src="<c:url value='/resources/common/images/upload/popup/${popupList.pop_img }'/>" alt="" width="100" height="100"></a>
								</c:if>
								<c:if test="${popupList.pop_img == null || popupList.pop_img == ''}">
									<a href="ePopupWrite?num=${popupList.num }"><img src="<c:url value='/resources/common/admin/images/common/no_img.jpg'/>" alt="" class="no_img" width="100" height="100"></a> <!-- 대체이미지 -->
								</c:if>
							</td>
							<td style="text-align: left;"><a href="ePopupWrite.do?num=${popupList.num }">${popupList.subject}</a></td>
							<td>${popupList.formatted_date}</td>
							<td>${popupList.sdate} ~<br> ${popupList.edate}</td>
							<td>
								<c:if test="${popupList.main_chk == 'Y'}">출력 (${popupList.order})</c:if>
								<c:if test="${popupList.main_chk == 'N'}">미출력</c:if>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty popupList}">
							<tr><td colspan="5">검색된 결과가 없습니다.</td></tr>
					</c:if>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty popupList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="ePopupList.do?page=1" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="ePopupList.do?page=${startPage-1}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
                    </c:if>
					<c:if test="${startPage eq 1 }">
                       	<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
                    </c:if>
                    
                    <!-- 페이지 번호 -->
                    <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
                   	<c:if test="${p eq currentPage }">
                    	<a href="#" class="page_link current">${p}</a>
                    </c:if>
                      <c:if test="${p ne currentPage }">
                      	<c:url var="ePopupList" value="ePopupList.do?">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${ePopupList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="ePopupList.do?page=${endPage+1}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="ePopupList.do?page=${maxPage}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>

				<div class="btn_area mt40">
					<a href="ePopupWrite.do" class="el_btn md line">등록</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

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