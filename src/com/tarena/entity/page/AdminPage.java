package com.tarena.entity.page;

import java.io.Serializable;

/**
 *	管理员的分页组件，用于封装账务 
 * 	管理员的分页条件及搜索条件。
 * 
 * @author Jsong
 */
public class AdminPage extends Page implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer moduleId;		//模块id
	
	private String roleName;		//角色名
	
	public AdminPage() {
		super.setPageSize(10);
	}

	public Integer getModuleId() {
		return moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Override
	public String toString() {
		return "AdminPage [moduleId=" + moduleId + ", roleName=" + roleName
				+ "]";
	}
	
}
