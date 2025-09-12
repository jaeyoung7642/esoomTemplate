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

import com.esoom.templeate.admin.service.AdminEtcService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;
import com.esoom.templeate.admin.service.PopupVO;
import com.esoom.templeate.admin.service.SlideVO;

@Controller
public class AdminEtcController {
	@Resource(name = "adminEtcService")
	private AdminEtcService adminEtcService;
	@Resource(name = "commonService")
	private CommonService commonService;

	@GetMapping("/ePopupList.do")
	public String ePopupList(@ModelAttribute("PopupVO") PopupVO PopupVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		int listCount = adminEtcService.getPopupListCount(PopupVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> popupList = adminEtcService.popupList(pi,PopupVO);
		model.addAttribute("popupList", popupList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		return "admin/etc/ePopupList";
	}
	@RequestMapping(value = "/ePopupWrite.do", method = RequestMethod.GET)
	public String fEventWrite(ModelMap model,@RequestParam(value = "page", required = false) Integer page,
			@ModelAttribute("PopupVO") PopupVO PopupVO) throws Exception {
			PopupVO = adminEtcService.selectPopupDetail(PopupVO);
			model.addAttribute("result", PopupVO);
		return "admin/etc/ePopupWrite";
	}
	@RequestMapping("/mergePopup.do")
	public String mergePopup(
	        @RequestParam(required = false) Integer num,
	        @RequestParam(required = false) String subject,
	        @RequestParam(required = false) String sDay,
	        @RequestParam(required = false) String sTime,
	        @RequestParam(required = false) String sMinute,
	        @RequestParam(required = false) String eDay,
	        @RequestParam(required = false) String eTime,
	        @RequestParam(required = false) String eMinute,
	        @RequestParam(required = false) String map_chk,
	        @RequestParam(required = false) String main_chk,
	        @RequestParam(required = false) String map_target,
	        @RequestParam(required = false) String map_url,
	        @RequestParam(required = false) String order,
	        @RequestParam(value = "pop_img", required = false) MultipartFile pop_img,
	        @RequestParam(value = "pop_img2", required = false) MultipartFile pop_img2,
	        @RequestParam(value = "pop_img_bf", required = false) String pop_img_bf,
	        @RequestParam(value = "pop_img2_bf", required = false) String pop_img2_bf
	) throws Exception {
		String filePathTail = "popup";
		PopupVO PopupVO = new PopupVO();
		PopupVO.setNum(num != null ? num : 0);
		PopupVO.setSubject(subject);
		PopupVO.setsDay(sDay != null && !sDay.isEmpty() ? sDay : "1900-01-01");
		PopupVO.setsTime(sTime != null && !sTime.isEmpty() ? sTime : "00");
		PopupVO.setsMinute(sMinute != null && !sMinute.isEmpty() ? sMinute : "00");
		PopupVO.seteDay(eDay != null && !eDay.isEmpty() ? eDay : "2079-06-06");
		PopupVO.seteTime(eTime != null && !eTime.isEmpty() ? eTime : "00");
		PopupVO.seteMinute(eMinute != null && !eMinute.isEmpty() ? eMinute : "00");
		PopupVO.setMain_chk(main_chk);
		PopupVO.setMap_chk(map_chk);
		PopupVO.setMap_target(map_target);
		PopupVO.setMap_url(map_url);
		PopupVO.setOrder(Integer.parseInt(order));

		PopupVO.setSdate(PopupVO.getsDay() + " " + PopupVO.getsTime() + ":" + PopupVO.getsMinute());
		PopupVO.setEdate(PopupVO.geteDay() + " " + PopupVO.geteTime() + ":" + PopupVO.geteMinute());

	    // 파일 처리
	    if (pop_img != null && !pop_img.isEmpty()) {
	        String fileResult = commonService.filesave(pop_img, filePathTail);
	        if (!"false".equals(fileResult)) PopupVO.setPop_img(fileResult);
	    } else {
	    	PopupVO.setPop_img(pop_img_bf);
	    }

	    if (pop_img2 != null && !pop_img2.isEmpty()) {
	        String fileResult = commonService.filesave(pop_img2, filePathTail);
	        if (!"false".equals(fileResult)) PopupVO.setPop_img2(fileResult);
	    } else {
	    	PopupVO.setPop_img2(pop_img2_bf);
	    }

	    int result = adminEtcService.mergePopup(PopupVO);

	    String returnUrl = "";
	    if (result > 0) {
            returnUrl = "redirect:/ePopupList.do";
	    } else {
    		returnUrl = "admin/etc/ePopupList";
	    }

	    return returnUrl;
	}
	@ResponseBody
	@RequestMapping(value = "/mainChkCount.do", method = RequestMethod.GET)
	public String mainChkCount(@ModelAttribute("PopupVO") PopupVO PopupVO)throws Exception {
		PopupVO.setNum(PopupVO.getNum() == null ? 0 : PopupVO.getNum());
		return String.valueOf(adminEtcService.mainChkCount(PopupVO));
	}
	@ResponseBody
	@RequestMapping(value = "/deletePopup.do", method = RequestMethod.GET)
	public String deletePopup(@ModelAttribute("PopupVO") PopupVO PopupVO)throws Exception {
		return String.valueOf(adminEtcService.deletePopup(PopupVO));
	}
	
	@GetMapping("/eMainSlideList.do")
	public String eMainSlideList(@ModelAttribute("SlideVO") SlideVO SlideVO,@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		int listCount = adminEtcService.getSlideListCount(SlideVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> mainsildeList = adminEtcService.SlideList(pi,SlideVO);
		model.addAttribute("mainsildeList", mainsildeList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		return "admin/etc/eMainSlideList";
	}
	@RequestMapping(value = "/eMainSlideWrite.do", method = RequestMethod.GET)
	public String eMainSlideWrite(ModelMap model,@RequestParam(value = "page", required = false) Integer page,
			@ModelAttribute("SlideVO") SlideVO SlideVO) throws Exception {
		SlideVO = adminEtcService.selectSlideDetail(SlideVO);
			model.addAttribute("result", SlideVO);
		return "admin/etc/eMainSlideWrite";
	}
	@RequestMapping("/mergeSlide.do")
	public String mergeSlide(
	        @RequestParam(required = false) Integer num,
	        @RequestParam(required = false) String title,
	        @RequestParam(required = false) String links,
	        @RequestParam(required = false) String use_yn,
	        @RequestParam(required = false) Integer banner_order,
	        @RequestParam(value = "img1", required = false) MultipartFile img1,
	        @RequestParam(value = "img2", required = false) MultipartFile img2,
	        @RequestParam(value = "img1_bf", required = false) String img1_bf,
	        @RequestParam(value = "img2_bf", required = false) String img2_bf
	) throws Exception {
		String filePathTail = "popup";
		SlideVO SlideVO = new SlideVO();
		SlideVO.setNum(num != null ? num : 0);
		SlideVO.setTitle(title);
		SlideVO.setLinks(links);
		SlideVO.setUse_yn(use_yn);
		SlideVO.setBanner_order(banner_order);

	    // 파일 처리
	    if (img1 != null && !img1.isEmpty()) {
	        String fileResult = commonService.filesave(img1, filePathTail);
	        if (!"false".equals(fileResult)) SlideVO.setImg1(fileResult);
	    } else {
	    	SlideVO.setImg1(img1_bf);
	    }

	    if (img2 != null && !img2.isEmpty()) {
	        String fileResult = commonService.filesave(img2, filePathTail);
	        if (!"false".equals(fileResult)) SlideVO.setImg2(fileResult);
	    } else {
	    	SlideVO.setImg2(img2_bf);
	    }

	    int result = adminEtcService.mergeSlide(SlideVO);

	    String returnUrl = "";
	    if (result > 0) {
            returnUrl = "redirect:/eMainSlideList.do";
	    } else {
    		returnUrl = "admin/etc/eMainSlideList";
	    }

	    return returnUrl;
	}
	@ResponseBody
	@RequestMapping(value = "/useYnCount.do", method = RequestMethod.GET)
	public String useYnCount(@ModelAttribute("SlideVO") SlideVO SlideVO)throws Exception {
		SlideVO.setNum(SlideVO.getNum() == null ? 0 : SlideVO.getNum());
		return String.valueOf(adminEtcService.useYnCount(SlideVO));
	}
	@ResponseBody
	@RequestMapping(value = "/deleteSlide.do", method = RequestMethod.GET)
	public String deleteSlide(@ModelAttribute("SlideVO") SlideVO SlideVO)throws Exception {
		return String.valueOf(adminEtcService.deleteSlide(SlideVO));
	}
}
