package com.tarena.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public  Map<String, Object> update(Admin admin , HttpSession session) {
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

	@ResponseBody
	@RequestMapping("/updateUserPassword.do")
	public Map<String, Object> updatePassword(@RequestParam("old_password")String oldPassword , 
			@RequestParam("password")String password , HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		Admin admin = (Admin) session.getAttribute("admin");

		Admin user = adminDao.findById(admin.getAdmin_id());
		if (!user.getPassword().equals(oldPassword)) {
			result.put("success", false);
			result.put("message", "原密码不符");
		}else {
			Map<String, Object> param = new HashMap<String, Object>();
			List<Integer> list = new ArrayList<Integer>();
			list.add(admin.getAdmin_id());
			param.put("ids", list);
			param.put("password", password);
			adminDao.updatePassword(param);

			result.put("success", true);
			result.put("message", "保存成功");
		}
		return result;
	}

}
