package com.tarena.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.ServiceDao;
import com.tarena.entity.page.ServicePage;

public class TestServiceDao {

	@Test
	public void testFindByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ServiceDao dao = context.getBean(ServiceDao.class);
		ServicePage page = new ServicePage();
		List<Map<String, Object>> list = dao.findByPage(page);
		for (Map<String, Object> map : list) {
			System.out.println(map.get("SERVICE_ID") + " "
		  + map.get("OS_USERNAME") + " "
		  + map.get("UNIX_HOST") + " "
		  + map.get("IDCARD_NO") + " "
		  + map.get("COST_NAME") + " "
		  );
		}
	}
	
}
