package com.tarena.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.BillDao;
import com.tarena.entity.page.BillPage;
import com.tarena.entity.page.DetailPage;
import com.tarena.entity.page.ItemPage;

public class TestBillDao {
	
//	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		BillPage page = new BillPage();
		page.setYear(2015);
		page.setMonth(2);
		System.out.println(page.getBill_month());
		System.out.println(dao.findByPage(page));
	}
	
//	@Test
	public void testFindById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		System.out.println(dao.findBillById(1));
	}
	
//	@Test
	public void testFindItemByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		ItemPage page = new ItemPage();
		page.setBill_id(1);
		System.out.println(dao.findItemByPage(page));
	}
	
	@Test
	public void testFindItemById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		System.out.println(dao.findItemById(2));
	}
	
//	@Test
	public void testFindDetailByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		DetailPage page = new DetailPage();
		page.setService_id(2001);
		System.out.println(dao.findDetailByPage(page));
	}

//	@Test
	public void testFindRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		BillPage page = new BillPage();
		System.out.println(dao.findBillRows(page));
	}
	
//	@Test
	public void testFindItemRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		ItemPage page = new ItemPage();
		page.setBill_id(1);
		System.out.println(dao.findItemRows(page));
	}
	
//	@Test
	public void testFindDetailRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		DetailPage page = new DetailPage();
		page.setService_id(2001);
		System.out.println(dao.findDetailRows(page));
	}
}
