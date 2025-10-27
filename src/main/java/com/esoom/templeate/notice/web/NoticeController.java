package com.esoom.templeate.notice.web;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.IpUtil;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.etc.service.EtcService;
import com.esoom.templeate.movie.service.MovieService;
import com.esoom.templeate.news.service.NewsService;
import com.esoom.templeate.notice.service.NoticeService;
import com.esoom.templeate.photo.service.PhotoService;


@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private IpUtil ipUtil;
	
	@GetMapping("/noticeList.do")
	public String noticeList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		BoardVO.setPart("notice");
		BoardVO.setFlag("N");
		int listCount = noticeService.getNoticeListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<BoardVO> noticeList = noticeService.noticeList(pi,BoardVO);
		if(noticeList != null && noticeList.size() >0) {
			for(BoardVO v: noticeList) {
				String content = v.getContent();
				v.setContent2(Jsoup.clean(content, Safelist.none()).replaceAll("&nbsp;", ""));
			}
		}
		model.addAttribute("noticeList", noticeList);
		
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		model.addAttribute("startPage2", pi2.getStartPage());
		model.addAttribute("endPage2", pi2.getEndPage());
		model.addAttribute("maxPage2", pi2.getMaxPage());
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "board/noticeList";
	}
	@GetMapping("/noticeDetail.do")
	public String noticeDetail(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page,@RequestParam(value = "listpage", required = false) Integer listpage, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		
		BoardVO.setPart("notice");
		BoardVO.setFlag("N");
		BoardVO noticeDetail = noticeService.noticeDetail(BoardVO);
		BoardVO prevDetail = noticeService.prevDetail(BoardVO);
		BoardVO nextDetail = noticeService.nextDetail(BoardVO);
		
		BoardTailVO boardTailVO = new BoardTailVO();
		boardTailVO.setInfo_num(BoardVO.getNum());
		int listCount = noticeService.getBoardTailListCount(boardTailVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> tailList = noticeService.boardTailList(pi, boardTailVO);
		
		
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("prevDetail", prevDetail);
		model.addAttribute("nextDetail", nextDetail);
		model.addAttribute("tailList", tailList);
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("listpage", listpage);
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "board/noticeDetail";
	}
	@ResponseBody
	@RequestMapping(value = "/contentWrite.do", method = RequestMethod.GET)
	public String contentWrite(@ModelAttribute("BoardTailVO") BoardTailVO BoardTailVO,HttpSession session,HttpServletRequest request,String part)throws Exception {
		MemberVO loginUserMap =  (MemberVO)session.getAttribute("loginUserMap");
		String id = loginUserMap.getId();
		BoardTailVO.setId(id);
		String name = loginUserMap.getName();
		BoardTailVO.setWriter(name);
		String ip = ipUtil.getClientIP(request);
		BoardTailVO.setIp(ip);
		int result=noticeService.contentWrite(BoardTailVO);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/contentPage.do", method = RequestMethod.GET)
	public String contentPage(ModelMap model,int page,@ModelAttribute("BoardTailVO") BoardTailVO BoardTailVO)throws Exception {
		// 현재 페이지
		int currentPage = page;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		// 상위리스트 카운트
		int listCount = noticeService.getBoardTailListCount(BoardTailVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> tailList = noticeService.boardTailList(pi,BoardTailVO); 
		
		model.addAttribute("tailList", tailList);
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		return "board/noticeDetailAjax";
	}
	@ResponseBody
	@RequestMapping(value = "/contentDelete.do", method = RequestMethod.GET)
	public String contentDelete(@ModelAttribute("BoardTailVO") BoardTailVO BoardTailVO)throws Exception {
		int result=noticeService.contentDelete(BoardTailVO);
		return String.valueOf(result);
	}
}
