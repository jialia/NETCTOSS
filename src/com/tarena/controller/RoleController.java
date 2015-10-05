package com.tarena.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.RoleDao;
import com.tarena.entity.Module;
import com.tarena.entity.Role;
import com.tarena.entity.page.RolePage;

/**
 * 角色模块的业务控制器
 * 
 * @author Jsong
 */
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
	
	@RequestMapping("/toAddRole.do")
	public String toAdd(Model model) {
		List<Module> list = roleDao.findAllModules();
		model.addAttribute("modules",list);
		return "role/add_role";
	}
	
	@RequestMapping("/addRole.do")
	public String add(Role role) {
		roleDao.save(role);
		List<Integer> moduleIds = role.getModuleIds();
		if (moduleIds != null && moduleIds.size() > 0) {
			for (Integer muduleId : moduleIds) {
				Map<String, Object> roleModule = new HashMap<String, Object>();
				roleModule.put("role_id", role.getRole_id());
				roleModule.put("module_id", muduleId);
				roleDao.saveRoleModule(roleModule);
			}
		}
		return "redirect:findRole.do";
	}
	
	@ResponseBody
	@RequestMapping("/deleteRole.do")
	public Map<String, Object> delete(@RequestParam("id")int id) {
		Map<String, Object> result = new HashMap<String, Object>();
		roleDao.deleteroleModule(id);
		roleDao.delete(id);
		
		result.put("success", true);
		result.put("message", "删除成功");
		return result;
	}
	
	@RequestMapping("/toUpdateRole.do")
	public String toUpdate(@RequestParam("id")int id , Model model) {
		List<Module> list = roleDao.findAllModules();
		model.addAttribute("modules", list);
		Role role = roleDao.findById(id);
		model.addAttribute("role", role);
		return "role/update_role";
	}
	
	@RequestMapping("/updateRole.do")
	public String update(Role role) {
		//更新角色表
		roleDao.update(role);
		//删除中间表
		roleDao.deleteroleModule(role.getRole_id());
		//添加中间表
		List<Integer> moduleIds = role.getModuleIds();
		if (moduleIds != null && moduleIds.size() > 0) {
			for (Integer muduleId : moduleIds) {
				Map<String, Object> roleModule = new HashMap<String, Object>();
				roleModule.put("role_id", role.getRole_id());
				roleModule.put("module_id", muduleId);
				roleDao.saveRoleModule(roleModule);
			}
		}
		return "redirect:findRole.do";
	}

}
