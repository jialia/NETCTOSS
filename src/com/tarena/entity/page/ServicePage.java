package com.tarena.entity.page;

import java.io.Serializable;

/**
 * 业务账号的分页组件
 * 
 * @author Jsong
 */
public class ServicePage extends Page implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String os_username;		//OS账号
	
	private String unix_host;		//服务器IP
	
	private String idcard_no;		//身份证号
	
	private String status;			//状态
	
	public ServicePage() {
	}
	
	public String getOs_username() {
		return os_username;
	}
	public void setOs_username(String os_username) {
		this.os_username = os_username;
	}
	public String getUnix_host() {
		return unix_host;
	}
	public void setUnix_host(String unix_host) {
		this.unix_host = unix_host;
	}
	public String getIdcard_no() {
		return idcard_no;
	}
	public void setIdcard_no(String idcard_no) {
		this.idcard_no = idcard_no;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
