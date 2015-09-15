package com.tarena.controller;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tarena.dao.CostDao;
import com.tarena.entity.Cost;
import com.tarena.entity.page.CostPage;


/**
 * 资费模块的业务控制器，用来处理资费的增删改查业务
 * 
 * @author Jsong
 */
@Controller
@RequestMapping("/cost")
public class CostController implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CostDao dao;
	
//	@RequestMapping("/findCost.do")
//	public String find(Model model) {
//		List<Cost> list =  dao.findAll();
//		model.addAttribute("costs", list);
//		return "cost/cost_list";
//	}
	
	@RequestMapping("/findCost.do")
	public String find(Model model , CostPage page) {
		//查询某一页的数据
		List<Cost> list =  dao.findBySort(page);
//		List<Cost> list =  dao.findByPage(page);
		model.addAttribute("costs", list);
		//计算总行数
		page.setRows(dao.findRows());
		model.addAttribute("costPage", page);
		return "cost/cost_list";
	}
	
	@RequestMapping("/toAddCost.do")
	public String toAdd() {
		return "cost/add_cost";
	}
	
	@RequestMapping("/addCost.do")
	public String add(Cost cost) {
		//保存前设置默认值
		cost.setStatus(0);
		cost.setCreatime(new Timestamp(System.currentTimeMillis()));
		dao.save(cost);
		return "redirect:findCost.do";
	}
	
	@RequestMapping("/toUpdateCost.do")
	public String toUpdate(@RequestParam("id")int id , Model model) {
		Cost cost = dao.findById(id);
		model.addAttribute("cost",cost);
		return "cost/update_cost";
	}
	
	@RequestMapping("/updateCost.do")
	public String update(Cost cost) {
		dao.update(cost);
		return "redirect:findCost.do";
	}
	
	@RequestMapping("/deleteCost.do")
	public String delete(@RequestParam("id") int id) {
		dao.delete(id);
		return "redirect:findCost.do";
	}
	
	@RequestMapping("/detailCost.do")
	public String toDetail(@RequestParam("id")int id , Model model) {
		Cost cost = dao.findById(id);
		model.addAttribute("cost",cost);
		return "cost/detail_cost";
	}

}
