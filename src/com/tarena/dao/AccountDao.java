package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

@MyBatisRepository
public interface AccountDao {
	
	public List<Account> findByPage(AccountPage page);
	
	public int findRows(AccountPage page) ;

}
