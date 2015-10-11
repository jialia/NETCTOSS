package com.tarena.entity;

import java.io.Serializable;

/**
 * 账单条目实体类
 * 
 * @author Jsong
 */
public class Item implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer item_id;	//条目id
	
	private Integer bill_id;	//账单id
	
	private Integer service_id;	//业务id
	
	private Integer account_id;	//账务id
	
	private String os_username;	//OS账号
	
	private String unix_host;	//服务器IP
	
	private String cost_name;	//资费名称
	
	private double cost;		//费用
	
	public Item() {
	}

	public Integer getItem_id() {
		return item_id;
	}

	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}

	public Integer getBill_id() {
		return bill_id;
	}

	public void setBill_id(Integer bill_id) {
		this.bill_id = bill_id;
	}

	public Integer getService_id() {
		return service_id;
	}

	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public Integer getAccount_id() {
		return account_id;
	}

	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
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

	public String getCost_name() {
		return cost_name;
	}

	public void setCost_name(String cost_name) {
		this.cost_name = cost_name;
	}

	@Override
	public String toString() {
		return "Item [item_id=" + item_id + ", bill_id=" + bill_id
				+ ", service_id=" + service_id + ", account_id=" + account_id
				+ ", os_username=" + os_username + ", unix_host=" + unix_host
				+ ", cost_name=" + cost_name + ", cost=" + cost + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bill_id == null) ? 0 : bill_id.hashCode());
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
		Item other = (Item) obj;
		if (bill_id == null) {
			if (other.bill_id != null)
				return false;
		} else if (!bill_id.equals(other.bill_id))
			return false;
		return true;
	}
	
}
