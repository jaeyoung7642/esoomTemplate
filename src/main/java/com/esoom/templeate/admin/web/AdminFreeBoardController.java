package com.esoom.templeate.admin.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.esoom.templeate.admin.service.AdminEventService;
import com.esoom.templeate.admin.service.AdminFreeService;
import com.esoom.templeate.admin.service.AdminMemberService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.admin.service.PopupVO;
import com.esoom.templeate.common.IpUtil;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminFreeBoardController {
	@Resource(name = "adminFreeService")
	private AdminFreeService adminFreeService;
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "adminMemeberService")
	private AdminMemberService adminMemeberService;
	@Autowired
	private IpUtil ipUtil;
	

	@GetMapping("/fFreeList.do")
	public String fFreeList(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;

		int listCount = adminFreeService.getFreeListCount(FreeBoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> freeList = adminFreeService.freeList(pi,FreeBoardVO);
		model.addAttribute("freeList", freeList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", FreeBoardVO.getSearchKeyword());
		model.addAttribute("searchTitle", FreeBoardVO.getSearchTitle());
		model.addAttribute("searchContent", FreeBoardVO.getSearchContent());
		model.addAttribute("searchWriter", FreeBoardVO.getSearchWriter());
		model.addAttribute("searchTail", FreeBoardVO.getSearchTail());
		model.addAttribute("searchTailWriter", FreeBoardVO.getSearchTailWriter());
		model.addAttribute("searchChk_del", FreeBoardVO.getSearchChk_del());
		return "admin/board/fFreeList";
	}
	@ResponseBody
	@RequestMapping(value = "/detailData.do", method = RequestMethod.POST)
	public FreeBoardVO detailData(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO) throws Exception{
		FreeBoardVO result = adminFreeService.selectFreeDetail(FreeBoardVO);
		if(result != null) {
			String content = result.getContent();
			result.setContent(Jsoup.clean(content, Safelist.none()).replaceAll("&nbsp;", ""));
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/writerData.do", method = RequestMethod.POST)
	public MemberVO writerData(@ModelAttribute("MemberVO") MemberVO MemberVO) throws Exception{
		return adminMemeberService.selectMemberDetail(MemberVO);
	}
	@ResponseBody
	@RequestMapping(value = "/changeChkDel.do", method = RequestMethod.GET)
	public String changeChkDel(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO)throws Exception {
		if("Y".equals(FreeBoardVO.getChk_del())) {
			FreeBoardVO.setChk_del("N");
		}else {
			FreeBoardVO.setChk_del("Y");
		}
		int result=adminFreeService.changeChkDel(FreeBoardVO);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/fFreeDetail.do", method = RequestMethod.GET)
	public String fFreeDetail(ModelMap model,@RequestParam(value = "page", required = false) Integer page,
			@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		
		FreeBoardVO freeDetail = adminFreeService.selectFreeDetail(FreeBoardVO);
		model.addAttribute("result", freeDetail);
		FreeTailVO freeTailVO = new FreeTailVO();
		freeTailVO.setInfo_num(FreeBoardVO.getNum());
		int listCount = adminFreeService.getFreeTailListCount(freeTailVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> freeTailList = adminFreeService.freeTailList(pi, freeTailVO);
		model.addAttribute("freeTailList", freeTailList);
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		
		int listCount2 = adminFreeService.getFreeListCount(FreeBoardVO);
		PageInfo pi2 = Pagination.getPageInfo(FreeBoardVO.getListpage(), listCount2, boardLimit);
		List<?> freeList = adminFreeService.freeList(pi2,FreeBoardVO);
		model.addAttribute("freeList", freeList);
		model.addAttribute("startPage2", pi2.getStartPage());
		model.addAttribute("endPage2", pi2.getEndPage());
		model.addAttribute("currentPage2", FreeBoardVO.getListpage());
		model.addAttribute("maxPage2", pi2.getMaxPage());
		model.addAttribute("searchKeyword", FreeBoardVO.getSearchKeyword());
		model.addAttribute("searchTitle", FreeBoardVO.getSearchTitle());
		model.addAttribute("searchContent", FreeBoardVO.getSearchContent());
		model.addAttribute("searchWriter", FreeBoardVO.getSearchWriter());
		model.addAttribute("searchTail", FreeBoardVO.getSearchTail());
		model.addAttribute("searchTailWriter", FreeBoardVO.getSearchTailWriter());
		model.addAttribute("searchChk_del", FreeBoardVO.getSearchChk_del());
		
		return "admin/board/fFreeDetail";
	}
	@ResponseBody
	@RequestMapping(value = "/insertFreeTail.do", method = RequestMethod.POST)
	public String insertFreeTail(@ModelAttribute("FreeTailVO") FreeTailVO FreeTailVO,HttpSession session,HttpServletRequest request)throws Exception {
		Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("user");
		if(userInfo != null) {
			FreeTailVO.setId(userInfo.get("id").toString());
			if("adm".equals(userInfo.get("id"))) {
				FreeTailVO.setWriter("KCC농구단");
			}else {
				FreeTailVO.setWriter(userInfo.get("name").toString());
			}
		}else {
			FreeTailVO.setId("test");
			FreeTailVO.setWriter("테스트");
		}
		String ip = ipUtil.getClientIP(request);
		FreeTailVO.setIp(ip);
		int result=adminFreeService.insertFreeTail(FreeTailVO);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteFreeTail.do", method = RequestMethod.GET)
	public String deleteFreeTail(@ModelAttribute("FreeTailVO") FreeTailVO FreeTailVO)throws Exception {
		int result=adminFreeService.deleteFreeTail(FreeTailVO);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteFree.do", method = RequestMethod.GET)
	public String deleteFree(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO)throws Exception {
		int result=adminFreeService.deleteFree(FreeBoardVO);
		return String.valueOf(result);
	}
	@RequestMapping("/mergeFree.do")
	public String mergeFree(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,HttpServletRequest request
	) throws Exception {
		FreeBoardVO.setIp(ipUtil.getClientIP(request));
	    int result = adminFreeService.mergeFree(FreeBoardVO);

	    String returnUrl = "";
	    if (result > 0) {
            returnUrl = "redirect:/fFreeList.do";
	    } else {
    		returnUrl = "admin/board/fFreeList";
	    }

	    return returnUrl;
	}
	@RequestMapping(value = "/fFreeWrite.do", method = RequestMethod.GET)
	public String fFreeWrite(ModelMap model,
			@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,HttpSession session) throws Exception {
		//수정
		if(FreeBoardVO.getNum() != null && FreeBoardVO.getNum()!=0) {
			FreeBoardVO freeDetail = adminFreeService.selectFreeDetail(FreeBoardVO);
			model.addAttribute("result", freeDetail);
		}else {//등록
			Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("user");
			if(userInfo != null) {
				FreeBoardVO.setId(userInfo.get("id").toString());
				if("adm".equals(userInfo.get("id"))) {
					FreeBoardVO.setWriter("KCC농구단");
				}else {
					FreeBoardVO.setWriter(userInfo.get("name").toString());
				}
			}else {
				FreeBoardVO.setId("test");
				FreeBoardVO.setWriter("테스트");
			}
			model.addAttribute("result", FreeBoardVO);
		}
		return "admin/board/fFreeWrite";
	}
}
