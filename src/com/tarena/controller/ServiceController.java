package com.tarena.controller;

import java.math.BigDecimal;
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

import com.tarena.dao.AccountDao;
import com.tarena.dao.CostDao;
import com.tarena.dao.ServiceDao;
import com.tarena.entity.Account;
import com.tarena.entity.Cost;
import com.tarena.entity.Service;
import com.tarena.entity.page.ServicePage;

@Controller
@RequestMapping("/service")
@SessionAttributes("servicePage")
public class ServiceController extends BaseController {
	
	@Resource
	private ServiceDao serviceDao;
	
	@Resource
	private AccountDao accountDao;
	
	@Resource
	private CostDao costDao;

	@RequestMapping("/findService.do")
	public String find(ServicePage page , Model model) {
		List<Map<String, Object>> list = serviceDao.findByPage(page);
		model.addAttribute("services",list);
		
		// 查询总行数
		page.setRows(serviceDao.findRows(page));
		model.addAttribute("servicePage", page);
		return "service/service_list";
	}
	
	@ResponseBody
	@RequestMapping("startService.do")
	public Map<String, Object> updateStart(@RequestParam("id")int id) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		//检测对应的账务账号是否开通
		Map<String, Object> service = serviceDao.findById(id);
		Integer account_id = ((BigDecimal)service.get("ACCOUNT_ID")).intValue();
		Account account = accountDao.findById(account_id);
		if (account.getStatus().equals("0")) {
			serviceDao.start(id);
			//成功开通，给予正确提示
			result.put("success", true);
			result.put("message", "开通成功");
		} else {
			result.put("success", false);
			result.put("message", "账务账号未开通，不能开通当前业务账号。");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("pauseService.do")
	public Map<String, Object> updatePause(@RequestParam("id")int id) {
		Map<String, Object> result = new HashMap<String, Object>();
		serviceDao.pause(id);
		
		result.put("success", true);
		result.put("message", "暂停成功");
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteService.do")
	public Map<String, Object> deleteStart(@RequestParam("id")int id) {
		Map<String, Object> result = new HashMap<String, Object>();
		serviceDao.delete(id);
		
		result.put("success", true);
		result.put("message", "删除成功");
		
		return result;
	}
	
	@RequestMapping("toUpdateService.do")
	public String toUpdate(@RequestParam("id")int id , Model model){
		Map<String, Object> service = serviceDao.findById(id);
		model.addAttribute("service", service);
		
		List<Cost> costs = costDao.findAll();
		model.addAttribute("costs", costs);
		return "service/update_service";
	}
	
	@RequestMapping("updateService.do")
	public String updateService(Service service){
		serviceDao.update(service);
		return "redirect:findService.do";
	}
}
