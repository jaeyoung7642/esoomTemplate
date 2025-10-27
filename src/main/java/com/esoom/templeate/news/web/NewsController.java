package com.esoom.templeate.news.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.etc.service.EtcService;
import com.esoom.templeate.movie.service.MovieService;
import com.esoom.templeate.news.service.NewsService;
import com.esoom.templeate.photo.service.PhotoService;


@Controller
public class NewsController {
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/newsList.do")
	public String newsList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page,ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		BoardVO.setPart("news");
		BoardVO.setFlag("N");
		int listCount = newsService.getNewsListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> newsList = newsService.newsList(pi,BoardVO);
		model.addAttribute("newsList", newsList);
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		model.addAttribute("startPage2", pi2.getStartPage());
		model.addAttribute("endPage2", pi2.getEndPage());
		model.addAttribute("maxPage2", pi2.getMaxPage());
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		model.addAttribute("sdate", BoardVO.getSdate());
		model.addAttribute("edate", BoardVO.getEdate());
		return "board/newsList";
	}
}
