package com.tarena.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarena.dao.BillDao;
import com.tarena.entity.Bill;
import com.tarena.entity.page.BillPage;

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
		return "bill/bill_list";
	}
	
}
