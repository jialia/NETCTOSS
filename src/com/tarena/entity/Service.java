package com.tarena.entity;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 业务账号实体类
 * 
 * @author Administrator
 */
public class Service implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer service_id;		//业务账号ID
	
	private Integer account_id;		//账务账号ID
	
	private String unix_host;		//服务器IP
	
	private String os_username;		//OS账号
	
	private String login_password;	//登录密码
	
	private String status;			//状态
	
	private Timestamp create_date;	//创建时间
	
	private Timestamp pause_date;	//暂停时间
	
	private Timestamp close_date;	//删除时间
	
	private Integer cost_id;		//资费ID
	
	public Service() {
	}
	
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer serviceId) {
		service_id = serviceId;
	}
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}
	public String getUnix_host() {
		return unix_host;
	}
	public void setUnix_host(String unix_host) {
		this.unix_host = unix_host;
	}
	public String getOs_username() {
		return os_username;
	}
	public void setOs_username(String os_username) {
		this.os_username = os_username;
	}
	public String getLogin_password() {
		return login_password;
	}
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}
	public Timestamp getPause_date() {
		return pause_date;
	}
	public void setPause_date(Timestamp pause_date) {
		this.pause_date = pause_date;
	}
	public Timestamp getClose_date() {
		return close_date;
	}
	public void setClose_date(Timestamp close_date) {
		this.close_date = close_date;
	}
	public Integer getCost_id() {
		return cost_id;
	}
	public void setCost_id(Integer cost_id) {
		this.cost_id = cost_id;
	}

}
