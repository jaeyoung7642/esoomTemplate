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

import com.esoom.templeate.admin.service.AdminNewsService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminNewsController {
	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;
	@Resource(name = "adminNewsService")
	private AdminNewsService adminNewsService;
	@Resource(name = "commonService")
	private CommonService commonService;

	@GetMapping("/mNewsList.do")
	public String mNewsList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		BoardVO.setPart("news");
		BoardVO.setFlag("N");
		int listCount = adminNewsService.getNewsListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> newsList = adminNewsService.newsList(pi,BoardVO);
		model.addAttribute("newsList", newsList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "admin/board/mNewsList";
	}
	@GetMapping("/mNewsWrite.do")
	public String fNoticeWrite(ModelMap model,
			@ModelAttribute("BoardVO") BoardVO BoardVO) throws Exception {
		BoardVO = adminNoticeService.selectBoardDetail(BoardVO);
		model.addAttribute("result", BoardVO);
		return "admin/board/mNewsWrite";
	}
	

}
