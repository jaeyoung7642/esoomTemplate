package com.esoom.templeate.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.esoom.templeate.admin.service.AdminEventService;
import com.esoom.templeate.admin.service.AdminLoginService;
import com.esoom.templeate.admin.service.AdminNoticeService;
import com.esoom.templeate.admin.service.AdminVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.IpUtil;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.common.Pagination;
import com.esoom.templeate.common.service.CommonService;

@Controller
public class AdminLoginController {
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "adminLoginService")
	private AdminLoginService adminLoginService;
	@Autowired
	private IpUtil ipUtil;

	@GetMapping(value = "/adminLoginForm.do")
	public String login(HttpServletRequest request) {
		String id = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("remember")) {
					id = cookie.getValue();
				}
			}
		}
		request.setAttribute("remember", id);
		return "admin/login/adminLogin";
	}
	@GetMapping(value = "/adminLogout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/adminLoginForm.do";
	}
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public String adminLogin(HttpSession session, @RequestParam(value = "id") String id,
			@RequestParam(value = "password") String pwd,String remember,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String returnUrl = "";
		if(remember == null) {
			remember = "";
		}
		AdminVO adminVo = new AdminVO();
		adminVo.setId(id);
		// 입력한 아이디로 사용자 정보 조회
		AdminVO userInfo = adminLoginService.getAdmin(adminVo);
		System.out.println("userInfo"+userInfo);
		if (userInfo != null) {
			if (remember.equals("on")) {
	            Cookie cookie = new Cookie("remember", userInfo.getId());
	            response.addCookie(cookie);
	        } else {
	            Cookie cookie = new Cookie("remember", "");
	            response.addCookie(cookie);
	        }
			// 비밀번호 암호화된 정보와 입력한 비밀번호 비교
//			if (bcryptPasswordEncoder.matches(pwd, userInfo.get("member_pwd").toString())) { // 로그인 성공
			if (pwd.equals(userInfo.getPwd())) { // 로그인 성공
				String ip = ipUtil.getClientIP(request);
				adminVo.setIp(ip);
				adminLoginService.insertLoginInfo(adminVo);
				if("70".equals(userInfo.getChk_grade())) {
					session.setMaxInactiveInterval(30 * 60);
					session.setAttribute("user", userInfo);
					returnUrl = "redirect:/fFreeList.do";
				}else {
					System.out.println("2");
					session.setMaxInactiveInterval(30 * 60);
					session.setAttribute("user", userInfo);
					returnUrl = "redirect:/mNewsList.do";
				}
			} else {// 비밀번호가 틀렸을 경우
				System.out.println("3");
				returnUrl = "admin/login/adminLogin";
			}
		} else { // 아이디가 없을 경우
			System.out.println("4");
			returnUrl = "admin/login/adminLogin";
		}
		return returnUrl;
	}
}
