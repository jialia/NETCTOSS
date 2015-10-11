package com.tarena.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarena.dao.BillDao;
import com.tarena.entity.Bill;
import com.tarena.entity.Detail;
import com.tarena.entity.Item;
import com.tarena.entity.page.BillPage;
import com.tarena.entity.page.DetailPage;
import com.tarena.entity.page.ItemPage;

/**
 * 账单模块的业务控制器
 * 
 * @author Jsong
 */
@Controller
@RequestMapping("/bill")
public class BillController extends BaseController {
	
	@Resource
	private BillDao billDao;

	@RequestMapping("/findBill.do")
	public String find(BillPage page , Model model) {
		List<Bill> bills = billDao.findByPage(page);
		model.addAttribute("bills",bills);
		
		page.setRows(billDao.findBillRows(page));
		model.addAttribute("billPage",page);
		return "bill/bill_list";
	}
	
	@RequestMapping("/findItem.do")
	public String findItem(ItemPage page , Model model) {
		List<Item> items = billDao.findItemByPage(page);
		model.addAttribute("items",items);
		
		Bill bill = billDao.findBillById(page.getBill_id());
		model.addAttribute("bill",bill);
		
		page.setRows(billDao.findItemRows(page));
		model.addAttribute("itemPage",page);
		return "bill/bill_item";
	}
	
	@RequestMapping("/findDetail.do")
	public String findDetail(DetailPage page , Model model) {
		List<Detail> Details = billDao.findDetailByPage(page);
		model.addAttribute("details",Details);
		
		Item item = billDao.findItemById(page.getItem_id());
		model.addAttribute("item",item);
		
		page.setRows(billDao.findDetailRows(page));
		model.addAttribute("detailPage",page);
		return "bill/bill_service_detail";
	}
	
}
