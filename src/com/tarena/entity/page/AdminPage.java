package com.tarena.entity.page;

public class AdminPage extends Page {

	private static final long serialVersionUID = 1L;
	
	private Integer moduleId;
	
	private String roleName;
	
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

}
