package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Role;
import com.tarena.entity.page.RolePage;

@MyBatisRepository
public interface RoleDao {

	/**
	 * 查询某一页的角色数据
	 * @param page
	 * @return
	 */
	public List<Role> findByPage(RolePage page);
	
	/**
	 * 查询总行数
	 * @return
	 */
	int findRows();
	
}
