package com.tarena.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.RoleDao;
import com.tarena.entity.page.RolePage;

public class TestRoleDao {

	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleDao dao = context.getBean(RoleDao.class);
		RolePage page = new RolePage();
		System.out.println(dao.findByPage(page));
	}
	

}
