package com.tarena.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.BillDao;
import com.tarena.entity.page.BillPage;

public class TestBillDao {
	
	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		BillDao dao = context.getBean(BillDao.class);
		BillPage page = new BillPage();
		page.setYear(2015);
		page.setMonth(2);
		System.out.println(page.getBill_month());
		System.out.println(dao.findByPage(page));
	}

}
