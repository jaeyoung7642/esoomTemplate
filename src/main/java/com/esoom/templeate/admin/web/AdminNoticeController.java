package com.esoom.templeate.admin.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminNoticeController {
	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;
	@Resource(name = "commonService")
	private CommonService commonService;

	@GetMapping("/fNoticeList.do")
	public String fNoticeList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		System.out.println(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		BoardVO.setPart("notice");
		BoardVO.setFlag("N");
		int listCount = adminNoticeService.getNoticeListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> noticeList = adminNoticeService.noticeList(pi,BoardVO);
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "admin/board/fNoticeList";
	}
	@GetMapping("/fNoticeWrite.do")
	public String fNoticeWrite(ModelMap model,
			@ModelAttribute("BoardVO") BoardVO BoardVO) throws Exception {
		System.out.println(BoardVO.getNum());
		BoardVO = adminNoticeService.selectBoardDetail(BoardVO);
		model.addAttribute("result", BoardVO);
		return "admin/board/fNoticeWrite";
	}
	
	@RequestMapping("/mergeBoard.do")
	public String mergeBoard(
	        @RequestParam(required = false) Integer num,
	        @RequestParam(required = false) String part,
	        @RequestParam(required = false) Integer visited,
	        @RequestParam(required = false) String subject,
	        @RequestParam(required = false) String content,
	        @RequestParam(required = false) String sDay,
	        @RequestParam(required = false) String sTime,
	        @RequestParam(required = false) String sMinute,
	        @RequestParam(required = false) String eDay,
	        @RequestParam(required = false) String eTime,
	        @RequestParam(required = false) String eMinute,
	        @RequestParam(required = false) String flag,
	        @RequestParam(required = false) String etc2,
	        @RequestParam(required = false) String wtype,
	        @RequestParam(required = false) String summary,
	        @RequestParam(required = false) String linkurl,
	        @RequestParam(value = "img1", required = false) MultipartFile img1,
	        @RequestParam(value = "img2", required = false) MultipartFile img2,
	        @RequestParam(value = "img1_bf", required = false) String img1_bf,
	        @RequestParam(value = "img2_bf", required = false) String img2_bf
	) throws Exception {
	    BoardVO boardVO = new BoardVO();
	    boardVO.setNum(num != null ? num : 0);
	    boardVO.setPart(part);
	    boardVO.setVisited(visited != null ? visited : 0);
	    boardVO.setSubject(subject);
	    boardVO.setContent(content != null && !content.equals("") ? content : "");
	    boardVO.setsDay(sDay != null && !sDay.isEmpty() ? sDay : "1900-01-01");
	    boardVO.setsTime(sTime != null && !sTime.isEmpty() ? sTime : "00");
	    boardVO.setsMinute(sMinute != null && !sMinute.isEmpty() ? sMinute : "00");
	    boardVO.seteDay(eDay != null && !eDay.isEmpty() ? eDay : "2079-06-06");
	    boardVO.seteTime(eTime != null && !eTime.isEmpty() ? eTime : "00");
	    boardVO.seteMinute(eMinute != null && !eMinute.isEmpty() ? eMinute : "00");
	    boardVO.setFlag(flag);
	    boardVO.setEtc2(etc2);
	    boardVO.setWtype(wtype);
	    boardVO.setSummary(summary);
	    boardVO.setLinkurl(linkurl);
	    
	    System.out.println(boardVO.getContent());

	    boardVO.setSdate(boardVO.getsDay() + " " + boardVO.getsTime() + ":" + boardVO.getsMinute());
	    boardVO.setEdate(boardVO.geteDay() + " " + boardVO.geteTime() + ":" + boardVO.geteMinute());

	    // 파일 처리
	    if (img1 != null && !img1.isEmpty()) {
	        String fileResult = commonService.filesave(img1, boardVO.getPart());
	        if (!"false".equals(fileResult)) boardVO.setImg1(fileResult);
	    } else {
	        boardVO.setImg1(img1_bf);
	    }

	    if (img2 != null && !img2.isEmpty()) {
	        String fileResult = commonService.filesave(img2, boardVO.getPart());
	        if (!"false".equals(fileResult)) boardVO.setImg2(fileResult);
	    } else {
	        boardVO.setImg2(img2_bf);
	    }

	    int result = adminNoticeService.mergeBoard(boardVO);

	    String returnUrl = "";
	    if (result > 0) {
	        switch (boardVO.getPart()) {
	            case "news": returnUrl = "redirect:/mNewsList.do"; break;
	            case "movie": returnUrl = "redirect:/mMovieList.do"; break;
	            case "notice": returnUrl = "redirect:/fNoticeList.do"; break;
	            case "event": returnUrl = "redirect:/fEventList.do"; break;
	        }
	    } else {
	        switch (boardVO.getPart()) {
	            case "news": returnUrl = "admin/mNewsList"; break;
	            case "movie": returnUrl = "admin/mMovieList"; break;
	            case "notice": returnUrl = "admin/fNoticeList"; break;
	            case "event": returnUrl = "admin/fEventList"; break;
	        }
	    }

	    return returnUrl;
	}
	@ResponseBody
	@RequestMapping(value = "/deleteBoard.do", method = RequestMethod.GET)
	public String deleteBoard(@ModelAttribute("BoardVO") BoardVO boardVO)throws Exception {
		int result=adminNoticeService.deleteBoard(boardVO);
		return String.valueOf(result);
	}
}
