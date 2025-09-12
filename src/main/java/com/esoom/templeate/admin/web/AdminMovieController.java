package com.esoom.templeate.admin.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.esoom.templeate.admin.service.AdminMovieService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminMovieController {
	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;
	@Resource(name = "adminMovieService")
	private AdminMovieService adminMovieService;
	@Resource(name = "commonService")
	private CommonService commonService;

	@GetMapping("/mMovieList.do")
	public String mMovieList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		BoardVO.setPart("news");
		BoardVO.setFlag("N");
		int listCount = adminMovieService.getMovieListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> movieList = adminMovieService.movieList(pi,BoardVO);
		model.addAttribute("movieList", movieList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "admin/board/mMovieList";
	}
	@GetMapping("/mMovieWrite.do")
	public String fNoticeWrite(ModelMap model,
			@ModelAttribute("BoardVO") BoardVO BoardVO) throws Exception {
		BoardVO = adminNoticeService.selectBoardDetail(BoardVO);
		model.addAttribute("result", BoardVO);
		return "admin/board/mMovieWrite";
	}
	

}
