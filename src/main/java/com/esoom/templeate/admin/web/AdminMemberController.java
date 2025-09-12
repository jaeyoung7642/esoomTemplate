package com.esoom.templeate.admin.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoom.templeate.admin.service.AdminMemberService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.AesUtil;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.ShaUtil;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminMemberController {
	@Resource(name = "adminMemeberService")
	private AdminMemberService adminMemeberService;
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;
	@Autowired
    private AesUtil aesUtil;
	@Autowired 
	private ShaUtil shaUtil;

	@GetMapping("/mMemberList.do")
	public String mMemberList(@ModelAttribute("MemberVO") MemberVO MemberVO,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) throws Exception {
		MemberVO.setChk_state(!MemberVO.getChk_state().equals("") ? MemberVO.getChk_state(): "all");
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 15;
		int listCount = adminMemeberService.getMemberListCount(MemberVO);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<?> memberList = adminMemeberService.memberList(pi,MemberVO);
		model.addAttribute("memberList", memberList);
		
		model.addAttribute("startPage", pi.getStartPage());
		model.addAttribute("endPage", pi.getEndPage());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", pi.getMaxPage());
		model.addAttribute("searchKeyword", MemberVO.getSearchKeyword());
		model.addAttribute("select", MemberVO.getSelect());
		model.addAttribute("chk_state", MemberVO.getChk_state());
		return "admin/member/mMemberList";
	}
	@RequestMapping(value = "/mMemberWrite.do", method = RequestMethod.GET)
	public String mMemberWrite(ModelMap model,
			@ModelAttribute("MemberVO") MemberVO MemberVO) throws Exception {
		MemberVO = adminMemeberService.selectMemberDetail(MemberVO);
		MemberVO.setJumin(aesUtil.decryptAes2(MemberVO.getJumin()));
		MemberVO.setEmail(aesUtil.decryptAes2(MemberVO.getEmail()));
		MemberVO.setAddr(aesUtil.decryptAes2(MemberVO.getAddr()));
		MemberVO.setDaddr(aesUtil.decryptAes2(MemberVO.getDaddr()));
		MemberVO.setHtel(aesUtil.decryptAes2(MemberVO.getHtel()));
		model.addAttribute("result", MemberVO);
		return "admin/member/mMemberWrite";
	}
	@ResponseBody
	@RequestMapping(value = "/changePwd.do", method = RequestMethod.POST)
	public String changePwd(@ModelAttribute("MemberVO") MemberVO MemberVO)throws Exception {
		MemberVO.setSha_pwd(shaUtil.encrypt(MemberVO.getPwd()));
		int result = adminMemeberService.changePwd(MemberVO);
		if(result >0) {
			return "true";
		}else {
			return "false";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/updateState.do", method = RequestMethod.GET)
	public String updateState(@ModelAttribute("MemberVO") MemberVO MemberVO)throws Exception {
		return String.valueOf(adminMemeberService.updateState(MemberVO));
	}
}
