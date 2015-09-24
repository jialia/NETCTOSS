package com.tarena.entity;

import java.util.List;

public class Role {

	private Integer role_id;
	
	private String name;
	
	//一组模块Id，持久化时使用
	private List<Integer> moduleIds;
	
	//关联属性，查询时使用
	private List<Module> modules;

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
	
}
