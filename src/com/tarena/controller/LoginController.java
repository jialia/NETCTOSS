package com.tarena.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.dao.AdminDao;
import com.tarena.entity.Admin;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {
	
	@Resource
	private AdminDao adminDao;
	
	private final static int SUCCESS = 0;
	
	private final static int ADMIN_CODE_ERROR = 1;
	
	private final static int PASSWORD_ERROR = 2;
	
	private final static int IMAGE_CODE_ERROR = 3;
	
	@RequestMapping("toLogin.do")
	public String toLogin() {
		return "main/login";
	}
	
	@ResponseBody
	@RequestMapping("/checkLogin.do")
	public Map<String, Object> checkLogin(
			@RequestParam("adminCode")String adminCode ,
			@RequestParam("password")String password) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Admin admin = adminDao.findByCode(adminCode);
		if (admin == null) {
			result.put("flag", ADMIN_CODE_ERROR);
		} else if(!admin.getPassword().equals(password)) {
			result.put("flag", PASSWORD_ERROR);
		} else {
			result.put("flag", SUCCESS);
		}
		return result;
	}
	
	@RequestMapping("/toIndex.do")
	public String toIndex(){
		return "main/index";
	}

}
