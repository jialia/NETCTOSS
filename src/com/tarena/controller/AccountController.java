package com.tarena.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("startAccount.do")
	public String updateStart(@RequestParam("id")int id){
		//暂停账务账号
		accDao.start(id);
		return "redirect:findAccount.do";
	}
	
	@RequestMapping("pauseAccount.do")
	public String updatePause(@RequestParam("id")int id){
		//暂停账务账号
		accDao.pause(id);
		
		// TODO 暂停账务账号时，要暂停它下属的业务账号
		
		return "redirect:findAccount.do";
	}
	
	@RequestMapping("deleteAccount.do")
	public String updateDelete(@RequestParam("id")int id){
		//暂停账务账号
		accDao.delete(id);
		
		// TODO 删除账务账号时，要删除它下属的业务账号
		
		return "redirect:findAccount.do";
	}

}
