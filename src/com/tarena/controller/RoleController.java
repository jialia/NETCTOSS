package com.tarena.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.RoleDao;
import com.tarena.entity.Role;
import com.tarena.entity.page.RolePage;

@Controller
@RequestMapping("/role")
@SessionAttributes("rolePage")
public class RoleController extends BaseController {
	
	@Resource
	private RoleDao roleDao;
	
	
	@RequestMapping("/findRole.do")
	public String find(RolePage page , Model model) {
		//查询当前页面数据
		List<Role> list = roleDao.findByPage(page);
		model.addAttribute("roles", list);
		//查询总行数
		page.setRows(roleDao.findRows());
		model.addAttribute("rolePage",page);
		return "role/role_list";
	}

}
