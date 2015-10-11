package com.tarena.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 业务详单实体类
 * 
 * @author Jsong
 */
public class Detail implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer detail_id;		//id
	
	private Integer service_id;		//业务id
	
	private String client_host;		//客户Ip
	
	private String os_username;		//登陆名
	
	private Integer pid;			//线程号
	
	private Timestamp login_time;	//登陆时间

	private Timestamp logout_time;	//登出时间
	
	private double duration;		//累计时长
	
	private double cost;			//费用
	
	private String cost_name;		//资费名称
	
	public Detail() {
	}

	public Integer getDetail_id() {
		return detail_id;
	}

	public void setDetail_id(Integer detail_id) {
		this.detail_id = detail_id;
	}

	public Integer getService_id() {
		return service_id;
	}

	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}

	public String getClient_host() {
		return client_host;
	}

	public void setClient_host(String client_host) {
		this.client_host = client_host;
	}

	public String getOs_username() {
		return os_username;
	}

	public void setOs_username(String os_username) {
		this.os_username = os_username;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Timestamp getLogin_time() {
		return login_time;
	}

	public void setLogin_time(Timestamp login_time) {
		this.login_time = login_time;
	}

	public Timestamp getLogout_time() {
		return logout_time;
	}

	public void setLogout_time(Timestamp logout_time) {
		this.logout_time = logout_time;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

	public String getCost_name() {
		return cost_name;
	}

	public void setCost_name(String cost_name) {
		this.cost_name = cost_name;
	}

	@Override
	public String toString() {
		return "Detail [detail_id=" + detail_id + ", service_id=" + service_id
				+ ", client_host=" + client_host + ", os_username="
				+ os_username + ", pid=" + pid + ", login_time=" + login_time
				+ ", logout_time=" + logout_time + ", duration=" + duration
				+ ", cost=" + cost + ", cost_name=" + cost_name + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((detail_id == null) ? 0 : detail_id.hashCode());
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
		Detail other = (Detail) obj;
		if (detail_id == null) {
			if (other.detail_id != null)
				return false;
		} else if (!detail_id.equals(other.detail_id))
			return false;
		return true;
	}
	
}
