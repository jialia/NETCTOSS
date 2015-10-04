package com.tarena.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * 管理员实体类
 * 
 * @author Jsong
 *
 */
public class Admin implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer admin_id;	//管理员Id
	
	private String admin_code;	//登陆账号
	
	private String password;	//密码

	private String name;		//真实姓名
	
	private String telephone;	//联系电话
	
	private String email;		//邮箱
	
	private Timestamp enrolldate;	//授权时间
	
	private List<Integer> roleIds;	//拥有角色Id

	private List<Role> roles;		//拥有角色
	
	public Admin() {
	}
	
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getEnrolldate() {
		return enrolldate;
	}
	public void setEnrolldate(Timestamp enrolldate) {
		this.enrolldate = enrolldate;
	}
	public List<Integer> getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(List<Integer> roleIds) {
		this.roleIds = roleIds;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_code=" + admin_code
				+ ", password=" + password + ", name=" + name + ", telephone="
				+ telephone + ", email=" + email + ", enrolldate=" + enrolldate
				+ ", roleIds=" + roleIds + ", roles=" + roles + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((admin_id == null) ? 0 : admin_id.hashCode());
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
		Admin other = (Admin) obj;
		if (admin_id == null) {
			if (other.admin_id != null)
				return false;
		} else if (!admin_id.equals(other.admin_id))
			return false;
		return true;
	}
	
}
