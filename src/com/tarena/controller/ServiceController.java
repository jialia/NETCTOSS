package com.tarena.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.CostDao;
import com.tarena.dao.ServiceDao;
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
	
	@RequestMapping("startService.do")
	public String updateStart(@RequestParam("id")int id) {
		serviceDao.start(id);
		return "redirect:findService.do";
	}
	
	@RequestMapping("pauseService.do")
	public String updatePause(@RequestParam("id")int id) {
		serviceDao.pause(id);
		return "redirect:findService.do";
	}
	
	@RequestMapping("deleteService.do")
	public String deleteStart(@RequestParam("id")int id) {
		serviceDao.delete(id);
		return "redirect:findService.do";
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
