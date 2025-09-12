package com.esoom.templeate.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.esoom.templeate.admin.service.AdminEventService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminEventController {
	@Resource(name = "adminEventService")
	private AdminEventService adminEventService;
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;

	@GetMapping("/fEventList.do")
	public String fNoticeList(@ModelAttribute("BoardVO") BoardVO BoardVO,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		BoardVO.setPart("event");
		BoardVO.setFlag("N");
		if("".equals(BoardVO.getState()) || BoardVO.getState() == null){
			BoardVO.setState("all");
		}
		int listCount = adminEventService.getEventListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> eventList = adminEventService.eventList(pi,BoardVO);
		model.addAttribute("eventList", eventList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "admin/board/fEventList";
	}
	@RequestMapping(value = "/fEventWrite.do", method = RequestMethod.GET)
	public String fEventWrite(ModelMap model,@RequestParam(value = "page", required = false) Integer page,
			@ModelAttribute("BoardVO") BoardVO BoardVO) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		if(BoardVO.getNum() != null && BoardVO.getNum()!=0) {
			System.out.println(BoardVO.getNum());
			BoardVO = adminNoticeService.selectBoardDetail(BoardVO);
			int listCount = adminEventService.getEventTailListCount(BoardVO);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			List<?> eventTailList = adminEventService.eventTailList(pi,BoardVO);
			model.addAttribute("result", BoardVO);
			model.addAttribute("eventTailList", eventTailList);
			model.addAttribute("startPage", pi.getStartPage());
			model.addAttribute("endPage", pi.getEndPage());
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", pi.getMaxPage());
		}
		return "admin/board/fEventWrite";
	}
}
