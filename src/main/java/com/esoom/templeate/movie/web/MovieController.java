package com.esoom.templeate.movie.web;



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
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@GetMapping("/movieList.do")
	public String movieList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		BoardVO.setPart("movie");
		BoardVO.setFlag("N");
		if(BoardVO.getWtype() == null || "".equals(BoardVO.getWtype())) {
			BoardVO.setWtype("all");
		}
		if(BoardVO.getOtype() == null || "".equals(BoardVO.getOtype())) {
			BoardVO.setOtype("num");
		}
		int listCount = movieService.getMovieListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> movieList = movieService.movieList(pi,BoardVO);
		model.addAttribute("movieList", movieList);
		
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
		model.addAttribute("wtype", BoardVO.getWtype());
		model.addAttribute("otype", BoardVO.getOtype());
		return "board/movieList";
	}
	@GetMapping("/movieDetail.do")
	public String movieDetail(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "listpage", required = false) Integer listpage, ModelMap model) throws Exception {
		BoardVO.setPart("movie");
		BoardVO movieDetail = movieService.movieDetail(BoardVO);
		if(BoardVO.getSdate() != null || !"".equals(BoardVO.getSdate())) {
			movieDetail.setSdate(BoardVO.getSdate());
		}else {
			movieDetail.setSdate("");
		}
		if(BoardVO.getEdate() != null || !"".equals(BoardVO.getEdate())) {
			movieDetail.setEdate(BoardVO.getEdate());
		}else {
			movieDetail.setEdate("");
		}
		List<?> footMovieList = movieService.footMovieList(BoardVO);
		model.addAttribute("movieDetail", movieDetail);
		model.addAttribute("footMovieList", footMovieList);
		model.addAttribute("listpage", listpage);
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		model.addAttribute("sdate", BoardVO.getSdate());
		model.addAttribute("edate", BoardVO.getEdate());
		model.addAttribute("wtype", BoardVO.getWtype());
		model.addAttribute("otype", BoardVO.getOtype());
		return "board/movieDetail";
	}
}
