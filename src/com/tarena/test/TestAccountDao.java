package com.tarena.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.AccountDao;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

public class TestAccountDao {
	
//	@Test
	public void testFindByDao() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		AccountPage page = new AccountPage();
		page.setStatus("1");
		page.setCurrentPage(2);
		List<Account> list = dao.findByPage(page);
		for (Account account : list) {
			System.out.println(account.getAccount_id());
			System.out.println(account.getReal_name());
			System.out.println(account.getIdcard_no());
		}
	}
	
//	@Test
	public void testFindRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		AccountPage page = new AccountPage();
		page.setCurrentPage(2);
		int rows = dao.findRows(page);
		System.out.println(rows);
	}
	
//	@Test
	public void testPause(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		dao.pause(1005);
	}
	
//	@Test
	public void testStart(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		dao.start(1005);
	}
	
//	@Test
	public void testDelete(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		dao.delete(1005);
	}
	
//	@Test
	public void testFindById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		System.out.println(dao.findById(1005));
	}
	
//	@Test
	public void testUpdate() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		Account account = dao.findById(1005);
		account.setEmail("zsf@wds.com");
		dao.update(account);
	}
	
	@Test
	public void testFingByIdcardNo() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		Account account = dao.findByIdcardNo("410381194302256528");
		System.out.println(account.getReal_name());
	}

}
