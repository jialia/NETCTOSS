package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

@MyBatisRepository
public interface AccountDao {
	
	/**
	 * 分页查找
	 * @param page
	 * @return
	 */
	public List<Account> findByPage(AccountPage page);
	
	/**
	 * 查找总行数
	 * @param page
	 * @return
	 */
	public int findRows(AccountPage page) ;
	
	/**
	 * 开通业务
	 * @param id
	 */
	public void start(int id);
	
	/**
	 * 暂停账务账号，将状态该为1，将暂停时间改为当前系统时间
	 * @param id
	 */
	public void pause(int id);

	/**
	 * 删除业务
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 根据ID查询一条账务账号
	 * @param id
	 * @return
	 */
	public Account findById(int id);
	
	/**
	 * 更新数据
	 * @param account
	 */
	public void update(Account account);
	
	/**
	 * 根据身份证查找
	 * @param idcardNo
	 * @return
	 */
	public Account findByIdcardNo(String idcardNo);
}
