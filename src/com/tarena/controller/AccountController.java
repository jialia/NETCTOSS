package com.tarena.controller;

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
import com.tarena.dao.ServiceDao;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

@Controller
@RequestMapping("/account")
@SessionAttributes("accountPage")
public class AccountController extends BaseController {
	
	@Resource
	private AccountDao accDao;
	
	@Resource
	private ServiceDao serDao;
	
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
	
	@ResponseBody
	@RequestMapping("startAccount.do")
	public Map<String, Object> updateStart(@RequestParam("id")int id){
		Map<String, Object> result = new HashMap<String, Object>();
		//开通账务账号
		accDao.start(id);
		
		result.put("success", true);
		result.put("message", "开通成功");
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("pauseAccount.do")
	public Map<String, Object> updatePause(@RequestParam("id")int id){
		Map<String, Object> result = new HashMap<String, Object>();
		//暂停账务账号
		accDao.pause(id);
		serDao.pauseByAccountID(id);
		
		result.put("success", true);
		result.put("message", "暂停成功，且已暂停其下属的业务账号！");
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteAccount.do")
	public Map<String, Object> updateDelete(@RequestParam("id")int id){
		Map<String, Object> result = new HashMap<String, Object>();
		//暂停账务账号
		accDao.delete(id);
		serDao.deleteByAccountID(id);
		
		result.put("success", true);
		result.put("message", "删除成功，且已删除其下属的业务账号！");
		
		return result;
	}
	
	@RequestMapping("toUpdateAccount.do")
	public String toUpdate(@RequestParam("id") int id ,Model model) {
		Account account = accDao.findById(id);
		model.addAttribute("account", account);
		return "account/update_account";
	}
	
	@RequestMapping("updateAccount.do")
	public String updateAccount(Account account){
		accDao.update(account);
		return "redirect:findAccount.do";
	}

	@RequestMapping("detailAccount.do")
	public String toDetail(@RequestParam("id") int id ,Model model) {
		Account account = accDao.findById(id);
		model.addAttribute("account", account);
		return "account/detail_account";
	}
	
	@RequestMapping("toAddAccount.do")
	public String toAdd() {
		return"account/add_account";
	}
}
