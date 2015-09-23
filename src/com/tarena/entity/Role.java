package com.tarena.entity;

import java.util.List;

public class Role {

	private Integer role_id;
	
	private String name;
	
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

	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", name=" + name + ", modules="
				+ modules + "]";
	}
	
}
