package com.tarena.entity.page;

import java.io.Serializable;


/**
 *	账务账号的分页组件，用于封装账务 
 * 	账号模块的分页条件及搜索条件。
 * 
 * @author Jsong
 */
public class AccountPage extends Page implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String idcard_no; 	//身份证
	
	private String real_name;	//姓名
	
	private String login_name;	//登录名
	
	private String status;		//状态
	
	public AccountPage() {
	}

	public String getIdcard_no() {
		return idcard_no;
	}

	public void setIdcard_no(String idcard_no) {
		this.idcard_no = idcard_no;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getLogin_name() {
		return login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AccountPage [idcard_no=" + idcard_no + ", real_name="
				+ real_name + ", login_name=" + login_name + ", status="
				+ status + "]";
	}
	
}
