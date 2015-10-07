package com.tarena.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.dao.AdminDao;
import com.tarena.entity.Admin;

/**
 * 用户信息模块的业务控制器
 * 		包含用户信息、密码更改两个模块
 * 
 * @author Jsong
 */
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
	
	@ResponseBody
	@RequestMapping("/updateUserInfo.do")
	public  Map<String, Object> update(Admin admin , HttpSession session , Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		adminDao.update(admin);
		//更新Session
		session.removeAttribute("admin");
		session.setAttribute("admin", admin);
		
		result.put("success", true);
		result.put("message", "保存成功");
		return result;
	}
	
	@RequestMapping("/toUserPassword.do")
	public String toUserPassword() {
		return "user/user_pwd";
	}
	
}
