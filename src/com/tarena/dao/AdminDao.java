package com.tarena.dao;

import java.util.List;
import java.util.Map;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Admin;
import com.tarena.entity.page.AdminPage;

@MyBatisRepository
public interface AdminDao {
	
	/**
	 * 分页查找
	 * @param page
	 * @return
	 */
	public List<Admin> findByPage(AdminPage page);
	
	/**
	 * 查询总行数
	 * @param page
	 * @return
	 */
	public int findRows();
	
	/**
	 * 添加管理员
	 * @param admin
	 */
	public void save(Admin admin);

	/**
	 * 添加管理员角色
	 * @param roles
	 */
	public void saveAdminRole(Map<String, Object> roles);
	
	/**
	 * 删除管理员
	 * @param id
	 */
	public void delete(Integer admin_id);
	
	/**
	 * 删除管理员角色
	 * @param id
	 */
	public void deleteAdminRole(Integer admin_id);
	
	/**
	 * 根据Id查询
	 * @param id
	 * @return
	 */
	public Admin findById(Integer id);
	
	/**
	 * 更新管理员信息
	 * @param admin
	 */
	public void update(Admin admin);
	
	/**
	 * 更新密码
	 * @param param
	 * KEY		VALUE
	 * ids		List<Integer>
	 * password	String
	 */
	public void updatePassword(Map<String, Object> param);
	
}
