package com.tarena.entity;

import java.io.Serializable;

/**
 * 模块实体类
 * 
 * @author Jsong
 *
 */
public class Module implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer module_id;		//id
	
	private String name;			//模块名
	
	public Module() {}

	public Integer getModule_id() {
		return module_id;
	}

	public void setModule_id(Integer module_id) {
		this.module_id = module_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Module [module_id=" + module_id + ", name=" + name + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((module_id == null) ? 0 : module_id.hashCode());
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
		Module other = (Module) obj;
		if (module_id == null) {
			if (other.module_id != null)
				return false;
		} else if (!module_id.equals(other.module_id))
			return false;
		return true;
	}
	
}
