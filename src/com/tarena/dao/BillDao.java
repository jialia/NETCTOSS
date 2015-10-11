package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Bill;
import com.tarena.entity.Detail;
import com.tarena.entity.Item;
import com.tarena.entity.page.BillPage;
import com.tarena.entity.page.DetailPage;
import com.tarena.entity.page.ItemPage;

@MyBatisRepository
public interface BillDao {
	
	/**
	 * 账单分页查询
	 * @param page
	 * @return
	 */
	public List<Bill> findByPage(BillPage page);
	
	/**
	 * 查询满足搜索条件的账单总行数
	 * @param page
	 * @return
	 */
	public int findBillRows(BillPage page);
	
	/**
	 * 通过账单id查找
	 * @param bill_id
	 * @return
	 */
	public Bill findBillById(Integer bill_id);
	
	/**
	 * 账单明细分页查询
	 * @param page
	 * @return
	 */
	public List<Item> findItemByPage(ItemPage page);
	
	/**
	 * 查询满足搜索条件的账单明细分总行数
	 * @param page
	 * @return
	 */
	public int findItemRows(ItemPage page);
	
	/**
	 * 通过详单id查找
	 * @param bill_id
	 * @return
	 */
	public Item findItemById(Integer item_id);
	
	/**
	 * 业务账号详单分页查询
	 * @param page
	 * @return
	 */
	public List<Detail> findDetailByPage(DetailPage page);
	
	/**
	 * 查询满足搜索条件的账号详单总行数
	 * @param page
	 * @return
	 */
	public int findDetailRows(DetailPage page);

}
