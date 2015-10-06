package com.tarena.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 报表模块的业务控制器
 * 
 * @author Jsong
 */
@Controller
@RequestMapping("/report")
public class ReportController extends BaseController {
	
	@RequestMapping("/findReport.do")
	public String find() {
		return "report/report_list";
	}

}
