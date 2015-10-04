package com.tarena.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tarena.dao.AdminDao;
import com.tarena.dao.RoleDao;
import com.tarena.entity.Admin;
import com.tarena.entity.Role;
import com.tarena.entity.page.AdminPage;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	private AdminDao adminDao;
	
	@Resource
	private RoleDao roleDao;
	
	@RequestMapping("/findAdmin.do")
	public String find(AdminPage page , Model model) {
		List<Admin> admins = adminDao.findByPage(page);
		model.addAttribute("admins", admins);
		
		page.setRows(adminDao.findRows());
		model.addAttribute("adminPage", page);
		return "admin/admin_list";
	}
	
	@RequestMapping("/toAddAdmin")
	public String toAdd(Model model) {
		//角色数据
		List<Role> list = roleDao.findAllRole();
		model.addAttribute("roles", list);
		
		return "admin/add_admin";
	}
	
	@RequestMapping("/addAdmin")
	public String add(Admin admin , Model model) {
		admin.setEnrolldate(new Timestamp(System.currentTimeMillis()));
		adminDao.save(admin);
		
		List<Integer> roles = admin.getRoleIds();
		if (roles != null && roles.size() > 0) {
			for (Integer roleId : roles) {
				Map<String, Object> adminRole = new HashMap<String, Object>();
				adminRole.put("admin_id", admin.getAdmin_id());
				adminRole.put("role_id", roleId);
				adminDao.saveAdminRole(adminRole);
			}
			
		}
		return "redirect:findAdmin.do";
	}

	@RequestMapping("/deleteAdmin.do")
	public String delete(@RequestParam("id")int id,Model model) {
		adminDao.deleteAdminRole(id);
		adminDao.delete(id);
		return "redirect:findAdmin.do";
	}
	
	@RequestMapping("/toUpdateAdmin")
	public String toUpdate(@RequestParam("id")int id,Model model){
		List<Role> list = roleDao.findAllRole();
		model.addAttribute("roles", list);
		
		Admin admin = adminDao.findById(id);
		model.addAttribute("admin",admin);
		
		return "admin/update_admin";
	}
	
	@RequestMapping("/updateAdmin")
	public String update(Admin admin , Model model) {
		adminDao.update(admin);
		
		adminDao.deleteAdminRole(admin.getAdmin_id());
		List<Integer> roles = admin.getRoleIds();
		if (roles != null && roles.size() > 0) {
			for (Integer roleId : roles) {
				Map<String, Object> adminRole = new HashMap<String, Object>();
				adminRole.put("admin_id", admin.getAdmin_id());
				adminRole.put("role_id", roleId);
				adminDao.saveAdminRole(adminRole);
			}
		}
		return "redirect:findAdmin.do";
	}

}
