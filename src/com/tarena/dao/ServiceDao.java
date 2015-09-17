package com.tarena.dao;

import java.util.List;
import java.util.Map;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.page.ServicePage;

@MyBatisRepository
public interface ServiceDao {
	
	/**
	 * 查询某一页的Service数据
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> findByPage(ServicePage page);
	
	/**
	 * 查询满足搜索条件的总行数
	 * @param page
	 * @return
	 */
	public int findRows(ServicePage page);

}
