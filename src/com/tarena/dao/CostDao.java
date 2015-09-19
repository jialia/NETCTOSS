package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Cost;
import com.tarena.entity.page.CostPage;

/**
 * Cost（资费表）数据持久层接口
 * 
 * @author Jsong
 *
 */
@MyBatisRepository
public interface CostDao {
	
	/**
	 * 查找全部资费信息
	 * @return
	 */
	public List<Cost> findAll();
	
	/**
	 * 添加新的资费信息
	 * @param cost
	 */
	public void save(Cost cost);
	
	/**
	 * 查找单个资费信息
	 * @param id
	 * @return
	 */
	public Cost findById(int id);
	
	/**
	 * 更新资费信息
	 * @param cost
	 */
	public void update(Cost cost);
	
	/**
	 * 删除资费信息
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 分页查找
	 * @param page
	 * @return
	 */
	public List<Cost> findByPage(CostPage page);
	
	/**
	 * 分页查找（条件排序）
	 * @param page
	 * @return
	 */
	public List<Cost> findBySort(CostPage page);
	
	/**
	 * 查找总数
	 * @return
	 */
	public int findRows();

}
