package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Bill;
import com.tarena.entity.page.BillPage;

@MyBatisRepository
public interface BillDao {
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	public List<Bill> findByPage(BillPage page);

}
