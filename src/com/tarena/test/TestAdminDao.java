package com.tarena.test;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.AdminDao;
import com.tarena.entity.Admin;
import com.tarena.entity.page.AdminPage;

public class TestAdminDao {
	
	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AdminDao dao = context.getBean(AdminDao.class);
		AdminPage page = new AdminPage();
		page.setRoleName("管理");
		System.out.println(dao.findByPage(page));
	}
	
//	@Test
	public void testFindRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AdminDao dao = context.getBean(AdminDao.class);
		System.out.println(dao.findRows());
	}
	
//	@Test
	public void testAddAdmin() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AdminDao dao = context.getBean(AdminDao.class);
		Admin admin = new Admin();
		admin.setAdmin_code("aaaaa");
		admin.setName("aaaaa");
		admin.setPassword("aaaa");
		admin.setTelephone("123456");
		admin.setEmail("aaa@123.com");
		admin.setEnrolldate(new Timestamp(System.currentTimeMillis()));
		dao.save(admin);
		
	}
	
//	@Test
	public void testAddAdminRole() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AdminDao dao = context.getBean(AdminDao.class);
		Map<String, Object> roles = new HashMap<String, Object>();
		roles.put("admin_id", 8020);
		roles.put("role_id", 100);
		dao.saveAdminRole(roles);
	}
	
//	@Test
	public void testFindById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AdminDao dao = context.getBean(AdminDao.class);
		System.out.println(dao.findById(8021));
	}

}
