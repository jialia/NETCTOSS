package com.tarena.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 角色实体类
 * 
 * @author Jsong
 *
 */
public class Role implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer role_id;	//id
	
	private String name;		//姓名
	
	//一组模块Id，持久化时使用
	private List<Integer> moduleIds;
	
	//关联属性，查询时使用
	private List<Module> modules;
	
	public Role() {}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<Integer> getModuleIds() {
		return moduleIds;
	}

	public void setModuleIds(List<Integer> moduleIds) {
		this.moduleIds = moduleIds;
	}

	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", name=" + name + ", modules="
				+ modules + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((role_id == null) ? 0 : role_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Role other = (Role) obj;
		if (role_id == null) {
			if (other.role_id != null)
				return false;
		} else if (!role_id.equals(other.role_id))
			return false;
		return true;
	}
	
}
