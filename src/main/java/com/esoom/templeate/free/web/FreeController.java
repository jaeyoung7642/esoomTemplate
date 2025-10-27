package com.esoom.templeate.free.web;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.IpUtil;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;
import com.esoom.templeate.etc.service.EtcService;
import com.esoom.templeate.free.service.FreeService;
import com.esoom.templeate.movie.service.MovieService;
import com.esoom.templeate.news.service.NewsService;
import com.esoom.templeate.notice.service.NoticeService;
import com.esoom.templeate.photo.service.PhotoService;


@Controller
public class FreeController {
	@Autowired
	private FreeService freeService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private IpUtil ipUtil;
	private static final String SECRET_KEY = "6Le1xioqAAAAAB_6w1FzKDydmVukW_rE4jcM3K7Z";
	@GetMapping("/freeList.do")
	public String freeList(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 15;
		
		List<?> topFreeList = freeService.topFreeList(FreeBoardVO);
		model.addAttribute("topFreeList", topFreeList);
		
		int listCount = freeService.getFreeListCount(FreeBoardVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> freeList = freeService.freeList(pi,FreeBoardVO);
		model.addAttribute("freeList", freeList);
		
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		model.addAttribute("startPage2", pi2.getStartPage());
		model.addAttribute("endPage2", pi2.getEndPage());
		model.addAttribute("maxPage2", pi2.getMaxPage());
		
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
		return "board/freeList";
	}
	@GetMapping("/freeDetail.do")
	public String freeDetail(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		
		FreeBoardVO freeDetail = freeService.freeDetail(FreeBoardVO);
		model.addAttribute("freeDetail", freeDetail);
		
		FreeTailVO freeTailVO = new FreeTailVO();
		freeTailVO.setInfo_num(FreeBoardVO.getNum());
		int listCount = freeService.getFreeTailListCount(freeTailVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> tailList = freeService.freeTailList(pi, freeTailVO);
		model.addAttribute("tailList", tailList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("listpage", listpage);
		model.addAttribute("searchKeyword", FreeBoardVO.getSearchKeyword());
		model.addAttribute("searchTitle", FreeBoardVO.getSearchTitle());
		model.addAttribute("searchContent", FreeBoardVO.getSearchContent());
		model.addAttribute("searchWriter", FreeBoardVO.getSearchWriter());
		model.addAttribute("searchTail", FreeBoardVO.getSearchTail());
		model.addAttribute("searchTailWriter", FreeBoardVO.getSearchTailWriter());
		model.addAttribute("searchChk_del", FreeBoardVO.getSearchChk_del());
		return "board/freeDetail";
	}
	@GetMapping("/freeWriteForm.do")
	public String freeWriteForm(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		if(FreeBoardVO.getNum() != null && FreeBoardVO.getNum() != 0) {
			FreeBoardVO freeDetail = freeService.freeDetail(FreeBoardVO);
			String content2 = commonService.HtmlUnescape(freeDetail.getContent());
			freeDetail.setContent(content2);
			model.addAttribute("freeDetail", freeDetail);
		}
		return "board/freeWriteForm";
	}
	@RequestMapping(value = "/freeWrite.do", method = RequestMethod.POST)
	public String freeWrite(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,@RequestParam("recaptchaResponse") String recaptchaResponse,HttpServletRequest request,
			 ModelMap model) throws Exception {
		String returnUrl = "";
		try {
        	String url = "https://www.google.com/recaptcha/api/siteverify";
            String params = "secret=" + SECRET_KEY + "&response=" + recaptchaResponse;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);
            con.getOutputStream().write(params.getBytes("UTF-8"));

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Check if reCAPTCHA verification was successful
            boolean success = response.toString().contains("\"success\": true");

            if (success) {
        		String ip = ipUtil.getClientIP(request);
        		FreeBoardVO.setIp(ip);
        		int result = freeService.mergeFree(FreeBoardVO);
        		if (result > 0) {
        			returnUrl ="redirect:/freeList.do";
        		} else {
        			System.out.println("머지오류");
        			model.addAttribute("msg", "서버 오류! 관리자에게 문의 바랍니다.");
        			returnUrl ="redirect:/freeWriteForm.do";
        		}
            } else {
            	model.addAttribute("msg", "캡차인증 실패했습니다. 다시 시도해주세요.");
            	returnUrl ="redirect:/freeWriteForm.do";
            }
        } catch (Exception e) {
        	System.out.println(e);
        	model.addAttribute("msg", "서버 오류! 관리자에게 문의 바랍니다.");
        	returnUrl ="redirect:/freeWriteForm.do";
        }
		return returnUrl;
	}
	@ResponseBody
	@GetMapping("/freeDelete.do")
	public String freeDelete(@ModelAttribute("FreeBoardVO") FreeBoardVO FreeBoardVO,
			ModelMap model) throws Exception {
		int result=freeService.freeDelete(FreeBoardVO);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/contentWriteFree.do", method = RequestMethod.GET)
	public String contentWrite(@ModelAttribute("FreeTailVO") FreeTailVO FreeTailVO,HttpSession session,HttpServletRequest request,String part)throws Exception {
		MemberVO loginUserMap =  (MemberVO)session.getAttribute("loginUserMap");
		String id = loginUserMap.getId();
		FreeTailVO.setId(id);
		String name = loginUserMap.getName();
		FreeTailVO.setWriter(name);
		String ip = ipUtil.getClientIP(request);
		FreeTailVO.setIp(ip);
		int result=freeService.contentWrite(FreeTailVO);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/contentPageFree.do", method = RequestMethod.GET)
	public String contentPage(ModelMap model,int page,@ModelAttribute("FreeTailVO") FreeTailVO FreeTailVO)throws Exception {
		// 현재 페이지
		int currentPage = page;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		// 상위리스트 카운트
		int listCount = freeService.getFreeTailListCount(FreeTailVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> tailList = freeService.freeTailList(pi,FreeTailVO); 
		
		model.addAttribute("tailList", tailList);
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		return "board/noticeDetailAjax";
	}
	@ResponseBody
	@RequestMapping(value = "/contentDeleteFree.do", method = RequestMethod.GET)
	public String contentDelete(@ModelAttribute("FreeTailVO") FreeTailVO FreeTailVO)throws Exception {
		int result=freeService.contentDelete(FreeTailVO);
		return String.valueOf(result);
	}
}
