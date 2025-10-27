package com.esoom.templeate.admin.common.web;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/cmsAdm")
public class AdminCommonController {

	@GetMapping("/adminHeader.do")
	public String adminHeader(ModelMap model) throws Exception {
		return "admin/common/adminHeader";
	}
}
