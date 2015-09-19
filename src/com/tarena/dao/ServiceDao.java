package com.tarena.dao;

import java.util.List;
import java.util.Map;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Service;
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
	
	/**
	 * 开通业务账号
	 * @param id
	 */
	public void start(int id);
	
	/**
	 * 暂停业务账号，将状态该为1，将暂停时间改为当前系统时间
	 * @param id
	 */
	public void pause(int id);

	/**
	 * 删除业务账号
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 根据ID查找单条信息
	 * @param id
	 * @return
	 */
	public Map<String, Object> findById(int id);
	
	/**
	 * 更新业务账号
	 * @param service
	 */
	public void update(Service service);
	
}
