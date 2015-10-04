package com.tarena.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.RoleDao;
import com.tarena.entity.Role;
import com.tarena.entity.page.RolePage;

/**
 * 角色模块Dao测试类
 * 
 * @author Jsong
 */
public class TestRoleDao {

//	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleDao dao = context.getBean(RoleDao.class);
		RolePage page = new RolePage();
		System.out.println(dao.findByPage(page));
	}
	
//	@Test
	public void testSave() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleDao dao = context.getBean(RoleDao.class);
		Role r = new Role();
		r.setName("XXX");
		dao.save(r);
	}
	
//	@Test
	public void testDelete() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleDao dao = context.getBean(RoleDao.class);
		dao.deleteroleModule(1001);
		dao.delete(1001);
	}
	
//	@Test
	public void testFindById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleDao dao = context.getBean(RoleDao.class);
		System.out.println(dao.findById(200));
	}
	
	@Test
	public void testFindAllRole() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleDao dao = context.getBean(RoleDao.class);
		System.out.println(dao.findAllRole());
	}

}
