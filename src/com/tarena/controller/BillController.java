package com.tarena.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bill")
public class BillController extends BaseController {

	@RequestMapping("/findBill.do")
	public String find() {
		return "bill/bill_list";
	}
	
}
