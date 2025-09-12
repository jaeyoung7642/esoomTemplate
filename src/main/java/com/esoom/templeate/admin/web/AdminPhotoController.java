package com.esoom.templeate.admin.web;

import java.util.List;

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

import com.esoom.templeate.admin.service.AdminMovieService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.AdminPhotoService;
import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminPhotoController {
	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;
	@Resource(name = "adminPhotoService")
	private AdminPhotoService adminPhotoService;
	@Resource(name = "commonService")
	private CommonService commonService;

	@GetMapping("/mPhotoList.do")
	public String mPhotoList(@ModelAttribute("BoardVO") BoardVO BoardVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		BoardVO.setCurrentPage(currentPage);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		BoardVO.setPart("news");
		BoardVO.setFlag("N");
		int listCount = adminPhotoService.getPhotoListCount(BoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> photoList = adminPhotoService.photoList(pi,BoardVO);
		model.addAttribute("photoList", photoList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", BoardVO.getSearchKeyword());
		return "admin/board/mPhotoList";
	}
	@GetMapping("/mPhotoWrite.do")
	public String mPhotoWrite(ModelMap model,
			@ModelAttribute("BoardVO") BoardVO BoardVO) throws Exception {
		BoardVO = adminNoticeService.selectBoardDetail(BoardVO);
		System.out.println(BoardVO.getPart());
		List<BoardPhotoVO> photoList = (List<BoardPhotoVO>) adminPhotoService.boardPhotoList(BoardVO); 
		if(photoList.size()>0) {
			BoardVO.setPhotoList(photoList);
		}
		model.addAttribute("result", BoardVO);
		return "admin/board/mPhotoWrite";
	}
	@RequestMapping("/mergeBoardPhoto.do")
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
	        @RequestParam(value = "img2_bf", required = false) String img2_bf,
	        @RequestParam(value="files", required=false) List<MultipartFile> files,
	        HttpServletRequest request, ModelMap model
	) throws Exception {
		String filePathTail = "gallery";
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
	    
	    if(result > 0) {
	    	String info_num = "";
	    	if(num == null || "".equals(num)) {
	    		BoardVO lastBoard = adminNoticeService.lastBoard(boardVO);
				info_num = lastBoard.getNum().toString();
			}else {
				info_num = num.toString();
			}
	    	String[] photofile_bf_arr = request.getParameterValues("photofile_bf");
	    	String[] photo_num_arr = request.getParameterValues("photoNum");
	    	int photoSaveCnt = 0;
			int size = files.size();
			if(size>0) {
				for(int i=0;i<size;i++) {
					BoardPhotoVO bpVO = new BoardPhotoVO();
					bpVO.setNum(photo_num_arr[i].equals("")?null:Integer.parseInt(photo_num_arr[i]));
					if (files.get(i) != null) {
						if(!files.get(i).isEmpty()) {
							String fileResult = commonService.filesave(files.get(i),filePathTail);
							bpVO.setInfo_num(Integer.parseInt(info_num));
							if(!"false".equals(fileResult)) {
								bpVO.setPhotofile(fileResult);
							}
						}else {
							if(photofile_bf_arr!=null) {
								bpVO.setPhotofile(photofile_bf_arr[i]);
							}else {
								bpVO.setPhotofile("");
								bpVO.setInfo_num(Integer.parseInt(info_num));
							}
						}
					}
					photoSaveCnt += adminPhotoService.boardPhotoMerge(bpVO);
				}
				if(photoSaveCnt<size) {
					model.addAttribute("msg", "서버 오류! 관리자에게 문의 바랍니다.");
				}else {
				}
			}else {
			}
	    }

	    return "redirect:/mPhotoList.do";
	}
	@ResponseBody
	@RequestMapping(value = "/deleteBoardPhoto.do", method = RequestMethod.GET)
	public String deleteNewsPhoto(@ModelAttribute("BoardPhotoVO") BoardPhotoVO BoardPhotoVO)throws Exception {
		int result=adminPhotoService.deleteBoardPhoto(BoardPhotoVO);
		return String.valueOf(result);
	}
}
