package com.tarena.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarena.dao.AccountDao;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Resource
	private AccountDao accDao;
	
	@RequestMapping("/findAccount.do")
	public String find(AccountPage page , Model model) {
		//查询出当前页的数据
		List<Account> list = accDao.findByPage(page);
		model.addAttribute("accounts", list);
		
		//查询出总行数，从而计算出总页数
		page.setRows(accDao.findRows(page));
		model.addAttribute("accountPage", page);
		return "account/account_list";
	}

}
