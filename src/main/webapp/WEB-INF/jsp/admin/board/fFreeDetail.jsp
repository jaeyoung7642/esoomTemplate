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
	<script src="<c:url value="/resources/common/admin/assets/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/common/admin/assets/js/jquery-3.6.0.min.js"/>"></script>	
	<script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
	<script>
	window.onload = function() {
		var titleChecked = document.getElementById('title').checked;
	    var contentChecked = document.getElementById('content').checked;
	    var writerChecked = document.getElementById('writer').checked;
	    var tailChecked = document.getElementById('tail').checked;
	    var tailWriterChecked = document.getElementById('tailWriter').checked;
		if(!titleChecked && !contentChecked && !writerChecked && !tailChecked && !tailWriterChecked){
			document.getElementById("title").checked = true;
	    }
	}
	function showYn(num,chkDel){
		if (confirm("노출여부를 변경하시겠습니까?") == true) {
			$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/esoomTemplate/changeChkDel.do",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num,
		       	 "chk_del" : chkDel
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		          console.log(res);
			        if(res==1){
			       	 location.reload();
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버에 문제가 있습니다.");
				}
		   });
		}else{
			return;
		}

	}
	function tailSave(num){
		var content = $("#tailWrite").val();
		 $.ajax({
		   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "/esoomTemplate/insertFreeTail.do",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "content":content,
		       	 "info_num": num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.reload();
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버에 문제가 있습니다.");
				}
		   }); 
		}
	function freeTailDelete(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			if(num=="" || num ==null){
				alert('삭제할수 없습니다.');
				return false;
			}
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/esoomTemplate/deleteFreeTail.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	location.reload();
				        }else{
				       	 alert("변경에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
	            
	        } else {
	            return;
	        }
		}
	function deleteFree(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			if(num=="" || num ==null){
				alert('삭제할수 없습니다.');
				return false;
			}
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/esoomTemplate/deleteFree.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	location.href = 'fFreeList.do';
				        }else{
				       	 alert("변경에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
	            
	        } else {
	            return;
	        }
		}
	function searchval(){
	    var form = $("#freeSearchForm");
	   	form.submit();
	   	$("body").append('<div class="loading"><span class="loading_box"></span></div>');
	}
	function searchReset() {
		// 오늘 날짜 계산
	    var today = new Date();
	    var yearAgo = new Date();
	    
	    // 1년 전 날짜 계산
	    yearAgo.setFullYear(today.getFullYear() - 1);

	    // 날짜 형식 맞추기 (YYYY-MM-DD)
	    var todayFormatted = today.toISOString().split('T')[0];
	    var yearAgoFormatted = yearAgo.toISOString().split('T')[0];

	    // sdate는 1년 전 날짜로, edate는 오늘 날짜로 설정
	    document.getElementById("sdate").value = yearAgoFormatted;
	    document.getElementById("edate").value = todayFormatted;
	    
	    
	    document.getElementById("chk_del").value = "N";

	    // 검색어 초기화
	    document.getElementById("keyWord").value = "";

	    // 체크박스 초기화
	    document.getElementById("title").checked = false;
	    document.getElementById("content").checked = false;
	    document.getElementById("writer").checked = false;
	    document.getElementById("tail").checked = false;
	    document.getElementById("tailWriter").checked = false;
		customSelect();
	}
	function handleKeyPress(event) {
	    if (event.key === 'Enter') {
	        var num = $("#num").val();
	        tailSave(num);
	    }
	}
	</script>
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
					<h3 class="aside_title">FANZONE</h3>
					<nav id="snb">
						<ul class="snb_list">
							<c:if test="${user.chk_grade == '70'}">
							<li><a href="fFreeList.do" class="snb_link current">팬게시판</a></li>
							</c:if>
							<c:if test="${user.chk_grade != '70'}">
							<li><a href="fNoticeList.do" class="snb_link">공지사항</a></li> 
							<li><a href="fFreeList.do" class="snb_link current">팬게시판</a></li>
							<li><a href="fEventList.do" class="snb_link">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
							</c:if>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">팬게시판</h3>
				<div class="board_view">
					<div class="board_view_header">
						<h4 class="subject">
							<c:if test="${result.flag == 'Y'}">[공지]</c:if> ${result.subject} 
						</h4>

						<div class="info">
							<c:if test="${result.writer =='KCC농구단'}">
							<span><em>작성자</em> ${result.writer}</span>
							</c:if>
							<c:if test="${result.writer !='KCC농구단'}">
							<%-- <span><em>작성자</em> ${result.maskName}</span> --%>
							<span><em>작성자</em> ${result.writer} (${result.id})</span>
							</c:if>
							<span><em>등록일시</em> ${result.formatted_date }</span>
							<span><em>조회수</em> ${result.visited}</span>
						</div>
					</div>

					<div class="board_view_content">${result.content }</div>
				</div>
				<input type="hidden" name="num" id="num" value="${result.num }">
				<input type="hidden" name="id" id="id" value="${result.id }">
					<div class="btn_area mt40" id="tailHead">
						<a href="fFreeWrite.do?num=${result.num}" class="el_btn md line">수정</a>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">목록</button>
						<button type="button" class="el_btn md line" onclick="deleteFree(${result.num});">삭제</button>
					</div>
				<c:if test="${result.num != null}">
				<!-- 댓글 -->
				<article class="article mt94">
					<div class="page_header">
						<h4 class="heading lv2">댓글</h4>
					</div>
					<div class="board_write">
						<form action="" onsubmit="return false;">
							<table class="tbl type4">
								<caption>댓글 리스트</caption>
								<colgroup>
									<col width="150">
									<col>
								</colgroup>
								<tbody>
									<c:forEach items="${freeTailList}" var="freeTailList">
									<tr>
										<th>${freeTailList.writer2} (${freeTailList.id})</th>
										<td>
											<div class="frm_group gap3">
												<p>${freeTailList.content }</p>
												<button type="button" class="el_btn remove2" aria-label="삭제" onclick="freeTailDelete(${freeTailList.num })"></button>
											</div>
												<p style="color : lightgrey; font-size:14px">${freeTailList.formatted_date }</p>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan="2">
											<!-- 댓글 작성 -->
											<div class="comment_write frm_group">
												<!-- <input type="text" class="frm_input" aria-label="댓글입력" id="tailWrite" onkeypress="handleKeyPress(event)"> -->
												<textarea class="frm_input" aria-label="댓글입력" id="tailWrite"></textarea>
												<button type="button" class="el_btn btn frm_btn deep" onclick="tailSave(${result.num});">댓글작성</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<c:if test="${not empty freeTailList}">
					<!-- pagination -->
					<div class="pagination mt20">
						<!-- 맨처음 -->
						<c:if test="${maxPage eq 0}">
						<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						</c:if>
						<c:if test="${maxPage > 0}">
						<a href="fFreeDetail.do?page=1&num=${result.num }&listpage=${currentPage2}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}#tailHead" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						</c:if>
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${startPage gt 1 }">
	                       	<a href="fFreeDetail.do?page=${startPage-1}&num=${result.num }&listpage=${currentPage2}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}#tailHead" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
	                      	<c:url var="fFreeDetail" value="fFreeDetail.do?&num=${result.num }&listpage=${currentPage2}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}#tailHead">
		 					<c:param name="page" value="${p}" />
		 					</c:url>
		 					<a href="${fFreeDetail}" class="page_link">${p}</a>
	                      </c:if>
	                    </c:forEach>
	                    
	                    <!-- 다음 블럭으로 이동 -->
	                    <c:if test="${endPage ne maxPage && maxPage > 1}">
						<a href="fFreeDetail.do?page=${endPage+1}&num=${result.num }&listpage=${currentPage2}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}#tailHead" class="page_link ico next"><span class="blind">다음</span></a>
	                    </c:if>
	                    <c:if test="${endPage ge maxPage}">
						<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
	                    </c:if>
	                    
	                    <!-- 맨끝 -->
	                    <c:if test="${maxPage eq 0}">
	                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
	                    </c:if>
	                    <c:if test="${maxPage > 0}">
						<a href="fFreeDetail.do?page=${maxPage}&num=${result.num }&listpage=${currentPage2}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}#tailHead" class="page_link ico last"><span class="blind">마지막</span></a>
						</c:if>
					</div>
				<!-- // pagination -->
				</c:if>
					</article>
				</c:if>
				<!-- search -->
					<div class="board_search mt27">
					<form action="fFreeList.do" class="forms search_group" id="freeSearchForm">
						<div class="forms frm_field">
							<div class="row rt">
								<div class="frm_group">
									<select class="frm_select sm m115" aria-label="출력 구분" name="searchChk_del" id="searchChk_del">
										<option value="all" <c:if test="${searchChk_del eq 'all'}">selected</c:if>>전체</option>
										<option value="N" <c:if test="${searchChk_del eq 'N'}">selected</c:if>>노출</option>
										<option value="Y" <c:if test="${searchChk_del eq 'Y'}">selected</c:if>>미노출</option>
									</select>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="title" name="searchTitle" value="Y" <c:if test="${searchTitle=='Y' }">checked</c:if>>
										<span>제목</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="content" name="searchContent" value="Y" <c:if test="${searchContent=='Y' }">checked</c:if>>
										<span>내용</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="writer" name="searchWriter" value="Y" <c:if test="${searchWriter=='Y' }">checked</c:if>>
										<span>작성자</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="tail" name="searchTail" value="Y" <c:if test="${searchTail=='Y' }">checked</c:if>>
										<span>댓글</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="tailWriter" name="searchTailWriter" value="Y" <c:if test="${searchTailWriter=='Y' }">checked</c:if>>
										<span>댓글작성자</span>
									</label>
									<input type="text" class="frm_input sm " name="searchKeyword" id="searchKeyword" value="${searchKeyword}" aria-label="검색어 입력" placeholder="검색어를 입력하세요.">
									<button type="button" class="el_btn frm_btn deep sm w100" onclick="searchval()">검색</button>
									<a href="fFreeList.do" class="el_btn frm_btn deep sm">새로고침</a>
								</div>
							</div>
						</div>
					</form>
					<!-- //search -->
				</div>

				<!-- board list -->
				<table class="tbl type2 mt30">
					<caption>선수 목록</caption>
					<colgroup>
						<col width="88">
						<col width="370">
						<col width="100">
						<col width="100">
						<col width="150">
						<col width="80">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">제목</th>
							<th scope="col">내용미리보기</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일시</th>
							<th scope="col">조회수</th>
							<th scope="col">노출여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${freeList}" var="freeList">
							<c:if test="${result.num == freeList.num}">
							<tr class="point">
								<td>[현재글]</td>								
							</c:if>
							<c:if test="${result.num != freeList.num}">
						<tr>
							<td>${freeList.rownum}</td>
							</c:if>
							<td class="lt">
							<c:if test="${freeList.chk_m == 'Y' }">
							<span class="el_ico_phone"></span>
							</c:if>
							<a href="fFreeDetail.do?num=${freeList.num }&listpage=${currentPage2}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}"><c:if test="${freeList.step != '0' }">ㄴ</c:if>${freeList.subject}</a>
							<c:if test="${freeList.tail_count != '0' }">
								<span class="count">[${freeList.tail_count }]</span>
							</c:if> 
							</td>
							<td>
								<input type="hidden" name="num" value="${freeList.num}">
								<button type="button" class="openModal freeData" data-target="#detailPopup">[미리보기]</button>
							</td>
							<td>
								<input type="hidden" name="id" value="${freeList.id}">
								<button type="button" class="writerData">${freeList.writer}</button>
								<button type="button" id="writerPop" class="openModal blind" data-target="#memberPopup"></button>
							</td>
							<td>${freeList.formatted_date}</td>
							<td>${freeList.visited}</td>
							<c:if test="${freeList.chk_del == 'N' }"><td><button type="button" class="toggle" onclick="showYn('${freeList.num}','${freeList.chk_del }')">O</button></td></c:if>
							<c:if test="${freeList.chk_del == 'Y' }"><td><button type="button" class="toggle" onclick="showYn('${freeList.num}','${freeList.chk_del }')">X</button></td></c:if>
						</tr>
					</c:forEach>
					<c:if test="${empty freeList}">
							<tr><td colspan="7">검색된 결과가 없습니다.</td></tr>
					</c:if>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty freeList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage2 eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage2 > 0}">
					<a href="fFreeList.do?page=1&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage2 gt 1 }">
                       	<a href="fFreeList.do?page=${startPage2-1}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
                    </c:if>
					<c:if test="${startPage2 eq 1 }">
                       	<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
                    </c:if>
                    
                    <!-- 페이지 번호 -->
                    <c:forEach var="p" begin="${startPage2}" end="${endPage2}" step="1">
                   	<c:if test="${p eq currentPage2 }">
                    	<a href="#" class="page_link current">${p}</a>
                    </c:if>
                      <c:if test="${p ne currentPage2 }">
                      	<c:url var="fFreeList" value="fFreeList.do?&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${fFreeList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage2 ne maxPage2 && maxPage2 > 1}">
					<a href="fFreeList.do?page=${endPage2+1}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage2 ge maxPage2}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage2 eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage2 > 0}">
					<a href="fFreeList.do?page=${maxPage}&searchKeyword=${searchKeyword}&searchTitle=${searchTitle}&searchContent=${searchContent}&searchWriter=${searchWriter}&searchTail=${searchTail}&searchTailWriter=${searchTailWriter}&searchChk_del=${searchChk_del}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->
	<!-- 작성자 정보 팝업 -->
				<div id="memberPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">작성자 정보</h4>
							</div>

							<div class="modal_body">
								<!-- 작성자 정보 -->
								<div class="board_write">
									<colgroup>
										<col width="167">
										<col>
									</colgroup>
									<table class="tbl type1">
										<caption>작성자 정보 테이블</caption>
										<tbody>
											<tr>
												<th scope="row" class="md"><label for="mb_id">회원명(ID)</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_id" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_join">가입일</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_join" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_login">최종 로그인</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_login" value="" readonly>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 작성자 정보 팝업 -->
				<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">내용 미리보기</h4>
							</div>

							<div class="modal_body">
								<!-- 작성자 정보 -->
								<div class="board_write">
									<colgroup>
										<col width="167">
										<col>
									</colgroup>
									<table class="tbl type1">
										<caption>내용 미리보기 테이블</caption>
										<tbody>
											<tr>
												<th scope="row" class="md"><label for="mb_id">회원명(ID)</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_id2" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_write">등록일시</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_write" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_subject">제목</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_subject" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_content">내용</label></th>
												<td>
													<textarea class="frm_input" id="mb_content" readonly></textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 작성자 정보 팝업 -->
				<script>
		$(document).on('click', '.writerData', function() {
			var writerId = $(this).prev().val();
			$.ajax({
			   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "/esoomTemplate/writerData.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "id": writerId
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	if(res != null && res != ""){
			        		$("#writerPop").trigger("click");
			        		$("#mb_id").val(res.name + " ("+res.id+")");
				        	$("#mb_join").val(res.reg_date);
				        	$("#mb_login").val(res.logindate);
				        }else{
				        	alert("탈퇴한 회원입니다.");
				        	$("#mb_id").val("탈퇴한 회원입니다.");
				        	$("#mb_join").val("");
				        	$("#mb_login").val("");
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
		});
		$(document).on('click', '.freeData', function() {
			var num = $(this).prev().val();
			$.ajax({
			   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "/esoomTemplate/detailData.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num": num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	if(res != null && res != ""){
			        		if(res.writer =='KCC농구단'){
			        			$("#mb_id2").val(res.writer);
			        		}else{
			        			$("#mb_id2").val(res.writer+" ("+res.id+")");
			        		}
				        	$("#mb_write").val(res.formatted_date);
				        	$("#mb_subject").val(res.subject);
				        	$("#mb_content").val(res.content);
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
		});
		</script>
	</div>
	<script>
		window.onpageshow = function(event){
			if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
				console.log(0);
				$('.loading').remove();
			}
		}
	</script>
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