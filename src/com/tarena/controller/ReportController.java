package com.tarena.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController {
	
	@RequestMapping("/findReport.do")
	public String find() {
		return "report/report_list";
	}

}
