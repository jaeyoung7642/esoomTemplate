package com.esoom.templeate.photo.web;



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
public class PhotoController {
	@Autowired
	private PhotoService photoService;
	
	@GetMapping("/photoList.do")
	public String photoList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		BoardVO.setPart("photo");
		BoardVO.setFlag("N");
		if(BoardVO.getOtype() == null || "".equals(BoardVO.getOtype())) {
			BoardVO.setOtype("num");
		}
		int listCount = photoService.getPhotoListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> photoList = photoService.photoList(pi,BoardVO);
		model.addAttribute("photoList", photoList);
		
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
		model.addAttribute("otype", BoardVO.getOtype());
		return "board/photoList";
	}
	@GetMapping("/photoDetail.do")
	public String photoDetail(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "listpage", required = false) Integer listpage, ModelMap model) throws Exception {
		BoardVO.setPart("photo");
		BoardVO photoDetail = photoService.photoDetail(BoardVO);
		if(BoardVO.getSdate() != null || !"".equals(BoardVO.getSdate())) {
			photoDetail.setSdate(BoardVO.getSdate());
		}else {
			photoDetail.setSdate("");
		}
		if(BoardVO.getEdate() != null || !"".equals(BoardVO.getEdate())) {
			photoDetail.setEdate(BoardVO.getEdate());
		}else {
			photoDetail.setEdate("");
		}
		List<?> photoChildList = photoService.photoChildList(BoardVO);
		
		List<?> footPhotoList = photoService.footPhotoList(BoardVO);
		model.addAttribute("photoDetail", photoDetail);
		model.addAttribute("photoChildList", photoChildList);
		model.addAttribute("footPhotoList", footPhotoList);
		model.addAttribute("listpage", listpage);
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		model.addAttribute("sdate", BoardVO.getSdate());
		model.addAttribute("edate", BoardVO.getEdate());
		model.addAttribute("wtype", BoardVO.getWtype());
		model.addAttribute("otype", BoardVO.getOtype());
		return "board/photoDetail";
	}
}
