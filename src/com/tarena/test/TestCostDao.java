package com.tarena.test;

import java.sql.Timestamp;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.CostDao;
import com.tarena.entity.Cost;
import com.tarena.entity.page.CostPage;


/**
 * 测试CostDao
 * 
 * @author Jsong
 */
public class TestCostDao {
	
//	@Test
	public void testFindAll() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		List<Cost> list = dao.findAll();
		for (Cost cost : list) {
			System.out.println(cost);
		}
	}
	
//	@Test
	public void textAddCost() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		Cost c = new Cost();
		c.setName("tarena");
		c.setBase_duration(99);
		c.setBase_cost(8.8);
		c.setDescr("Tarena");
		c.setStatus(0);
		c.setUnit_cost(9.9);
		c.setCreatime(new Timestamp(System.currentTimeMillis()));
		dao.save(c);
	}
	
//	@Test
	public void testFindById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		System.out.println(dao.findById(6));
	}
	
//	@Test
	public void testUpdate() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		Cost cost = dao.findById(6);
		cost.setUnit_cost(12.0);
		dao.update(cost);
		cost = dao.findById(6);
		System.out.println(cost);
	}
	
//	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		List<Cost> list = dao.findByPage(new CostPage(2, 5));
		for (Cost cost : list) {
			System.out.println(cost);
		}
	}
	
//	@Test
	public void testFindRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		System.out.println(dao.findRows());
	}
	
	@Test
	public void testFindSort() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostDao dao = context.getBean(CostDao.class);
		CostPage page = new CostPage(null, false);
		List<Cost> list = dao.findBySort(page);
		for (Cost cost : list) {
			System.out.println(cost);
		}
	}

}
