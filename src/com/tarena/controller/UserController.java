package com.tarena.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarena.dao.AdminDao;
import com.tarena.entity.Admin;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Resource
	private AdminDao adminDao;
	
	@RequestMapping("/toUserInfo.do")
	public String toUserInfo(HttpSession session , Model model) {
		Admin admin = (Admin) session.getAttribute("admin");
		Admin user = adminDao.findById(admin.getAdmin_id());
		model.addAttribute("user", user);
		return "user/user_info";
	}
	
	@RequestMapping("/updateUserInfo.do")
	public String update(Admin admin , HttpSession session , Model model) {
		adminDao.update(admin);
		//更新Session
		session.removeAttribute("admin");
		session.setAttribute("admin", admin);
		return "redirect:../login/toIndex.do";
	}
	
	@RequestMapping("/toUserPassword.do")
	public String toUserPassword() {
		return "user/user_pwd";
	}
	
}
